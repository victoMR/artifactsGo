terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "required_apis" {
  for_each = toset([
    "artifactregistry.googleapis.com",
    "run.googleapis.com",
    "cloudbuild.googleapis.com",
  ])
  service = each.key
}

resource "google_artifact_registry_repository" "docker_repo" {
  repository_id = "anime-api-repo"
  format        = "DOCKER"
  location      = var.region
  depends_on    = [google_project_service.required_apis]
}

resource "google_cloudbuild_trigger" "docker_build" {
  name        = "anime-api-go-build"
  description = "Build and deploy Anime API Go + Hugo"

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = "^main$"
    }
  }

  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "build",
        "-t",
        "${var.region}-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api-go:latest",
        "."
      ]
    }

    step {
      name = "gcr.io/cloud-builders/docker"
      args = [
        "push",
        "${var.region}-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api-go:latest"
      ]
    }

    artifacts {
      images = [
        "${var.region}-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api-go:latest"
      ]
    }
  }
}

resource "google_cloud_run_service" "anime_api" {
  name     = "anime-api-go"
  location = var.region

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/anime-api-repo/anime-api-go:latest"
        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_cloudbuild_trigger.docker_build,
    google_artifact_registry_repository.docker_repo
  ]
}

resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.anime_api.name
  location = google_cloud_run_service.anime_api.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
