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

Tras la ejecución y análisis de las 64 consultas SQL, se han obtenido las siguientes conclusiones principales organizadas por áreas funcionales:

### 1. 📽️ Rendimiento del Catálogo e Inventario
* **Películas más demandadas:** Se identificaron las categorías y títulos con mayor rotación de alquiler. Las categorías de mayor popularidad generan un volumen significativo del total de ingresos.
* **Disponibilidad y rotación:** Se detectaron patrones sobre el tiempo medio de préstamo de las películas y películas que actualmente no se encuentran devueltas (`return_date IS NULL`).
* **Inventario sin uso:** Se localizaron títulos y copias en inventario sin registros de alquiler recientes, representando un coste de oportunidad en almacenamiento.

### 2. 👥 Comportamiento de Clientes y Recaudación
* **Segmentación de Clientes:** Se identificaron los clientes TOP (mayor número de alquileres y mayor gasto acumulado en la tabla `payment`), permitiendo diseñar programas de fidelización.
* **Patrones de Devolución:** Un porcentaje relevante de los alquileres supera la duración estándar estipulada, generando cobros/penalizaciones por retraso.

### 3. 🎭 Análisis de Reparto y Producción
* **Actores más prolíficos:** Se listaron los actores con mayor presencia en el catálogo y su impacto directo en las películas más alquiladas.
* **Análisis Cruzado:** La relación entre categorías específicas de películas y sus actores más recurrentes.

---

## 🧠 Competencias SQL Demostradas

En el desarrollo de las 64 consultas se han aplicado las siguientes técnicas de consulta:

* **Uniones relacionales complexas:** `INNER JOIN`, `LEFT JOIN` (múltiples tablas en cadena) y análisis de rendimiento con `CROSS JOIN`.
* **Filtrado avanzado y fechas:** Manipulación de intervalos temporales con `DATEDIFF`, `DATE`, filtros de estados nulos (`IS NULL`).
* **Agregaciones y Agrupaciones:** `GROUP BY`, `HAVING`, funciones de agregación (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) y concatenación de cadenas (`GROUP_CONCAT` / `STRING_AGG`).
* **Subconsultas y Lógica de Negocio:** Subconsultas escalares y correlacionadas (`EXISTS`, `IN`, `>= ALL/ANY`).

---

## 🚀 Cómo Ejecutar las Consultas

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/tu-repositorio.git](https://github.com/tu-usuario/tu-repositorio.git)
