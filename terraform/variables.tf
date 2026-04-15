variable "web_port" {
  description = "Puerto externo para WEB01"
  type        = number
  default     = 4001 
}

variable "api_port" {
  description = "Puerto externo para API01"
  type        = number
  default     = 4002 
}

variable "bd_port" {
  description = "Puerto externo para BD"
  type        = number
  default     = 4003 
}

variable "web_container_name" {
  description = "Nombre del contenedor WEB01"
  type        = string
  default     = "web-LOCAL-01" 
}