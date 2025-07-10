variable "project_id" {
  description = "ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "Región de GCP"
  type        = string
  default     = "us-central1"
}

variable "github_owner" {
  description = "Dueño del repositorio GitHub"
  type        = string
}

variable "github_repo" {
  description = "Nombre del repositorio GitHub"
  type        = string
}
