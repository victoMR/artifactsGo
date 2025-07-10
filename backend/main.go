package main

import (
	"net/http"
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

	// Endpoints CRUD
	r.GET("/animes", getAnimes)
	r.POST("/animes", addAnime)
	r.DELETE("/animes/:id", deleteAnime)

	r.Run(":8080")
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
