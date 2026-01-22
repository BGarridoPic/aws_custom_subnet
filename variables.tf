variable "owner_tag" {
  description = "Propietario del recurso"
  type        = string
  validation {
    condition     = var.owner_tag != null && length(var.owner_tag) > 0
    error_message = "El valor 'owner_tag' no puede ser nulo ni una cadena vacía."
  }
}

variable "environment_tag" {
  description = "Entorno (DEV, PRO, TES, PRE)"
  type        = string
  validation {
    condition     = length(var.environment_tag) > 0 && contains(["DEV", "PRO", "TES", "PRE"], upper(var.environment_tag))
    error_message = "El entorno debe ser uno de los siguientes: DEV, PRO, TES, PRE"
  }
}

variable "subnet_name" {
  description = "Nombre estricto de la subred"
  type        = string
  validation {

    condition     = can(regex("^subnet-[a-z]{3,}tfexercise\\d{2,}$", var.subnet_name))
    error_message = "Formato incorrecto. Ej: subnet-nombretfexercise01"
  }
}

variable "subnet_tags" {
  description = "Etiquetas extra"
  type        = map(string)
  default     = {}
  validation {
    condition     = var.subnet_tags != null
    error_message = "No puede ser nulo."
  }
}