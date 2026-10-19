# 🎬 Proyecto de Análisis de Datos SQL: Base de Datos Sakila

## 📌 Descripción del Proyecto
Este proyecto consiste en un análisis exhaustivo de la base de datos **Sakila** (videoclub/plataforma de alquiler de películas) a través de **64 consultas SQL** avanzadas. 

El objetivo principal es responder a preguntas clave del negocio, optimizar el análisis de datos de alquileres, clientes e inventario, y extraer conclusiones estratégicas que ayuden a la toma de decisiones.

---

## 🛠️ Tecnologías y Herramientas Utilizadas
* **Base de Datos:** MySQL / PostgreSQL (Sakila Schema)
* **Lenguaje:** SQL (DML, DDL, agregaciones, subconsultas, JOINS, CTEs, funciones de ventana)
* **Modelado:** Diagramas Entidad-Relación (Mermaid)

---

## 🗂️ Estructura del Repositorio
* `Consultas_resueltas.sql`: Archivo completo con las 64 consultas comentadas y ordenadas.
* `esquemadb.md`: Esquema entidad-relación detallado del modelo de datos.

---

## 💡 Principales Hallazgos y Análisis del Negocio

Tras la ejecución y análisis de las 64 consultas SQL, se han obtenido las siguientes conclusiones principales:


-Las peliculas de clasificación "PG-13" tienden a ser las peliculas mas largas teniendo un promedio de **120,44** minutos mientras que las peliculas de clasificacion "PG" suelen ser las mas cortas con un promedio de **112,01** minutos.
-La duración de los alquileres de peliculas suele durar casi 5 días de media.
-La empresa **Shakila** ha recaudado un total de **67.416,51** euros.
-El cliente que mas dinero ha gastado es **KARL SEAL** con **221,55** euros.
-El cliente que mas alquileres ha realizado es **ELEANOR HUNT** con un total de **46** y el que menos es **BRIAN WYMAN** con **12**.
-El actor que ha trabajado en más peliculas es **GINA DEGENERES** con un total de 42.


---

## 🧠 Competencias SQL Demostradas

En el desarrollo de las 64 consultas se han aplicado las siguientes técnicas de consulta:

* **Uniones relacionales complexas:** `INNER JOIN`, `LEFT JOIN` (múltiples tablas en cadena) y análisis de rendimiento con `CROSS JOIN`.
* **Filtrado avanzado y fechas:** Manipulación de intervalos temporales con `DATEDIFF`, `DATE`, filtros de estados nulos (`IS NULL`).
* **Agregaciones y Agrupaciones:** `GROUP BY`, `HAVING`, funciones de agregación (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) y concatenación de cadenas (`GROUP_CONCAT` / `STRING_AGG`).
* **Subconsultas y Lógica de Negocio:** Subconsultas escalares y correlacionadas (`EXISTS`, `IN`, `>= ALL/ANY`).

---

## 🎓  Agradecimientos
* Agradecimientos a ThePowerMBA por la facilitacion de conocimientos y herramientas para hacer el proyecto.
* A la comunidad de MySQL por proveer la base de datos de ejemplo Sakila.


