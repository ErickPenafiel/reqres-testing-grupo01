# 🧪 API Testing con Postman y Karate - Reqres

Este repositorio contiene las pruebas de automatización realizadas sobre la API pública [Reqres](https://reqres.in) utilizando **Postman** y **Karate DSL**. Incluye tanto las colecciones de Postman como los scripts de prueba automatizados en Karate.
El propósito del proyecto es desarrollar un conjunto de pruebas automatizadas para validar la funcionalidad, rendimiento y calidad de todos los endpoints de la API pública ReqRes. La API ofrece endpoints para gestionar recursos como usuarios (/users), datos genéricos (/unknown), autenticación (/login, /register), y más. Los objetivos principales son:

- Verificar que cada endpoint devuelva respuestas correctas en términos de estado HTTP, tiempo de respuesta, estructura de datos y formato de campos.
- Automatizar casos de prueba generales que abarquen todos los endpoints, permitiendo validar tanto solicitudes exitosas como la estructura de las respuestas.
- Facilitar la detección temprana de errores en la API mediante un framework reutilizable y escalable.
- Generar reportes para documentar los resultados y permitir un seguimiento continuo de la calidad de la API en su totalidad.
  
---

## 📌 Objetivos

- Validar el funcionamiento de los endpoints REST de Reqres.
- Implementar pruebas automatizadas utilizando dos herramientas: Postman y Karate.
- Ejecutar pruebas individuales y por lotes.
- Generar reportes automáticos de ejecución.

---

# Stack de Tecnología
El stack de tecnología para este proyecto es el siguiente:
## 1.- Lenguaje de programación: 
   - Java 11: Base del código, compatible con los frameworks y plugins utilizados.
## 2.-	Framework de pruebas: 
   - Karate: Framework de pruebas de API que permite definir escenarios en Gherkin (archivos .feature) y ejecutar solicitudes HTTP con validaciones avanzadas, ideal para            cubrir múltiples endpoints.
## 3.- Dependencias y librerías: 
   - cucumber-reporting (versión 5.7.5): Librería para generar reportes detallados (opcional, para implementar más adelante).
   - Karate Runner: Permite ejecutar pruebas Karate directamente desde VS Code, ofreciendo una interfaz para lanzar escenarios individuales o archivos completos sin necesidad       de usar la terminal con mvn test.
   - Karate Syntax: Mejora el resaltado de sintaxis y la legibilidad del código Karate, incluyendo pasos, expresiones JSON, y comandos como * print.
## 4.- Herramientas de construcción y ejecución:
   - Maven: Sistema de gestión de dependencias y construcción, con pom.xml para configurar el proyecto.
   - maven-surefire-plugin (versión 3.2.5): Plugin para ejecutar pruebas.
   - maven-compiler-plugin (versión 3.11.0): Plugin para compilar el código con Java 11.
## 5.- Entorno de desarrollo:
   - Visual Studio Code: IDE para escribir y ejecutar el código y las pruebas.
## 6.- API de prueba:
   - ReqRes: API REST pública con endpoints como /users, /unknown, /login, /register, etc., utilizada como objetivo de las pruebas.

---

## ✅ Requisitos

### Postman

- [Postman](https://www.postman.com/downloads/)

### Karate

- Java JDK 8 o superior
- Maven
- Editor como IntelliJ IDEA, VS Code, o cualquier IDE con soporte para Maven

## 📋 Qué pasos se deben seguir hasta tener corriendo las pruebas automatizadas:

- Clona el repositorio en tu equipo local usando el siguiente comando: git clone https://github.com/ErickPenafiel/reqres-testing-grupo01
- Abre el proyecto clonado en un editor de texto, por ejemplo, Visual Studio Code.
- Instala las siguientes extensiones en tu editor para facilitar la edición y ejecución de pruebas:
   - Cucumber (soporte para archivos Gherkin)
   - Karate Runner
   - Karate Syntax
- Dentro de Visual Studio Code, ubica en la barra lateral izquierda el ícono de Karate Runner.
- Desde esta sección, selecciona y ejecuta los endpoints o escenarios que deseas correr de este repositorio.


