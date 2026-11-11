\# Sistema de Gestión de Donaciones y Banco de Alimentos



Sistema académico desarrollado con MySQL para administrar donaciones, productos, inventario, solicitudes y entregas de un banco de alimentos.



\---



\## Menú de navegación



| Sección | Acceso |

|---|---|

| 📄 Informe final | \[Ver informe PDF](documentacion/Informe\_Final\_Base\_de\_Datos.pdf) |

| 📝 Informe editable | \[Ver informe Word](documentacion/Informe\_Final\_Base\_de\_Datos.docx) |

| 📊 Diagrama entidad-relación | \[Ver diagrama](documentacion/Modelo\_Entidad\_Relacion.png) |

| 🗂️ Modelo relacional | \[Ver modelo](documentacion/Modelo\_Relacional.png) |

| 🗄️ Base de datos | \[Abrir script SQL](base\_de\_datos/banco\_alimentos.sql) |

| 💻 Consultas SQL | \[Ver consultas](consultas/consultas.sql) |



\---



\## Descripción del proyecto



El proyecto consiste en diseñar e implementar una base de datos relacional que permita organizar y controlar las donaciones recibidas y los productos entregados a diferentes beneficiarios.



\## Objetivo general



Desarrollar una base de datos que facilite la administración de la información de donantes, productos, inventario, beneficiarios, solicitudes, donaciones y entregas.



\## Estructura de la base de datos



La base de datos está conformada por 11 tablas:



1\. DONANTES

2\. CATEGORIAS

3\. INVENTARIO

4\. PRODUCTOS

5\. DONACIONES

6\. DETALLE\_DONACION

7\. BENEFICIARIOS

8\. SOLICITUDES

9\. DETALLE\_SOLICITUD

10\. ENTREGAS

11\. DETALLE\_ENTREGA



\## Contenido del repositorio



\- \*\*documentacion/\*\*: informe final y diagramas del proyecto.

\- \*\*base\_de\_datos/\*\*: script SQL para crear las tablas e insertar los datos.

\- \*\*consultas/\*\*: consultas SQL utilizadas en el proyecto.



\## Requisitos



\- MySQL Server.

\- MySQL Workbench (recomendado).



\## Instalación



1\. Abrir MySQL Workbench.

2\. Conectarse al servidor MySQL.

3\. Abrir el archivo `base\\\_de\\\_datos/banco\\\_alimentos.sql`.

4\. Ejecutar el script SQL.

5\. Comprobar la creación de las 11 tablas y sus registros.



\## Consultas realizadas



El archivo `consultas/consultas.sql` contiene operaciones de:



\- Selección y proyección.

\- Unión.

\- Intersección y diferencia.

\- Producto cartesiano con selección.

\- JOIN y agrupamiento.



\---



\## Autoría



Proyecto académico desarrollado como parte de la asignatura de Bases de Datos.

