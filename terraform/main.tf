terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

# 1. Habilitar APIs necesarias (versión simplificada)
resource "google_project_service" "apis" {
  for_each = toset([
    "artifactregistry.googleapis.com",
    "run.googleapis.com",
    "cloudbuild.googleapis.com"
  ])
  service = each.key
}

# 2. Repositorio Artifact Registry
resource "google_artifact_registry_repository" "repo" {
  repository_id = "anime-api-repo"
  format        = "DOCKER"
  location      = "us-central1"
  description   = "Repositorio para imágenes Docker"

  depends_on = [google_project_service.apis]
}

# 3. Service Account for Cloud Build
resource "google_service_account" "cloudbuild_sa" {
  account_id   = "cloud-build-sa"
  display_name = "Cloud Build Service Account"
}

resource "google_project_iam_member" "cloudbuild_sa_roles" {
  for_each = toset([
    "roles/cloudbuild.builds.builder",
    "roles/artifactregistry.writer",
  ])
  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.cloudbuild_sa.email}"
}

# 4. Trigger Cloud Build
resource "google_cloudbuild_trigger" "build" {
  name        = "anime-api-trigger"
  location    = "us-central1"
  description = "Trigger para construcción automática"
  service_account = google_service_account.cloudbuild_sa.id

  github {
    owner = "victoMR"
    name  = "artifactsGo"
    push {
      branch = "main"
    }
  }

  build {
    timeout = "600s"

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "build",
        "-t",
        "us-central1-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api:latest",
        "."
      ]
    }

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "push",
        "us-central1-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api:latest"
      ]
    }

    artifacts {
      images = [
        "us-central1-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api:latest"
      ]
    }
  }

  depends_on = [
    google_artifact_registry_repository.repo,
    google_project_service.apis,
    google_project_iam_member.cloudbuild_sa_roles
  ]
}


# 4. Despliegue en Cloud Run (COMENTADO)

resource "google_cloud_run_service" "api" {
  name     = "anime-api"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api:latest"
        ports {
          container_port = 8080
        }

        resources {
          limits = {
            cpu    = "1000m"
            memory = "512Mi"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_cloudbuild_trigger.build
  ]
}


# 5. Permisos de acceso público (COMENTADO)

resource "google_cloud_run_service_iam_member" "public" {
  service  = google_cloud_run_service.api.name
  location = google_cloud_run_service.api.location
  role     = "roles/run.invoker"
  member   = "allUsers"

  depends_on = [google_cloud_run_service.api]
}


# 6. Outputs útiles

output "service_url" {
  value = google_cloud_run_service.api.status[0].url
}

output "docker_repo" {
  value = "us-central1-docker.pkg.dev/${var.project_id}/anime-api-repo"
}