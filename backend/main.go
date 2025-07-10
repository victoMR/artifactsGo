package main

import (
	"net/http"
	"os"
	"path/filepath"
	"strings"

	"github.com/gin-gonic/gin"
)

type Anime struct {
	ID     string `json:"id"`
	Title  string `json:"title"`
	Genre  string `json:"genre"`
	Rating int    `json:"rating"`
}

var animes = []Anime{
	{ID: "1", Title: "Attack on Titan", Genre: "Action", Rating: 5},
	{ID: "2", Title: "Spy x Family", Genre: "Comedy", Rating: 4},
}

func main() {
	r := gin.Default()

	// API endpoints primero (más específicos)
	api := r.Group("/api")
	{
		api.GET("/animes", getAnimes)
		api.POST("/animes", addAnime)
		api.PUT("/animes/:id", updateAnime)
		api.DELETE("/animes/:id", deleteAnime)
	}

	// Servir archivos estáticos (CSS, JS, imágenes)
	r.Static("/css", "./static/css")
	r.Static("/js", "./static/js")
	r.Static("/fonts", "./static/fonts")
	r.StaticFile("/favicon.svg", "./static/favicon.svg")
	r.StaticFile("/favicon.png", "./static/favicon.png")
	r.StaticFile("/apple-touch-icon.png", "./static/apple-touch-icon.png")
	r.StaticFile("/sitemap.xml", "./static/sitemap.xml")
	r.StaticFile("/index.xml", "./static/index.xml")

	// Manejo de rutas de Hugo - debe ir al final
	r.NoRoute(func(c *gin.Context) {
		serveHugoPage(c)
	})

	r.Run(":8080")
}

// Función para servir páginas de Hugo
func serveHugoPage(c *gin.Context) {
	requestPath := c.Request.URL.Path

	// Limpiar la ruta
	if requestPath == "/" {
		requestPath = "/index.html"
	}

	// Intentar servir el archivo directamente
	filePath := filepath.Join("./static", requestPath)
	if _, err := os.Stat(filePath); err == nil {
		c.File(filePath)
		return
	}

	// Si no existe, intentar con /index.html (para rutas de Hugo)
	if !strings.HasSuffix(requestPath, "/") {
		requestPath += "/"
	}
	filePath = filepath.Join("./static", requestPath, "index.html")

	if _, err := os.Stat(filePath); err == nil {
		c.File(filePath)
		return
	}

	// Si no se encuentra, servir 404
	notFoundPath := filepath.Join("./static", "404.html")
	if _, err := os.Stat(notFoundPath); err == nil {
		c.File(notFoundPath)
		c.Status(http.StatusNotFound)
		return
	}

	// Fallback básico
	c.String(http.StatusNotFound, "404 - Página no encontrada")
}

func getAnimes(c *gin.Context) {
	c.JSON(http.StatusOK, animes)
}

func addAnime(c *gin.Context) {
	var newAnime Anime
	if err := c.BindJSON(&newAnime); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	animes = append(animes, newAnime)
	c.JSON(http.StatusCreated, newAnime)
}

func updateAnime(c *gin.Context) {
	id := c.Param("id")
	var updatedAnime Anime

	if err := c.BindJSON(&updatedAnime); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	for i, a := range animes {
		if a.ID == id {
			// Mantener el ID original
			updatedAnime.ID = id
			animes[i] = updatedAnime
			c.JSON(http.StatusOK, updatedAnime)
			return
		}
	}
	c.JSON(http.StatusNotFound, gin.H{"error": "Anime not found"})
}

func deleteAnime(c *gin.Context) {
	id := c.Param("id")
	for i, a := range animes {
		if a.ID == id {
			animes = append(animes[:i], animes[i+1:]...)
			c.JSON(http.StatusOK, gin.H{"message": "Anime deleted"})
			return
		}
	}
	c.JSON(http.StatusNotFound, gin.H{"error": "Anime not found"})
}
