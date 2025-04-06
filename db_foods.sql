/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `Food_Type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `Foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `Food_Type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Like_Res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `Like_Res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Like_Res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `Restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `Foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Rate_Res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int DEFAULT '0',
  `date_rate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `Rate_Res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Rate_Res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `Restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Sub_Food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `Sub_Food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `Foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleteBy` int NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `deleteAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Food_Type` (`type_id`, `type_name`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 'Món chính', 0, 0, '2025-03-16 16:27:44', '2025-03-16 16:27:44', '2025-03-16 16:27:44');
INSERT INTO `Food_Type` (`type_id`, `type_name`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 'Khai vị', 0, 0, '2025-03-16 16:27:44', '2025-03-16 16:27:44', '2025-03-16 16:27:44');
INSERT INTO `Food_Type` (`type_id`, `type_name`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 'Tráng miệng', 0, 0, '2025-03-16 16:27:44', '2025-03-16 16:27:44', '2025-03-16 16:27:44');
INSERT INTO `Food_Type` (`type_id`, `type_name`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 'Nước uống', 0, 0, '2025-03-16 16:27:44', '2025-03-16 16:27:44', '2025-03-16 16:27:44'),
(5, 'Ăn nhẹ', 0, 0, '2025-03-16 16:27:44', '2025-03-16 16:27:44', '2025-03-16 16:27:44');

INSERT INTO `Foods` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 'Phở bò', NULL, 50000, NULL, 1, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49');
INSERT INTO `Foods` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 'Bánh mì', NULL, 20000, NULL, 1, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49');
INSERT INTO `Foods` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 'Gỏi cuốn', NULL, 30000, NULL, 2, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49');
INSERT INTO `Foods` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 'Chè bưởi', NULL, 25000, NULL, 3, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(5, 'Nước cam', NULL, 15000, NULL, 4, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(6, 'Hủ tiếu', NULL, 45000, NULL, 1, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(7, 'Bánh xèo', NULL, 40000, NULL, 1, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(8, 'Súp cua', NULL, 35000, NULL, 2, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(9, 'Kem dừa', NULL, 30000, NULL, 3, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(10, 'Cà phê sữa', NULL, 20000, NULL, 4, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(11, 'Bún chả', NULL, 55000, NULL, 1, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(12, 'Nem rán', NULL, 40000, NULL, 2, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(13, 'Bánh flan', NULL, 20000, NULL, 3, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(14, 'Nước chanh', NULL, 10000, NULL, 4, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49'),
(15, 'Mì quảng', NULL, 50000, NULL, 1, 0, 0, '2025-03-16 16:27:49', '2025-03-16 16:27:49', '2025-03-16 16:27:49');

INSERT INTO `Like_Res` (`like_id`, `user_id`, `res_id`, `date_like`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 1, 1, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36');
INSERT INTO `Like_Res` (`like_id`, `user_id`, `res_id`, `date_like`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 2, 1, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36');
INSERT INTO `Like_Res` (`like_id`, `user_id`, `res_id`, `date_like`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 3, 1, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36');
INSERT INTO `Like_Res` (`like_id`, `user_id`, `res_id`, `date_like`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 4, 1, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(5, 5, 1, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(6, 6, 2, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(7, 7, 2, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(8, 8, 2, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(9, 9, 2, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(10, 10, 2, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(11, 11, 3, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(12, 12, 3, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(13, 13, 3, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(14, 14, 3, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(15, 15, 3, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(16, 1, 4, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(17, 2, 5, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(18, 3, 6, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(19, 4, 7, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(20, 5, 8, '2025-03-16 16:27:36', 0, 0, '2025-03-16 16:27:36', '2025-03-16 16:27:36', '2025-03-16 16:27:36'),
(21, 2, 8, '2025-03-16 16:36:02', 0, 0, '2025-03-16 16:36:02', '2025-03-16 16:36:02', '2025-03-16 16:36:02'),
(22, 7, 1, '2025-03-16 16:40:29', 0, 0, '2025-03-16 16:40:29', '2025-03-16 16:40:29', '2025-03-16 16:40:29'),
(23, 7, 4, '2025-03-16 16:42:51', 0, 0, '2025-03-16 16:42:51', '2025-03-16 16:42:51', '2025-03-16 16:42:51'),
(24, 7, 3, '2025-03-16 16:42:51', 0, 0, '2025-03-16 16:42:51', '2025-03-16 16:42:51', '2025-03-16 16:42:51'),
(25, 7, 8, '2025-03-16 16:42:51', 0, 0, '2025-03-16 16:42:51', '2025-03-16 16:42:51', '2025-03-16 16:42:51');

INSERT INTO `Orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 1, 1, 2, 'ORD001', '1,2', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58');
INSERT INTO `Orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 2, 2, 1, 'ORD002', '3,4', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58');
INSERT INTO `Orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 3, 3, 3, 'ORD003', '5', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58');
INSERT INTO `Orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 4, 4, 1, 'ORD004', '6,7', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(5, 5, 5, 2, 'ORD005', '8', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(6, 6, 6, 1, 'ORD006', '9,10', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(7, 7, 7, 2, 'ORD007', '1,3,5', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(8, 8, 8, 3, 'ORD008', '2,4,6', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(9, 9, 9, 1, 'ORD009', '7,8', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(10, 10, 10, 2, 'ORD010', '9,10', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(11, 11, 11, 1, 'ORD011', '1', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(12, 12, 12, 3, 'ORD012', '2', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(13, 13, 13, 2, 'ORD013', '3', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(14, 14, 14, 1, 'ORD014', '4', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(15, 15, 15, 2, 'ORD015', '5', 0, 0, '2025-03-16 16:27:58', '2025-03-16 16:27:58', '2025-03-16 16:27:58'),
(16, 3, 5, 0, NULL, NULL, 0, 0, '2025-03-16 16:47:17', '2025-03-16 16:47:17', '2025-03-16 16:47:17'),
(17, 5, 1, 0, NULL, NULL, 0, 0, '2025-03-16 16:47:17', '2025-03-16 16:47:17', '2025-03-16 16:47:17'),
(18, 5, 11, 0, NULL, NULL, 0, 0, '2025-03-16 16:47:17', '2025-03-16 16:47:17', '2025-03-16 16:47:17'),
(19, 10, 5, 5, 'ORD011', '2', 0, 0, '2025-04-05 16:14:32', '2025-04-05 16:14:32', '2025-04-05 16:14:32'),
(20, 10, 5, 5, '', '2', 0, 0, '2025-04-05 16:14:57', '2025-04-05 16:14:57', '2025-04-05 16:14:57'),
(21, 12, 1, 5, '', '4', 0, 0, '2025-04-05 16:16:21', '2025-04-05 16:16:21', '2025-04-05 16:16:21'),
(22, 4, 5, 2, '', '7', 0, 0, '2025-04-05 16:17:52', '2025-04-05 16:17:52', '2025-04-05 16:17:52'),
(23, 4, 5, 2, '', '7', 0, 0, '2025-04-05 16:18:26', '2025-04-05 16:18:26', '2025-04-05 16:18:26');

INSERT INTO `Rate_Res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 1, 1, 5, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21');
INSERT INTO `Rate_Res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 2, 1, 4, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21');
INSERT INTO `Rate_Res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 3, 1, 3, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21');
INSERT INTO `Rate_Res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 4, 1, 2, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(5, 5, 1, 1, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(6, 6, 2, 5, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(7, 7, 2, 4, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(8, 8, 2, 3, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(9, 9, 2, 2, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(10, 10, 2, 1, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(11, 11, 3, 5, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(12, 12, 3, 4, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(13, 13, 3, 3, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(14, 14, 3, 2, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(15, 15, 3, 1, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(16, 1, 4, 5, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(17, 2, 5, 4, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(18, 3, 6, 3, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(19, 4, 7, 2, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(20, 5, 8, 1, '2025-03-16 16:27:21', 0, 0, '2025-03-16 16:27:21', '2025-03-16 16:27:21', '2025-03-16 16:27:21'),
(21, 10, 5, 5, '2025-04-05 16:05:16', 0, 0, '2025-04-05 16:05:16', '2025-04-05 16:05:16', '2025-04-05 16:05:16'),
(22, 15, 5, 3, '2025-04-05 16:06:10', 0, 0, '2025-04-05 16:06:10', '2025-04-05 16:06:10', '2025-04-05 16:06:10');

INSERT INTO `Restaurant` (`res_id`, `res_name`, `image`, `desc`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 'Nhà Hàng A', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17');
INSERT INTO `Restaurant` (`res_id`, `res_name`, `image`, `desc`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 'Nhà Hàng B', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17');
INSERT INTO `Restaurant` (`res_id`, `res_name`, `image`, `desc`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 'Nhà Hàng C', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17');
INSERT INTO `Restaurant` (`res_id`, `res_name`, `image`, `desc`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 'Nhà Hàng D', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(5, 'Nhà Hàng E', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(6, 'Nhà Hàng F', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(7, 'Nhà Hàng G', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(8, 'Nhà Hàng H', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(9, 'Nhà Hàng I', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(10, 'Nhà Hàng J', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(11, 'Nhà Hàng K', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(12, 'Nhà Hàng L', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(13, 'Nhà Hàng M', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(14, 'Nhà Hàng N', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17'),
(15, 'Nhà Hàng O', NULL, NULL, 0, 0, '2025-03-16 16:27:17', '2025-03-16 16:27:17', '2025-03-16 16:27:17');

INSERT INTO `Sub_Food` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 'Thêm thịt', 10000, 1, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54');
INSERT INTO `Sub_Food` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 'Thêm trứng', 5000, 2, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54');
INSERT INTO `Sub_Food` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 'Thêm tôm', 7000, 3, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54');
INSERT INTO `Sub_Food` (`sub_id`, `sub_name`, `sub_price`, `food_id`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 'Thêm nước cốt dừa', 5000, 4, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54'),
(5, 'Thêm đá', 2000, 5, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54'),
(6, 'Thêm rau sống', 5000, 6, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54'),
(7, 'Thêm dưa leo', 3000, 7, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54'),
(8, 'Thêm bánh tráng', 4000, 8, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54'),
(9, 'Thêm đường', 1000, 9, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54'),
(10, 'Thêm sữa đặc', 2000, 10, 0, 0, '2025-03-16 16:27:54', '2025-03-16 16:27:54', '2025-03-16 16:27:54');

INSERT INTO `Users` (`user_id`, `full_name`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(1, 'Nguyễn Văn A', 'NguyenVanA@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07');
INSERT INTO `Users` (`user_id`, `full_name`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(2, 'Nguyễn Văn B', 'NguyenVanB@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07');
INSERT INTO `Users` (`user_id`, `full_name`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(3, 'Nguyễn Văn C', 'NguyenVanC@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07');
INSERT INTO `Users` (`user_id`, `full_name`, `email`, `password`, `deleteBy`, `isDelete`, `deleteAt`, `createAt`, `updateAt`) VALUES
(4, 'Nguyễn Văn D', 'NguyenVanD@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(5, 'Nguyễn Văn E', 'NguyenVanE@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(6, 'Nguyễn Văn F', 'NguyenVanF@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(7, 'Nguyễn Văn G', 'NguyenVanG@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(8, 'Nguyễn Văn H', 'NguyenVanH@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(9, 'Nguyễn Văn I', 'NguyenVanI@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(10, 'Nguyễn Văn J', 'NguyenVanJ@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(11, 'Nguyễn Văn K', 'NguyenVanK@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(12, 'Nguyễn Văn L', 'NguyenVanL@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(13, 'Nguyễn Văn M', 'NguyenVanM@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(14, 'Nguyễn Văn N', 'NguyenVanN@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(15, 'Nguyễn Văn O', 'NguyenVanO@gmail.com', '123', 0, 0, '2025-03-16 16:27:07', '2025-03-16 16:27:07', '2025-03-16 16:27:07'),
(16, 'Nguyễn Văn Z', 'NguyenVanZ@gmail.com', '123', 0, 0, '2025-03-16 16:51:03', '2025-03-16 16:51:03', '2025-03-16 16:51:03'),
(17, 'Nguyễn Văn T', 'NguyenVanT@gmail.com', '123', 0, 0, '2025-03-16 16:51:39', '2025-03-16 16:51:39', '2025-03-16 16:51:39');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;