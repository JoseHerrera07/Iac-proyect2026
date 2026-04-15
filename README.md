# Iac-proyect2026
# Despliegue de Infraestructura de 3 Capas (IaC)

Este README contiene la configuración IaC utilizando Terraform y Docker para desplegar una arquitectura de tres capas.

## Estructura de la Arquitectura
* **Presentación (WEB01):** Nginx sirviendo contenido estático (Puerto host: 4001).
* **Aplicación (API01):** API REST en Java 17 con Spring Boot (Puerto host: 4002).
* **Datos (BD):** Base de datos PostgreSQL (Puerto host: 4003).

## Requisitos Previos
* Tener Docker instalado y ejecutándose.
* Tener Terraform (v1.x) instalado.

## Instrucciones de Despliegue

1. Clonar este repositorio y abrir la terminal en el directorio raíz.
2. Ingresar a la carpeta de infraestructura:

   cd terraform

3. Inicializar Terraform para descargar los plugins necesarios (provider de Docker):

   terraform init

4. Revisar el plan de despliegue.

   terraform plan

5. Aplicar la configuración para crear y levantar los contenedores.

   terraform apply -auto-approve

## Destruir la Infraestructura

Para apagar y eliminar todos los contenedores y redes creadas, ejecuta:

   terraform destroy -auto-approve

   