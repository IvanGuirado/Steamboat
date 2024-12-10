-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;




-- Volcando estructura para tabla steamboat_laravel.carrito
CREATE TABLE IF NOT EXISTS `carrito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_producto` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `talla` char(3) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user_id_producto_talla_color` (`id_user`,`id_producto`,`talla`,`color`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.carrito: 0 rows
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.failed_jobs: 0 rows
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.imagenes_producto
CREATE TABLE IF NOT EXISTS `imagenes_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `color` varchar(20) NOT NULL,
  `imagen` varchar(512) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.imagenes_producto: ~6 rows (aproximadamente)
INSERT INTO `imagenes_producto` (`id`, `id_producto`, `color`, `imagen`, `orden`) VALUES
	(2, 3, 'naranja', '2.jpg', 1),
	(3, 3, 'rojo', '3.jpg', 1),
	(4, 212, 'negro', '/uploads/productos/212/bangers.PNG', NULL),
	(5, 212, 'verde', '/uploads/productos/212/bc8a791f-5654-4487-8a62-ed15533dd656.jpg', NULL),
	(6, 212, 'rojo', '/uploads/productos/212/Captura.JPG', NULL),
	(7, 212, 'negro', '/uploads/productos/212/Cute-Monster-In-Tim-Burton-Style-Nightmare-Before-Christmas-5D-74209358-1.png', NULL);

-- Volcando estructura para tabla steamboat_laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.migrations: 4 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_08_19_000000_create_failed_jobs_table', 1),
	(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(3, '2023_09_01_150026_producto', 1),
	(4, '2024_09_27_101112_create_seo_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `userId` int(10) unsigned NOT NULL,
  `total` double NOT NULL,
  `notas` varchar(512) DEFAULT NULL,
  `estado` enum('Pendiente','Enviado','Recibido','Incidencia','Cancelado','Devuelto') NOT NULL DEFAULT 'Pendiente',
  `direccion_envio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pedidos_users` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.pedidos: 0 rows
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.pedidos_productos
CREATE TABLE IF NOT EXISTS `pedidos_productos` (
  `producto_Id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `pedido_Id` int(10) unsigned NOT NULL,
  `talla` char(3) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '',
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `precio_unidad` double NOT NULL DEFAULT 0,
  KEY `FK_pedidos_productos_productos` (`producto_Id`),
  KEY `FK_pedidos_productos_pedidos` (`pedido_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.pedidos_productos: 0 rows
/*!40000 ALTER TABLE `pedidos_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_productos` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.personal_access_tokens: 0 rows
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imagen` varchar(191) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_en` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `detalle` text NOT NULL,
  `detalle_en` text NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `descripcion_en` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.productos: 5 rows
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `imagen`, `nombre`, `nombre_en`, `descripcion`, `precio`, `detalle`, `detalle_en`, `categoria`, `created_at`, `updated_at`, `descripcion_en`) VALUES
	(212, '/uploads/gorra lana.jpg', 'Noir', 'Noir', 'Gorro hecho de suave lana en color negro, cuenta con un bordado de una rueda de barco en el frente.', 14, '<font size="2" face="arial">El gorro <b>Noir </b>está confeccionado en suave lana, ofreciendo comodidad y calidez en cualquier clima frío. Su diseño minimalista en color negro destaca por un elegante bordado de una rueda de barco en la parte frontal, añadiendo un toque náutico y único. Perfecto para quienes buscan un accesorio versátil y estilizado, este gorro combina funcionalidad y estilo, manteniéndote abrigado mientras reflejas una estética marinera sofisticada.</font>', '<font face="arial" size="2">The Noir beanie is made from soft wool, providing comfort and warmth in any cold weather. Its minimalist design in black features an elegant embroidered ship\'s wheel on the front, adding a unique nautical touch. Perfect for those looking for a versatile and stylish accessory, this beanie combines functionality and style, keeping you warm while reflecting a sophisticated maritime aesthetic.</font>', 'Hombre, Mujer, Gorro, Accesorios', '2024-10-15 15:56:35', '2024-10-23 13:20:22', 'Winter hat made from soft wool in black, featuring an embroidered ship\'s wheel on the front.'),
	(0, '/uploads/IMG_7075.PNG', 'Queen Catrina', 'Queen Catrina', 'Camiseta 100% algodón de cuello scoop.', 24, '<font face="arial" size="2">Camiseta 100% algodón de cuello scoop, en color negro, presenta un vibrante diseño de una catrina esqueleto, un ícono tradicional del Día de los Muertos. El detalle del arte captura la elegancia y simbolismo de la catrina, con colores vivos que resaltan sobre el fondo oscuro, ofreciendo una combinación perfecta de estilo y cultura. Confeccionada en tejido suave y transpirable, esta camiseta es ideal para expresar tu aprecio por las tradiciones mexicanas mientras disfrutas de comodidad y un ajuste moderno.</font>', '<font face="arial" size="2">100% cotton scoop neck t-shirt in black features a vibrant design of a Catrina skeleton, a traditional icon of the Day of the Dead. The artwork captures the elegance and symbolism of the Catrina, with vivid colors that stand out against the dark background, offering the perfect blend of style and culture. Made from soft, breathable fabric, this t-shirt is ideal for expressing your appreciation for Mexican traditions while enjoying comfort and a modern fit.</font>', 'Camisetas, Mujer, Cuello Scoop, Negro', '2024-10-15 15:43:46', '2024-10-15 16:03:58', '100% cotton scoop neck t-shirt.'),
	(2, '/uploads/24975D66-56C9-487B-9E36-4CF68814E48E.png', 'Kois', 'Kois', 'Sudadera Negra de 300 GSM con Diseño de Peces Koi.', 40, '<font size="2">Esta sudadera negra de 300 GSM ofrece el equilibrio perfecto entre comodidad y estilo, confeccionada con una suave mezcla de 80% algodón y 20% poliéster que asegura durabilidad y un ajuste cómodo. Su diseño presenta unos intrigantes peces Koi con un toque artístico único y un estilo oscuro y detallado que aporta un aire de misterio. Ideal para quienes buscan una prenda distintiva que combine originalidad y funcionalidad, esta sudadera es perfecta tanto para el uso diario como para destacar en ocasiones especiales.</font>', '<font size="2">This black sweatshirt, crafted from a soft blend of 80% cotton and 20% polyester, offers the perfect balance of comfort and style. With a 300 GSM fabric, it ensures durability and a comfortable fit. The design features intriguing Koi fish with a unique, artistic flair and dark, detailed style, adding an air of mystery to the piece. Ideal for those looking for a distinctive garment that combines originality and functionality, this sweatshirt is perfect for everyday wear or standing out on special occasions.</font>', 'Sudaderas, Unisex, Mujer, Hombre', '2024-10-08 18:13:56', '2024-10-08 18:19:03', 'Black 300 GSM Sweatshirt with Koi Fish Design'),
	(3, '/uploads/7F3D9823-3689-4549-AF16-35ED062275E8.PNG', 'Nightfall', 'Nightfall', 'Camiseta manga corta negra Nightfall', 21, '<font size="2" style="">La camiseta Nightfall está confeccionada con 100% algodón, lo que garantiza una sensación suave y cómoda para el uso diario. En la parte delantera, luce un discreto logo de una rueda en pequeño, mientras que en la parte trasera el mismo logo se destaca en mayor tamaño sobre un fondo blanco, creando un contraste moderno y llamativo. Con su diseño minimalista pero impactante, esta camiseta es ideal para quienes buscan un estilo sencillo pero cargado de personalidad.</font>', '<font size="2">The Nightfall t-shirt is made from 100% cotton, offering a soft and comfortable feel for everyday wear. It features a small wheel logo on the front, while the same logo appears larger on the back over a white background, creating a bold yet modern contrast. With its minimalist yet striking design, this t-shirt is perfect for those who seek a simple style with a strong personality.</font>', 'Camisetas, Unisex, Mujer, Hombre', '2024-10-08 18:26:06', '2024-10-08 18:26:06', 'Nightfall Black Short-Sleeve T-Shirt'),
	(4, '/uploads/222B5F61-B2E5-46DE-A702-E7B38D4BD5F5.png', 'Rose', 'Rose', 'Sudadera 380 GSM en color Hawthorn Rose.', 40, '<p><font size="2" face="arial">Esta sudadera en color Hawthorn Rose combina estilo y calidad, confeccionada con una mezcla de 80% algodón y 20% poliéster, que ofrece una sensación suave al tacto y gran durabilidad. Con un tejido de 380 GSM, es lo suficientemente gruesa para mantenerte cómodo y abrigado en cualquier ocasión. El elegante bordado gris en el pecho y sobre uno de los hombros le añade un toque distintivo y moderno, elevando el estilo urbano con detalles sofisticados. Ideal tanto para el día a día como para ocasiones más especiales, esta sudadera es la fusión perfecta entre comodidad, estilo y originalidad.</font></p>', '<font face="arial" size="2">This <strong>Hawthorn Rose</strong> sweatshirt combines style and quality, crafted from a blend of <strong>80% cotton</strong> and <strong>20% polyester</strong> for softness and durability. With a <strong>380 GSM</strong> fabric, it\'s thick enough to provide warmth and comfort in any situation. The elegant <strong>grey embroidery</strong> on the chest and shoulder adds a modern and distinctive touch, perfect for elevating your urban style. Ideal for everyday wear or more special occasions, this sweatshirt offers the perfect combination of comfort, design, and originality.</font>', 'Sudaderas, Unisex, Mujer, Hombre', '2024-10-08 18:03:48', '2024-10-08 18:20:18', '380 GSM Sweatshirt in Hawthorn Rose.');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla steamboat_laravel.seo
CREATE TABLE IF NOT EXISTS `seo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `description` longtext DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `author` varchar(191) DEFAULT NULL,
  `robots` varchar(191) DEFAULT NULL,
  `canonical_url` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seo_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.seo: ~5 rows (aproximadamente)
INSERT INTO `seo` (`id`, `model_type`, `model_id`, `description`, `title`, `image`, `author`, `robots`, `canonical_url`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\Producto', 208, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-08 18:03:48', '2024-10-08 18:03:48'),
	(2, 'App\\Models\\Producto', 209, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-08 18:13:56', '2024-10-08 18:13:56'),
	(3, 'App\\Models\\Producto', 210, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-08 18:26:06', '2024-10-08 18:26:06'),
	(4, 'App\\Models\\Producto', 211, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 15:43:46', '2024-10-15 15:43:46'),
	(5, 'App\\Models\\Producto', 212, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-15 15:56:35', '2024-10-15 15:56:35');

-- Volcando estructura para tabla steamboat_laravel.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id_producto` int(11) NOT NULL,
  `talla` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.stock: ~11 rows (aproximadamente)
INSERT INTO `stock` (`id_producto`, `talla`, `color`, `cantidad`) VALUES
	(2, 'L', 'Negro', 3),
	(2, 'S', 'Negro', 5),
	(4, 'S', 'hawthorn Rose', 3),
	(3, 'L', 'AZUL', 2),
	(3, 'S', 'Negro', 3),
	(3, 'L', 'Blanca', 4),
	(212, 'M', 'rojo', 3),
	(212, 'M', 'verde', 2),
	(212, 'M', 'azul', 3),
	(212, 'M', 'negro', 5),
	(0, 'L', 'Negro', 2),
	(0, 'S', 'Negro', 3);

-- Volcando estructura para tabla steamboat_laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `pc` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `language` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.users: 6 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `created_at`, `updated_at`, `birthdate`, `address`, `province`, `pc`, `country`, `city`, `remember_token`, `language`) VALUES
	(1, 'ivan', 'Guirado Cebrero', 'lordefrey@gmail.com', '$2y$10$/5w39I8EYVxnh41CCFoc/.QJxr5au3W6JgSSzI0nskILW8cfd.PRG', '2023-11-02 19:03:37', '2024-10-24 16:59:25', '1986-10-17', 'Fra Pare Joan Cerda 31', 'Islas Baleares', '07300', 'España', 'INCA', 'JxjTJ9z0CTuwK9zkvJVwm4LuNbTV9RbJWM4xHG6IKrogkkY74LdJcighkIhb', 'es'),
	(7, 'Pepe', 'palitos', 'papa@gmail.com', '$2y$10$8psivlMTrltCSgZ/MYeHauA9iMKhK15XQaay//RLlzhEj6aSx08ti', '2024-10-08 16:13:50', '2024-10-08 16:13:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'Paco', 'hjdhdj', 'riac@gmail.com', '$2y$10$Mipycd24LeltP8Qytr9oXOlGRYPfQFAzhOuQdZIfoG3BM2VIjrkru', '2024-10-08 16:26:21', '2024-10-08 16:26:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'iop', 'saa', 'rere@gmail.com', '$2y$10$Lpj4p0fGk6UcwmSqWWHh5OUh9C5uMTu2FoMSxOTIIj4IU3v3Sl/2e', '2024-10-08 16:32:04', '2024-10-08 16:32:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Ivan', 'Guirado', 'ivan@gmail.com', '$2y$10$2T6eTHgm0WwTVslzk8DCquc8dQ0fFoMaxQIkwafV7DZJuF9GqSHqW', '2024-10-08 16:34:22', '2024-10-08 16:34:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, '', '', '', '$2y$10$gRsENu0QW3.HxswtEn7cnOKMT4NYON/aCF9dVbIfkDN9EEtpeQYTC', '2024-10-08 16:52:59', '2024-10-08 16:52:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
