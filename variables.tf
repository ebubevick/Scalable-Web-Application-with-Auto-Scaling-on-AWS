variable "project" {
  description = "Project name"
  type        = string
  default     = "web-app"
}

variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
