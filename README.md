Karate Challengue
=============
### 1. Pre-requisitos:

- Maquina local con el sistema operativo Windows 10
- IntelliJ IDEA Community Edition  version 2023.2.5
- Maven version 3.9.5 (debe estar en la variable de entorno)
- JDK versión 1.8 (debe estar en la variable de entorno)

### 2. Comandos de instalación

- mvn install -DskipTests (descarga todas las dependencias del POM)

### 3. Instrucciones para ejecutar los test

######				 Ejecución
- Escribir el tag del feature que se quiere ejecutar en tags("@Store") que está dentro del runner.
- Ejecutar desde el Runner con click derecho 'Run RunnerTest'

###### 				Reporte
- El reporte se generará dentro del carpeta target en la siguiente ruta: FormacionKarate2023/target/karate-reports
- Seleccionar el archivo html con el nombre del feature ejecutado, click derecho y seleccionar Open In/Browser


### 4. Información adicional
-Cada feature tiene su etiqueta para ejecutar con el runner.
-Runner = src/test/java/bdd/Runner/RunnerTest.java con click derecho 'Run RunnerTest'
