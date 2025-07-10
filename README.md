# 🎌 Anime Collection Manager

Una aplicación web completa para gestionar colecciones de anime con backend en Go y frontend interactivo, desplegada en Google Cloud Platform.

![GitHub](https://img.shields.io/badge/Go-1.24+-blue?logo=go)
![Docker](https://img.shields.io/badge/Docker-20.10+-blue?logo=docker)
![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?logo=terraform)
![GCP](https://img.shields.io/badge/Google_Cloud-Cloud_Run-green?logo=googlecloud)

## 🎯 Características

- ✅ **API REST completa** con operaciones CRUD
- 🎨 **Frontend interactivo** con interfaz moderna
- 📊 **Dashboard con estadísticas** en tiempo real
- 🚀 **Despliegue automatizado** con un solo comando
- 🐳 **Containerización** con Docker
- ☁️ **Infraestructura como código** con Terraform
- 🔧 **Script inteligente** que detecta cambios automáticamente

## 📁 Estructura del Proyecto

```
📦 anime-collection-manager/
├── 🔧 deploy.sh              # Script automatizado de despliegue
├── 🐳 Dockerfile             # Configuración de contenedor
├── 📖 README.md              # Documentación del proyecto
├── 📂 backend/               # API Backend en Go
│   ├── 📄 go.mod             # Dependencias de Go
│   ├── 📄 go.sum             # Checksums de dependencias
│   └── 🚀 main.go            # Servidor API principal
├── 📂 frontend/              # Frontend Web
│   └── 📂 static/
│       └── 🌐 index.html     # Aplicación web CRUD
└── 📂 terraform/             # Infraestructura como código
    ├── 🏗️ main.tf            # Configuración principal
    ├── 🔧 variables.tf       # Variables de configuración
    └── 📊 terraform.tfvars   # Valores de variables
```

## 🛠️ Tecnologías y Herramientas

| 🛠️ **Tecnología** | 📋 **Propósito** | ✨ **Beneficios** |
|:------------------|:------------------|:------------------|
| **🔷 Go + Gin** | Backend API REST | • Alto rendimiento<br>• Sintaxis simple<br>• Compilación rápida<br>• Excelente para APIs |
| **🌐 HTML + CSS + JS** | Frontend interactivo | • Sin frameworks pesados<br>• Carga rápida<br>• Compatible universalmente<br>• Fácil mantenimiento |
| **🐳 Docker** | Containerización | • Portabilidad garantizada<br>• Aislamiento de dependencias<br>• Despliegues consistentes<br>• Escalabilidad |
| **☁️ Google Cloud Run** | Hosting serverless | • Escalado automático<br>• Pago por uso<br>• Alta disponibilidad<br>• HTTPS automático |
| **🏗️ Terraform** | Infraestructura como código | • Versionado de infraestructura<br>• Despliegues reproducibles<br>• Gestión de estado<br>• Rollbacks seguros |
| **📦 Artifact Registry** | Registro de imágenes | • Integración nativa con GCP<br>• Seguridad avanzada<br>• Versionado de imágenes<br>• Alta disponibilidad |
| **🔧 Bash Script** | Automatización de despliegue | • Un solo comando<br>• Detección inteligente<br>• Manejo de errores<br>• Output colorido |

## 🚀 API Endpoints

### 📋 Backend REST API

| Método | Endpoint | Descripción | Ejemplo |
|:-------|:---------|:------------|:--------|
| `GET` | `/animes` | Obtener todos los animes | `curl https://tu-url/animes` |
| `POST` | `/animes` | Crear nuevo anime | `curl -X POST -H "Content-Type: application/json" -d '{"id":"3","title":"Naruto","genre":"Action","rating":5}' https://tu-url/animes` |
| `DELETE` | `/animes/:id` | Eliminar anime por ID | `curl -X DELETE https://tu-url/animes/1` |

### 🌐 Frontend Routes

| Ruta | Descripción |
|:-----|:------------|
| `/` | Redirección al frontend |
| `/static/` | Aplicación web principal |
| `/static/index.html` | Interfaz CRUD completa |

## 🎨 Características del Frontend

### 📊 Dashboard Interactivo
- **Total de animes** - Contador en tiempo real
- **Rating promedio** - Cálculo automático
- **Género más popular** - Análisis estadístico

### ✨ Funcionalidades CRUD
- **➕ Agregar animes** - Formulario con validación
- **📋 Listar animes** - Cards visuales atractivas  
- **🗑️ Eliminar animes** - Con confirmación de seguridad
- **📱 Diseño responsive** - Adaptable a móviles

### 🎨 Experiencia de Usuario
- **🌈 Diseño moderno** - Gradientes y animaciones
- **🔔 Notificaciones** - Mensajes de éxito/error
- **⚡ Carga rápida** - Sin frameworks pesados
- **🖱️ Hover effects** - Interacciones fluidas

## ⚙️ Configuración y Despliegue

### 📋 Requisitos Previos

```bash
# Instalar herramientas necesarias
1. Google Cloud SDK ☁️
2. Docker 🐳
3. Terraform 🏗️
```

### 🚀 Despliegue Rápido (Un Solo Comando)

```bash
# 1. Clonar y entrar al proyecto
git clone <tu-repo>
cd anime-collection-manager

# 2. Configurar autenticación
gcloud auth configure-docker us-central1-docker.pkg.dev

# 3. ¡Desplegar todo automáticamente!
./deploy.sh
```

### 🔧 Script de Despliegue Inteligente

El script `deploy.sh` incluye:

- **🎨 Output colorido** con emojis informativos
- **🔍 Detección automática** de cambios en Terraform
- **🚀 Despliegue manual** cuando Terraform no detecta cambios
- **✅ Validación** de cada paso del proceso
- **📊 Resumen final** con URLs y comandos de prueba

```bash
🚀 Starting deployment process...
🔨 Building Docker image...
✅ Docker image built successfully!
📦 Pushing Docker image to registry...
✅ Docker image pushed successfully!
🏗️ Applying Terraform changes...
⚠️ Terraform detected no infrastructure changes
🔄 Forcing manual Cloud Run deployment...
✅ Manual Cloud Run deployment successful!
🎉 Deployment completed successfully!
```

## 🌐 URLs de Acceso

Después del despliegue, tendrás acceso a:

| 🎯 **Servicio** | 🔗 **URL** | 📋 **Descripción** |
|:---------------|:-----------|:-------------------|
| **🎌 Frontend Completo** | `https://anime-api-2r3soktbma-uc.a.run.app/static/` | Interfaz web CRUD completa |
| **🔗 API Backend** | `https://anime-api-2r3soktbma-uc.a.run.app/animes` | Endpoints REST |
| **🏠 Página Principal** | `https://anime-api-2r3soktbma-uc.a.run.app/` | Redirección automática |

## 🧪 Ejemplos de Uso

### 📱 Uso del Frontend Web

1. Abre `https://tu-url/static/` en tu navegador
2. Verás el dashboard con estadísticas
3. Usa el formulario para agregar nuevos animes
4. Haz clic en "🗑️ Delete" para eliminar animes

### 🔧 Uso de la API REST

```bash
# Obtener todos los animes
curl https://anime-api-2r3soktbma-uc.a.run.app/animes

# Agregar un nuevo anime
curl -X POST https://anime-api-2r3soktbma-uc.a.run.app/animes \
  -H "Content-Type: application/json" \
  -d '{"id":"4","title":"Death Note","genre":"Mystery","rating":5}'

# Eliminar un anime
curl -X DELETE https://anime-api-2r3soktbma-uc.a.run.app/animes/4
```

## 🔧 Desarrollo Local

### 🐳 Con Docker

```bash
# Construir imagen
docker build -t anime-api .

# Ejecutar contenedor
docker run -p 8080:8080 anime-api

# Acceder en: http://localhost:8080/static/
```

### 🔧 Sin Docker

```bash
# Backend
cd backend
go mod download
go run main.go

# Frontend se sirve automáticamente en /static/
```

## 📊 Estructura de Datos

### 🎌 Modelo Anime

```json
{
  "id": "string",      // Identificador único
  "title": "string",   // Título del anime
  "genre": "string",   // Género (Action, Comedy, etc.)
  "rating": integer    // Calificación (1-5)
}
```

### 📈 Géneros Disponibles

| 🎭 **Género** | 📋 **Descripción** |
|:-------------|:-------------------|
| Action | Acción y aventura |
| Adventure | Exploración y viajes |
| Comedy | Humor y comedia |
| Drama | Historias dramáticas |
| Fantasy | Mundos fantásticos |
| Horror | Terror y suspenso |
| Mystery | Misterio y detective |
| Romance | Historias románticas |
| Sci-Fi | Ciencia ficción |
| Slice of Life | Vida cotidiana |
| Sports | Deportes |
| Supernatural | Elementos sobrenaturales |
| Thriller | Suspense y tensión |

## 🤝 Contribución

1. 🍴 Fork el proyecto
2. 🌟 Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. 💾 Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push a la rama (`git push origin feature/AmazingFeature`)
5. 🔄 Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 👨‍💻 Autor

**Tu Nombre** - [@tu-github](https://github.com/tu-usuario)

---

## 🚀 ¡Próximos Pasos!

- [ ] 🔐 Autenticación de usuarios
- [ ] 📊 Más estadísticas avanzadas
- [ ] 🔍 Búsqueda y filtros
- [ ] 📱 App móvil
- [ ] 🌐 Múltiples idiomas
- [ ] 📈 Analytics y métricas

---

**⭐ ¡Si te gusta este proyecto, dale una estrella en GitHub! ⭐**
