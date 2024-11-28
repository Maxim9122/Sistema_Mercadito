-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2024 a las 17:29:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mercadito_jr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `descripcion`) VALUES
(1, 'Indumentaria'),
(2, 'Calzados'),
(3, 'Accesorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `descripcion`) VALUES
(1, 'admin'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `categoria_id` int(10) DEFAULT NULL,
  `precio` double(255,0) NOT NULL,
  `precio_vta` double(255,0) NOT NULL,
  `stock` int(11) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `eliminado` varchar(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `categoria_id`, `precio`, `precio_vta`, `stock`, `stock_min`, `imagen`, `eliminado`) VALUES
(1, 'Bajo cero', 'cerveza quilmes', 1, 1460, 1900, 0, 6, '1729961192_1e2f5a6312a493a1dd86.jpg', 'NO'),
(2, 'Mayonesa Natura 250g', 'mayo natura 250gr', 2, 700, 1200, 5, 6, '1729961577_40f5145112c2c675fcfd.jpg', 'NO'),
(3, 'Yerba Cruz Malta', 'yerba de 500gr', 2, 1200, 2000, 16, 3, '1729961855_3ed89336f03ba5cc7f60.jpg', 'NO'),
(4, 'Costilla Nobillo', 'Costilla especial', 3, 2000, 4000, 13, 5, '1730030917_e095ce4d4a2ed43db628.png', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(10) NOT NULL,
  `mensaje` varchar(300) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `visitante` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `mensaje`, `estado`, `visitante`) VALUES
(7, 'Maxim', 'kkeelingo_a369s@hxsni.com', 4545668, 'Hola kase', 'Pendiente', 'Si'),
(13, 'Lukitas', 'Lukais@gmail.com', 45468465, 'Esta ves si vamos a tomar algo boló.', 'Pendiente', 'No'),
(18, 'Edis', 'eledis@gmail.com', 1234567890, 'hola', 'Pendiente', 'No');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `telefono` int(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `perfil_id` int(11) NOT NULL DEFAULT 2,
  `baja` varchar(20) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `usuario`, `telefono`, `direccion`, `email`, `pass`, `perfil_id`, `baja`) VALUES
(1, 'Rocio', 'Luna', 'Rocio22', 1234567890, 'B Don Santiago', 'Rocio@gmail.com', '$2y$10$IMT0n1eJ77oG9fFzBdU4meLMJuoYiYq7pmgTbUNIHEo34pUn4ehAq', 1, 'NO'),
(2, 'Jony', 'Maciel', 'Jony22', 1234567890, 'B Don Santiago', 'Jony@gmail.com', '$2y$10$YnarWkyA.kcom.N4zJHLc.pdEaQMdkDSiQPk1mX2n0zhiCez3bS.m', 2, 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_cabecera`
--

CREATE TABLE `ventas_cabecera` (
  `id` int(10) NOT NULL,
  `fecha` varchar(10) NOT NULL,
  `hora` varchar(10) NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `total_venta` double(10,2) NOT NULL,
  `tipo_pago` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas_cabecera`
--

INSERT INTO `ventas_cabecera` (`id`, `fecha`, `hora`, `usuario_id`, `total_venta`, `tipo_pago`) VALUES
(2, '30-10-2024', '13:42:20', 2, 5200.00, 'Efectivo'),
(3, '29-10-2024', '13:42:49', 2, 2000.00, 'Efectivo'),
(4, '30-10-2024', '19:28:08', 2, 5200.00, 'Efectivo'),
(5, '30-10-2024', '19:28:40', 2, 2000.00, 'Efectivo'),
(6, '31-10-2024', '18:59:57', 2, 8000.00, 'Transferencia'),
(11, '01-11-2024', '11:40:59', 2, 10000.00, 'Efectivo'),
(12, '01-11-2024', '12:59:40', 2, 4700.00, 'Transferencia'),
(13, '01-11-2024', '13:04:03', 2, 500.00, 'Efectivo'),
(14, '01-11-2024', '13:05:05', 2, 500.00, 'Efectivo'),
(15, '01-11-2024', '13:05:31', 2, 500.00, 'Efectivo'),
(16, '01-11-2024', '13:08:34', 2, 11000.00, 'Transferencia'),
(17, '01-11-2024', '19:59:41', 2, 2000.00, 'Efectivo'),
(18, '01-11-2024', '20:00:21', 2, 2000.00, 'Efectivo'),
(19, '01-11-2024', '22:38:37', 2, 6400.00, 'Efectivo'),
(20, '16-11-2024', '12:31:51', 2, 11600.00, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `id` int(10) NOT NULL,
  `venta_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `precio` double(10,2) UNSIGNED NOT NULL,
  `total` double(10,2) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio`, `total`) VALUES
(1, 2, 4, 1, 4000.00, 4000.00),
(2, 2, 2, 1, 1200.00, 1200.00),
(3, 3, 3, 1, 2000.00, 2000.00),
(4, 4, 4, 1, 4000.00, 4000.00),
(5, 4, 2, 1, 1200.00, 1200.00),
(6, 5, 3, 1, 2000.00, 2000.00),
(7, 6, 4, 2, 4000.00, 8000.00),
(8, 7, 4, 1, 4000.00, 4000.00),
(16, 11, 4, 2, 4000.00, 8000.00),
(10, 8, 4, 3, 4000.00, 12000.00),
(11, 8, 0, 1, 1900.00, 1900.00),
(12, 9, 4, 3, 4000.00, 12000.00),
(17, 11, 0, 1, 2000.00, 2000.00),
(18, 12, 4, 1, 4000.00, 4000.00),
(19, 12, 0, 1, 700.00, 700.00),
(20, 13, 0, 1, 500.00, 500.00),
(21, 14, 0, 1, 500.00, 500.00),
(22, 15, 0, 1, 500.00, 500.00),
(23, 16, 4, 2, 4000.00, 8000.00),
(24, 16, 0, 1, 3000.00, 3000.00),
(25, 19, 2, 2, 1200.00, 2400.00),
(26, 19, 0, 1, 4000.00, 4000.00),
(27, 20, 2, 3, 1200.00, 3600.00),
(28, 20, 3, 2, 2000.00, 4000.00),
(29, 20, 4, 1, 4000.00, 4000.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_id` (`perfil_id`);

--
-- Indices de la tabla `ventas_cabecera`
--
ALTER TABLE `ventas_cabecera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas_cabecera`
--
ALTER TABLE `ventas_cabecera`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
