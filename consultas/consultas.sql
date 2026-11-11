
-- =====================================================
-- SISTEMA DE GESTION DE DONACIONES Y BANCO DE ALIMENTOS
-- CONSULTAS DE ALGEBRA RELACIONAL
-- =====================================================

USE banco_alimentos;


-- =====================================================
-- CONSULTA 1: SELECCION Y PROYECCION
-- Algebra relacional: π nombre, unidad_medida,
-- cantidad_disponible (σ cantidad_disponible > 0 (PRODUCTOS))
-- =====================================================

SELECT nombre, unidad_medida, cantidad_disponible
FROM PRODUCTOS
WHERE cantidad_disponible > 0;


-- =====================================================
-- CONSULTA 2: UNION
-- Algebra relacional:
-- π nombre_completo, tipo (DONANTES)
-- UNION
-- π nombre_completo, tipo (BENEFICIARIOS)
-- =====================================================

SELECT nombre_completo, tipo
FROM DONANTES

UNION

SELECT nombre_completo, tipo
FROM BENEFICIARIOS;


-- =====================================================
-- CONSULTA 3: INTERSECCION Y DIFERENCIA
-- =====================================================

-- INTERSECCION: productos que fueron donados y solicitados.

SELECT DISTINCT dd.id_producto
FROM DETALLE_DONACION dd
WHERE dd.id_producto IN (
    SELECT ds.id_producto
    FROM DETALLE_SOLICITUD ds
);


-- DIFERENCIA: productos solicitados que no aparecen
-- en los detalles de donacion.

SELECT DISTINCT ds.id_producto
FROM DETALLE_SOLICITUD ds
WHERE ds.id_producto NOT IN (
    SELECT dd.id_producto
    FROM DETALLE_DONACION dd
);


-- =====================================================
-- CONSULTA 4: PRODUCTO CARTESIANO CON SELECCION
-- Algebra relacional:
-- π CATEGORIAS.nombre, PRODUCTOS.nombre
-- (σ CATEGORIAS.id_categoria = PRODUCTOS.id_categoria
-- (CATEGORIAS × PRODUCTOS))
-- =====================================================

SELECT c.nombre AS categoria,
       p.nombre AS producto
FROM CATEGORIAS c
CROSS JOIN PRODUCTOS p
WHERE c.id_categoria = p.id_categoria;


-- =====================================================
-- CONSULTA 5: JOIN Y AGRUPAMIENTO
-- Algebra relacional:
-- γ nombre; SUM(cantidad_entregada)
-- (PRODUCTOS ⋈ DETALLE_ENTREGA)
-- =====================================================

SELECT p.id_producto,
       p.nombre,
       SUM(de.cantidad_entregada) AS total_entregado
FROM PRODUCTOS p
JOIN DETALLE_ENTREGA de
    ON p.id_producto = de.id_producto
GROUP BY p.id_producto, p.nombre
ORDER BY p.nombre;
