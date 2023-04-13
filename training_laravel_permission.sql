/*
 Navicat Premium Data Transfer

 Source Server         : phpmyadmin
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : training_laravel_permission

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 13/04/2023 22:13:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (19, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (20, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (21, '2023_04_13_0001_create_roles_table', 1);
INSERT INTO `migrations` VALUES (22, '2023_04_13_0002_create_permissions_table', 1);

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (15, 2, 1, '2023-04-13 21:29:21', '2023-04-13 21:29:21');
INSERT INTO `permission_role` VALUES (16, 3, 1, '2023-04-13 21:29:21', '2023-04-13 21:29:21');
INSERT INTO `permission_role` VALUES (17, 4, 1, '2023-04-13 21:29:21', '2023-04-13 21:29:21');
INSERT INTO `permission_role` VALUES (18, 5, 1, '2023-04-13 21:29:21', '2023-04-13 21:29:21');
INSERT INTO `permission_role` VALUES (19, 6, 1, '2023-04-13 21:29:21', '2023-04-13 21:29:21');
INSERT INTO `permission_role` VALUES (20, 7, 1, '2023-04-13 21:29:21', '2023-04-13 21:29:21');
INSERT INTO `permission_role` VALUES (22, 1, 2, '2023-04-13 21:29:54', '2023-04-13 21:29:54');
INSERT INTO `permission_role` VALUES (23, 1, 3, '2023-04-13 21:30:52', '2023-04-13 21:30:52');
INSERT INTO `permission_role` VALUES (24, 2, 3, '2023-04-13 21:30:52', '2023-04-13 21:30:52');
INSERT INTO `permission_role` VALUES (25, 3, 3, '2023-04-13 21:30:52', '2023-04-13 21:30:52');
INSERT INTO `permission_role` VALUES (26, 4, 3, '2023-04-13 21:30:52', '2023-04-13 21:30:52');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'user-list', 'Danh sách user', '2023-04-13 14:30:48', '2023-04-13 14:30:48', NULL);
INSERT INTO `permissions` VALUES (2, 'user-create', 'Tạo mới user', '2023-04-13 14:31:02', '2023-04-13 14:31:02', NULL);
INSERT INTO `permissions` VALUES (3, 'user-edit', 'Sửa user', '2023-04-13 14:31:13', '2023-04-13 14:31:13', NULL);
INSERT INTO `permissions` VALUES (4, 'user-delete', 'Xóa user', '2023-04-13 14:31:20', '2023-04-13 14:31:20', NULL);
INSERT INTO `permissions` VALUES (5, 'role-list', 'Danh sách role', '2023-04-13 14:31:28', '2023-04-13 14:31:45', NULL);
INSERT INTO `permissions` VALUES (6, 'role-create', 'Xóa role', '2023-04-13 14:31:34', '2023-04-13 14:31:34', NULL);
INSERT INTO `permissions` VALUES (7, 'role-edit', 'Sửa role', '2023-04-13 14:31:53', '2023-04-13 14:31:53', NULL);
INSERT INTO `permissions` VALUES (8, 'role-delete', 'Xóa role', '2023-04-13 14:32:00', '2023-04-13 14:32:00', NULL);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp(0) DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_user_role_id_index`(`role_id`) USING BTREE,
  INDEX `role_user_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (15, 1, 1, '2023-04-13 14:59:14', '2023-04-13 14:59:14');
INSERT INTO `role_user` VALUES (18, 2, 5, '2023-04-13 21:32:02', '2023-04-13 21:32:02');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Quản lý', '2023-04-13 14:30:22', '2023-04-13 14:29:47', NULL);
INSERT INTO `roles` VALUES (2, 'content', 'Soạn nội dung', '2023-04-13 14:30:28', '2023-04-13 14:30:14', NULL);
INSERT INTO `roles` VALUES (3, 'writer', 'Viết bài', '2023-04-13 14:30:34', '2023-04-13 14:32:16', NULL);
INSERT INTO `roles` VALUES (5, 'teacher', 'GV', '2023-04-13 10:25:45', '2023-04-13 14:29:05', '2023-04-13 14:29:05');
INSERT INTO `roles` VALUES (6, 'support', 'Ho tro vien', '2023-04-13 10:42:57', '2023-04-13 10:49:47', '2023-04-13 10:49:47');
INSERT INTO `roles` VALUES (9, 'support1', 'support1', '2023-04-13 10:52:11', '2023-04-13 14:29:07', '2023-04-13 14:29:07');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@gmail.com', NULL, '$2y$10$Zh1cZ2eNfkVSVj/B3Fv4XORG2jXbtwH7AZB9Hpax/1N93HvCziZSa', 'W95hjljK9w2K5SahTPd63E8ieKuWO5hHlCMxkBN7WY36yGooaaSWSFCxLe1B', '2023-04-13 07:27:34', '2023-04-13 21:32:25', NULL);
INSERT INTO `users` VALUES (2, 'mot', 'mot@gmail.com', NULL, '$2y$10$GF8QrEZNgyD4GEEKU31RLOH.WX6Fh3784Smpdrrc4TnBEKXVye8sO', NULL, '2023-04-13 07:32:52', '2023-04-13 10:07:20', '2023-04-13 10:07:20');
INSERT INTO `users` VALUES (3, 'hai', 'hai@gmail.com', NULL, '$2y$10$yvvw5SX0BTvR5/mujchkUebqkiQWY5SyY/v03KCxUL7MJuxloTFDC', NULL, '2023-04-13 07:34:52', '2023-04-13 07:59:43', '2023-04-13 07:59:43');
INSERT INTO `users` VALUES (5, 'Normal user', 'normal@gmail.com', NULL, '$2y$10$vHvu7tGUCf3Y1rhvdNz4FuEHnv9i.ElrwDmcXlZtqGTUtJf/2HDsO', NULL, '2023-04-13 14:32:02', '2023-04-13 14:32:02', NULL);

SET FOREIGN_KEY_CHECKS = 1;
