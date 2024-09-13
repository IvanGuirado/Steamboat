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


-- Volcando estructura de base de datos para steamboat_laravel
CREATE DATABASE IF NOT EXISTS `steamboat_laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `steamboat_laravel`;

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- Volcando estructura para tabla steamboat_laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.migrations: 3 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_08_19_000000_create_failed_jobs_table', 1),
	(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(3, '2023_09_01_150026_producto', 1);
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
  `colores` varchar(70) NOT NULL,
  `tallas` varchar(20) DEFAULT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` double NOT NULL DEFAULT 0,
  `detalle` text NOT NULL,
  `detalle_en` text NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock` int(10) unsigned NOT NULL,
  `descripcion_en` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.productos: 200 rows
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `imagen`, `nombre`, `nombre_en`, `colores`, `tallas`, `descripcion`, `precio`, `detalle`, `detalle_en`, `categoria`, `created_at`, `updated_at`, `stock`, `descripcion_en`) VALUES
	(1, 'https://via.placeholder.com/500x500.png/00eeff?text=Mujer%2Csudaderas+vel', 'Omnis', '', 'Rojo, Negro, Azul', 'S,M,L', 'Voluptatum sit ut quo necessitatibus.', 49, 'Voluptatum at in.', '', 'Mujer,sudaderas', '2023-09-29 16:04:58', '2023-12-10 16:46:24', 8, NULL),
	(2, 'https://via.placeholder.com/500x500.png/00ffaa?text=sudaderas%2Cgorras+exercitationem', 'Maiores.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Doloribus est harum quia officiis ea.', 30, 'Quia eum blanditiis.', '', 'sudaderas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(3, 'https://via.placeholder.com/500x500.png/00ddee?text=Hombre%2CMujer+et', 'Ea quis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Consectetur nam omnis inventore nulla aperiam adipisci.', 39, 'Minus delectus quos.', '', 'Hombre,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(4, 'https://via.placeholder.com/500x500.png/008800?text=gorras%2Cgorras+assumenda', 'Est qui.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et quidem temporibus commodi sapiente quidem aut ut.', 5, 'Et voluptatibus.', '', 'gorras,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(5, 'https://via.placeholder.com/500x500.png/00eecc?text=gorras%2Cgorras+est', 'Molestias.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Alias quae unde qui porro.', 35, 'Vitae quos harum.', '', 'gorras,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(6, '/uploads/e6ee4fc8-364b-47f9-b236-c881d79591a6.JPG', 'Autem in.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Vitae laborum facilis rerum.', 25, 'Illo rerum tenetur.', '', 'gorras,Verano', '2023-09-29 16:04:58', '2023-10-19 17:15:09', 19, NULL),
	(7, 'https://via.placeholder.com/500x500.png/00aa44?text=sudaderas%2CMujer+culpa', 'Cumque.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Rerum doloribus animi odit dolor dolores numquam. Reprehenderit et aut voluptatem similique.', 6, 'Dolore est minima.', '', 'sudaderas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(8, 'https://via.placeholder.com/500x500.png/002222?text=Invierno%2CMujer+quam', 'Ut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Porro provident nostrum doloribus dolores sed sapiente. Molestiae aliquam nihil qui voluptate incidunt.', 33, 'Eius minus quaerat.', '', 'Invierno,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(9, 'https://via.placeholder.com/500x500.png/0011dd?text=gorras%2CMujer+eius', 'Et iure.', '', 'Rojo, Negro, Gris', 'S,M,L', 'Sint quam aut nobis. Et qui aut quasi repudiandae nemo.', 36, 'Labore et qui.', '', 'gorras,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(10, 'https://via.placeholder.com/500x500.png/009988?text=Mujer%2CMujer+id', 'Tempore.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Reprehenderit quia quisquam consequatur.', 25, 'Odit iusto.', '', 'Mujer,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(11, 'https://via.placeholder.com/500x500.png/00aa44?text=sudaderas%2Csudaderas+praesentium', 'Veritatis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Debitis quam debitis iste totam similique consequatur molestiae.', 31, 'Voluptas in minus.', '', 'sudaderas,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(12, 'https://via.placeholder.com/500x500.png/00ff88?text=Mujer%2Csudaderas+et', 'Iste eos.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Itaque dolorem autem est aut incidunt consequatur ratione aspernatur.', 49, 'Quis inventore.', '', 'Mujer,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(13, 'https://via.placeholder.com/500x500.png/00ee44?text=Camisetas%2Csudaderas+magnam', 'Et.', '', 'Rojo, Negro, Blanco', 'S,M', 'Quas nostrum rem voluptatibus.', 16, 'Eligendi maxime.', '', 'Camisetas,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(14, 'https://via.placeholder.com/500x500.png/00aa33?text=Camisetas%2CInvierno+aut', 'Eos.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Laboriosam harum esse dignissimos.', 9, 'Error velit sed.', '', 'Camisetas,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(15, 'https://via.placeholder.com/500x500.png/0022cc?text=Camisetas%2CMujer+explicabo', 'Cum et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quia rerum tempora totam natus eum doloribus.', 44, 'Ea in harum sit.', '', 'Camisetas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(16, 'https://via.placeholder.com/500x500.png/004411?text=Verano%2CMujer+facere', 'Minima.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quis aperiam sed non.', 10, 'Facilis sint.', '', 'Verano,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(17, 'https://via.placeholder.com/500x500.png/009988?text=Invierno%2Csudaderas+odio', 'Et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ut et eligendi dolores nam. Placeat possimus et rerum voluptatem.', 28, 'Voluptatem vitae.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(18, 'https://via.placeholder.com/500x500.png/00aaff?text=Mujer%2CCamisetas+non', 'Et quae', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptas corporis saepe minus quisquam dicta consequatur dolorem fugiat. Et et et veritatis rem blanditiis dolor.', 44, 'Et odit qui.', '', 'Mujer,Camisetas', '2023-09-29 16:04:58', '2023-12-14 13:50:27', 2, NULL),
	(19, 'https://via.placeholder.com/500x500.png/00cc77?text=sudaderas%2Csudaderas+quas', 'Enim quos.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Blanditiis error recusandae eos qui. Non aut molestiae est adipisci omnis odit similique.', 48, 'Aut velit ut rerum.', '', 'sudaderas,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(20, 'https://via.placeholder.com/500x500.png/008866?text=sudaderas%2CMujer+nisi', 'Non sed.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ullam vel qui eveniet quisquam veniam voluptas.', 33, 'Qui in sit ea.', '', 'sudaderas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(21, 'https://via.placeholder.com/500x500.png/001166?text=Hombre%2CVerano+ut', 'Et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Explicabo ut ut hic nihil. Blanditiis illo aliquid hic quis sit qui.', 18, 'Aliquid nobis.', '', 'Hombre,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(22, 'https://via.placeholder.com/500x500.png/009933?text=gorras%2Cgorras+voluptas', 'Deserunt.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aliquam doloribus cumque velit ratione laborum voluptas sed non. Dolores sint quod consectetur amet repellendus.', 24, 'Qui quibusdam nulla.', '', 'gorras,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(23, 'https://via.placeholder.com/500x500.png/00cc77?text=Mujer%2CMujer+fugiat', 'Culpa est.', '', 'Rojo, Negro, Blanco', 'M,L', 'Est eos omnis eaque dolor neque.', 44, 'Et corrupti saepe.', '', 'Mujer,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(24, 'https://via.placeholder.com/500x500.png/00aa66?text=gorras%2CHombre+rerum', 'Molestias.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptatem mollitia facilis officiis et illum accusamus aperiam.', 8, 'Eos quasi.', '', 'gorras,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(25, 'https://via.placeholder.com/500x500.png/0011dd?text=Camisetas%2Cgorras+est', 'Odit.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Est sed dolore facilis maiores dolor iure unde. Omnis voluptatibus odio debitis maiores aspernatur reiciendis aut.', 26, 'Sint ut suscipit.', '', 'Camisetas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(26, 'https://via.placeholder.com/500x500.png/001133?text=Mujer%2Csudaderas+eos', 'Veritatis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et qui qui quo provident consequatur voluptas. Quaerat sit et quaerat illum iste ad quod.', 50, 'Vel nihil maxime.', '', 'Mujer,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(27, 'https://via.placeholder.com/500x500.png/0022ee?text=Mujer%2CHombre+ab', 'Est aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quasi eum eum recusandae.', 35, 'Illo non odit et.', '', 'Mujer,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(28, 'https://via.placeholder.com/500x500.png/006666?text=Verano%2CVerano+necessitatibus', 'Mollitia.', '', 'Rojo, Negro, Blanco', 'M,L,XL', 'Excepturi totam a quidem maiores sit quia. Et esse ut suscipit dolores.', 29, 'Quis sint numquam.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(29, 'https://via.placeholder.com/500x500.png/00bb66?text=Mujer%2Cgorras+dolore', 'Minus aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quo ipsum et magni placeat.', 49, 'Consequatur numquam.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(30, 'https://via.placeholder.com/500x500.png/0011aa?text=Hombre%2CMujer+repellendus', 'Est ipsam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Distinctio ea voluptatem ratione quis earum ut deserunt nisi. Asperiores quo est harum.', 30, 'Velit accusamus.', '', 'Hombre,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(31, 'https://via.placeholder.com/500x500.png/005511?text=sudaderas%2CVerano+quis', 'Pariatur.', '', 'Rojo, Negro, Blanco', 'S,M,L,XL', 'Necessitatibus saepe vitae cumque architecto aut.', 32, 'Ab at similique.', '', 'sudaderas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(32, 'https://via.placeholder.com/500x500.png/00ff99?text=Invierno%2Cgorras+at', 'Quidem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Laudantium accusantium maxime quidem.', 36, 'Libero ea non.', '', 'Invierno,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(33, 'https://via.placeholder.com/500x500.png/002266?text=sudaderas%2CVerano+commodi', 'Officiis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et earum accusamus repellat ab minus. A illum autem modi quaerat.', 27, 'Id id quis.', '', 'sudaderas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(34, 'https://via.placeholder.com/500x500.png/00dd99?text=Mujer%2Cgorras+sed', 'Qui quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quibusdam eligendi esse distinctio facere repudiandae odit ducimus.', 36, 'Quod voluptas hic.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(35, 'https://via.placeholder.com/500x500.png/007755?text=sudaderas%2CCamisetas+perspiciatis', 'Quisquam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Non nam quo voluptate eum.', 39, 'Et ex at non.', '', 'sudaderas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(36, 'https://via.placeholder.com/500x500.png/0099ff?text=Camisetas%2CMujer+nostrum', 'Aliquam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Delectus aliquid sint quia quam vel id eos.', 44, 'Recusandae facere a.', '', 'Camisetas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(37, 'https://via.placeholder.com/500x500.png/00bbcc?text=Invierno%2CMujer+non', 'Et eos.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Totam unde quidem nisi amet voluptatum sint.', 27, 'Ut atque iusto sunt.', '', 'Invierno,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(38, 'https://via.placeholder.com/500x500.png/00ddcc?text=Invierno%2Csudaderas+repellat', 'Eius.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quia autem aspernatur ut architecto consectetur voluptas.', 42, 'Consequuntur.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(39, 'https://via.placeholder.com/500x500.png/0055bb?text=Verano%2CVerano+natus', 'Debitis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Numquam dolores dignissimos minus molestiae quae enim assumenda quasi.', 30, 'Ea occaecati autem.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(40, 'https://via.placeholder.com/500x500.png/006655?text=Camisetas%2CVerano+commodi', 'Sint.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Hic cupiditate doloribus consequatur nihil ut ut beatae rerum. Autem rerum autem eum quam modi.', 23, 'Qui quaerat et sunt.', '', 'Camisetas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(41, 'https://via.placeholder.com/500x500.png/0055aa?text=gorras%2CInvierno+eveniet', 'Dolor.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quia et sed est natus sed.', 26, 'Repellendus ea eos.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(42, 'https://via.placeholder.com/500x500.png/007722?text=Mujer%2CVerano+dolor', 'Eligendi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Rerum molestiae inventore odio ratione consectetur perspiciatis ut. Natus dolores consequuntur sit dicta sit.', 25, 'Voluptas vero fugit.', '', 'Mujer,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(43, 'https://via.placeholder.com/500x500.png/007766?text=Verano%2CHombre+omnis', 'Itaque ut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Velit quia ut ut.', 12, 'Est et quisquam.', '', 'Verano,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(44, 'https://via.placeholder.com/500x500.png/0077aa?text=Mujer%2Csudaderas+quae', 'Doloribus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Non rerum molestiae sapiente voluptatem est expedita.', 37, 'Sed aperiam earum.', '', 'Mujer,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(45, 'https://via.placeholder.com/500x500.png/0088cc?text=Invierno%2Cgorras+quia', 'Vel.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Fuga ullam tenetur aliquam vitae fugit praesentium sit.', 45, 'Provident.', '', 'Invierno,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(46, 'https://via.placeholder.com/500x500.png/00cccc?text=Verano%2CHombre+consequatur', 'Et aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'A et et dolorem delectus magnam minima hic. Quia voluptas vero sint.', 13, 'Sunt aut incidunt.', '', 'Verano,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(47, 'https://via.placeholder.com/500x500.png/0077dd?text=gorras%2CInvierno+aspernatur', 'Est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptas quibusdam eaque odio itaque hic. Distinctio inventore sed eos similique molestiae molestias.', 33, 'Asperiores quo.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(48, 'https://via.placeholder.com/500x500.png/007766?text=Mujer%2CMujer+cumque', 'Omnis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quis expedita est earum quod tenetur illum eligendi fugit. Saepe inventore eius harum eligendi.', 45, 'Atque velit.', '', 'Mujer,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(49, 'https://via.placeholder.com/500x500.png/00ff88?text=Camisetas%2CCamisetas+doloribus', 'Illum et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Odit et eum perferendis iste nisi accusantium quo.', 5, 'Qui et minus autem.', '', 'Camisetas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(50, 'https://via.placeholder.com/500x500.png/00ccee?text=Invierno%2CInvierno+amet', 'Et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et dolor consequuntur et rerum. Autem harum odio doloribus repellat quae maiores.', 36, 'Magni voluptatem.', '', 'Invierno,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(51, 'https://via.placeholder.com/500x500.png/00ddcc?text=sudaderas%2CInvierno+sint', 'Laborum.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Culpa quidem cumque praesentium deserunt architecto sapiente beatae assumenda. Ipsa cumque deleniti soluta.', 18, 'Vel placeat nobis.', '', 'sudaderas,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(52, 'https://via.placeholder.com/500x500.png/005555?text=Invierno%2Cgorras+et', 'Qui.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolorem porro id animi officiis vitae est.', 34, 'Et illum alias vero.', '', 'Invierno,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(53, 'https://via.placeholder.com/500x500.png/00ddff?text=gorras%2CMujer+id', 'Qui.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Fugiat autem vitae iusto non. Dolor ut architecto fuga impedit sunt quam officia quis.', 18, 'Deserunt.', '', 'gorras,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(54, 'https://via.placeholder.com/500x500.png/001133?text=gorras%2CHombre+commodi', 'Molestiae.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Qui laborum et eum qui sapiente tenetur.', 37, 'Recusandae est nam.', '', 'gorras,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(55, 'https://via.placeholder.com/500x500.png/00eecc?text=Verano%2CVerano+maxime', 'Possimus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Eius et eius eos ut laboriosam debitis.', 50, 'Aut libero impedit.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(56, 'https://via.placeholder.com/500x500.png/00ccee?text=Mujer%2Cgorras+assumenda', 'Id minima.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et in totam quidem magnam repudiandae et.', 13, 'Et minima officiis.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(57, 'https://via.placeholder.com/500x500.png/0077dd?text=sudaderas%2CCamisetas+sit', 'Quas qui.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Repudiandae sunt qui animi labore in est veritatis.', 44, 'Qui quam optio esse.', '', 'sudaderas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(58, 'https://via.placeholder.com/500x500.png/007755?text=sudaderas%2Cgorras+non', 'Doloribus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Corporis odit itaque animi. Minima unde vel earum commodi necessitatibus aspernatur enim culpa.', 23, 'Ut ab numquam.', '', 'sudaderas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(59, 'https://via.placeholder.com/500x500.png/00dd00?text=gorras%2CHombre+tempora', 'Et libero.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et voluptatem quia eum qui.', 44, 'Quia quia dolorem.', '', 'gorras,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(60, 'https://via.placeholder.com/500x500.png/00ff22?text=sudaderas%2CHombre+laudantium', 'Eius est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aut illo natus facere modi sint.', 23, 'Voluptatem.', '', 'sudaderas,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(206, '/uploads/e6ee4fc8-364b-47f9-b236-c881d79591a6.JPG', 'sadff', '', 'Rojo, Negro, Blanco', 'S,M,L', 'fdgdf', 22, 'dfxfgd', '', 'camiseta', '2023-10-17 16:18:42', '2023-10-17 16:18:42', 0, NULL),
	(62, 'https://via.placeholder.com/500x500.png/0022aa?text=sudaderas%2CHombre+nihil', 'Quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Hic quo corporis asperiores quas repudiandae in.', 8, 'Non quia doloribus.', '', 'sudaderas,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(63, 'https://via.placeholder.com/500x500.png/00cc44?text=sudaderas%2CInvierno+accusantium', 'Animi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Natus repudiandae molestias fugit excepturi architecto a nemo. Eius neque eum adipisci aperiam sit.', 36, 'Porro temporibus.', '', 'sudaderas,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(64, 'https://via.placeholder.com/500x500.png/0077dd?text=Verano%2CVerano+ut', 'Molestias.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Assumenda quis nihil reprehenderit quo.', 16, 'Ex similique.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(65, 'https://via.placeholder.com/500x500.png/0044ee?text=Invierno%2Csudaderas+et', 'Quo.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptatem consequuntur et velit tempora.', 50, 'Soluta qui sunt.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(66, 'https://via.placeholder.com/500x500.png/0099ee?text=Invierno%2CMujer+voluptas', 'Ut eos.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolores facere inventore eligendi minima aut amet qui sunt.', 35, 'Iure numquam.', '', 'Invierno,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(67, 'https://via.placeholder.com/500x500.png/009988?text=gorras%2CInvierno+est', 'Eum autem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Est illo enim molestias ut cum qui quam. Odio dignissimos et delectus exercitationem harum voluptates sequi est.', 41, 'Qui ut provident.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(68, 'https://via.placeholder.com/500x500.png/002299?text=Mujer%2CInvierno+non', 'Nihil.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Qui dignissimos minus et a minus voluptatem quae.', 18, 'Voluptates dolor.', '', 'Mujer,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(69, 'https://via.placeholder.com/500x500.png/006622?text=sudaderas%2Cgorras+exercitationem', 'Aut et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sed cum natus nostrum quis expedita tempora et. Corrupti dolores laborum architecto illum officiis voluptas quo rem.', 14, 'Fugiat distinctio.', '', 'sudaderas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(70, 'https://via.placeholder.com/500x500.png/00eedd?text=Mujer%2CHombre+voluptates', 'Voluptate.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Porro molestiae et occaecati.', 9, 'Voluptate eos.', '', 'Mujer,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(71, 'https://via.placeholder.com/500x500.png/000022?text=Verano%2CInvierno+mollitia', 'Et ut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ratione commodi voluptatibus doloribus. Eum vero animi atque et.', 39, 'Et autem voluptatum.', '', 'Verano,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(72, 'https://via.placeholder.com/500x500.png/008888?text=gorras%2CHombre+aliquam', 'Cum.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quia eos et quo eaque hic non autem.', 33, 'Esse aut dolore et.', '', 'gorras,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(73, 'https://via.placeholder.com/500x500.png/003344?text=gorras%2Cgorras+nobis', 'Non quasi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Facilis voluptatem quo ipsum perferendis. Aliquam aut recusandae aut ut officiis vel.', 21, 'Et veniam voluptas.', '', 'gorras,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(74, 'https://via.placeholder.com/500x500.png/00ff11?text=Verano%2Cgorras+eligendi', 'Magni.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'In sit sint aut accusamus quis voluptatem. Nihil quia ab ad dolorem sunt repellat.', 34, 'Repudiandae sunt.', '', 'Verano,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(75, 'https://via.placeholder.com/500x500.png/0099cc?text=gorras%2CCamisetas+fuga', 'Quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dignissimos est harum enim explicabo et praesentium debitis quos.', 6, 'Corrupti cupiditate.', '', 'gorras,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(76, 'https://via.placeholder.com/500x500.png/003311?text=Hombre%2CMujer+aliquid', 'Sed nihil.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Similique dolor qui vel optio esse est ab omnis. Harum rerum eius fugit magnam odit sapiente.', 33, 'Quia adipisci.', '', 'Hombre,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(77, 'https://via.placeholder.com/500x500.png/008833?text=sudaderas%2CMujer+qui', 'Sint.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Consequatur maiores minus nobis voluptates qui explicabo qui. Esse illo minima voluptas voluptas quisquam amet.', 50, 'Voluptate inventore.', '', 'sudaderas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(78, 'https://via.placeholder.com/500x500.png/0022cc?text=Verano%2CHombre+ipsa', 'Eius quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Magnam voluptatem expedita exercitationem qui excepturi amet. Aut et ullam dolores et voluptas odio.', 37, 'Nostrum mollitia.', '', 'Verano,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(79, 'https://via.placeholder.com/500x500.png/007722?text=Invierno%2CMujer+aut', 'Nemo.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Autem repudiandae ut ea delectus voluptatem dolor est. Pariatur qui suscipit deserunt porro eius voluptatem ipsum ea.', 42, 'Dolores laudantium.', '', 'Invierno,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(80, 'https://via.placeholder.com/500x500.png/0066bb?text=Invierno%2Csudaderas+tempora', 'Est ut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Velit repellendus cumque quia cumque. Molestiae libero inventore vel quaerat.', 26, 'Molestias.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(81, 'https://via.placeholder.com/500x500.png/0099cc?text=Invierno%2CCamisetas+delectus', 'Commodi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolor consequatur sunt accusamus animi saepe facilis.', 26, 'Cum harum sit.', '', 'Invierno,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(82, 'https://via.placeholder.com/500x500.png/009955?text=Verano%2Csudaderas+libero', 'Quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sint neque mollitia veritatis.', 23, 'Voluptatem sed.', '', 'Verano,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(83, 'https://via.placeholder.com/500x500.png/00ddcc?text=sudaderas%2Cgorras+id', 'Sit neque.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Iure illo cupiditate omnis.', 50, 'Iure ut fugit ipsum.', '', 'sudaderas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(84, 'https://via.placeholder.com/500x500.png/00ddff?text=Camisetas%2CCamisetas+eos', 'Minus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Odio rerum occaecati molestiae temporibus.', 39, 'Accusamus.', '', 'Camisetas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(85, 'https://via.placeholder.com/500x500.png/004411?text=Mujer%2CVerano+sint', 'Expedita.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et quam adipisci ut modi quos.', 41, 'Veritatis quam.', '', 'Mujer,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(86, 'https://via.placeholder.com/500x500.png/00eebb?text=sudaderas%2Csudaderas+nemo', 'Provident.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Qui ab distinctio aut. Nam odio facilis perspiciatis dignissimos.', 24, 'Molestiae assumenda.', '', 'sudaderas,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(87, 'https://via.placeholder.com/500x500.png/0033bb?text=gorras%2CMujer+officiis', 'Expedita.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Occaecati libero pariatur aliquid et molestiae aut ut.', 35, 'Quo magnam.', '', 'gorras,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(88, 'https://via.placeholder.com/500x500.png/0066dd?text=Invierno%2CVerano+sed', 'Et et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aut quas consequatur enim voluptatum nesciunt. Distinctio quia incidunt atque asperiores esse beatae.', 8, 'Officiis non.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(89, 'https://via.placeholder.com/500x500.png/007733?text=sudaderas%2CCamisetas+ipsum', 'In.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Atque animi qui aut ut voluptatem.', 22, 'Dolores dicta ad.', '', 'sudaderas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(90, 'https://via.placeholder.com/500x500.png/00cc66?text=Mujer%2Cgorras+quasi', 'Iusto.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Error temporibus quia ex dignissimos. Mollitia omnis molestiae aut aut.', 12, 'Reiciendis qui est.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(91, 'https://via.placeholder.com/500x500.png/001100?text=Mujer%2CHombre+ut', 'Sapiente.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolore enim reiciendis totam quidem assumenda sit perspiciatis. Deserunt et quia alias voluptatibus.', 6, 'Et dicta et enim.', '', 'Mujer,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(92, 'https://via.placeholder.com/500x500.png/008888?text=Invierno%2CCamisetas+harum', 'Quo error.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Non quidem dolorem quis ut. Est vitae et molestias iure sit officiis voluptatem.', 14, 'Fugit et natus.', '', 'Invierno,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(93, 'https://via.placeholder.com/500x500.png/0044dd?text=gorras%2CInvierno+repellat', 'Veritatis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Unde enim minus repudiandae est ab sed dolorem ut.', 39, 'Laborum est ad est.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(94, 'https://via.placeholder.com/500x500.png/0099cc?text=Mujer%2CCamisetas+voluptates', 'Iure.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptatem consequatur ad tempora magnam qui quaerat.', 21, 'Qui tempore.', '', 'Mujer,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(96, 'https://via.placeholder.com/500x500.png/009988?text=Mujer%2CInvierno+sapiente', 'Provident.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quis id voluptatum accusantium aut doloribus.', 33, 'Velit accusamus ut.', '', 'Mujer,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(97, 'https://via.placeholder.com/500x500.png/00aacc?text=Mujer%2CInvierno+voluptatem', 'Nesciunt.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quaerat aperiam ut sunt qui.', 32, 'Beatae amet et.', '', 'Mujer,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(98, 'https://via.placeholder.com/500x500.png/008833?text=Invierno%2Cgorras+consectetur', 'Quo ipsam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Repellat vitae excepturi et aut.', 10, 'Ut amet unde.', '', 'Invierno,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(99, 'https://via.placeholder.com/500x500.png/00ddff?text=Hombre%2CCamisetas+aut', 'Maxime', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Id temporibus quis aliquid amet.', 99, 'Rerum in et officia.', '', 'Hombre,Camisetas', '2023-09-29 16:04:58', '2024-06-11 15:57:20', 56, NULL),
	(100, 'https://via.placeholder.com/500x500.png/0077cc?text=Mujer%2CHombre+ut', 'Atque aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Reprehenderit eius corporis et illum cupiditate harum.', 10, 'Reiciendis ab.', '', 'Mujer,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(101, 'https://via.placeholder.com/500x500.png/0077bb?text=Mujer%2Cgorras+eius', 'Sed dolor.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolorum voluptatem eaque doloribus facilis. Et deleniti beatae commodi sit sit numquam voluptas veritatis.', 42, 'Quod minima et.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(102, 'https://via.placeholder.com/500x500.png/009900?text=Hombre%2CVerano+vel', 'Modi vel.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Eum quasi aut modi et nemo.', 23, 'Et consequatur.', '', 'Hombre,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(103, 'https://via.placeholder.com/500x500.png/008811?text=sudaderas%2CHombre+necessitatibus', 'Deserunt.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Est consequuntur quos voluptatibus voluptas qui voluptate aut.', 7, 'Dicta et repellat a.', '', 'sudaderas,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(104, 'https://via.placeholder.com/500x500.png/00aa33?text=Verano%2CVerano+veritatis', 'Saepe.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptatibus id qui totam.', 42, 'Eius dicta sit.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(105, 'https://via.placeholder.com/500x500.png/002200?text=Camisetas%2CHombre+atque', 'Beatae.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ipsum veritatis iure aut deleniti quisquam rerum expedita.', 15, 'Et omnis provident.', '', 'Camisetas,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(106, 'https://via.placeholder.com/500x500.png/0066bb?text=sudaderas%2CVerano+reiciendis', 'Aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Asperiores nam aut nobis autem consectetur doloribus autem.', 38, 'Occaecati provident.', '', 'sudaderas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(107, 'https://via.placeholder.com/500x500.png/0077dd?text=gorras%2CInvierno+ullam', 'Error.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Exercitationem excepturi dolores qui a laudantium. Doloribus id doloremque est accusamus similique eveniet.', 20, 'Voluptas.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(108, 'https://via.placeholder.com/500x500.png/00ff77?text=Camisetas%2CVerano+praesentium', 'Id omnis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quo quia doloremque qui earum. Ut velit mollitia error fugit hic voluptatum officia dolorem.', 12, 'Dolores id et.', '', 'Camisetas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(109, 'https://via.placeholder.com/500x500.png/0066aa?text=Mujer%2CHombre+quibusdam', 'Quos a.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptates eius asperiores quae et ut eligendi ipsum.', 46, 'Corporis magnam.', '', 'Mujer,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(110, 'https://via.placeholder.com/500x500.png/0022ff?text=sudaderas%2CCamisetas+dolore', 'Vitae.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Qui magni beatae excepturi repellendus quasi corporis.', 22, 'Quod nobis atque.', '', 'sudaderas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(111, 'https://via.placeholder.com/500x500.png/0088ff?text=sudaderas%2CInvierno+blanditiis', 'Autem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Minima consequatur nesciunt est. Rerum consequatur qui reprehenderit ex ut et nesciunt.', 13, 'Vel et.', '', 'sudaderas,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(112, 'https://via.placeholder.com/500x500.png/009966?text=Camisetas%2CHombre+ullam', 'Harum est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ipsa quia et est repellat ut. Et aperiam fugit nostrum.', 28, 'Est voluptas.', '', 'Camisetas,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(113, 'https://via.placeholder.com/500x500.png/0011ee?text=Verano%2CVerano+quia', 'Et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Rerum ea consequatur ut.', 45, 'Iusto ad est sunt.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(114, 'https://via.placeholder.com/500x500.png/00dddd?text=sudaderas%2CInvierno+aut', 'Similique.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Corrupti est vero vero amet vero. Rerum eveniet nemo blanditiis natus minus minima.', 46, 'Dolore aut pariatur.', '', 'sudaderas,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(115, 'https://via.placeholder.com/500x500.png/00aa99?text=Hombre%2Csudaderas+et', 'Et est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Expedita id voluptas aspernatur sit nihil corrupti. Saepe tenetur omnis corporis dolores laudantium consectetur.', 15, 'Occaecati voluptas.', '', 'Hombre,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(116, 'https://via.placeholder.com/500x500.png/0000dd?text=Hombre%2CCamisetas+velit', 'Similique.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'In aut ipsa dignissimos impedit quam eos in fuga.', 15, 'Distinctio aliquid.', '', 'Hombre,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(117, 'https://via.placeholder.com/500x500.png/00bbee?text=sudaderas%2CInvierno+aspernatur', 'Omnis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et quae quo illum. Sit rerum dicta quos dolorum beatae dolores voluptates.', 48, 'Odit qui et.', '', 'sudaderas,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(118, 'https://via.placeholder.com/500x500.png/00aaff?text=sudaderas%2CVerano+consectetur', 'Porro.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Fugiat voluptatum odit quam sunt quod est sint aut. Tempore cum nesciunt laborum magnam.', 38, 'Fuga velit.', '', 'sudaderas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(119, 'https://via.placeholder.com/500x500.png/00ddcc?text=Invierno%2CMujer+quasi', 'Hic dolor.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Velit atque ut tenetur. Nihil tempore error et asperiores dolores quidem quasi omnis.', 34, 'Doloribus ipsam.', '', 'Invierno,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(120, 'https://via.placeholder.com/500x500.png/00ffee?text=Hombre%2CVerano+voluptatem', 'Qui quo.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptatem voluptatum accusamus reiciendis itaque.', 13, 'Voluptas quibusdam.', '', 'Hombre,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(121, 'https://via.placeholder.com/500x500.png/006666?text=Verano%2Cgorras+in', 'Ipsam id.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Est illum necessitatibus repudiandae maiores.', 47, 'Cum dolores aut.', '', 'Verano,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(122, 'https://via.placeholder.com/500x500.png/00eedd?text=Hombre%2CVerano+accusantium', 'Ea est ut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Omnis itaque ut et quia iure cumque.', 31, 'At vitae molestias.', '', 'Hombre,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(123, 'https://via.placeholder.com/500x500.png/004400?text=Invierno%2CMujer+itaque', 'Dolor aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sunt ipsam eveniet ipsa sit repellendus sed.', 22, 'Aliquid atque est.', '', 'Invierno,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(124, 'https://via.placeholder.com/500x500.png/0088aa?text=gorras%2CCamisetas+rerum', 'Doloribus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Qui quidem velit recusandae qui aut a incidunt totam.', 47, 'Ut temporibus.', '', 'gorras,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(125, 'https://via.placeholder.com/500x500.png/0033ee?text=Verano%2CCamisetas+veniam', 'Beatae.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Saepe fugit distinctio beatae sit perspiciatis tempore.', 7, 'Suscipit ullam hic.', '', 'Verano,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(126, 'https://via.placeholder.com/500x500.png/00ee33?text=gorras%2CInvierno+ea', 'Atque aut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Perferendis ducimus cupiditate ipsum cupiditate vero enim aut.', 46, 'Deserunt sit et aut.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(127, 'https://via.placeholder.com/500x500.png/004466?text=Verano%2CVerano+accusantium', 'Quidem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Eligendi eos quidem architecto magni voluptatum inventore. Qui eligendi necessitatibus et et ea.', 48, 'Dicta aut.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(128, 'https://via.placeholder.com/500x500.png/009911?text=Hombre%2Cgorras+velit', 'Qui.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sed numquam exercitationem quia eveniet soluta amet. Consequuntur quam numquam voluptatum consequatur deserunt.', 36, 'Sint consequatur.', '', 'Hombre,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(129, 'https://via.placeholder.com/500x500.png/003322?text=Hombre%2Cgorras+aut', 'Animi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Cumque voluptatem minima reiciendis. Cumque repellendus dolorem est.', 28, 'Ut blanditiis et.', '', 'Hombre,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(130, 'https://via.placeholder.com/500x500.png/0055ff?text=Invierno%2CVerano+quis', 'Amet.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Iure ullam et itaque voluptas sint deserunt quisquam. Quae maiores est minus voluptatibus quisquam laudantium ullam.', 48, 'Placeat eum enim.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(131, 'https://via.placeholder.com/500x500.png/0099cc?text=sudaderas%2CMujer+eveniet', 'Est culpa.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Distinctio itaque aperiam non praesentium.', 18, 'Odio aut qui iusto.', '', 'sudaderas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(132, 'https://via.placeholder.com/500x500.png/00eeee?text=gorras%2Csudaderas+aut', 'Mollitia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ipsam ut dolores esse explicabo deserunt esse.', 46, 'Veniam similique.', '', 'gorras,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(133, 'https://via.placeholder.com/500x500.png/00ff00?text=Verano%2CHombre+harum', 'Pariatur.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ducimus dolorem autem illum.', 38, 'At explicabo fugit.', '', 'Verano,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(134, 'https://via.placeholder.com/500x500.png/00ee77?text=Mujer%2Cgorras+aspernatur', 'Molestiae.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Perspiciatis consequatur laboriosam reprehenderit quia quia. Omnis quaerat porro aperiam ipsum beatae aut.', 48, 'Perspiciatis qui et.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(135, 'https://via.placeholder.com/500x500.png/00ffdd?text=Invierno%2Cgorras+eveniet', 'Deserunt.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sequi harum dolores delectus.', 9, 'Aut quo consequatur.', '', 'Invierno,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(136, 'https://via.placeholder.com/500x500.png/00dd33?text=Invierno%2Csudaderas+error', 'Et quas.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Odio est at culpa ex nostrum eveniet non. Aperiam est consectetur id.', 9, 'Enim repellendus.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(137, 'https://via.placeholder.com/500x500.png/003311?text=Hombre%2CCamisetas+debitis', 'Officiis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ea beatae deleniti esse molestiae ex. Occaecati consectetur porro eaque excepturi ipsa.', 21, 'Et dicta delectus.', '', 'Hombre,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(138, 'https://via.placeholder.com/500x500.png/0011dd?text=Mujer%2CHombre+odit', 'Adipisci.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Nemo dignissimos maxime dolorum architecto. Quo voluptatum enim dolor eum.', 9, 'Voluptatum.', '', 'Mujer,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(139, 'https://via.placeholder.com/500x500.png/0000aa?text=gorras%2CInvierno+debitis', 'Numquam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Doloremque voluptatem placeat quidem eos officia sequi.', 36, 'Adipisci magnam id.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(140, 'https://via.placeholder.com/500x500.png/009944?text=gorras%2CHombre+officia', 'Possimus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Enim recusandae porro dolorum impedit. Est voluptatem ipsa exercitationem ut nihil est ratione qui.', 37, 'Aut cum quisquam.', '', 'gorras,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(141, 'https://via.placeholder.com/500x500.png/00ee33?text=sudaderas%2Cgorras+aut', 'Sit hic.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sequi voluptatem earum labore alias eum distinctio vitae.', 44, 'Quos excepturi.', '', 'sudaderas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(142, 'https://via.placeholder.com/500x500.png/003377?text=Hombre%2CVerano+et', 'Eum nam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Illo architecto eius nemo quo quae minima eos.', 44, 'Et consequatur.', '', 'Hombre,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(143, 'https://via.placeholder.com/500x500.png/009900?text=Invierno%2CVerano+molestiae', 'Eveniet.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Numquam sunt velit numquam ut.', 12, 'Deleniti aut vel.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(144, 'https://via.placeholder.com/500x500.png/00ccaa?text=Mujer%2Csudaderas+ex', 'Error in.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Inventore ut ab delectus voluptatem omnis assumenda sed.', 23, 'Laborum autem sint.', '', 'Mujer,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(145, 'https://via.placeholder.com/500x500.png/0088cc?text=Invierno%2CCamisetas+totam', 'Labore id.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aliquam sapiente id corrupti itaque hic vero et dicta.', 17, 'Ut iste quia minus.', '', 'Invierno,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(146, 'https://via.placeholder.com/500x500.png/00bbdd?text=Verano%2Csudaderas+velit', 'Quia id.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aut eius veritatis aliquid aliquid aut magni.', 25, 'Voluptatibus.', '', 'Verano,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(147, 'https://via.placeholder.com/500x500.png/00dd11?text=Mujer%2Cgorras+velit', 'Inventore.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aut eos rerum omnis eos quas quis.', 34, 'Molestiae nihil.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(148, 'https://via.placeholder.com/500x500.png/00ccbb?text=Camisetas%2Csudaderas+explicabo', 'Eveniet.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Neque dignissimos rem blanditiis modi corporis unde et laboriosam.', 14, 'Minus expedita.', '', 'Camisetas,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(149, 'https://via.placeholder.com/500x500.png/009900?text=Invierno%2Csudaderas+facilis', 'Molestiae.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Odit eveniet sunt ut.', 33, 'Dolorum et error.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(150, 'https://via.placeholder.com/500x500.png/002233?text=sudaderas%2CMujer+magnam', 'Quia quas.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Est ut quae libero. Velit quos et nihil consequatur dolorem.', 18, 'Earum mollitia est.', '', 'sudaderas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(151, 'https://via.placeholder.com/500x500.png/0044aa?text=gorras%2CHombre+earum', 'Inventore.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Est dolorem nobis saepe.', 33, 'Suscipit id sit a.', '', 'gorras,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(152, 'https://via.placeholder.com/500x500.png/00cccc?text=Hombre%2Csudaderas+molestias', 'Adipisci.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Incidunt quo est molestiae illum rem quod aut impedit. Repudiandae non iure qui repudiandae.', 35, 'Est dolor quia.', '', 'Hombre,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(153, 'https://via.placeholder.com/500x500.png/009900?text=Mujer%2CMujer+illo', 'Nihil.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quisquam vitae delectus doloremque laborum eius.', 41, 'Nesciunt molestiae.', '', 'Mujer,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(154, 'https://via.placeholder.com/500x500.png/007788?text=Mujer%2Cgorras+est', 'Qui eius.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Autem qui tempore recusandae hic molestiae ut. Qui voluptas quam ut pariatur.', 6, 'Quis voluptas odio.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(155, 'https://via.placeholder.com/500x500.png/0066ff?text=Camisetas%2Cgorras+qui', 'Sit.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Culpa maiores similique impedit dolorem.', 40, 'Est illo quia.', '', 'Camisetas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(156, 'https://via.placeholder.com/500x500.png/00eeee?text=Hombre%2CMujer+est', 'Sint.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Non quibusdam doloremque cum voluptatum.', 26, 'Consectetur.', '', 'Hombre,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(157, 'https://via.placeholder.com/500x500.png/006688?text=sudaderas%2CVerano+error', 'In.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolor voluptate aliquam sed at ut.', 40, 'Quibusdam magni.', '', 'sudaderas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(158, 'https://via.placeholder.com/500x500.png/00eedd?text=Mujer%2CVerano+est', 'Enim.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolores et aspernatur hic sit itaque aut. Est nisi voluptatibus enim dolorem tempore sit eum.', 47, 'Dolor magnam quae.', '', 'Mujer,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(159, 'https://via.placeholder.com/500x500.png/003366?text=Camisetas%2CVerano+est', 'Aperiam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et velit dolor itaque aliquid et voluptates.', 41, 'Doloribus qui.', '', 'Camisetas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(160, 'https://via.placeholder.com/500x500.png/001166?text=gorras%2Csudaderas+temporibus', 'Et et et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et et aut saepe et sint omnis ipsam nihil. Nesciunt illo omnis at eum aspernatur odit.', 48, 'Velit dolorem quos.', '', 'gorras,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(161, 'https://via.placeholder.com/500x500.png/006677?text=Hombre%2Csudaderas+et', 'Dolorem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Doloremque earum quae eius.', 45, 'Omnis aliquam sint.', '', 'Hombre,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(162, 'https://via.placeholder.com/500x500.png/00bbee?text=Verano%2Cgorras+esse', 'Aut ut.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'In quos nihil voluptas ex possimus sed porro. Provident at et consequuntur qui repellat ab qui.', 45, 'Laborum cum eum.', '', 'Verano,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(163, 'https://via.placeholder.com/500x500.png/002277?text=Hombre%2CMujer+qui', 'Dolorem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et fuga ea esse animi exercitationem vel optio.', 22, 'Quia esse ut.', '', 'Hombre,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(164, 'https://via.placeholder.com/500x500.png/00aa00?text=Camisetas%2Cgorras+dignissimos', 'Sunt.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dignissimos qui vero molestiae reprehenderit id. Consectetur accusantium eaque a enim voluptas laboriosam.', 47, 'Et aliquid rem.', '', 'Camisetas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(165, 'https://via.placeholder.com/500x500.png/003322?text=Mujer%2Cgorras+aut', 'Est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Eaque fuga corporis reprehenderit placeat. Repellendus doloremque ut eius.', 9, 'Iste qui ad quia.', '', 'Mujer,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(166, 'https://via.placeholder.com/500x500.png/003344?text=Hombre%2CHombre+aspernatur', 'Hic.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Qui a voluptates culpa rem. Dolores rerum voluptatem est sed enim id.', 27, 'Voluptatem.', '', 'Hombre,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(167, 'https://via.placeholder.com/500x500.png/00aa22?text=Mujer%2CMujer+accusamus', 'Velit.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Perspiciatis eveniet sed voluptatem aperiam praesentium modi quasi.', 32, 'Quibusdam dolor.', '', 'Mujer,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(168, 'https://via.placeholder.com/500x500.png/003377?text=Invierno%2CInvierno+nobis', 'Aliquam.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dignissimos commodi expedita sit optio mollitia qui. Est enim voluptatibus est quia modi rerum consequatur.', 42, 'Illo sapiente iusto.', '', 'Invierno,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(169, 'https://via.placeholder.com/500x500.png/007722?text=Invierno%2CHombre+dicta', 'Corporis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Molestiae perspiciatis sint assumenda et vel ut beatae.', 30, 'Et dolorem non.', '', 'Invierno,Hombre', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(170, 'https://via.placeholder.com/500x500.png/00cc33?text=sudaderas%2CVerano+assumenda', 'Et dolor.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ab numquam temporibus veritatis est vitae dolores itaque.', 25, 'Labore est totam.', '', 'sudaderas,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(171, 'https://via.placeholder.com/500x500.png/002277?text=Hombre%2Csudaderas+eius', 'Esse.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et expedita autem impedit in nobis. Id accusamus optio et eligendi voluptatem sit suscipit.', 13, 'Doloribus adipisci.', '', 'Hombre,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(172, 'https://via.placeholder.com/500x500.png/00dd77?text=Invierno%2Csudaderas+itaque', 'Et.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Repudiandae quia sapiente provident ratione esse ipsam mollitia. Sed vitae quia quasi quibusdam saepe quia et beatae.', 46, 'Exercitationem.', '', 'Invierno,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(173, 'https://via.placeholder.com/500x500.png/005533?text=sudaderas%2CCamisetas+eum', 'Animi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sed quod quia sint eum facilis numquam unde. Et aut itaque dolorem sint unde minus qui accusamus.', 31, 'Velit ut neque quia.', '', 'sudaderas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(174, 'https://via.placeholder.com/500x500.png/0044ff?text=Camisetas%2CMujer+ut', 'Optio.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Cupiditate et rem sed rerum. Consequuntur ut hic distinctio eveniet eum labore debitis sunt.', 47, 'Rem sint alias ex.', '', 'Camisetas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(175, 'https://via.placeholder.com/500x500.png/007799?text=Camisetas%2CMujer+reprehenderit', 'Et dolor.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Facilis consequatur cupiditate fugit fuga repellendus quis.', 19, 'Ad fugiat soluta.', '', 'Camisetas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(176, 'https://via.placeholder.com/500x500.png/003344?text=gorras%2Csudaderas+libero', 'Aliquid.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Rerum ducimus eveniet possimus delectus alias impedit. In quo provident unde tempora eos vel.', 37, 'Fugit est qui sint.', '', 'gorras,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(177, 'https://via.placeholder.com/500x500.png/005588?text=Camisetas%2CCamisetas+eaque', 'Sed iure.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et unde laboriosam harum voluptas exercitationem.', 33, 'Ad rerum voluptas.', '', 'Camisetas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(178, 'https://via.placeholder.com/500x500.png/007733?text=Verano%2CInvierno+nihil', 'Corrupti.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Molestiae quis labore placeat voluptas tempore. Enim nisi odio natus veritatis architecto error qui.', 24, 'Iusto labore aut ut.', '', 'Verano,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(179, 'https://via.placeholder.com/500x500.png/0055ff?text=gorras%2CInvierno+aut', 'Est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolorum inventore nihil asperiores explicabo veniam et maxime. Sint quia perspiciatis molestiae fuga aperiam inventore dignissimos.', 12, 'Odit asperiores.', '', 'gorras,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(180, 'https://via.placeholder.com/500x500.png/00bb22?text=Invierno%2Cgorras+laudantium', 'Nisi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Tempore laborum consequatur odio nam autem et.', 21, 'Veritatis veniam.', '', 'Invierno,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(181, 'https://via.placeholder.com/500x500.png/00dd44?text=Camisetas%2CCamisetas+nesciunt', 'Delectus.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Omnis illo repudiandae deserunt magni.', 17, 'Quia id non autem.', '', 'Camisetas,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(182, 'https://via.placeholder.com/500x500.png/00ff88?text=Verano%2CInvierno+esse', 'In.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Quas earum quaerat assumenda aut. Doloribus qui et fugit aliquam.', 47, 'Rem in veritatis.', '', 'Verano,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(183, 'https://via.placeholder.com/500x500.png/003399?text=Verano%2Cgorras+mollitia', 'Sunt.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Sed doloribus eligendi a quis aut corrupti dignissimos.', 21, 'Sint inventore.', '', 'Verano,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(184, 'https://via.placeholder.com/500x500.png/000044?text=Hombre%2CMujer+recusandae', 'Ea autem.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Eos aut molestiae ad ipsum distinctio molestiae repellendus.', 42, 'Tenetur ipsam.', '', 'Hombre,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(185, 'https://via.placeholder.com/500x500.png/004433?text=Mujer%2CInvierno+repudiandae', 'Quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Veniam minus cupiditate ex assumenda. Veritatis quisquam possimus aut totam eum iste nihil.', 46, 'Sed voluptate aut.', '', 'Mujer,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(186, 'https://via.placeholder.com/500x500.png/007788?text=Invierno%2CVerano+sapiente', 'Modi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Fuga possimus illum sint sint.', 8, 'Laboriosam ipsam.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(187, 'https://via.placeholder.com/500x500.png/00aa00?text=Camisetas%2Cgorras+qui', 'Quasi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Nisi est quod reiciendis.', 5, 'Quo aliquam aut.', '', 'Camisetas,gorras', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(188, 'https://via.placeholder.com/500x500.png/00dd99?text=Verano%2CCamisetas+optio', 'Est velit.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Deserunt quia necessitatibus minima in quibusdam et inventore.', 49, 'Autem sed at qui.', '', 'Verano,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(189, 'https://via.placeholder.com/500x500.png/007711?text=sudaderas%2CMujer+amet', 'Debitis.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Ut eius alias enim. Quis voluptas id consequatur amet et et officiis.', 35, 'Et fuga aspernatur.', '', 'sudaderas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(190, 'https://via.placeholder.com/500x500.png/0055ee?text=Invierno%2CVerano+asperiores', 'Dolor.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Voluptas minima sapiente ratione.', 10, 'Animi et inventore.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(191, 'https://via.placeholder.com/500x500.png/0044aa?text=Invierno%2CVerano+non', 'Sequi eum.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aspernatur ad deleniti ipsa est. Reiciendis vero in qui enim ut tempore.', 6, 'Aut et molestiae.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(192, 'https://via.placeholder.com/500x500.png/00dd77?text=Invierno%2CInvierno+ut', 'Vel.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Et voluptatem accusamus unde magni aspernatur. Et itaque maxime vel exercitationem.', 37, 'Sint qui quis et.', '', 'Invierno,Invierno', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(193, 'https://via.placeholder.com/500x500.png/005511?text=Verano%2Csudaderas+nihil', 'Ut quasi.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Dolor culpa aperiam eum.', 21, 'Ad delectus et.', '', 'Verano,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(194, 'https://via.placeholder.com/500x500.png/0044ee?text=Verano%2CVerano+illo', 'Et soluta.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Non et sit eos quod odit fuga perferendis et. Suscipit tempore sed provident iste corrupti.', 40, 'Cumque sapiente.', '', 'Verano,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(195, 'https://via.placeholder.com/500x500.png/00bb99?text=Camisetas%2CMujer+sint', 'Et quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Repellat quia perspiciatis et necessitatibus et corporis sint sed.', 46, 'Quia occaecati et.', '', 'Camisetas,Mujer', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(196, 'https://via.placeholder.com/500x500.png/00cc99?text=sudaderas%2Csudaderas+suscipit', 'Quia.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Veritatis nobis unde officiis sit veritatis unde dolorem. Voluptatem voluptatum nam hic fugiat at.', 8, 'Quod occaecati.', '', 'sudaderas,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(197, 'https://via.placeholder.com/500x500.png/0099cc?text=gorras%2Csudaderas+et', 'Est.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Error quas doloribus voluptas excepturi debitis aut rem.', 39, 'Voluptas enim fugit.', '', 'gorras,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(198, 'https://via.placeholder.com/500x500.png/0033bb?text=Mujer%2Csudaderas+est', 'Aliquid.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aut blanditiis assumenda voluptatem sit cum velit cupiditate.', 49, 'Voluptatibus nihil.', '', 'Mujer,sudaderas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(199, 'https://via.placeholder.com/500x500.png/00aa55?text=Invierno%2CVerano+eveniet', 'Optio.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Aut ut est animi autem veniam officiis.', 40, 'Alias excepturi.', '', 'Invierno,Verano', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(200, 'https://via.placeholder.com/500x500.png/00aa22?text=Mujer%2CCamisetas+voluptatem', 'Error.', '', 'Rojo, Negro, Blanco', 'S,M,L', 'Adipisci fugit eos est optio est iusto. Impedit ratione voluptas velit ut.', 21, 'Incidunt.', '', 'Mujer,Camisetas', '2023-09-29 16:04:58', '2023-09-29 16:04:58', 0, NULL),
	(207, '/uploads/m_blanco.png', 'Koi', '', 'rojo, negro, Azul', 'S,XL,XXL', 'asddsd', 50, 'addxss', '', 'xzx', '2023-12-15 19:03:01', '2023-12-15 19:03:01', 8, NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla steamboat_laravel.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `created_at`, `updated_at`, `birthdate`, `address`, `province`, `pc`, `country`, `city`, `remember_token`, `language`) VALUES
	(1, 'ivan', 'Guirado Cebrero', 'lordefrey@gmail.com', '$2y$10$/5w39I8EYVxnh41CCFoc/.QJxr5au3W6JgSSzI0nskILW8cfd.PRG', '2023-11-02 19:03:37', '2024-06-11 16:32:29', '1986-10-17', 'Fra Pare Joan Cerda 31', 'Islas Baleares', '07300', 'España', 'INCA', 'JxjTJ9z0CTuwK9zkvJVwm4LuNbTV9RbJWM4xHG6IKrogkkY74LdJcighkIhb', 'en');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
