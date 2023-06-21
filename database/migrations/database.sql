-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: strapi
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `work_schedule` longtext,
  `location` longtext,
  PRIMARY KEY (`id`),
  KEY `abouts_created_by_id_fk` (`created_by_id`),
  KEY `abouts_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `abouts_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `abouts_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts`
--

LOCK TABLES `abouts` WRITE;
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abouts_components`
--

DROP TABLE IF EXISTS `abouts_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abouts_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abouts_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `abouts_field_index` (`field`),
  KEY `abouts_component_type_index` (`component_type`),
  KEY `abouts_entity_fk` (`entity_id`),
  CONSTRAINT `abouts_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `abouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts_components`
--

LOCK TABLES `abouts_components` WRITE;
/*!40000 ALTER TABLE `abouts_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `abouts_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `bank` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_created_by_id_fk` (`created_by_id`),
  KEY `accounts_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `accounts_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accounts_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Cuenta para honorarios para iniciar proceso de calificación','Bancolombia','Corriente',5995280374,'2023-05-16 21:08:39.623000','2023-05-16 21:08:42.423000','2023-05-16 21:08:42.419000',1,1),(2,'Cuenta para consignar para valoración con los interconsultores requeridos por la junta','Bancolombia','Corriente',5934239128,'2023-05-16 21:09:29.107000','2023-05-16 21:14:17.867000','2023-05-16 21:14:17.864000',1,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `conditions` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'plugin::upload.read',NULL,'{}','[]','2023-05-05 00:46:02.745000','2023-05-05 00:46:02.745000',NULL,NULL),(2,'plugin::upload.configure-view',NULL,'{}','[]','2023-05-05 00:46:02.753000','2023-05-05 00:46:02.753000',NULL,NULL),(3,'plugin::upload.assets.create',NULL,'{}','[]','2023-05-05 00:46:02.763000','2023-05-05 00:46:02.763000',NULL,NULL),(4,'plugin::upload.assets.update',NULL,'{}','[]','2023-05-05 00:46:02.771000','2023-05-05 00:46:02.771000',NULL,NULL),(5,'plugin::upload.assets.download',NULL,'{}','[]','2023-05-05 00:46:02.778000','2023-05-05 00:46:02.778000',NULL,NULL),(6,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-05-05 00:46:02.785000','2023-05-05 00:46:02.785000',NULL,NULL),(7,'plugin::upload.read',NULL,'{}','[\"admin::is-creator\"]','2023-05-05 00:46:02.793000','2023-05-05 00:46:02.793000',NULL,NULL),(8,'plugin::upload.configure-view',NULL,'{}','[]','2023-05-05 00:46:02.802000','2023-05-05 00:46:02.802000',NULL,NULL),(9,'plugin::upload.assets.create',NULL,'{}','[]','2023-05-05 00:46:02.810000','2023-05-05 00:46:02.810000',NULL,NULL),(10,'plugin::upload.assets.update',NULL,'{}','[\"admin::is-creator\"]','2023-05-05 00:46:02.819000','2023-05-05 00:46:02.819000',NULL,NULL),(11,'plugin::upload.assets.download',NULL,'{}','[]','2023-05-05 00:46:02.827000','2023-05-05 00:46:02.827000',NULL,NULL),(12,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-05-05 00:46:02.836000','2023-05-05 00:46:02.836000',NULL,NULL),(13,'plugin::content-manager.explorer.create','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-05-05 00:46:02.863000','2023-05-05 00:46:02.863000',NULL,NULL),(14,'plugin::content-manager.explorer.read','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-05-05 00:46:02.872000','2023-05-05 00:46:02.872000',NULL,NULL),(15,'plugin::content-manager.explorer.update','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2023-05-05 00:46:02.880000','2023-05-05 00:46:02.880000',NULL,NULL),(16,'plugin::content-manager.explorer.delete','plugin::users-permissions.user','{}','[]','2023-05-05 00:46:02.887000','2023-05-05 00:46:02.887000',NULL,NULL),(17,'plugin::content-manager.single-types.configure-view',NULL,'{}','[]','2023-05-05 00:46:02.896000','2023-05-05 00:46:02.896000',NULL,NULL),(18,'plugin::content-manager.collection-types.configure-view',NULL,'{}','[]','2023-05-05 00:46:02.904000','2023-05-05 00:46:02.904000',NULL,NULL),(19,'plugin::content-manager.components.configure-layout',NULL,'{}','[]','2023-05-05 00:46:02.912000','2023-05-05 00:46:02.912000',NULL,NULL),(20,'plugin::content-type-builder.read',NULL,'{}','[]','2023-05-05 00:46:02.921000','2023-05-05 00:46:02.921000',NULL,NULL),(21,'plugin::email.settings.read',NULL,'{}','[]','2023-05-05 00:46:02.929000','2023-05-05 00:46:02.929000',NULL,NULL),(22,'plugin::upload.read',NULL,'{}','[]','2023-05-05 00:46:02.937000','2023-05-05 00:46:02.937000',NULL,NULL),(23,'plugin::upload.assets.create',NULL,'{}','[]','2023-05-05 00:46:02.946000','2023-05-05 00:46:02.946000',NULL,NULL),(24,'plugin::upload.assets.update',NULL,'{}','[]','2023-05-05 00:46:02.955000','2023-05-05 00:46:02.955000',NULL,NULL),(25,'plugin::upload.assets.download',NULL,'{}','[]','2023-05-05 00:46:02.962000','2023-05-05 00:46:02.962000',NULL,NULL),(26,'plugin::upload.assets.copy-link',NULL,'{}','[]','2023-05-05 00:46:02.969000','2023-05-05 00:46:02.969000',NULL,NULL),(27,'plugin::upload.configure-view',NULL,'{}','[]','2023-05-05 00:46:02.978000','2023-05-05 00:46:02.978000',NULL,NULL),(28,'plugin::upload.settings.read',NULL,'{}','[]','2023-05-05 00:46:02.986000','2023-05-05 00:46:02.986000',NULL,NULL),(29,'plugin::i18n.locale.create',NULL,'{}','[]','2023-05-05 00:46:02.995000','2023-05-05 00:46:02.995000',NULL,NULL),(30,'plugin::i18n.locale.read',NULL,'{}','[]','2023-05-05 00:46:03.002000','2023-05-05 00:46:03.002000',NULL,NULL),(31,'plugin::i18n.locale.update',NULL,'{}','[]','2023-05-05 00:46:03.009000','2023-05-05 00:46:03.009000',NULL,NULL),(32,'plugin::i18n.locale.delete',NULL,'{}','[]','2023-05-05 00:46:03.016000','2023-05-05 00:46:03.016000',NULL,NULL),(33,'plugin::users-permissions.roles.create',NULL,'{}','[]','2023-05-05 00:46:03.024000','2023-05-05 00:46:03.024000',NULL,NULL),(34,'plugin::users-permissions.roles.read',NULL,'{}','[]','2023-05-05 00:46:03.031000','2023-05-05 00:46:03.031000',NULL,NULL),(35,'plugin::users-permissions.roles.update',NULL,'{}','[]','2023-05-05 00:46:03.038000','2023-05-05 00:46:03.038000',NULL,NULL),(36,'plugin::users-permissions.roles.delete',NULL,'{}','[]','2023-05-05 00:46:03.046000','2023-05-05 00:46:03.046000',NULL,NULL),(37,'plugin::users-permissions.providers.read',NULL,'{}','[]','2023-05-05 00:46:03.056000','2023-05-05 00:46:03.056000',NULL,NULL),(38,'plugin::users-permissions.providers.update',NULL,'{}','[]','2023-05-05 00:46:03.065000','2023-05-05 00:46:03.065000',NULL,NULL),(39,'plugin::users-permissions.email-templates.read',NULL,'{}','[]','2023-05-05 00:46:03.073000','2023-05-05 00:46:03.073000',NULL,NULL),(40,'plugin::users-permissions.email-templates.update',NULL,'{}','[]','2023-05-05 00:46:03.082000','2023-05-05 00:46:03.082000',NULL,NULL),(41,'plugin::users-permissions.advanced-settings.read',NULL,'{}','[]','2023-05-05 00:46:03.089000','2023-05-05 00:46:03.089000',NULL,NULL),(42,'plugin::users-permissions.advanced-settings.update',NULL,'{}','[]','2023-05-05 00:46:03.096000','2023-05-05 00:46:03.096000',NULL,NULL),(43,'admin::marketplace.read',NULL,'{}','[]','2023-05-05 00:46:03.106000','2023-05-05 00:46:03.106000',NULL,NULL),(44,'admin::webhooks.create',NULL,'{}','[]','2023-05-05 00:46:03.113000','2023-05-05 00:46:03.113000',NULL,NULL),(45,'admin::webhooks.read',NULL,'{}','[]','2023-05-05 00:46:03.122000','2023-05-05 00:46:03.122000',NULL,NULL),(46,'admin::webhooks.update',NULL,'{}','[]','2023-05-05 00:46:03.129000','2023-05-05 00:46:03.129000',NULL,NULL),(47,'admin::webhooks.delete',NULL,'{}','[]','2023-05-05 00:46:03.136000','2023-05-05 00:46:03.136000',NULL,NULL),(48,'admin::users.create',NULL,'{}','[]','2023-05-05 00:46:03.145000','2023-05-05 00:46:03.145000',NULL,NULL),(49,'admin::users.read',NULL,'{}','[]','2023-05-05 00:46:03.152000','2023-05-05 00:46:03.152000',NULL,NULL),(50,'admin::users.update',NULL,'{}','[]','2023-05-05 00:46:03.163000','2023-05-05 00:46:03.163000',NULL,NULL),(51,'admin::users.delete',NULL,'{}','[]','2023-05-05 00:46:03.171000','2023-05-05 00:46:03.171000',NULL,NULL),(52,'admin::roles.create',NULL,'{}','[]','2023-05-05 00:46:03.179000','2023-05-05 00:46:03.179000',NULL,NULL),(53,'admin::roles.read',NULL,'{}','[]','2023-05-05 00:46:03.186000','2023-05-05 00:46:03.186000',NULL,NULL),(54,'admin::roles.update',NULL,'{}','[]','2023-05-05 00:46:03.195000','2023-05-05 00:46:03.195000',NULL,NULL),(55,'admin::roles.delete',NULL,'{}','[]','2023-05-05 00:46:03.202000','2023-05-05 00:46:03.202000',NULL,NULL),(56,'admin::api-tokens.access',NULL,'{}','[]','2023-05-05 00:46:03.209000','2023-05-05 00:46:03.209000',NULL,NULL),(57,'admin::api-tokens.create',NULL,'{}','[]','2023-05-05 00:46:03.216000','2023-05-05 00:46:03.216000',NULL,NULL),(58,'admin::api-tokens.read',NULL,'{}','[]','2023-05-05 00:46:03.225000','2023-05-05 00:46:03.225000',NULL,NULL),(59,'admin::api-tokens.update',NULL,'{}','[]','2023-05-05 00:46:03.232000','2023-05-05 00:46:03.232000',NULL,NULL),(60,'admin::api-tokens.regenerate',NULL,'{}','[]','2023-05-05 00:46:03.239000','2023-05-05 00:46:03.239000',NULL,NULL),(61,'admin::api-tokens.delete',NULL,'{}','[]','2023-05-05 00:46:03.246000','2023-05-05 00:46:03.246000',NULL,NULL),(62,'admin::project-settings.update',NULL,'{}','[]','2023-05-05 00:46:03.253000','2023-05-05 00:46:03.253000',NULL,NULL),(63,'admin::project-settings.read',NULL,'{}','[]','2023-05-05 00:46:03.262000','2023-05-05 00:46:03.262000',NULL,NULL),(64,'admin::transfer.tokens.access',NULL,'{}','[]','2023-05-05 00:46:03.269000','2023-05-05 00:46:03.269000',NULL,NULL),(65,'admin::transfer.tokens.create',NULL,'{}','[]','2023-05-05 00:46:03.276000','2023-05-05 00:46:03.276000',NULL,NULL),(66,'admin::transfer.tokens.read',NULL,'{}','[]','2023-05-05 00:46:03.283000','2023-05-05 00:46:03.283000',NULL,NULL),(67,'admin::transfer.tokens.update',NULL,'{}','[]','2023-05-05 00:46:03.293000','2023-05-05 00:46:03.293000',NULL,NULL),(68,'admin::transfer.tokens.regenerate',NULL,'{}','[]','2023-05-05 00:46:03.300000','2023-05-05 00:46:03.300000',NULL,NULL),(69,'admin::transfer.tokens.delete',NULL,'{}','[]','2023-05-05 00:46:03.308000','2023-05-05 00:46:03.308000',NULL,NULL),(444,'plugin::documentation.read',NULL,'{}','[]','2023-05-16 14:52:59.470000','2023-05-16 14:52:59.470000',NULL,NULL),(445,'plugin::documentation.settings.update',NULL,'{}','[]','2023-05-16 14:52:59.504000','2023-05-16 14:52:59.504000',NULL,NULL),(446,'plugin::documentation.settings.regenerate',NULL,'{}','[]','2023-05-16 14:52:59.526000','2023-05-16 14:52:59.526000',NULL,NULL),(447,'plugin::documentation.settings.read',NULL,'{}','[]','2023-05-16 14:52:59.552000','2023-05-16 14:52:59.552000',NULL,NULL),(463,'plugin::content-manager.explorer.delete','api::about.about','{}','[]','2023-05-16 15:07:42.679000','2023-05-16 15:07:42.679000',NULL,NULL),(465,'plugin::content-manager.explorer.delete','api::author.author','{}','[]','2023-05-16 15:07:42.719000','2023-05-16 15:07:42.719000',NULL,NULL),(466,'plugin::content-manager.explorer.delete','api::category.category','{}','[]','2023-05-16 15:07:42.739000','2023-05-16 15:07:42.739000',NULL,NULL),(472,'plugin::content-manager.explorer.delete','api::header.header','{}','[]','2023-05-16 20:05:22.946000','2023-05-16 20:05:22.946000',NULL,NULL),(473,'plugin::content-manager.explorer.publish','api::header.header','{}','[]','2023-05-16 20:05:22.954000','2023-05-16 20:05:22.954000',NULL,NULL),(477,'plugin::content-manager.explorer.delete','api::footer.footer','{}','[]','2023-05-16 20:08:57.850000','2023-05-16 20:08:57.850000',NULL,NULL),(478,'plugin::content-manager.explorer.publish','api::footer.footer','{}','[]','2023-05-16 20:08:57.859000','2023-05-16 20:08:57.859000',NULL,NULL),(485,'plugin::content-manager.explorer.delete','api::entity.entity','{}','[]','2023-05-16 20:14:01.019000','2023-05-16 20:14:01.019000',NULL,NULL),(486,'plugin::content-manager.explorer.publish','api::entity.entity','{}','[]','2023-05-16 20:14:01.029000','2023-05-16 20:14:01.029000',NULL,NULL),(492,'plugin::content-manager.explorer.create','api::account.account','{\"fields\": [\"description\", \"bank\", \"type\", \"number\"]}','[]','2023-05-16 20:20:16.788000','2023-05-16 20:20:16.788000',NULL,NULL),(493,'plugin::content-manager.explorer.read','api::account.account','{\"fields\": [\"description\", \"bank\", \"type\", \"number\"]}','[]','2023-05-16 20:20:16.800000','2023-05-16 20:20:16.800000',NULL,NULL),(494,'plugin::content-manager.explorer.update','api::account.account','{\"fields\": [\"description\", \"bank\", \"type\", \"number\"]}','[]','2023-05-16 20:20:16.809000','2023-05-16 20:20:16.809000',NULL,NULL),(495,'plugin::content-manager.explorer.delete','api::account.account','{}','[]','2023-05-16 20:20:16.818000','2023-05-16 20:20:16.818000',NULL,NULL),(496,'plugin::content-manager.explorer.publish','api::account.account','{}','[]','2023-05-16 20:20:16.826000','2023-05-16 20:20:16.826000',NULL,NULL),(514,'plugin::content-manager.explorer.delete','api::service.service','{}','[]','2023-05-16 20:52:58.224000','2023-05-16 20:52:58.224000',NULL,NULL),(515,'plugin::content-manager.explorer.publish','api::service.service','{}','[]','2023-05-16 20:52:58.234000','2023-05-16 20:52:58.234000',NULL,NULL),(519,'plugin::content-manager.explorer.delete','api::home.home','{}','[]','2023-05-16 20:57:15.960000','2023-05-16 20:57:15.960000',NULL,NULL),(520,'plugin::content-manager.explorer.publish','api::home.home','{}','[]','2023-05-16 20:57:15.968000','2023-05-16 20:57:15.968000',NULL,NULL),(527,'plugin::content-manager.explorer.create','api::service.service','{\"fields\": [\"logo\", \"title\", \"appliesTo.items.text\", \"appliesTo.items.description\", \"appliesTo.items.link\", \"steps.items.text\", \"steps.items.description\", \"steps.items.link\", \"account\", \"payment\", \"disclaimer\"]}','[]','2023-05-16 21:19:40.215000','2023-05-16 21:19:40.215000',NULL,NULL),(528,'plugin::content-manager.explorer.read','api::service.service','{\"fields\": [\"logo\", \"title\", \"appliesTo.items.text\", \"appliesTo.items.description\", \"appliesTo.items.link\", \"steps.items.text\", \"steps.items.description\", \"steps.items.link\", \"account\", \"payment\", \"disclaimer\"]}','[]','2023-05-16 21:19:40.226000','2023-05-16 21:19:40.226000',NULL,NULL),(529,'plugin::content-manager.explorer.update','api::service.service','{\"fields\": [\"logo\", \"title\", \"appliesTo.items.text\", \"appliesTo.items.description\", \"appliesTo.items.link\", \"steps.items.text\", \"steps.items.description\", \"steps.items.link\", \"account\", \"payment\", \"disclaimer\"]}','[]','2023-05-16 21:19:40.234000','2023-05-16 21:19:40.234000',NULL,NULL),(540,'plugin::content-manager.explorer.create','api::site.site','{\"fields\": [\"name\", \"favicon\", \"description\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2023-05-17 00:37:09.598000','2023-05-17 00:37:09.598000',NULL,NULL),(541,'plugin::content-manager.explorer.read','api::site.site','{\"fields\": [\"name\", \"favicon\", \"description\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2023-05-17 00:37:09.630000','2023-05-17 00:37:09.630000',NULL,NULL),(542,'plugin::content-manager.explorer.update','api::site.site','{\"fields\": [\"name\", \"favicon\", \"description\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2023-05-17 00:37:09.651000','2023-05-17 00:37:09.651000',NULL,NULL),(543,'plugin::content-manager.explorer.delete','api::site.site','{}','[]','2023-05-17 00:37:09.677000','2023-05-17 00:37:09.677000',NULL,NULL),(544,'plugin::content-manager.explorer.publish','api::site.site','{}','[]','2023-05-17 00:37:09.700000','2023-05-17 00:37:09.700000',NULL,NULL),(548,'plugin::content-manager.explorer.create','api::entity.entity','{\"fields\": [\"name\", \"address\", \"workSchedule\", \"NIT\", \"accounts\", \"emails.email\", \"emails.description\", \"phones.number\", \"phones.type\", \"phones.code\", \"fee.value\", \"fee.description\", \"logo\"]}','[]','2023-05-17 15:38:17.611000','2023-05-17 15:38:17.611000',NULL,NULL),(549,'plugin::content-manager.explorer.read','api::entity.entity','{\"fields\": [\"name\", \"address\", \"workSchedule\", \"NIT\", \"accounts\", \"emails.email\", \"emails.description\", \"phones.number\", \"phones.type\", \"phones.code\", \"fee.value\", \"fee.description\", \"logo\"]}','[]','2023-05-17 15:38:17.624000','2023-05-17 15:38:17.624000',NULL,NULL),(550,'plugin::content-manager.explorer.update','api::entity.entity','{\"fields\": [\"name\", \"address\", \"workSchedule\", \"NIT\", \"accounts\", \"emails.email\", \"emails.description\", \"phones.number\", \"phones.type\", \"phones.code\", \"fee.value\", \"fee.description\", \"logo\"]}','[]','2023-05-17 15:38:17.632000','2023-05-17 15:38:17.632000',NULL,NULL),(551,'plugin::content-manager.explorer.create','api::footer.footer','{\"fields\": [\"disclaimer\", \"authorities.file\", \"authorities.url\"]}','[]','2023-05-22 13:37:17.881000','2023-05-22 13:37:17.881000',NULL,NULL),(553,'plugin::content-manager.explorer.read','api::footer.footer','{\"fields\": [\"disclaimer\", \"authorities.file\", \"authorities.url\"]}','[]','2023-05-22 13:37:17.925000','2023-05-22 13:37:17.925000',NULL,NULL),(555,'plugin::content-manager.explorer.update','api::footer.footer','{\"fields\": [\"disclaimer\", \"authorities.file\", \"authorities.url\"]}','[]','2023-05-22 13:37:17.953000','2023-05-22 13:37:17.953000',NULL,NULL),(563,'plugin::content-manager.explorer.delete','api::quienes-somos.quienes-somos','{}','[]','2023-05-30 22:29:31.338000','2023-05-30 22:29:31.338000',NULL,NULL),(564,'plugin::content-manager.explorer.publish','api::quienes-somos.quienes-somos','{}','[]','2023-05-30 22:29:31.360000','2023-05-30 22:29:31.360000',NULL,NULL),(568,'plugin::content-manager.explorer.delete','api::servicios-page.servicios-page','{}','[]','2023-05-30 22:32:00.002000','2023-05-30 22:32:00.002000',NULL,NULL),(569,'plugin::content-manager.explorer.publish','api::servicios-page.servicios-page','{}','[]','2023-05-30 22:32:00.027000','2023-05-30 22:32:00.027000',NULL,NULL),(582,'plugin::content-manager.explorer.delete','api::normatividad-page.normatividad-page','{}','[]','2023-05-30 22:43:42.771000','2023-05-30 22:43:42.771000',NULL,NULL),(583,'plugin::content-manager.explorer.publish','api::normatividad-page.normatividad-page','{}','[]','2023-05-30 22:43:42.796000','2023-05-30 22:43:42.796000',NULL,NULL),(587,'plugin::content-manager.explorer.delete','api::atencion-usuario.atencion-usuario','{}','[]','2023-05-30 22:44:52.805000','2023-05-30 22:44:52.805000',NULL,NULL),(588,'plugin::content-manager.explorer.publish','api::atencion-usuario.atencion-usuario','{}','[]','2023-05-30 22:44:52.830000','2023-05-30 22:44:52.830000',NULL,NULL),(616,'plugin::content-manager.explorer.delete','api::normativity.normativity','{}','[]','2023-06-11 18:48:54.138000','2023-06-11 18:48:54.138000',NULL,NULL),(617,'plugin::content-manager.explorer.publish','api::normativity.normativity','{}','[]','2023-06-11 18:48:54.147000','2023-06-11 18:48:54.147000',NULL,NULL),(662,'plugin::content-manager.explorer.create','api::header.header','{\"fields\": [\"menu.items.text\", \"menu.items.description\", \"menu.items.link\"]}','[]','2023-06-12 10:04:44.872000','2023-06-12 10:04:44.872000',NULL,NULL),(663,'plugin::content-manager.explorer.read','api::header.header','{\"fields\": [\"menu.items.text\", \"menu.items.description\", \"menu.items.link\"]}','[]','2023-06-12 10:04:44.884000','2023-06-12 10:04:44.884000',NULL,NULL),(664,'plugin::content-manager.explorer.update','api::header.header','{\"fields\": [\"menu.items.text\", \"menu.items.description\", \"menu.items.link\"]}','[]','2023-06-12 10:04:44.893000','2023-06-12 10:04:44.893000',NULL,NULL),(677,'plugin::content-manager.explorer.create','api::normativity.normativity','{\"fields\": [\"title\", \"abstract\", \"pageUrl\", \"pdfUrl\"]}','[]','2023-06-12 15:51:37.483000','2023-06-12 15:51:37.483000',NULL,NULL),(678,'plugin::content-manager.explorer.read','api::normativity.normativity','{\"fields\": [\"title\", \"abstract\", \"pageUrl\", \"pdfUrl\"]}','[]','2023-06-12 15:51:37.492000','2023-06-12 15:51:37.492000',NULL,NULL),(679,'plugin::content-manager.explorer.update','api::normativity.normativity','{\"fields\": [\"title\", \"abstract\", \"pageUrl\", \"pdfUrl\"]}','[]','2023-06-12 15:51:37.500000','2023-06-12 15:51:37.500000',NULL,NULL),(692,'plugin::content-manager.explorer.create','api::about.about','{\"fields\": [\"title\", \"blocks\", \"contentTitle.text\", \"contentTitle.level\", \"contentTitle.size\", \"contentTitle.styles\", \"workSchedule\", \"location\"]}','[]','2023-06-13 01:22:55.102000','2023-06-13 01:22:55.102000',NULL,NULL),(693,'plugin::content-manager.explorer.read','api::about.about','{\"fields\": [\"title\", \"blocks\", \"contentTitle.text\", \"contentTitle.level\", \"contentTitle.size\", \"contentTitle.styles\", \"workSchedule\", \"location\"]}','[]','2023-06-13 01:22:55.128000','2023-06-13 01:22:55.128000',NULL,NULL),(694,'plugin::content-manager.explorer.update','api::about.about','{\"fields\": [\"title\", \"blocks\", \"contentTitle.text\", \"contentTitle.level\", \"contentTitle.size\", \"contentTitle.styles\", \"workSchedule\", \"location\"]}','[]','2023-06-13 01:22:55.149000','2023-06-13 01:22:55.149000',NULL,NULL),(695,'plugin::content-manager.explorer.create','api::atencion-usuario.atencion-usuario','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"title.text\", \"title.level\", \"title.size\", \"title.styles\", \"schedule_title.text\", \"schedule_title.level\", \"schedule_title.size\", \"schedule_title.styles\", \"scheduleDescription\", \"locationTitle.text\", \"locationTitle.level\", \"locationTitle.size\", \"locationTitle.styles\", \"locationDescription\", \"phoneTitle.text\", \"phoneTitle.level\", \"phoneTitle.size\", \"phoneTitle.styles\"]}','[]','2023-06-13 20:17:56.135000','2023-06-13 20:17:56.135000',NULL,NULL),(696,'plugin::content-manager.explorer.read','api::atencion-usuario.atencion-usuario','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"title.text\", \"title.level\", \"title.size\", \"title.styles\", \"schedule_title.text\", \"schedule_title.level\", \"schedule_title.size\", \"schedule_title.styles\", \"scheduleDescription\", \"locationTitle.text\", \"locationTitle.level\", \"locationTitle.size\", \"locationTitle.styles\", \"locationDescription\", \"phoneTitle.text\", \"phoneTitle.level\", \"phoneTitle.size\", \"phoneTitle.styles\"]}','[]','2023-06-13 20:17:56.161000','2023-06-13 20:17:56.161000',NULL,NULL),(697,'plugin::content-manager.explorer.update','api::atencion-usuario.atencion-usuario','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"title.text\", \"title.level\", \"title.size\", \"title.styles\", \"schedule_title.text\", \"schedule_title.level\", \"schedule_title.size\", \"schedule_title.styles\", \"scheduleDescription\", \"locationTitle.text\", \"locationTitle.level\", \"locationTitle.size\", \"locationTitle.styles\", \"locationDescription\", \"phoneTitle.text\", \"phoneTitle.level\", \"phoneTitle.size\", \"phoneTitle.styles\"]}','[]','2023-06-13 20:17:56.189000','2023-06-13 20:17:56.189000',NULL,NULL),(710,'plugin::content-manager.explorer.create','api::articulo.articulo','{\"fields\": [\"title\", \"description\", \"slug\", \"cover\", \"author\", \"category\", \"blocks\"]}','[]','2023-06-15 01:29:59.776000','2023-06-15 01:29:59.776000',NULL,NULL),(713,'plugin::content-manager.explorer.read','api::articulo.articulo','{\"fields\": [\"title\", \"description\", \"slug\", \"cover\", \"author\", \"category\", \"blocks\"]}','[]','2023-06-15 01:29:59.808000','2023-06-15 01:29:59.808000',NULL,NULL),(716,'plugin::content-manager.explorer.update','api::articulo.articulo','{\"fields\": [\"title\", \"description\", \"slug\", \"cover\", \"author\", \"category\", \"blocks\"]}','[]','2023-06-15 01:29:59.838000','2023-06-15 01:29:59.838000',NULL,NULL),(719,'plugin::content-manager.explorer.delete','api::articulo.articulo','{}','[]','2023-06-15 01:29:59.865000','2023-06-15 01:29:59.865000',NULL,NULL),(720,'plugin::content-manager.explorer.publish','api::articulo.articulo','{}','[]','2023-06-15 01:29:59.873000','2023-06-15 01:29:59.873000',NULL,NULL),(733,'plugin::content-manager.explorer.create','api::home.home','{\"fields\": [\"sections.name\", \"sections.title.text\", \"sections.title.level\", \"sections.title.size\", \"sections.title.styles\", \"sections.image.file\", \"sections.image.url\", \"sections.priority\", \"sections.style\", \"sections.textAlign\", \"sections.description\", \"sections.services\", \"sections.document.media\", \"sections.document.title\", \"sections.document.downloadText\", \"sections.normativities\", \"sections.articulos\", \"sections.showServices\"]}','[]','2023-06-16 12:57:40.512000','2023-06-16 12:57:40.512000',NULL,NULL),(734,'plugin::content-manager.explorer.create','api::normatividad-page.normatividad-page','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\"]}','[]','2023-06-16 12:57:40.526000','2023-06-16 12:57:40.526000',NULL,NULL),(735,'plugin::content-manager.explorer.create','api::quienes-somos.quienes-somos','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\"]}','[]','2023-06-16 12:57:40.538000','2023-06-16 12:57:40.538000',NULL,NULL),(736,'plugin::content-manager.explorer.create','api::servicios-page.servicios-page','{\"fields\": [\"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\", \"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\"]}','[]','2023-06-16 12:57:40.551000','2023-06-16 12:57:40.551000',NULL,NULL),(737,'plugin::content-manager.explorer.read','api::home.home','{\"fields\": [\"sections.name\", \"sections.title.text\", \"sections.title.level\", \"sections.title.size\", \"sections.title.styles\", \"sections.image.file\", \"sections.image.url\", \"sections.priority\", \"sections.style\", \"sections.textAlign\", \"sections.description\", \"sections.services\", \"sections.document.media\", \"sections.document.title\", \"sections.document.downloadText\", \"sections.normativities\", \"sections.articulos\", \"sections.showServices\"]}','[]','2023-06-16 12:57:40.563000','2023-06-16 12:57:40.563000',NULL,NULL),(738,'plugin::content-manager.explorer.read','api::normatividad-page.normatividad-page','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\"]}','[]','2023-06-16 12:57:40.572000','2023-06-16 12:57:40.572000',NULL,NULL),(739,'plugin::content-manager.explorer.read','api::quienes-somos.quienes-somos','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\"]}','[]','2023-06-16 12:57:40.582000','2023-06-16 12:57:40.582000',NULL,NULL),(740,'plugin::content-manager.explorer.read','api::servicios-page.servicios-page','{\"fields\": [\"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\", \"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\"]}','[]','2023-06-16 12:57:40.592000','2023-06-16 12:57:40.592000',NULL,NULL),(741,'plugin::content-manager.explorer.update','api::home.home','{\"fields\": [\"sections.name\", \"sections.title.text\", \"sections.title.level\", \"sections.title.size\", \"sections.title.styles\", \"sections.image.file\", \"sections.image.url\", \"sections.priority\", \"sections.style\", \"sections.textAlign\", \"sections.description\", \"sections.services\", \"sections.document.media\", \"sections.document.title\", \"sections.document.downloadText\", \"sections.normativities\", \"sections.articulos\", \"sections.showServices\"]}','[]','2023-06-16 12:57:40.602000','2023-06-16 12:57:40.602000',NULL,NULL),(742,'plugin::content-manager.explorer.update','api::normatividad-page.normatividad-page','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\"]}','[]','2023-06-16 12:57:40.611000','2023-06-16 12:57:40.611000',NULL,NULL),(743,'plugin::content-manager.explorer.update','api::quienes-somos.quienes-somos','{\"fields\": [\"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\", \"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\"]}','[]','2023-06-16 12:57:40.619000','2023-06-16 12:57:40.619000',NULL,NULL),(744,'plugin::content-manager.explorer.update','api::servicios-page.servicios-page','{\"fields\": [\"description.name\", \"description.title.text\", \"description.title.level\", \"description.title.size\", \"description.title.styles\", \"description.image.file\", \"description.image.url\", \"description.priority\", \"description.style\", \"description.textAlign\", \"description.description\", \"description.services\", \"description.document.media\", \"description.document.title\", \"description.document.downloadText\", \"description.normativities\", \"description.articulos\", \"description.showServices\", \"banner.image.file\", \"banner.image.url\", \"banner.backgroundColor\"]}','[]','2023-06-16 12:57:40.628000','2023-06-16 12:57:40.628000',NULL,NULL),(745,'plugin::content-manager.explorer.create','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\", \"articulos\"]}','[]','2023-06-16 13:09:42.246000','2023-06-16 13:09:42.246000',NULL,NULL),(746,'plugin::content-manager.explorer.create','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\", \"articulos\"]}','[]','2023-06-16 13:09:42.255000','2023-06-16 13:09:42.255000',NULL,NULL),(747,'plugin::content-manager.explorer.read','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\", \"articulos\"]}','[]','2023-06-16 13:09:42.263000','2023-06-16 13:09:42.263000',NULL,NULL),(748,'plugin::content-manager.explorer.read','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\", \"articulos\"]}','[]','2023-06-16 13:09:42.271000','2023-06-16 13:09:42.271000',NULL,NULL),(749,'plugin::content-manager.explorer.update','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\", \"articulos\"]}','[]','2023-06-16 13:09:42.282000','2023-06-16 13:09:42.282000',NULL,NULL),(750,'plugin::content-manager.explorer.update','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\", \"articulos\"]}','[]','2023-06-16 13:09:42.291000','2023-06-16 13:09:42.291000',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_links`
--

DROP TABLE IF EXISTS `admin_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_links_fk` (`permission_id`),
  KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_links`
--

LOCK TABLES `admin_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_links` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_links` VALUES (1,1,2,1),(2,2,2,2),(3,3,2,3),(4,4,2,4),(5,5,2,5),(6,6,2,6),(7,7,3,1),(8,8,3,2),(9,9,3,3),(10,10,3,4),(11,11,3,5),(12,12,3,6),(13,13,1,1),(14,14,1,2),(15,15,1,3),(16,16,1,4),(17,17,1,5),(18,18,1,6),(19,19,1,7),(20,20,1,8),(21,21,1,9),(22,22,1,10),(23,23,1,11),(24,24,1,12),(25,25,1,13),(26,26,1,14),(27,27,1,15),(28,28,1,16),(29,29,1,17),(30,30,1,18),(31,31,1,19),(32,32,1,20),(33,33,1,21),(34,34,1,22),(35,35,1,23),(36,36,1,24),(37,37,1,25),(38,38,1,26),(39,39,1,27),(40,40,1,28),(41,41,1,29),(42,42,1,30),(43,43,1,31),(44,44,1,32),(45,45,1,33),(46,46,1,34),(47,47,1,35),(48,48,1,36),(49,49,1,37),(50,50,1,38),(51,51,1,39),(52,52,1,40),(53,53,1,41),(54,54,1,42),(55,55,1,43),(56,56,1,44),(57,57,1,45),(58,58,1,46),(59,59,1,47),(60,60,1,48),(61,61,1,49),(62,62,1,50),(63,63,1,51),(64,64,1,52),(65,65,1,53),(66,66,1,54),(67,67,1,55),(68,68,1,56),(69,69,1,57),(444,444,1,119),(445,445,1,120),(446,446,1,121),(447,447,1,122),(463,463,1,138),(465,465,1,140),(466,466,1,141),(472,472,1,147),(473,473,1,148),(477,477,1,152),(478,478,1,153),(485,485,1,160),(486,486,1,161),(492,492,1,162),(493,493,1,163),(494,494,1,164),(495,495,1,165),(496,496,1,166),(514,514,1,184),(515,515,1,185),(519,519,1,189),(520,520,1,190),(527,527,1,197),(528,528,1,198),(529,529,1,199),(540,540,1,207),(541,541,1,208),(542,542,1,209),(543,543,1,210),(544,544,1,211),(548,548,1,212),(549,549,1,213),(550,550,1,214),(551,551,1,215),(553,553,1,217),(555,555,1,219),(563,563,1,226),(564,564,1,227),(568,568,1,231),(569,569,1,232),(582,582,1,242),(583,583,1,243),(587,587,1,247),(588,588,1,248),(616,616,1,274),(617,617,1,275),(662,662,1,310),(663,663,1,311),(664,664,1,312),(677,677,1,325),(678,678,1,326),(679,679,1,327),(692,692,1,340),(693,693,1,341),(694,694,1,342),(695,695,1,343),(696,696,1,344),(697,697,1,345),(710,710,1,358),(713,713,1,361),(716,716,1,364),(719,719,1,367),(720,720,1,368),(733,733,1,369),(734,734,1,370),(735,735,1,371),(736,736,1,372),(737,737,1,373),(738,738,1,374),(739,739,1,375),(740,740,1,376),(741,741,1,377),(742,742,1,378),(743,743,1,379),(744,744,1,380),(745,745,1,381),(746,746,1,382),(747,747,1,383),(748,748,1,384),(749,749,1,385),(750,750,1,386);
/*!40000 ALTER TABLE `admin_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2023-05-05 00:46:02.723000','2023-05-05 00:46:02.723000',NULL,NULL),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2023-05-05 00:46:02.733000','2023-05-05 00:46:02.733000',NULL,NULL),(3,'Author','strapi-author','Authors can manage the content they have created.','2023-05-05 00:46:02.738000','2023-05-05 00:46:02.738000',NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'Maria Paula','Rodriguez',NULL,'mariapaularoes@gmail.com','$2a$10$rgpMYxXnfplnhQdJ724xeu2VjvbIzMbVw4pXASBkMEQb9MxOL2jhi',NULL,NULL,1,0,NULL,'2023-05-05 00:46:31.042000','2023-05-05 00:46:31.042000',NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_links`
--

DROP TABLE IF EXISTS `admin_users_roles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users_roles_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `role_order` double unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  KEY `admin_users_roles_links_fk` (`user_id`),
  KEY `admin_users_roles_links_inv_fk` (`role_id`),
  KEY `admin_users_roles_links_order_fk` (`role_order`),
  KEY `admin_users_roles_links_order_inv_fk` (`user_order`),
  CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_links`
--

LOCK TABLES `admin_users_roles_links` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_links` DISABLE KEYS */;
INSERT INTO `admin_users_roles_links` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `admin_users_roles_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articulos_slug_unique` (`slug`),
  KEY `articulos_created_by_id_fk` (`created_by_id`),
  KEY `articulos_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `articulos_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `articulos_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'Comunicado Oficial','Actualización de los correos institucionales.','comunicado-oficial','2023-06-15 01:32:01.809000','2023-06-15 21:24:14.585000','2023-06-15 01:33:43.662000',1,1);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_author_links`
--

DROP TABLE IF EXISTS `articulos_author_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos_author_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `articulo_id` int unsigned DEFAULT NULL,
  `author_id` int unsigned DEFAULT NULL,
  `articulo_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articulos_author_links_unique` (`articulo_id`,`author_id`),
  KEY `articulos_author_links_fk` (`articulo_id`),
  KEY `articulos_author_links_inv_fk` (`author_id`),
  KEY `articulos_author_links_order_inv_fk` (`articulo_order`),
  CONSTRAINT `articulos_author_links_fk` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `articulos_author_links_inv_fk` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_author_links`
--

LOCK TABLES `articulos_author_links` WRITE;
/*!40000 ALTER TABLE `articulos_author_links` DISABLE KEYS */;
INSERT INTO `articulos_author_links` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `articulos_author_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_category_links`
--

DROP TABLE IF EXISTS `articulos_category_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos_category_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `articulo_id` int unsigned DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `articulo_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articulos_category_links_unique` (`articulo_id`,`category_id`),
  KEY `articulos_category_links_fk` (`articulo_id`),
  KEY `articulos_category_links_inv_fk` (`category_id`),
  KEY `articulos_category_links_order_inv_fk` (`articulo_order`),
  CONSTRAINT `articulos_category_links_fk` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `articulos_category_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_category_links`
--

LOCK TABLES `articulos_category_links` WRITE;
/*!40000 ALTER TABLE `articulos_category_links` DISABLE KEYS */;
INSERT INTO `articulos_category_links` VALUES (1,1,2,1);
/*!40000 ALTER TABLE `articulos_category_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos_components`
--

DROP TABLE IF EXISTS `articulos_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articulos_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `articulos_field_index` (`field`),
  KEY `articulos_component_type_index` (`component_type`),
  KEY `articulos_entity_fk` (`entity_id`),
  CONSTRAINT `articulos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos_components`
--

LOCK TABLES `articulos_components` WRITE;
/*!40000 ALTER TABLE `articulos_components` DISABLE KEYS */;
INSERT INTO `articulos_components` VALUES (9,1,2,'shared.rich-text','blocks',1),(10,1,3,'shared.document','blocks',2);
/*!40000 ALTER TABLE `articulos_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atencion_usuarios`
--

DROP TABLE IF EXISTS `atencion_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atencion_usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `schedule_description` longtext,
  `location_description` longtext,
  PRIMARY KEY (`id`),
  KEY `atencion_usuarios_created_by_id_fk` (`created_by_id`),
  KEY `atencion_usuarios_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `atencion_usuarios_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `atencion_usuarios_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atencion_usuarios`
--

LOCK TABLES `atencion_usuarios` WRITE;
/*!40000 ALTER TABLE `atencion_usuarios` DISABLE KEYS */;
INSERT INTO `atencion_usuarios` VALUES (1,'2023-05-30 23:12:06.387000','2023-06-13 20:23:22.476000','2023-06-01 00:33:27.039000',1,1,'**Lunes a viernes**\n7:30 A.M - 5:30 P.M\nJornada continua\n\n**Sábados**\n8:00 A.M - 12:00 P.M\n\n**Domingos y Festivos**\nNo hay servicio','**Cra. 23c #64 A 10**\nManizales, Caldas');
/*!40000 ALTER TABLE `atencion_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atencion_usuarios_components`
--

DROP TABLE IF EXISTS `atencion_usuarios_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atencion_usuarios_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `atencion_usuarios_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `atencion_usuarios_field_index` (`field`),
  KEY `atencion_usuarios_component_type_index` (`component_type`),
  KEY `atencion_usuarios_entity_fk` (`entity_id`),
  CONSTRAINT `atencion_usuarios_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `atencion_usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atencion_usuarios_components`
--

LOCK TABLES `atencion_usuarios_components` WRITE;
/*!40000 ALTER TABLE `atencion_usuarios_components` DISABLE KEYS */;
INSERT INTO `atencion_usuarios_components` VALUES (1,1,4,'template.banner','banner',NULL),(4,1,14,'section.heading','title',NULL),(5,1,15,'section.heading','schedule_title',NULL),(6,1,16,'section.heading','locationTitle',NULL);
/*!40000 ALTER TABLE `atencion_usuarios_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authors_created_by_id_fk` (`created_by_id`),
  KEY `authors_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `authors_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `authors_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Junta Caldas','krodassoftware@gmail.com','2023-06-15 00:40:44.416000','2023-06-15 00:40:44.416000',1,1);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_created_by_id_fk` (`created_by_id`),
  KEY `categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Noticias','category-noticias','Noticias relevantes para la Junta Regional de Invalidez de Caldas','2023-06-14 00:42:48.526000','2023-06-15 00:26:51.022000',1,1),(2,'Comunicados','category-comunicados','Comunicados oficiales','2023-06-15 00:27:18.295000','2023-06-15 00:27:18.295000',1,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_documents`
--

DROP TABLE IF EXISTS `components_shared_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `download_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_documents`
--

LOCK TABLES `components_shared_documents` WRITE;
/*!40000 ALTER TABLE `components_shared_documents` DISABLE KEYS */;
INSERT INTO `components_shared_documents` VALUES (1,'REGLAMENTO INTERNO DE FUNCIONAMIENTO','Descargar para ver'),(2,'Comunicado oficial','Descargar para ver'),(3,'Comunicado oficial','Descargar para ver');
/*!40000 ALTER TABLE `components_shared_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_emails`
--

DROP TABLE IF EXISTS `components_shared_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_emails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_emails`
--

LOCK TABLES `components_shared_emails` WRITE;
/*!40000 ALTER TABLE `components_shared_emails` DISABLE KEYS */;
INSERT INTO `components_shared_emails` VALUES (1,'gestortecnico@juntacaldas.com','Derechos de petición, tutelas, pagos Junta Nacional.'),(2,'gestoradministrativo@juntacaldas.com','Interconsultores, proveedores, compras.'),(3,'notificaciones@juntacaldas.com','Presentación de recursos'),(4,'analista@juntacaldas.com','Remisión de expedientes para solicitudes de calificación – pagos realizados a la junta regional.'),(5,'gestortecnico@juntacaldas.com','Derechos de petición, tutelas, pagos Junta Nacional '),(6,'gestoradministrativo@juntacaldas.com','Interconsultores, proveedores, compras.'),(7,'notificaciones@juntacaldas.com','Presentación de recursos'),(8,'analista@juntacaldas.com','Remisión de expedientes para solicitudes de calificación, pagos realizados a la junta regional.');
/*!40000 ALTER TABLE `components_shared_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_fees`
--

DROP TABLE IF EXISTS `components_shared_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_fees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `value` bigint DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_fees`
--

LOCK TABLES `components_shared_fees` WRITE;
/*!40000 ALTER TABLE `components_shared_fees` DISABLE KEYS */;
INSERT INTO `components_shared_fees` VALUES (1,1160000,'Salario mínimo legal vigente {{entity.fee.value}}\n');
/*!40000 ALTER TABLE `components_shared_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_headings`
--

DROP TABLE IF EXISTS `components_shared_headings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_headings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` int DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `styles` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_headings`
--

LOCK TABLES `components_shared_headings` WRITE;
/*!40000 ALTER TABLE `components_shared_headings` DISABLE KEYS */;
INSERT INTO `components_shared_headings` VALUES (1,1,NULL,NULL,NULL),(2,2,NULL,NULL,NULL),(3,2,NULL,NULL,NULL),(4,2,NULL,NULL,NULL),(5,1,'Junta Regional de Calificación de Invalidez de Caldas',48,NULL),(6,2,'Una herramienta fundamental',48,NULL),(7,2,'Calificación según su caso',48,NULL),(8,2,'Recibe las ultimas novedades',48,NULL),(9,1,'Calificación según su caso',42,NULL),(10,1,'Junta Regional de Calificación de Invalidez de Caldas',42,NULL),(11,1,'Conoce las leyes y decretos',42,NULL),(12,1,'Junta Regional de Calificación de Invalidez Caldas',NULL,'sm:48'),(13,2,'Calificación según su caso',NULL,NULL),(14,1,'Nuestros horarios de atención al cliente',48,NULL),(15,2,'Horario de atención',32,NULL),(16,2,'Ubicación',32,NULL);
/*!40000 ALTER TABLE `components_shared_headings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_items`
--

DROP TABLE IF EXISTS `components_shared_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `description` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_items`
--

LOCK TABLES `components_shared_items` WRITE;
/*!40000 ALTER TABLE `components_shared_items` DISABLE KEYS */;
INSERT INTO `components_shared_items` VALUES (1,'Quiénes somos','Conócenos y descubre cómo podemos ayudarte','/quienes-somos'),(2,'Servicios','Conoce nuestros servicios','/servicios'),(3,'Normatividad','Conoce la normatividad vigente','/normatividad'),(4,'Atención al usuario','Conoce nuestros horarios de atención, ubicación y correos electrónicos','/atencion-al-usuario'),(5,'Quiénes somo','Conócenos y descubre cómo podemos ayudarte','/quienes-somos'),(6,'Servicios','Conoce nuestros servicios','/servicios'),(7,'Normatividad','Conoce la normatividad vigente','/normatividad'),(8,'Atención al usuario','Conoce nuestros horarios de atención, ubicación y correos electrónicos','/atencion-al-usuario'),(9,'Condonación de deudas',NULL,NULL),(10,'Reclamación seguros de vida',NULL,NULL),(11,'Reclamación seguros de vida',NULL,NULL),(12,'Reclamación de indemnización por accidente de tránsito',NULL,NULL),(13,'Pensión anticipada por hijo discapacitado',NULL,NULL),(14,'Prueba anticipada para iniciar demanda',NULL,NULL),(15,'Diligenciar el formulario para la solicitud de calificación ante la Junta de Calificación de Invalidez',NULL,NULL),(16,'Consignar los honorarios equivalentes a $1.160.000 en la cuenta corriente No. 05995280374 de Bancolombia, convenio # 46495 a nombre de la JUNTA REGIONAL DE CALIFICACIÓN DE INVALIDEZ DE CALDAS NIT No. 900.600.849-5 ',NULL,NULL),(17,'Historia Clínica completa. (Concepto de Rehabilitación Integral) debidamente foliada de adelante hacia atrás por una sola página\n',NULL,NULL),(18,'Carta dirigida a la entidad a la cual está reclamando con sello de recibido, informándoles que se encuentra realizando los trámites para la calificación ante la {{entity.name}}',NULL,NULL),(19,'Carta dirigida a la Junta en donde informan para que necesitan la calificación',NULL,NULL),(20,'Fotocopia de la Cédula de Ciudadanía ampliada al 150%',NULL,NULL),(21,'Ayudas o indemnización por ser víctimas del conflicto armado',NULL,NULL),(22,'Diligenciar el formulario para la solicitud de calificación ante la Junta de Calificación de Invalidez',NULL,NULL),(23,'Consignar los honorarios equivalentes a $1.160.000 en la cuenta corriente No. 05995280374 de Bancolombia, convenio # 46495 a nombre de la JUNTA REGIONAL DE CALIFICACIÓN DE INVALIDEZ DE CALDAS NIT No. 900.600.849-5 ',NULL,NULL),(24,'Historia Clínica completa. (Concepto de Rehabilitación Integral) debidamente foliada de adelante hacia atrás por una sola página\n',NULL,NULL),(25,'RUV certificado único de víctimas\n',NULL,NULL),(26,'Carta dirigida a la entidad a la cual está reclamando con sello de recibido, informándoles que se encuentra realizando los trámites para la calificación ante la {{entity.name}}',NULL,NULL),(27,'Carta dirigida a la Junta en donde informan para que necesitan la calificación',NULL,NULL),(28,'Fotocopia de la Cédula de Ciudadanía ampliada al 150%',NULL,NULL),(29,'Requerimiento por orden judicial',NULL,NULL),(30,'Diligenciar el formulario para la solicitud de calificación ante la Junta de Calificación de Invalidez',NULL,NULL),(31,'Consignar los honorarios equivalentes a $1.160.000 en la cuenta corriente No. 05995280374 de Bancolombia, convenio # 46495 a nombre de la JUNTA REGIONAL DE CALIFICACIÓN DE INVALIDEZ DE CALDAS NIT No. 900.600.849-5 ',NULL,NULL),(32,'Historia Clínica completa. (Concepto de Rehabilitación Integral) debidamente foliada de adelante hacia atrás por una sola página\n',NULL,NULL),(33,'Auto del juzgado donde asigna a las Juntas regionales como perito\n',NULL,NULL),(34,'Fotocopia de la Cédula de Ciudadanía ampliada al 150%',NULL,NULL),(35,'Quiénes somos','Conoce más sobre nosotros','/quienes-somos'),(36,'Servicios','Conoce nuestros servicios','/servicios'),(37,'Normatividad','Conoce la normatividad vigente','/normatividad'),(38,'Atención al usuario','Conoce nuestros horarios de atención, ubicación y otros datos','/atencion-al-usuario');
/*!40000 ALTER TABLE `components_shared_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_media`
--

DROP TABLE IF EXISTS `components_shared_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_media`
--

LOCK TABLES `components_shared_media` WRITE;
/*!40000 ALTER TABLE `components_shared_media` DISABLE KEYS */;
INSERT INTO `components_shared_media` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL),(12,NULL),(13,NULL),(14,NULL),(15,NULL),(16,NULL),(17,NULL),(18,NULL),(19,NULL),(20,NULL),(21,NULL),(22,NULL),(23,NULL),(24,NULL);
/*!40000 ALTER TABLE `components_shared_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_phones`
--

DROP TABLE IF EXISTS `components_shared_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_phones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` bigint DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `code` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_phones`
--

LOCK TABLES `components_shared_phones` WRITE;
/*!40000 ALTER TABLE `components_shared_phones` DISABLE KEYS */;
INSERT INTO `components_shared_phones` VALUES (1,8850406,'fijo',606),(2,8850409,'fijo',606),(3,8850413,'fijo',606),(4,3108793711,'whatsapp',57),(5,8850406,'fijo',606),(6,8850409,'fijo',606),(7,8850413,'fijo',606),(8,3108793711,'celular',57),(9,3108793711,'whatsapp',57);
/*!40000 ALTER TABLE `components_shared_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_quotes`
--

DROP TABLE IF EXISTS `components_shared_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_quotes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_quotes`
--

LOCK TABLES `components_shared_quotes` WRITE;
/*!40000 ALTER TABLE `components_shared_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_shared_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_rich_texts`
--

DROP TABLE IF EXISTS `components_shared_rich_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_rich_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_rich_texts`
--

LOCK TABLES `components_shared_rich_texts` WRITE;
/*!40000 ALTER TABLE `components_shared_rich_texts` DISABLE KEYS */;
INSERT INTO `components_shared_rich_texts` VALUES (1,'Actualización de los correos institucionales.'),(2,'La Junta Regional de Calificación de Invalidez de Caldas informa que a partir de la fecha los correos institucionales son:\n\n[gestortecnico@juntacaldas.com](mailto:gestortecnico@juntacaldas.com) “derechos de petición, tutelas, orden de pago a favor de la Junta Nacional”\n[notificaciones@juntacaldas.com](mailto:notificaciones@juntacaldas.com) “presentación de recursos y solicitud de actas de ejecutoria”\n[analista@juntacaldas.com](mailto:analista@juntacaldas.com) “remisión de expedientes para calificación, órdenes de pago a favor de la Junta Regional de Invalidez de Caldas” \n[gestoradministrativo@juntacaldas.com](mailto:gestoradministrativo@juntacaldas.com) “compras, proveedores, facturación electrónica, todo lo relacionado con interconsultores, pago de exámenes complementarios de interconsultores”\n\n\n#### NOTA:\nFavor abstenerse de seguir enviando más comunicaciones a los siguientes correos:\n“**juntacaldas@hotmail.com; juntacaldasnotificaciones@hotmail.com; 7juntaregionalcaldas@gmail.com; juntacaldasnotificaciones@gmail.com; juntacalinterconsultores@hotmail.com;** ya que se encuentran deshabilitados y no serán objeto de trámite.');
/*!40000 ALTER TABLE `components_shared_rich_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_seos`
--

DROP TABLE IF EXISTS `components_shared_seos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_seos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_seos`
--

LOCK TABLES `components_shared_seos` WRITE;
/*!40000 ALTER TABLE `components_shared_seos` DISABLE KEYS */;
INSERT INTO `components_shared_seos` VALUES (1,'Junta Regional de calificación de invalidez de Caldas ','Entidad privada adscrita al Ministerio de Trabajo que decide recursos de apelación contra dictámenes de juntas regionales de calificación de invalidez.'),(2,'Junta Regional de calificación de invalidez de Caldas ','Evaluación justa de discapacidades. Apoyando derechos y bienestar de personas con limitaciones laborales en Caldas.'),(3,'Junta Regional de calificación de Invalidez de Caldas ','Evaluación justa de discapacidades. Apoyando derechos y bienestar de personas con limitaciones laborales en Caldas.');
/*!40000 ALTER TABLE `components_shared_seos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_sliders`
--

DROP TABLE IF EXISTS `components_shared_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_sliders`
--

LOCK TABLES `components_shared_sliders` WRITE;
/*!40000 ALTER TABLE `components_shared_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_shared_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_banners`
--

DROP TABLE IF EXISTS `components_template_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `background_color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_banners`
--

LOCK TABLES `components_template_banners` WRITE;
/*!40000 ALTER TABLE `components_template_banners` DISABLE KEYS */;
INSERT INTO `components_template_banners` VALUES (1,'tertiary'),(2,'none'),(3,'tertiary'),(4,'tertiary');
/*!40000 ALTER TABLE `components_template_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_banners_components`
--

DROP TABLE IF EXISTS `components_template_banners_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_banners_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_template_banners_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_template_banners_field_index` (`field`),
  KEY `components_template_banners_component_type_index` (`component_type`),
  KEY `components_template_banners_entity_fk` (`entity_id`),
  CONSTRAINT `components_template_banners_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_template_banners` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_banners_components`
--

LOCK TABLES `components_template_banners_components` WRITE;
/*!40000 ALTER TABLE `components_template_banners_components` DISABLE KEYS */;
INSERT INTO `components_template_banners_components` VALUES (1,1,19,'shared.media','image',NULL),(2,2,20,'shared.media','image',NULL),(4,3,23,'shared.media','image',NULL),(5,4,24,'shared.media','image',NULL);
/*!40000 ALTER TABLE `components_template_banners_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_lists`
--

DROP TABLE IF EXISTS `components_template_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_lists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_lists`
--

LOCK TABLES `components_template_lists` WRITE;
/*!40000 ALTER TABLE `components_template_lists` DISABLE KEYS */;
INSERT INTO `components_template_lists` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `components_template_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_lists_components`
--

DROP TABLE IF EXISTS `components_template_lists_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_lists_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_template_lists_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_template_lists_field_index` (`field`),
  KEY `components_template_lists_component_type_index` (`component_type`),
  KEY `components_template_lists_entity_fk` (`entity_id`),
  CONSTRAINT `components_template_lists_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_template_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_lists_components`
--

LOCK TABLES `components_template_lists_components` WRITE;
/*!40000 ALTER TABLE `components_template_lists_components` DISABLE KEYS */;
INSERT INTO `components_template_lists_components` VALUES (1,1,1,'shared.item','item',1),(2,1,2,'shared.item','item',3),(3,1,3,'shared.item','item',5),(4,1,4,'shared.item','item',7),(5,1,5,'shared.item','items',1),(6,1,6,'shared.item','items',2),(7,1,7,'shared.item','items',3),(8,1,8,'shared.item','items',4),(10,2,9,'shared.item','items',1),(11,2,10,'shared.item','items',2),(12,2,11,'shared.item','items',3),(13,2,12,'shared.item','items',4),(14,2,13,'shared.item','items',5),(15,2,14,'shared.item','items',6),(22,3,15,'shared.item','items',1),(23,3,16,'shared.item','items',2),(24,3,17,'shared.item','items',3),(25,3,18,'shared.item','items',4),(26,3,19,'shared.item','items',5),(27,3,20,'shared.item','items',6),(52,4,21,'shared.item','items',1),(53,5,22,'shared.item','items',1),(54,5,23,'shared.item','items',2),(55,5,24,'shared.item','items',3),(56,5,25,'shared.item','items',4),(57,5,26,'shared.item','items',5),(58,5,27,'shared.item','items',6),(59,5,28,'shared.item','items',7),(80,6,29,'shared.item','items',1),(81,7,30,'shared.item','items',1),(82,7,31,'shared.item','items',2),(83,7,32,'shared.item','items',3),(84,7,33,'shared.item','items',4),(85,7,34,'shared.item','items',5),(118,8,35,'shared.item','items',1),(119,8,36,'shared.item','items',2),(120,8,37,'shared.item','items',3),(121,8,38,'shared.item','items',4);
/*!40000 ALTER TABLE `components_template_lists_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_sections`
--

DROP TABLE IF EXISTS `components_template_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `text_align` varchar(255) DEFAULT NULL,
  `description` longtext,
  `show_services` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_sections`
--

LOCK TABLES `components_template_sections` WRITE;
/*!40000 ALTER TABLE `components_template_sections` DISABLE KEYS */;
INSERT INTO `components_template_sections` VALUES (1,'Bienvenidos',1,'primary','right','Nuestra organización trabaja incansablemente para mejorar el nivel de vida de la población a la que atendemos. A través de la presentación objetiva de **nuestros servicios y la ejecución de planes, programas y proyectos**, garantizamos el bienestar de nuestros beneficiarios.',NULL),(2,'Nosotros',2,'secondary','left','La Junta Regional de Calificación de Invalidez es una herramienta que brinda al ciudadano la oportunidad de tener una evaluación precisa de su discapacidad, lo que le permite acceder a los beneficios e indemnizaciones que le corresponden.\nCon estas medidas, nuestro objetivo es asegurar que las personas con discapacidad reciban la atención y el apoyo que necesitan para mejorar su calidad de vida, y que se les brinde una evaluación justa y rigurosa de sus condiciones de salud.',NULL),(3,'Servicios',3,'content','center',NULL,NULL),(4,'Noticias',4,'content','center',NULL,NULL),(5,'Bienvenidos',1,'primary','right','Nuestra organización trabaja incansablemente para mejorar el nivel de vida de la población a la que atendemos. A través de la presentación objetiva de **nuestros servicios y la ejecución de planes, programas y proyectos,** garantizamos el bienestar de nuestros beneficiarios.',0),(6,'Nosotros',2,'secondary','left','La Junta Regional de Calificación de Invalidez es una herramienta que brinda al ciudadano la oportunidad de tener una evaluación precisa de su discapacidad, lo que le permite acceder a los beneficios e indemnizaciones que le corresponden.\nCon estas medidas, nuestro objetivo es asegurar que las personas con discapacidad reciban la atención y el apoyo que necesitan para mejorar su calidad de vida, y que se les brinde una evaluación justa y rigurosa de sus condiciones de salud.',0),(7,'Servicios',3,'content','center',NULL,0),(8,'Noticias',4,'content','center',NULL,0),(9,'Servicios',1,'content','center','',1),(10,'Quienes somos',1,'content','center','Somos una entidad del Sistema de Seguridad Social Integral, creada legalmente y adscrita al Ministerio del Trabajo. Tenemos personería jurídica, somos de derecho privado y sin fines de lucro. Nos caracterizamos por ser interdisciplinarios y estar sujetos a revisoría fiscal, pero al mismo tiempo, contamos con autonomía técnica y científica en la emisión de dictámenes periciales. Las decisiones que tomamos tienen carácter obligatorio.\n\nComo Junta Nacional de Calificación de Invalidez, nuestras funciones son exclusivas. Nos encargamos de decidir en segunda instancia los recursos de apelación que se presenten contra los dictámenes emitidos por las Juntas Regionales de Calificación de Invalidez. Dichos recursos se refieren a aspectos como el origen y la pérdida de la capacidad laboral, la fecha de estructuración y revisión de la pérdida de dicha capacidad, así como el estado de invalidez.\n\n',0),(11,'Normatividad',1,'content','center',NULL,0);
/*!40000 ALTER TABLE `components_template_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_sections_articulos_links`
--

DROP TABLE IF EXISTS `components_template_sections_articulos_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_sections_articulos_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int unsigned DEFAULT NULL,
  `articulo_id` int unsigned DEFAULT NULL,
  `articulo_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_template_sections_articulos_links_unique` (`section_id`,`articulo_id`),
  KEY `components_template_sections_articulos_links_fk` (`section_id`),
  KEY `components_template_sections_articulos_links_inv_fk` (`articulo_id`),
  KEY `components_template_sections_articulos_links_order_fk` (`articulo_order`),
  CONSTRAINT `components_template_sections_articulos_links_fk` FOREIGN KEY (`section_id`) REFERENCES `components_template_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_template_sections_articulos_links_inv_fk` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_sections_articulos_links`
--

LOCK TABLES `components_template_sections_articulos_links` WRITE;
/*!40000 ALTER TABLE `components_template_sections_articulos_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_template_sections_articulos_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_sections_components`
--

DROP TABLE IF EXISTS `components_template_sections_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_sections_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_template_sections_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `components_template_sections_field_index` (`field`),
  KEY `components_template_sections_component_type_index` (`component_type`),
  KEY `components_template_sections_entity_fk` (`entity_id`),
  CONSTRAINT `components_template_sections_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_template_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_sections_components`
--

LOCK TABLES `components_template_sections_components` WRITE;
/*!40000 ALTER TABLE `components_template_sections_components` DISABLE KEYS */;
INSERT INTO `components_template_sections_components` VALUES (1,1,1,'shared.heading','title',NULL),(2,1,11,'shared.media','image',NULL),(3,2,2,'shared.heading','title',NULL),(4,2,12,'shared.media','image',NULL),(5,3,3,'shared.heading','title',NULL),(11,4,4,'shared.heading','title',NULL),(12,5,5,'shared.heading','title',NULL),(13,5,17,'shared.media','image',NULL),(14,6,6,'shared.heading','title',NULL),(15,6,18,'shared.media','image',NULL),(16,7,7,'shared.heading','title',NULL),(22,8,8,'shared.heading','title',NULL),(47,9,9,'shared.heading','title',NULL),(48,10,10,'shared.heading','title',NULL),(49,10,21,'shared.media','image',NULL),(51,9,22,'shared.media','image',NULL),(52,11,11,'shared.heading','title',NULL),(80,10,10,'section.heading','title',NULL),(82,10,1,'shared.document','document',NULL),(83,11,11,'section.heading','title',NULL),(84,5,5,'section.heading','title',NULL),(86,6,6,'section.heading','title',NULL),(88,7,7,'section.heading','title',NULL),(89,8,8,'section.heading','title',NULL),(108,9,9,'section.heading','title',NULL);
/*!40000 ALTER TABLE `components_template_sections_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_sections_normativities_links`
--

DROP TABLE IF EXISTS `components_template_sections_normativities_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_sections_normativities_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int unsigned DEFAULT NULL,
  `normativity_id` int unsigned DEFAULT NULL,
  `normativity_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_template_sections_normativities_links_unique` (`section_id`,`normativity_id`),
  KEY `components_template_sections_normativities_links_fk` (`section_id`),
  KEY `components_template_sections_normativities_links_inv_fk` (`normativity_id`),
  KEY `components_template_sections_normativities_links_order_fk` (`normativity_order`),
  CONSTRAINT `components_template_sections_normativities_links_fk` FOREIGN KEY (`section_id`) REFERENCES `components_template_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_template_sections_normativities_links_inv_fk` FOREIGN KEY (`normativity_id`) REFERENCES `normativities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_sections_normativities_links`
--

LOCK TABLES `components_template_sections_normativities_links` WRITE;
/*!40000 ALTER TABLE `components_template_sections_normativities_links` DISABLE KEYS */;
INSERT INTO `components_template_sections_normativities_links` VALUES (1,11,3,10),(2,11,6,9),(3,11,9,8),(4,11,4,7),(5,11,1,6),(6,11,2,5),(7,11,7,4),(8,11,5,3),(9,11,10,2),(10,11,8,1);
/*!40000 ALTER TABLE `components_template_sections_normativities_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_template_sections_services_links`
--

DROP TABLE IF EXISTS `components_template_sections_services_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_template_sections_services_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int unsigned DEFAULT NULL,
  `service_id` int unsigned DEFAULT NULL,
  `service_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_template_sections_services_links_unique` (`section_id`,`service_id`),
  KEY `components_template_sections_services_links_fk` (`section_id`),
  KEY `components_template_sections_services_links_inv_fk` (`service_id`),
  KEY `components_template_sections_services_links_order_fk` (`service_order`),
  CONSTRAINT `components_template_sections_services_links_fk` FOREIGN KEY (`section_id`) REFERENCES `components_template_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_template_sections_services_links_inv_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_template_sections_services_links`
--

LOCK TABLES `components_template_sections_services_links` WRITE;
/*!40000 ALTER TABLE `components_template_sections_services_links` DISABLE KEYS */;
INSERT INTO `components_template_sections_services_links` VALUES (1,7,3,3),(2,7,2,2),(3,7,1,1),(4,9,2,3),(5,9,1,2),(6,9,3,1);
/*!40000 ALTER TABLE `components_template_sections_services_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` longtext,
  `work_schedule` longtext,
  `nit` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_created_by_id_fk` (`created_by_id`),
  KEY `entities_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `entities_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entities_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,' LA JUNTA REGIONAL DE CALIFICACION DE INVALIDEZ DE CALDAS ','Cra. 23c #64 A 10, Manizales, Caldas','Lunes a viernes 7:00 A.M A 4:00 P.M. JORNADA CONTINUA – Sábado 8:00 A.M A 12:00 MM. ','900600849-5','2023-05-16 21:14:02.171000','2023-06-06 22:23:00.997000','2023-05-16 21:14:09.101000',1,1);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_accounts_links`
--

DROP TABLE IF EXISTS `entities_accounts_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities_accounts_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `account_id` int unsigned DEFAULT NULL,
  `account_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entities_accounts_links_unique` (`entity_id`,`account_id`),
  KEY `entities_accounts_links_fk` (`entity_id`),
  KEY `entities_accounts_links_inv_fk` (`account_id`),
  KEY `entities_accounts_links_order_fk` (`account_order`),
  CONSTRAINT `entities_accounts_links_fk` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entities_accounts_links_inv_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_accounts_links`
--

LOCK TABLES `entities_accounts_links` WRITE;
/*!40000 ALTER TABLE `entities_accounts_links` DISABLE KEYS */;
INSERT INTO `entities_accounts_links` VALUES (1,1,2,1),(2,1,1,0);
/*!40000 ALTER TABLE `entities_accounts_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities_components`
--

DROP TABLE IF EXISTS `entities_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entities_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `entities_field_index` (`field`),
  KEY `entities_component_type_index` (`component_type`),
  KEY `entities_entity_fk` (`entity_id`),
  CONSTRAINT `entities_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities_components`
--

LOCK TABLES `entities_components` WRITE;
/*!40000 ALTER TABLE `entities_components` DISABLE KEYS */;
INSERT INTO `entities_components` VALUES (1,1,13,'shared.media','logo',11),(2,1,5,'shared.email','emails',2),(3,1,6,'shared.email','emails',4),(4,1,7,'shared.email','emails',1),(5,1,8,'shared.email','emails',5),(6,1,5,'shared.phone','phones',2),(7,1,6,'shared.phone','phones',4),(8,1,7,'shared.phone','phones',5),(9,1,8,'shared.phone','phones',1),(28,1,1,'shared.fee','fee',10),(42,1,9,'shared.phone','phones',3);
/*!40000 ALTER TABLE `entities_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `formats` json DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` json DEFAULT NULL,
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (13,'logo.png',NULL,NULL,193,71,NULL,'logo_0a8d78d2ad','.png','image/png',5.20,'/uploads/logo_0a8d78d2ad.png',NULL,'local',NULL,'/','2023-05-14 14:58:58.680000','2023-05-14 15:08:12.396000',NULL,NULL),(14,'minsalud.png','Logo del Ministerio de salud y protección social','Ministerio de salud y protección social',410,113,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_minsalud_dfabe25833.png\", \"hash\": \"thumbnail_minsalud_dfabe25833\", \"mime\": \"image/png\", \"name\": \"thumbnail_minsalud.png\", \"path\": null, \"size\": 10.52, \"width\": 245, \"height\": 68}}','minsalud_dfabe25833','.png','image/png',7.55,'/uploads/minsalud_dfabe25833.png',NULL,'local',NULL,'/','2023-05-14 15:28:14.132000','2023-05-14 15:30:14.808000',NULL,NULL),(15,'mintrabajo.png','Logo del Ministerio del Trabajo','Ministerio del Trabajo',395,113,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_mintrabajo_31d18f003e.png\", \"hash\": \"thumbnail_mintrabajo_31d18f003e\", \"mime\": \"image/png\", \"name\": \"thumbnail_mintrabajo.png\", \"path\": null, \"size\": 12.72, \"width\": 245, \"height\": 70}}','mintrabajo_31d18f003e','.png','image/png',8.36,'/uploads/mintrabajo_31d18f003e.png',NULL,'local',NULL,'/','2023-05-14 15:28:14.213000','2023-05-14 15:30:52.030000',NULL,NULL),(16,'supersalud.png','Logo de Superintencia Nacional de Salud','Superintencia Nacional de Salud',360,123,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_supersalud_c54e70127a.png\", \"hash\": \"thumbnail_supersalud_c54e70127a\", \"mime\": \"image/png\", \"name\": \"thumbnail_supersalud.png\", \"path\": null, \"size\": 24.06, \"width\": 245, \"height\": 84}}','supersalud_c54e70127a','.png','image/png',15.67,'/uploads/supersalud_c54e70127a.png',NULL,'local',NULL,'/','2023-05-14 15:28:14.286000','2023-05-14 16:35:03.463000',NULL,NULL),(17,'main-section.png','Imagen decorativa',NULL,1094,1090,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_main_section_59fe2b0eef.png\", \"hash\": \"large_main_section_59fe2b0eef\", \"mime\": \"image/png\", \"name\": \"large_main-section.png\", \"path\": null, \"size\": 816.95, \"width\": 1000, \"height\": 996}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_main_section_59fe2b0eef.png\", \"hash\": \"small_main_section_59fe2b0eef\", \"mime\": \"image/png\", \"name\": \"small_main-section.png\", \"path\": null, \"size\": 242.31, \"width\": 500, \"height\": 498}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_main_section_59fe2b0eef.png\", \"hash\": \"medium_main_section_59fe2b0eef\", \"mime\": \"image/png\", \"name\": \"medium_main-section.png\", \"path\": null, \"size\": 496.29, \"width\": 750, \"height\": 747}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_main_section_59fe2b0eef.png\", \"hash\": \"thumbnail_main_section_59fe2b0eef\", \"mime\": \"image/png\", \"name\": \"thumbnail_main-section.png\", \"path\": null, \"size\": 34.9, \"width\": 157, \"height\": 156}}','main_section_59fe2b0eef','.png','image/png',215.50,'/uploads/main_section_59fe2b0eef.png',NULL,'local',NULL,'/','2023-05-14 15:44:41.621000','2023-06-11 21:44:27.816000',NULL,1),(18,'homepage-section-2.png','Imagen decorativa',NULL,697,697,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_homepage_section_2_f66f8ebcf6.png\", \"hash\": \"small_homepage_section_2_f66f8ebcf6\", \"mime\": \"image/png\", \"name\": \"small_homepage-section-2.png\", \"path\": null, \"size\": 152.8, \"width\": 500, \"height\": 500}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_homepage_section_2_f66f8ebcf6.png\", \"hash\": \"thumbnail_homepage_section_2_f66f8ebcf6\", \"mime\": \"image/png\", \"name\": \"thumbnail_homepage-section-2.png\", \"path\": null, \"size\": 30.44, \"width\": 156, \"height\": 156}}','homepage_section_2_f66f8ebcf6','.png','image/png',35.66,'/uploads/homepage_section_2_f66f8ebcf6.png',NULL,'local',NULL,'/','2023-05-14 15:49:03.851000','2023-05-14 21:26:13.823000',NULL,1),(19,'service-6.png','Icono decorativo','',55,55,NULL,'service_6_390c5d3931','.png','image/png',0.39,'/uploads/service_6_390c5d3931.png',NULL,'local',NULL,'/','2023-05-14 15:57:24.943000','2023-05-14 16:34:54.039000',NULL,NULL),(20,'service-5.png','Icono decorativo',NULL,55,55,NULL,'service_5_1d36f3911f','.png','image/png',0.34,'/uploads/service_5_1d36f3911f.png',NULL,'local',NULL,'/','2023-05-14 15:57:24.988000','2023-05-14 16:34:50.916000',NULL,NULL),(21,'service-4.png','Icono decorativo',NULL,55,55,NULL,'service_4_b6dcd1589e','.png','image/png',0.32,'/uploads/service_4_b6dcd1589e.png',NULL,'local',NULL,'/','2023-05-14 15:57:25.043000','2023-05-16 21:41:30.406000',NULL,1),(22,'service-3.png','Icono decorativo',NULL,55,55,NULL,'service_3_5bea4d36fa','.png','image/png',0.29,'/uploads/service_3_5bea4d36fa.png',NULL,'local',NULL,'/','2023-05-14 15:57:25.080000','2023-05-14 16:34:45.303000',NULL,NULL),(24,'service-2.png','Icono decorativo',NULL,55,55,NULL,'service_2_bc80a6c0c8','.png','image/png',0.30,'/uploads/service_2_bc80a6c0c8.png',NULL,'local',NULL,'/','2023-05-14 15:57:25.193000','2023-05-14 16:34:39.258000',NULL,NULL),(25,'favicon.ico',NULL,NULL,NULL,NULL,NULL,'favicon_431e6da740','.ico','image/x-icon',4.29,'/uploads/favicon_431e6da740.ico',NULL,'local',NULL,'/','2023-05-14 20:53:29.657000','2023-05-17 00:37:52.526000',1,1),(26,'logo.png','logo de la Junta Regional de calificación de invalidez de Caldas ',NULL,4096,1889,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_logo_969d2bcd24.png\", \"hash\": \"large_logo_969d2bcd24\", \"mime\": \"image/png\", \"name\": \"large_logo.png\", \"path\": null, \"size\": 109.18, \"width\": 1000, \"height\": 461}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_logo_969d2bcd24.png\", \"hash\": \"small_logo_969d2bcd24\", \"mime\": \"image/png\", \"name\": \"small_logo.png\", \"path\": null, \"size\": 42.46, \"width\": 500, \"height\": 231}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_logo_969d2bcd24.png\", \"hash\": \"medium_logo_969d2bcd24\", \"mime\": \"image/png\", \"name\": \"medium_logo.png\", \"path\": null, \"size\": 73.02, \"width\": 750, \"height\": 346}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_logo_969d2bcd24.png\", \"hash\": \"thumbnail_logo_969d2bcd24\", \"mime\": \"image/png\", \"name\": \"thumbnail_logo.png\", \"path\": null, \"size\": 16.61, \"width\": 245, \"height\": 113}}','logo_969d2bcd24','.png','image/png',128.78,'/uploads/logo_969d2bcd24.png',NULL,'local',NULL,'/','2023-05-14 21:04:20.993000','2023-05-30 21:05:37.327000',1,1),(27,'supersalud.png','Logo de Superintencia Nacional de Salud',NULL,360,123,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_supersalud_6607a64225.png\", \"hash\": \"thumbnail_supersalud_6607a64225\", \"mime\": \"image/png\", \"name\": \"thumbnail_supersalud.png\", \"path\": null, \"size\": 24.06, \"width\": 245, \"height\": 84}}','supersalud_6607a64225','.png','image/png',15.67,'/uploads/supersalud_6607a64225.png',NULL,'local',NULL,'/','2023-05-14 21:17:56.990000','2023-05-14 21:17:56.990000',1,1),(28,'minsalud.png','Logo del Ministerio de salud y protección social',NULL,410,113,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_minsalud_f713def5e6.png\", \"hash\": \"thumbnail_minsalud_f713def5e6\", \"mime\": \"image/png\", \"name\": \"thumbnail_minsalud.png\", \"path\": null, \"size\": 10.52, \"width\": 245, \"height\": 68}}','minsalud_f713def5e6','.png','image/png',7.55,'/uploads/minsalud_f713def5e6.png',NULL,'local',NULL,'/','2023-05-14 21:17:56.995000','2023-05-14 21:17:56.995000',1,1),(29,'mintrabajo.png','Logo del Ministerio del Trabajo',NULL,395,113,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_mintrabajo_ed9efad0c4.png\", \"hash\": \"thumbnail_mintrabajo_ed9efad0c4\", \"mime\": \"image/png\", \"name\": \"thumbnail_mintrabajo.png\", \"path\": null, \"size\": 12.72, \"width\": 245, \"height\": 70}}','mintrabajo_ed9efad0c4','.png','image/png',8.36,'/uploads/mintrabajo_ed9efad0c4.png',NULL,'local',NULL,'/','2023-05-14 21:17:56.995000','2023-05-14 21:17:56.995000',1,1),(30,'service-1.png',NULL,NULL,55,55,NULL,'service_1_bd947f0797','.png','image/png',0.47,'/uploads/service_1_bd947f0797.png',NULL,'local',NULL,'/','2023-05-16 21:42:09.179000','2023-05-16 21:42:09.179000',1,1),(31,'normatividad-banner.png',NULL,NULL,443,443,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_normatividad_banner_657f1087d9.png\", \"hash\": \"thumbnail_normatividad_banner_657f1087d9\", \"mime\": \"image/png\", \"name\": \"thumbnail_normatividad-banner.png\", \"path\": null, \"size\": 26.82, \"width\": 156, \"height\": 156}}','normatividad_banner_657f1087d9','.png','image/png',19.32,'/uploads/normatividad_banner_657f1087d9.png',NULL,'local',NULL,'/','2023-05-30 23:02:40.887000','2023-06-01 01:00:11.745000',1,1),(32,'servicios-banner.png',NULL,NULL,443,443,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_servicios_banner_ace7c3b65b.png\", \"hash\": \"thumbnail_servicios_banner_ace7c3b65b\", \"mime\": \"image/png\", \"name\": \"thumbnail_servicios-banner.png\", \"path\": null, \"size\": 29.65, \"width\": 156, \"height\": 156}}','servicios_banner_ace7c3b65b','.png','image/png',20.09,'/uploads/servicios_banner_ace7c3b65b.png',NULL,'local',NULL,'/','2023-05-30 23:02:40.891000','2023-05-30 23:02:40.891000',1,1),(33,'atencion-usuario-banner.png',NULL,NULL,443,443,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_atencion_usuario_banner_b9c7a17cb7.png\", \"hash\": \"thumbnail_atencion_usuario_banner_b9c7a17cb7\", \"mime\": \"image/png\", \"name\": \"thumbnail_atencion-usuario-banner.png\", \"path\": null, \"size\": 28.37, \"width\": 156, \"height\": 156}}','atencion_usuario_banner_b9c7a17cb7','.png','image/png',20.93,'/uploads/atencion_usuario_banner_b9c7a17cb7.png',NULL,'local',NULL,'/','2023-05-30 23:02:40.892000','2023-05-30 23:02:40.892000',1,1),(34,'quienes-somos-banner.png',NULL,NULL,1512,502,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_quienes_somos_banner_913184aa6f.png\", \"hash\": \"large_quienes_somos_banner_913184aa6f\", \"mime\": \"image/png\", \"name\": \"large_quienes-somos-banner.png\", \"path\": null, \"size\": 922.12, \"width\": 1000, \"height\": 332}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_quienes_somos_banner_913184aa6f.png\", \"hash\": \"small_quienes_somos_banner_913184aa6f\", \"mime\": \"image/png\", \"name\": \"small_quienes-somos-banner.png\", \"path\": null, \"size\": 234.86, \"width\": 500, \"height\": 166}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_quienes_somos_banner_913184aa6f.png\", \"hash\": \"medium_quienes_somos_banner_913184aa6f\", \"mime\": \"image/png\", \"name\": \"medium_quienes-somos-banner.png\", \"path\": null, \"size\": 522.47, \"width\": 750, \"height\": 249}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_quienes_somos_banner_913184aa6f.png\", \"hash\": \"thumbnail_quienes_somos_banner_913184aa6f\", \"mime\": \"image/png\", \"name\": \"thumbnail_quienes-somos-banner.png\", \"path\": null, \"size\": 57.39, \"width\": 245, \"height\": 81}}','quienes_somos_banner_913184aa6f','.png','image/png',550.78,'/uploads/quienes_somos_banner_913184aa6f.png',NULL,'local',NULL,'/','2023-05-30 23:07:11.819000','2023-05-30 23:07:11.819000',1,1),(35,'dummy.pdf',NULL,NULL,NULL,NULL,NULL,'dummy_f2761b9506','.pdf','application/pdf',13.26,'/uploads/dummy_f2761b9506.pdf',NULL,'local',NULL,'/','2023-06-12 10:09:39.346000','2023-06-12 10:09:39.346000',1,1),(36,'Comunicado oficial cambio de correos electrònicos.pdf',NULL,NULL,NULL,NULL,NULL,'Comunicado_oficial_cambio_de_correos_electronicos_f53ee1fbf3','.pdf','application/pdf',280.22,'/uploads/Comunicado_oficial_cambio_de_correos_electronicos_f53ee1fbf3.pdf',NULL,'local',NULL,'/','2023-06-15 00:34:15.970000','2023-06-15 01:31:34.263000',1,1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_folder_links`
--

DROP TABLE IF EXISTS `files_folder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_folder_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `folder_id` int unsigned DEFAULT NULL,
  `file_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  KEY `files_folder_links_fk` (`file_id`),
  KEY `files_folder_links_inv_fk` (`folder_id`),
  KEY `files_folder_links_order_inv_fk` (`file_order`),
  CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_folder_links`
--

LOCK TABLES `files_folder_links` WRITE;
/*!40000 ALTER TABLE `files_folder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_folder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_morphs`
--

DROP TABLE IF EXISTS `files_related_morphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_related_morphs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `related_id` int unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_morphs_fk` (`file_id`),
  KEY `files_related_morphs_order_index` (`order`),
  KEY `files_related_morphs_id_column_index` (`related_id`),
  CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_morphs`
--

LOCK TABLES `files_related_morphs` WRITE;
/*!40000 ALTER TABLE `files_related_morphs` DISABLE KEYS */;
INSERT INTO `files_related_morphs` VALUES (42,25,1,'api::global.global','favicon',1),(46,28,2,'shared.media','file',1),(47,29,3,'shared.media','file',1),(48,27,4,'shared.media','file',1),(50,24,6,'shared.media','file',1),(51,22,7,'shared.media','file',1),(52,21,8,'shared.media','file',1),(53,20,9,'shared.media','file',1),(54,19,10,'shared.media','file',1),(57,17,11,'shared.media','file',1),(58,18,12,'shared.media','file',1),(59,26,1,'shared.media','file',1),(72,26,13,'shared.media','file',1),(79,25,1,'api::global.global','favicon',1),(114,25,1,'api::site.site','favicon',1),(137,26,1,'api::entity.entity','logo',1),(147,29,14,'shared.media','file',1),(148,28,15,'shared.media','file',1),(149,27,16,'shared.media','file',1),(151,17,1,'section.image','media',1),(155,33,24,'shared.media','file',1),(166,36,2,'shared.document','media',1),(173,36,3,'shared.document','media',1),(174,32,19,'shared.media','file',1),(175,34,20,'shared.media','file',1),(176,35,1,'shared.document','media',1),(177,31,23,'shared.media','file',1),(178,17,17,'shared.media','file',1),(179,18,18,'shared.media','file',1),(182,21,3,'api::service.service','logo',1),(183,30,1,'api::service.service','logo',1),(184,20,2,'api::service.service','logo',1);
/*!40000 ALTER TABLE `files_related_morphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footers`
--

DROP TABLE IF EXISTS `footers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `disclaimer` longtext,
  PRIMARY KEY (`id`),
  KEY `footers_created_by_id_fk` (`created_by_id`),
  KEY `footers_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `footers_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `footers_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footers`
--

LOCK TABLES `footers` WRITE;
/*!40000 ALTER TABLE `footers` DISABLE KEYS */;
INSERT INTO `footers` VALUES (1,'2023-05-16 21:44:15.212000','2023-06-11 17:45:55.656000','2023-05-16 21:44:25.230000',1,1,'Para requerimientos, solicitudes, tramites, tutelas, derechos de petición y documentos anexos el correo es: [{{entity.emails.1.email}}](mailto:{{entity.emails.1.email}}).\n\nCanal exclusivo para la recepción de demandas el correo es: {{entity.emails.2.email}}.\n\nHorario de atención al público: {{entity.workSchedule}}\n');
/*!40000 ALTER TABLE `footers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footers_components`
--

DROP TABLE IF EXISTS `footers_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footers_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `footers_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `footers_field_index` (`field`),
  KEY `footers_component_type_index` (`component_type`),
  KEY `footers_entity_fk` (`entity_id`),
  CONSTRAINT `footers_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `footers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footers_components`
--

LOCK TABLES `footers_components` WRITE;
/*!40000 ALTER TABLE `footers_components` DISABLE KEYS */;
INSERT INTO `footers_components` VALUES (1,1,14,'shared.media','authorities',1),(2,1,15,'shared.media','authorities',2),(3,1,16,'shared.media','authorities',3);
/*!40000 ALTER TABLE `footers_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `headers`
--

DROP TABLE IF EXISTS `headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `headers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `headers_created_by_id_fk` (`created_by_id`),
  KEY `headers_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `headers_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `headers_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headers`
--

LOCK TABLES `headers` WRITE;
/*!40000 ALTER TABLE `headers` DISABLE KEYS */;
INSERT INTO `headers` VALUES (1,'2023-05-16 21:51:45.839000','2023-06-11 21:55:55.173000','2023-05-16 21:53:43.803000',1,1);
/*!40000 ALTER TABLE `headers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `headers_components`
--

DROP TABLE IF EXISTS `headers_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `headers_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `headers_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `headers_field_index` (`field`),
  KEY `headers_component_type_index` (`component_type`),
  KEY `headers_entity_fk` (`entity_id`),
  CONSTRAINT `headers_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `headers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headers_components`
--

LOCK TABLES `headers_components` WRITE;
/*!40000 ALTER TABLE `headers_components` DISABLE KEYS */;
INSERT INTO `headers_components` VALUES (1,1,8,'template.list','menu',1);
/*!40000 ALTER TABLE `headers_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homes`
--

DROP TABLE IF EXISTS `homes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `homes_created_by_id_fk` (`created_by_id`),
  KEY `homes_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `homes_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `homes_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homes`
--

LOCK TABLES `homes` WRITE;
/*!40000 ALTER TABLE `homes` DISABLE KEYS */;
INSERT INTO `homes` VALUES (1,'2023-05-16 21:57:00.528000','2023-06-15 22:50:44.502000','2023-05-16 22:45:45.866000',1,1);
/*!40000 ALTER TABLE `homes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homes_components`
--

DROP TABLE IF EXISTS `homes_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homes_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `homes_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `homes_field_index` (`field`),
  KEY `homes_component_type_index` (`component_type`),
  KEY `homes_entity_fk` (`entity_id`),
  CONSTRAINT `homes_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `homes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homes_components`
--

LOCK TABLES `homes_components` WRITE;
/*!40000 ALTER TABLE `homes_components` DISABLE KEYS */;
INSERT INTO `homes_components` VALUES (1,1,5,'template.section','sections',1),(2,1,6,'template.section','sections',2),(3,1,7,'template.section','sections',3),(4,1,8,'template.section','sections',4);
/*!40000 ALTER TABLE `homes_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i18n_locale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES (2,'English (en)','en','2023-05-05 00:46:02.610000','2023-05-05 00:46:02.610000',NULL,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normatividad_pages`
--

DROP TABLE IF EXISTS `normatividad_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normatividad_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `normatividad_pages_created_by_id_fk` (`created_by_id`),
  KEY `normatividad_pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `normatividad_pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `normatividad_pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normatividad_pages`
--

LOCK TABLES `normatividad_pages` WRITE;
/*!40000 ALTER TABLE `normatividad_pages` DISABLE KEYS */;
INSERT INTO `normatividad_pages` VALUES (1,'2023-05-30 23:11:27.696000','2023-06-15 22:50:18.830000','2023-05-31 20:38:45.909000',1,1);
/*!40000 ALTER TABLE `normatividad_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normatividad_pages_components`
--

DROP TABLE IF EXISTS `normatividad_pages_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normatividad_pages_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `normatividad_pages_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `normatividad_pages_field_index` (`field`),
  KEY `normatividad_pages_component_type_index` (`component_type`),
  KEY `normatividad_pages_entity_fk` (`entity_id`),
  CONSTRAINT `normatividad_pages_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `normatividad_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normatividad_pages_components`
--

LOCK TABLES `normatividad_pages_components` WRITE;
/*!40000 ALTER TABLE `normatividad_pages_components` DISABLE KEYS */;
INSERT INTO `normatividad_pages_components` VALUES (1,1,3,'template.banner','banner',1),(2,1,11,'template.section','description',2);
/*!40000 ALTER TABLE `normatividad_pages_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normativities`
--

DROP TABLE IF EXISTS `normativities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normativities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `abstract` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `pdf_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `normativities_created_by_id_fk` (`created_by_id`),
  KEY `normativities_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `normativities_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `normativities_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normativities`
--

LOCK TABLES `normativities` WRITE;
/*!40000 ALTER TABLE `normativities` DISABLE KEYS */;
INSERT INTO `normativities` VALUES (1,'Decreto 1477 de 2014','Por el cual se expide la Tabla de Enfermedades Laborales.','2023-06-12 15:57:28.625000','2023-06-12 17:32:44.746000','2023-06-12 15:57:31.401000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=58849','https://www.mintrabajo.gov.co/documents/20147/36482/decreto_1477_del_5_de_agosto_de_2014.pdf/b526be63-28ee-8a0d-9014-8b5d7b299500'),(2,'Decreto 1507 de 2014','Por el cual se expide el Manual Único para la Calificación de la Pérdida de la Capacidad Laboral y Ocupacional.','2023-06-12 15:58:36.389000','2023-06-12 17:33:14.819000','2023-06-12 15:58:37.990000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=58941','https://www.minsalud.gov.co/sites/rid/Lists/BibliotecaDigital/RIDE/DE/DIJ/Decreto-1507-DE-2014.pdf'),(3,'Decreto 1072 de 2015 Sector Trabajo','Por medio del cual se expide el Decreto Único Reglamentario del Sector Trabajo','2023-06-12 16:01:06.947000','2023-06-12 17:30:22.266000','2023-06-12 16:01:08.065000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=72173','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=72173'),(4,'Decreto 1352 de 2013','Por el cual se reglamenta la organización y funcionamiento de las Juntas de Calificación de Invalidez, y se dictan otras disposiciones.','2023-06-12 16:04:44.130000','2023-06-12 17:30:51.773000','2023-06-12 16:04:45.835000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=68355','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=68355'),(5,'Ley 1562 de 2012','Por la cual se modifica el Sistema de Riesgos Laborales y se dictan otras disposiciones en materia de Salud Ocupacional.','2023-06-12 16:08:54.437000','2023-06-12 16:15:45.381000','2023-06-12 16:08:55.140000',1,1,'http://www.secretariasenado.gov.co/senado/basedoc/ley_1562_2012.html','https://www.minsalud.gov.co/sites/rid/Lists/BibliotecaDigital/RIDE/DE/DIJ/Ley-1562-de-2012.pdf'),(6,'Decreto 019 de 2012','Por el cual se dictan normas para suprimir o reformar regulaciones, procedimientos y trámites innecesarios existentes en la Administración Pública.','2023-06-12 16:10:27.782000','2023-06-12 16:15:23.970000','2023-06-12 16:10:28.857000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=45322','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=45322'),(7,'Decreto 2566 de 2009','Por el cual se adopta la Tabla de Enfermedades Profesionales.','2023-06-12 16:11:27.810000','2023-06-12 16:15:35.328000','2023-06-12 16:11:28.692000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=36783','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=36783'),(8,'Decreto 917 de 1999','Por el cual se modifica el Decreto 692 de 1995.','2023-06-12 16:12:36.158000','2023-06-12 17:33:45.223000','2023-06-12 16:12:36.835000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=29544','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=29544'),(9,'Decreto 1295 de 1994','Por el cual se determina la organización y administración del Sistema General de Riesgos Profesionales.','2023-06-12 16:13:53.708000','2023-06-12 16:13:54.847000','2023-06-12 16:13:54.844000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=2629','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=2629'),(10,'Ley 100 de 1993','Por la cual se crea el sistema de seguridad social integral y se dictan otras disposiciones.','2023-06-12 16:14:56.971000','2023-06-12 16:14:58.177000','2023-06-12 16:14:58.174000',1,1,'https://www.funcionpublica.gov.co/eva/gestornormativo/norma.php?i=5248','https://www.funcionpublica.gov.co/eva/gestornormativo/norma_pdf.php?i=5248');
/*!40000 ALTER TABLE `normativities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quienes_somos_1`
--

DROP TABLE IF EXISTS `quienes_somos_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quienes_somos_1` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quienes_somos_1_created_by_id_fk` (`created_by_id`),
  KEY `quienes_somos_1_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `quienes_somos_1_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `quienes_somos_1_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quienes_somos_1`
--

LOCK TABLES `quienes_somos_1` WRITE;
/*!40000 ALTER TABLE `quienes_somos_1` DISABLE KEYS */;
INSERT INTO `quienes_somos_1` VALUES (1,'2023-05-30 23:08:25.754000','2023-06-15 22:50:11.088000','2023-05-31 20:37:33.354000',1,1);
/*!40000 ALTER TABLE `quienes_somos_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quienes_somos_1_components`
--

DROP TABLE IF EXISTS `quienes_somos_1_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quienes_somos_1_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quienes_somos_1_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `quienes_somos_1_field_index` (`field`),
  KEY `quienes_somos_1_component_type_index` (`component_type`),
  KEY `quienes_somos_1_entity_fk` (`entity_id`),
  CONSTRAINT `quienes_somos_1_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `quienes_somos_1` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quienes_somos_1_components`
--

LOCK TABLES `quienes_somos_1_components` WRITE;
/*!40000 ALTER TABLE `quienes_somos_1_components` DISABLE KEYS */;
INSERT INTO `quienes_somos_1_components` VALUES (1,1,2,'template.banner','banner',NULL),(2,1,10,'template.section','description',NULL);
/*!40000 ALTER TABLE `quienes_somos_1_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `payment` longtext,
  `disclaimer` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_created_by_id_fk` (`created_by_id`),
  KEY `services_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `services_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `services_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Calificación Particular','LA CONSIGNACIÓN SE DEBE REALIZAR CON EL NÚMERO DE LA CÉDULA DEL PACIENTE.\nCuenta {{entity.accounts.1.type}} / {{entity.accounts.1.bank}}, N° {{entity.accounts.1.number}} / Convenio {{entity.accounts.1.convenio}} / Referencia (Cédula del paciente)',NULL,'2023-05-16 21:19:22.214000','2023-06-15 23:51:45.243000','2023-05-16 21:31:36.557000',1,1),(2,'Calificación Víctimas','LA CONSIGNACIÓN SE DEBE REALIZAR CON EL NÚMERO DE LA CÉDULA DEL PACIENTE.\nCuenta {{entity.accounts.1.type}} / {{entity.accounts.1.bank}}, N° {{entity.accounts.1.number}} / Convenio {{entity.accounts.1.convenio}} / Referencia (Cédula del paciente)',NULL,'2023-05-16 21:34:15.003000','2023-06-15 23:52:12.295000','2023-05-16 21:34:29.020000',1,1),(3,'Calificación Judicial','LA CONSIGNACIÓN SE DEBE REALIZAR CON EL NÚMERO DE LA CÉDULA DEL PACIENTE.\nCuenta {{entity.accounts.1.type}} / {{entity.accounts.1.bank}}, N° {{entity.accounts.1.number}} / Convenio {{entity.accounts.1.convenio}} / Referencia (Cédula del paciente)\n',NULL,'2023-05-16 21:37:09.426000','2023-06-15 23:50:07.956000','2023-05-16 22:46:01.397000',1,1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_account_links`
--

DROP TABLE IF EXISTS `services_account_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_account_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned DEFAULT NULL,
  `account_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_account_links_unique` (`service_id`,`account_id`),
  KEY `services_account_links_fk` (`service_id`),
  KEY `services_account_links_inv_fk` (`account_id`),
  CONSTRAINT `services_account_links_fk` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `services_account_links_inv_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_account_links`
--

LOCK TABLES `services_account_links` WRITE;
/*!40000 ALTER TABLE `services_account_links` DISABLE KEYS */;
INSERT INTO `services_account_links` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `services_account_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_components`
--

DROP TABLE IF EXISTS `services_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `services_field_index` (`field`),
  KEY `services_component_type_index` (`component_type`),
  KEY `services_entity_fk` (`entity_id`),
  CONSTRAINT `services_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_components`
--

LOCK TABLES `services_components` WRITE;
/*!40000 ALTER TABLE `services_components` DISABLE KEYS */;
INSERT INTO `services_components` VALUES (1,1,2,'template.list','appliesTo',NULL),(3,1,3,'template.list','steps',NULL),(8,2,4,'template.list','appliesTo',NULL),(9,2,5,'template.list','steps',NULL),(14,3,6,'template.list','appliesTo',NULL),(15,3,7,'template.list','steps',NULL);
/*!40000 ALTER TABLE `services_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_pages`
--

DROP TABLE IF EXISTS `servicios_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicios_pages_created_by_id_fk` (`created_by_id`),
  KEY `servicios_pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `servicios_pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `servicios_pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_pages`
--

LOCK TABLES `servicios_pages` WRITE;
/*!40000 ALTER TABLE `servicios_pages` DISABLE KEYS */;
INSERT INTO `servicios_pages` VALUES (1,'2023-05-30 23:04:59.087000','2023-06-15 22:50:01.534000','2023-05-31 20:38:52.087000',1,1);
/*!40000 ALTER TABLE `servicios_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_pages_components`
--

DROP TABLE IF EXISTS `servicios_pages_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_pages_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servicios_pages_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `servicios_pages_field_index` (`field`),
  KEY `servicios_pages_component_type_index` (`component_type`),
  KEY `servicios_pages_entity_fk` (`entity_id`),
  CONSTRAINT `servicios_pages_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `servicios_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_pages_components`
--

LOCK TABLES `servicios_pages_components` WRITE;
/*!40000 ALTER TABLE `servicios_pages_components` DISABLE KEYS */;
INSERT INTO `servicios_pages_components` VALUES (1,1,9,'template.section','description',NULL),(2,1,1,'template.banner','banner',NULL);
/*!40000 ALTER TABLE `servicios_pages_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sites_created_by_id_fk` (`created_by_id`),
  KEY `sites_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `sites_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sites_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'Junta Regional de calificación de invalidez de Caldas ','La Junta Regional de Calificación de Invalidez de Caldas es una entidad que evalúa y califica las discapacidades y condiciones de salud en la región. Nuestro objetivo es determinar el grado de invalidez y brindar apoyo a las personas para acceder a sus derechos y beneficios. ','2023-05-17 00:38:31.673000','2023-05-31 20:39:41.771000','2023-05-17 00:40:26.233000',1,1);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites_components`
--

DROP TABLE IF EXISTS `sites_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites_components` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `component_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sites_unique` (`entity_id`,`component_id`,`field`,`component_type`),
  KEY `sites_field_index` (`field`),
  KEY `sites_component_type_index` (`component_type`),
  KEY `sites_entity_fk` (`entity_id`),
  CONSTRAINT `sites_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites_components`
--

LOCK TABLES `sites_components` WRITE;
/*!40000 ALTER TABLE `sites_components` DISABLE KEYS */;
INSERT INTO `sites_components` VALUES (1,1,3,'shared.seo','defaultSeo',NULL);
/*!40000 ALTER TABLE `sites_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions`
--

LOCK TABLES `strapi_api_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int unsigned DEFAULT NULL,
  `api_token_id` int unsigned DEFAULT NULL,
  `api_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`),
  CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions_token_links`
--

LOCK TABLES `strapi_api_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES (1,'Webpage','Página web','read-only','540e1bd8cfeecb3220d470f51a81dd506e46674245b8bf6cfa8d2b32915d773f226456770d54e3c8655dbed39b82d9b8ecfcd76dcdf023a0fa29c91b4e96505f','2023-06-20 00:49:34.004000',NULL,NULL,'2023-05-14 17:23:10.449000','2023-06-20 00:49:34.004000',NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES (138,'strapi_content_types_schema','{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token\",\"connection\":\"default\",\"uid\":\"admin::transfer-token\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token-permission\",\"connection\":\"default\",\"uid\":\"admin::transfer-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"api::about.about\":{\"kind\":\"singleType\",\"collectionName\":\"abouts\",\"info\":{\"singularName\":\"about\",\"pluralName\":\"abouts\",\"displayName\":\"About\",\"description\":\"Write about yourself and the content you create\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"shared.media\",\"shared.quote\",\"shared.rich-text\",\"shared.slider\"]},\"contentTitle\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"workSchedule\":{\"type\":\"richtext\"},\"location\":{\"type\":\"richtext\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"abouts\",\"info\":{\"singularName\":\"about\",\"pluralName\":\"abouts\",\"displayName\":\"About\",\"description\":\"Write about yourself and the content you create\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"shared.media\",\"shared.quote\",\"shared.rich-text\",\"shared.slider\"]},\"contentTitle\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"workSchedule\":{\"type\":\"richtext\"},\"location\":{\"type\":\"richtext\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"about\",\"connection\":\"default\",\"uid\":\"api::about.about\",\"apiName\":\"about\",\"globalId\":\"About\",\"actions\":{},\"lifecycles\":{}},\"api::account.account\":{\"kind\":\"collectionType\",\"collectionName\":\"accounts\",\"info\":{\"singularName\":\"account\",\"pluralName\":\"accounts\",\"displayName\":\"Account\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"description\":{\"type\":\"text\",\"required\":true},\"bank\":{\"type\":\"enumeration\",\"enum\":[\"Bancolombia\"]},\"type\":{\"type\":\"enumeration\",\"enum\":[\"Ahorros\",\"Corriente\"],\"required\":true},\"number\":{\"type\":\"biginteger\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"accounts\",\"info\":{\"singularName\":\"account\",\"pluralName\":\"accounts\",\"displayName\":\"Account\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"description\":{\"type\":\"text\",\"required\":true},\"bank\":{\"type\":\"enumeration\",\"enum\":[\"Bancolombia\"]},\"type\":{\"type\":\"enumeration\",\"enum\":[\"Ahorros\",\"Corriente\"],\"required\":true},\"number\":{\"type\":\"biginteger\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"account\",\"connection\":\"default\",\"uid\":\"api::account.account\",\"apiName\":\"account\",\"globalId\":\"Account\",\"actions\":{},\"lifecycles\":{}},\"api::articulo.articulo\":{\"kind\":\"collectionType\",\"collectionName\":\"articulos\",\"info\":{\"singularName\":\"articulo\",\"pluralName\":\"articulos\",\"displayName\":\"Articulo\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"title\"},\"cover\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"author\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::author.author\",\"inversedBy\":\"articulos\"},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::category.category\",\"inversedBy\":\"articulos\"},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"shared.media\",\"shared.document\",\"shared.rich-text\",\"shared.slider\",\"shared.quote\"],\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"articulos\",\"info\":{\"singularName\":\"articulo\",\"pluralName\":\"articulos\",\"displayName\":\"Articulo\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\",\"targetField\":\"title\"},\"cover\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"author\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::author.author\",\"inversedBy\":\"articulos\"},\"category\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::category.category\",\"inversedBy\":\"articulos\"},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"shared.media\",\"shared.document\",\"shared.rich-text\",\"shared.slider\",\"shared.quote\"],\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"articulo\",\"connection\":\"default\",\"uid\":\"api::articulo.articulo\",\"apiName\":\"articulo\",\"globalId\":\"Articulo\",\"actions\":{},\"lifecycles\":{}},\"api::atencion-usuario.atencion-usuario\":{\"kind\":\"singleType\",\"collectionName\":\"atencion_usuarios\",\"info\":{\"singularName\":\"atencion-usuario\",\"pluralName\":\"atencion-usuarios\",\"displayName\":\"AtencionUsuarioPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"title\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"schedule_title\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"scheduleDescription\":{\"type\":\"richtext\",\"required\":true},\"locationTitle\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\",\"required\":true},\"locationDescription\":{\"type\":\"richtext\",\"required\":true},\"phoneTitle\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"atencion_usuarios\",\"info\":{\"singularName\":\"atencion-usuario\",\"pluralName\":\"atencion-usuarios\",\"displayName\":\"AtencionUsuarioPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"title\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"schedule_title\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"},\"scheduleDescription\":{\"type\":\"richtext\",\"required\":true},\"locationTitle\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\",\"required\":true},\"locationDescription\":{\"type\":\"richtext\",\"required\":true},\"phoneTitle\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"section.heading\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"atencion-usuario\",\"connection\":\"default\",\"uid\":\"api::atencion-usuario.atencion-usuario\",\"apiName\":\"atencion-usuario\",\"globalId\":\"AtencionUsuario\",\"actions\":{},\"lifecycles\":{}},\"api::author.author\":{\"kind\":\"collectionType\",\"collectionName\":\"authors\",\"info\":{\"singularName\":\"author\",\"pluralName\":\"authors\",\"displayName\":\"Author\",\"description\":\"Create authors for your content\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"avatar\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\"]},\"email\":{\"type\":\"string\"},\"articulos\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::articulo.articulo\",\"mappedBy\":\"author\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"authors\",\"info\":{\"singularName\":\"author\",\"pluralName\":\"authors\",\"displayName\":\"Author\",\"description\":\"Create authors for your content\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"avatar\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\"]},\"email\":{\"type\":\"string\"},\"articulos\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::articulo.articulo\",\"mappedBy\":\"author\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"author\",\"connection\":\"default\",\"uid\":\"api::author.author\",\"apiName\":\"author\",\"globalId\":\"Author\",\"actions\":{},\"lifecycles\":{}},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\",\"description\":\"Organize your content into categories\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\"},\"description\":{\"type\":\"text\"},\"articulos\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::articulo.articulo\",\"mappedBy\":\"category\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\",\"description\":\"Organize your content into categories\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\"},\"description\":{\"type\":\"text\"},\"articulos\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::articulo.articulo\",\"mappedBy\":\"category\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"category\",\"connection\":\"default\",\"uid\":\"api::category.category\",\"apiName\":\"category\",\"globalId\":\"Category\",\"actions\":{},\"lifecycles\":{}},\"api::entity.entity\":{\"kind\":\"singleType\",\"collectionName\":\"entities\",\"info\":{\"singularName\":\"entity\",\"pluralName\":\"entities\",\"displayName\":\"Entity\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"address\":{\"type\":\"text\",\"required\":true},\"workSchedule\":{\"type\":\"richtext\",\"required\":true},\"NIT\":{\"type\":\"string\",\"required\":true},\"accounts\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::account.account\"},\"emails\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"shared.email\"},\"phones\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"shared.phone\"},\"fee\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"shared.fee\"},\"logo\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"entities\",\"info\":{\"singularName\":\"entity\",\"pluralName\":\"entities\",\"displayName\":\"Entity\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"address\":{\"type\":\"text\",\"required\":true},\"workSchedule\":{\"type\":\"richtext\",\"required\":true},\"NIT\":{\"type\":\"string\",\"required\":true},\"accounts\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::account.account\"},\"emails\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"shared.email\"},\"phones\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"shared.phone\"},\"fee\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"shared.fee\"},\"logo\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false,\"required\":true}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"entity\",\"connection\":\"default\",\"uid\":\"api::entity.entity\",\"apiName\":\"entity\",\"globalId\":\"Entity\",\"actions\":{},\"lifecycles\":{}},\"api::footer.footer\":{\"kind\":\"singleType\",\"collectionName\":\"footers\",\"info\":{\"singularName\":\"footer\",\"pluralName\":\"footers\",\"displayName\":\"Footer\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"disclaimer\":{\"type\":\"richtext\"},\"authorities\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"shared.media\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"footers\",\"info\":{\"singularName\":\"footer\",\"pluralName\":\"footers\",\"displayName\":\"Footer\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"disclaimer\":{\"type\":\"richtext\"},\"authorities\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"shared.media\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"footer\",\"connection\":\"default\",\"uid\":\"api::footer.footer\",\"apiName\":\"footer\",\"globalId\":\"Footer\",\"actions\":{},\"lifecycles\":{}},\"api::header.header\":{\"kind\":\"singleType\",\"collectionName\":\"headers\",\"info\":{\"singularName\":\"header\",\"pluralName\":\"headers\",\"displayName\":\"Header\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"menu\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.list\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"headers\",\"info\":{\"singularName\":\"header\",\"pluralName\":\"headers\",\"displayName\":\"Header\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"menu\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.list\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"header\",\"connection\":\"default\",\"uid\":\"api::header.header\",\"apiName\":\"header\",\"globalId\":\"Header\",\"actions\":{},\"lifecycles\":{}},\"api::home.home\":{\"kind\":\"singleType\",\"collectionName\":\"homes\",\"info\":{\"singularName\":\"home\",\"pluralName\":\"homes\",\"displayName\":\"Home\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"sections\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"template.section\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"homes\",\"info\":{\"singularName\":\"home\",\"pluralName\":\"homes\",\"displayName\":\"Home\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"sections\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"template.section\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"home\",\"connection\":\"default\",\"uid\":\"api::home.home\",\"apiName\":\"home\",\"globalId\":\"Home\",\"actions\":{},\"lifecycles\":{}},\"api::normatividad-page.normatividad-page\":{\"kind\":\"singleType\",\"collectionName\":\"normatividad_pages\",\"info\":{\"singularName\":\"normatividad-page\",\"pluralName\":\"normatividad-pages\",\"displayName\":\"NormatividadPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"description\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.section\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"normatividad_pages\",\"info\":{\"singularName\":\"normatividad-page\",\"pluralName\":\"normatividad-pages\",\"displayName\":\"NormatividadPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"description\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.section\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"normatividad-page\",\"connection\":\"default\",\"uid\":\"api::normatividad-page.normatividad-page\",\"apiName\":\"normatividad-page\",\"globalId\":\"NormatividadPage\",\"actions\":{},\"lifecycles\":{}},\"api::normativity.normativity\":{\"kind\":\"collectionType\",\"collectionName\":\"normativities\",\"info\":{\"singularName\":\"normativity\",\"pluralName\":\"normativities\",\"displayName\":\"Normativity\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"abstract\":{\"type\":\"richtext\",\"required\":true},\"pageUrl\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"pdfUrl\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"normativities\",\"info\":{\"singularName\":\"normativity\",\"pluralName\":\"normativities\",\"displayName\":\"Normativity\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"abstract\":{\"type\":\"richtext\",\"required\":true},\"pageUrl\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"pdfUrl\":{\"type\":\"string\",\"required\":true,\"unique\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"normativity\",\"connection\":\"default\",\"uid\":\"api::normativity.normativity\",\"apiName\":\"normativity\",\"globalId\":\"Normativity\",\"actions\":{},\"lifecycles\":{}},\"api::quienes-somos.quienes-somos\":{\"kind\":\"singleType\",\"collectionName\":\"quienes_somos_1\",\"info\":{\"singularName\":\"quienes-somos\",\"pluralName\":\"quienes-somos-1\",\"displayName\":\"QuienesSomosPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"description\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.section\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"quienes_somos_1\",\"info\":{\"singularName\":\"quienes-somos\",\"pluralName\":\"quienes-somos-1\",\"displayName\":\"QuienesSomosPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"description\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.section\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"quienes-somos\",\"connection\":\"default\",\"uid\":\"api::quienes-somos.quienes-somos\",\"apiName\":\"quienes-somos\",\"globalId\":\"QuienesSomos\",\"actions\":{},\"lifecycles\":{}},\"api::service.service\":{\"kind\":\"collectionType\",\"collectionName\":\"services\",\"info\":{\"singularName\":\"service\",\"pluralName\":\"services\",\"displayName\":\"Service\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"logo\":{\"type\":\"media\",\"multiple\":false,\"required\":true,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"title\":{\"type\":\"string\"},\"appliesTo\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.list\"},\"steps\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.list\"},\"account\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::account.account\",\"private\":true},\"payment\":{\"type\":\"richtext\"},\"disclaimer\":{\"type\":\"richtext\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"services\",\"info\":{\"singularName\":\"service\",\"pluralName\":\"services\",\"displayName\":\"Service\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"logo\":{\"type\":\"media\",\"multiple\":false,\"required\":true,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"title\":{\"type\":\"string\"},\"appliesTo\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.list\"},\"steps\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.list\"},\"account\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::account.account\",\"private\":true},\"payment\":{\"type\":\"richtext\"},\"disclaimer\":{\"type\":\"richtext\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"service\",\"connection\":\"default\",\"uid\":\"api::service.service\",\"apiName\":\"service\",\"globalId\":\"Service\",\"actions\":{},\"lifecycles\":{}},\"api::servicios-page.servicios-page\":{\"kind\":\"singleType\",\"collectionName\":\"servicios_pages\",\"info\":{\"singularName\":\"servicios-page\",\"pluralName\":\"servicios-pages\",\"displayName\":\"ServiciosPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"description\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.section\"},\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"servicios_pages\",\"info\":{\"singularName\":\"servicios-page\",\"pluralName\":\"servicios-pages\",\"displayName\":\"ServiciosPage\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"description\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.section\"},\"banner\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"template.banner\"}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"servicios-page\",\"connection\":\"default\",\"uid\":\"api::servicios-page.servicios-page\",\"apiName\":\"servicios-page\",\"globalId\":\"ServiciosPage\",\"actions\":{},\"lifecycles\":{}},\"api::site.site\":{\"kind\":\"singleType\",\"collectionName\":\"sites\",\"info\":{\"singularName\":\"site\",\"pluralName\":\"sites\",\"displayName\":\"Site\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"favicon\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"description\":{\"type\":\"text\",\"required\":true},\"defaultSeo\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"shared.seo\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"sites\",\"info\":{\"singularName\":\"site\",\"pluralName\":\"sites\",\"displayName\":\"Site\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"favicon\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"description\":{\"type\":\"text\",\"required\":true},\"defaultSeo\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"shared.seo\",\"required\":true}},\"kind\":\"singleType\"},\"modelType\":\"contentType\",\"modelName\":\"site\",\"connection\":\"default\",\"uid\":\"api::site.site\",\"apiName\":\"site\",\"globalId\":\"Site\",\"actions\":{},\"lifecycles\":{}}}','object',NULL,NULL),(139,'plugin_content_manager_configuration_content_types::admin::role','{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]}}','object',NULL,NULL),(140,'plugin_content_manager_configuration_content_types::admin::permission','{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(141,'plugin_content_manager_configuration_content_types::admin::user','{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object',NULL,NULL),(142,'plugin_content_manager_configuration_content_types::admin::api-token','{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),(143,'plugin_content_manager_configuration_content_types::admin::api-token-permission','{\"uid\":\"admin::api-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),(144,'plugin_content_manager_configuration_content_types::admin::transfer-token','{\"uid\":\"admin::transfer-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),(145,'plugin_content_manager_configuration_content_types::admin::transfer-token-permission','{\"uid\":\"admin::transfer-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),(146,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]}}','object',NULL,NULL),(147,'plugin_content_manager_configuration_content_types::plugin::upload.folder','{\"uid\":\"plugin::upload.folder\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]}}','object',NULL,NULL),(148,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object',NULL,NULL),(149,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(150,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]}}','object',NULL,NULL),(151,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),(152,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}','object',NULL,NULL),(153,'plugin_upload_view_configuration','{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}','object',NULL,NULL),(154,'plugin_upload_metrics','{\"weeklySchedule\":\"27 39 22 * * 2\",\"lastWeeklyUpdate\":1686713967022}','object',NULL,NULL),(155,'plugin_i18n_default_locale','\"en\"','string',NULL,NULL),(156,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]}}','object',NULL,NULL),(157,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),(158,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":\"\",\"default_role\":\"authenticated\"}','object',NULL,NULL),(159,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object',NULL,NULL),(206,'plugin_content_manager_configuration_components::shared.media','{\"uid\":\"shared.media\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"url\",\"defaultSortBy\":\"url\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"file\":{\"edit\":{\"label\":\"file\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"file\",\"searchable\":false,\"sortable\":false}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"file\",\"url\"],\"edit\":[[{\"name\":\"file\",\"size\":6},{\"name\":\"url\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(207,'plugin_content_manager_configuration_components::shared.quote','{\"uid\":\"shared.quote\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"body\":{\"edit\":{\"label\":\"body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"body\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"body\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"body\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(208,'plugin_content_manager_configuration_components::shared.rich-text','{\"uid\":\"shared.rich-text\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"body\":{\"edit\":{\"label\":\"body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"body\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"body\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(209,'plugin_content_manager_configuration_components::shared.seo','{\"uid\":\"shared.seo\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"metaTitle\",\"defaultSortBy\":\"metaTitle\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"metaTitle\":{\"edit\":{\"label\":\"metaTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaTitle\",\"searchable\":true,\"sortable\":true}},\"metaDescription\":{\"edit\":{\"label\":\"metaDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaDescription\",\"searchable\":true,\"sortable\":true}},\"shareImage\":{\"edit\":{\"label\":\"shareImage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"shareImage\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"metaTitle\",\"metaDescription\",\"shareImage\"],\"edit\":[[{\"name\":\"metaTitle\",\"size\":6},{\"name\":\"metaDescription\",\"size\":6}],[{\"name\":\"shareImage\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(210,'plugin_content_manager_configuration_components::shared.slider','{\"uid\":\"shared.slider\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"files\"],\"edit\":[[{\"name\":\"files\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(216,'plugin_content_manager_configuration_components::template.banner','{\"uid\":\"template.banner\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"backgroundColor\":{\"edit\":{\"label\":\"backgroundColor\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"backgroundColor\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"image\",\"backgroundColor\"],\"edit\":[[{\"name\":\"image\",\"size\":12}],[{\"name\":\"backgroundColor\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(218,'plugin_content_manager_configuration_components::shared.email','{\"uid\":\"shared.email\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"email\",\"defaultSortBy\":\"description\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"email\",\"description\"],\"edit\":[[{\"name\":\"email\",\"size\":6},{\"name\":\"description\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(220,'plugin_content_manager_configuration_components::shared.item','{\"uid\":\"shared.item\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"description\",\"defaultSortBy\":\"description\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"link\":{\"edit\":{\"label\":\"link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"description\",\"link\"],\"edit\":[[{\"name\":\"text\",\"size\":12}],[{\"name\":\"description\",\"size\":6},{\"name\":\"link\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(221,'plugin_content_manager_configuration_components::template.list','{\"uid\":\"template.list\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"items\":{\"edit\":{\"label\":\"items\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"items\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"items\"],\"edit\":[[{\"name\":\"items\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(222,'plugin_content_manager_configuration_components::shared.phone','{\"uid\":\"shared.phone\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"number\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"number\":{\"edit\":{\"label\":\"number\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"number\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"number\",\"type\",\"code\"],\"edit\":[[{\"name\":\"number\",\"size\":4},{\"name\":\"type\",\"size\":6}],[{\"name\":\"code\",\"size\":4}]]},\"isComponent\":true}','object',NULL,NULL),(223,'plugin_content_manager_configuration_components::template.section','{\"uid\":\"template.section\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":false,\"sortable\":false}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"priority\":{\"edit\":{\"label\":\"priority\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"priority\",\"searchable\":true,\"sortable\":true}},\"style\":{\"edit\":{\"label\":\"style\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"style\",\"searchable\":true,\"sortable\":true}},\"textAlign\":{\"edit\":{\"label\":\"textAlign\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"textAlign\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"services\":{\"edit\":{\"label\":\"services\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"services\",\"searchable\":false,\"sortable\":false}},\"document\":{\"edit\":{\"label\":\"document\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"document\",\"searchable\":false,\"sortable\":false}},\"normativities\":{\"edit\":{\"label\":\"normativities\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"normativities\",\"searchable\":false,\"sortable\":false}},\"articulos\":{\"edit\":{\"label\":\"articulos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"articulos\",\"searchable\":false,\"sortable\":false}},\"showServices\":{\"edit\":{\"label\":\"showServices\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"showServices\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"title\",\"image\"],\"edit\":[[{\"name\":\"name\",\"size\":6}],[{\"name\":\"title\",\"size\":12}],[{\"name\":\"image\",\"size\":12}],[{\"name\":\"priority\",\"size\":4},{\"name\":\"style\",\"size\":6}],[{\"name\":\"textAlign\",\"size\":6}],[{\"name\":\"description\",\"size\":12}],[{\"name\":\"services\",\"size\":6}],[{\"name\":\"document\",\"size\":12}],[{\"name\":\"normativities\",\"size\":6}],[{\"name\":\"showServices\",\"size\":4},{\"name\":\"articulos\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(229,'plugin_documentation_config','{\"restrictedAccess\":false}','object',NULL,NULL),(230,'plugin_content_manager_configuration_content_types::api::about.about','{\"uid\":\"api::about.about\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"contentTitle\":{\"edit\":{\"label\":\"contentTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentTitle\",\"searchable\":false,\"sortable\":false}},\"workSchedule\":{\"edit\":{\"label\":\"workSchedule\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"workSchedule\",\"searchable\":false,\"sortable\":false}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"blocks\",\"size\":12}],[{\"name\":\"contentTitle\",\"size\":12}],[{\"name\":\"workSchedule\",\"size\":12}],[{\"name\":\"location\",\"size\":12}]]}}','object',NULL,NULL),(232,'plugin_content_manager_configuration_content_types::api::author.author','{\"uid\":\"api::author.author\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"avatar\":{\"edit\":{\"label\":\"avatar\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"avatar\",\"searchable\":false,\"sortable\":false}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"articulos\":{\"edit\":{\"label\":\"articulos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"articulos\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"avatar\",\"email\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"avatar\",\"size\":6}],[{\"name\":\"email\",\"size\":6}],[{\"name\":\"articulos\",\"size\":6}]]}}','object',NULL,NULL),(233,'plugin_content_manager_configuration_content_types::api::category.category','{\"uid\":\"api::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"articulos\":{\"edit\":{\"label\":\"articulos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"articulos\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"description\",\"size\":6}],[{\"name\":\"articulos\",\"size\":6}]]}}','object',NULL,NULL),(235,'plugin_content_manager_configuration_content_types::api::header.header','{\"uid\":\"api::header.header\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"menu\":{\"edit\":{\"label\":\"menu\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"menu\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"menu\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"menu\",\"size\":12}]]}}','object',NULL,NULL),(236,'plugin_content_manager_configuration_content_types::api::footer.footer','{\"uid\":\"api::footer.footer\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"disclaimer\":{\"edit\":{\"label\":\"disclaimer\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"disclaimer\",\"searchable\":false,\"sortable\":false}},\"authorities\":{\"edit\":{\"label\":\"authorities\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"authorities\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"createdAt\",\"updatedAt\",\"authorities\"],\"edit\":[[{\"name\":\"disclaimer\",\"size\":12}],[{\"name\":\"authorities\",\"size\":12}]]}}','object',NULL,NULL),(237,'plugin_content_manager_configuration_content_types::api::entity.entity','{\"uid\":\"api::entity.entity\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"address\":{\"edit\":{\"label\":\"address\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"address\",\"searchable\":true,\"sortable\":true}},\"workSchedule\":{\"edit\":{\"label\":\"workSchedule\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"workSchedule\",\"searchable\":false,\"sortable\":false}},\"NIT\":{\"edit\":{\"label\":\"NIT\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"NIT\",\"searchable\":true,\"sortable\":true}},\"accounts\":{\"edit\":{\"label\":\"accounts\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"accounts\",\"searchable\":false,\"sortable\":false}},\"emails\":{\"edit\":{\"label\":\"emails\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"emails\",\"searchable\":false,\"sortable\":false}},\"phones\":{\"edit\":{\"label\":\"phones\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"phones\",\"searchable\":false,\"sortable\":false}},\"fee\":{\"edit\":{\"label\":\"fee\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"fee\",\"searchable\":false,\"sortable\":false}},\"logo\":{\"edit\":{\"label\":\"logo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"logo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"address\",\"logo\"],\"edit\":[[{\"name\":\"name\",\"size\":6}],[{\"name\":\"address\",\"size\":6}],[{\"name\":\"workSchedule\",\"size\":12}],[{\"name\":\"NIT\",\"size\":6},{\"name\":\"accounts\",\"size\":6}],[{\"name\":\"emails\",\"size\":12}],[{\"name\":\"phones\",\"size\":12}],[{\"name\":\"fee\",\"size\":12}],[{\"name\":\"logo\",\"size\":6}]]}}','object',NULL,NULL),(239,'plugin_content_manager_configuration_content_types::api::account.account','{\"uid\":\"api::account.account\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"number\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"bank\":{\"edit\":{\"label\":\"bank\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"bank\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"number\":{\"edit\":{\"label\":\"number\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"number\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"number\",\"size\":4},{\"name\":\"type\",\"size\":6}],[{\"name\":\"bank\",\"size\":6},{\"name\":\"description\",\"size\":6}]],\"list\":[\"id\",\"description\",\"bank\",\"type\"]}}','object',NULL,NULL),(241,'plugin_content_manager_configuration_content_types::api::service.service','{\"uid\":\"api::service.service\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"logo\":{\"edit\":{\"label\":\"logo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"logo\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"appliesTo\":{\"edit\":{\"label\":\"appliesTo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"appliesTo\",\"searchable\":false,\"sortable\":false}},\"steps\":{\"edit\":{\"label\":\"steps\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"steps\",\"searchable\":false,\"sortable\":false}},\"account\":{\"edit\":{\"label\":\"account\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"account\",\"searchable\":true,\"sortable\":true}},\"payment\":{\"edit\":{\"label\":\"payment\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"payment\",\"searchable\":false,\"sortable\":false}},\"disclaimer\":{\"edit\":{\"label\":\"disclaimer\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"disclaimer\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"logo\",\"title\",\"appliesTo\"],\"edit\":[[{\"name\":\"logo\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"appliesTo\",\"size\":12}],[{\"name\":\"steps\",\"size\":12}],[{\"name\":\"account\",\"size\":6}],[{\"name\":\"payment\",\"size\":12}],[{\"name\":\"disclaimer\",\"size\":12}]]}}','object',NULL,NULL),(242,'plugin_content_manager_configuration_content_types::api::home.home','{\"uid\":\"api::home.home\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"sections\":{\"edit\":{\"label\":\"sections\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"sections\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"sections\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"sections\",\"size\":12}]]}}','object',NULL,NULL),(244,'plugin_content_manager_configuration_components::shared.fee','{\"uid\":\"shared.fee\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"value\":{\"edit\":{\"label\":\"value\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"value\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"value\"],\"edit\":[[{\"name\":\"value\",\"size\":4}],[{\"name\":\"description\",\"size\":12}]]},\"isComponent\":true}','object',NULL,NULL),(247,'plugin_content_manager_configuration_content_types::api::site.site','{\"uid\":\"api::site.site\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"favicon\":{\"edit\":{\"label\":\"favicon\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"favicon\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"defaultSeo\":{\"edit\":{\"label\":\"defaultSeo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"defaultSeo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"favicon\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"favicon\",\"size\":6}],[{\"name\":\"description\",\"size\":6}],[{\"name\":\"defaultSeo\",\"size\":12}]]}}','object',NULL,NULL),(248,'plugin_content_manager_configuration_content_types::api::quienes-somos.quienes-somos','{\"uid\":\"api::quienes-somos.quienes-somos\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"banner\":{\"edit\":{\"label\":\"banner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"banner\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"banner\",\"description\",\"createdAt\"],\"edit\":[[{\"name\":\"banner\",\"size\":12}],[{\"name\":\"description\",\"size\":12}]]}}','object',NULL,NULL),(249,'plugin_content_manager_configuration_content_types::api::servicios-page.servicios-page','{\"uid\":\"api::servicios-page.servicios-page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"banner\":{\"edit\":{\"label\":\"banner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"banner\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"description\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"description\",\"size\":12}],[{\"name\":\"banner\",\"size\":12}]]}}','object',NULL,NULL),(250,'plugin_content_manager_configuration_content_types::api::normatividad-page.normatividad-page','{\"uid\":\"api::normatividad-page.normatividad-page\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"banner\":{\"edit\":{\"label\":\"banner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"banner\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"banner\",\"description\",\"createdAt\"],\"edit\":[[{\"name\":\"banner\",\"size\":12}],[{\"name\":\"description\",\"size\":12}]]}}','object',NULL,NULL),(251,'plugin_content_manager_configuration_content_types::api::atencion-usuario.atencion-usuario','{\"uid\":\"api::atencion-usuario.atencion-usuario\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"banner\":{\"edit\":{\"label\":\"banner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"banner\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":false,\"sortable\":false}},\"schedule_title\":{\"edit\":{\"label\":\"schedule_title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"schedule_title\",\"searchable\":false,\"sortable\":false}},\"scheduleDescription\":{\"edit\":{\"label\":\"scheduleDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduleDescription\",\"searchable\":false,\"sortable\":false}},\"locationTitle\":{\"edit\":{\"label\":\"locationTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"locationTitle\",\"searchable\":false,\"sortable\":false}},\"locationDescription\":{\"edit\":{\"label\":\"locationDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"locationDescription\",\"searchable\":false,\"sortable\":false}},\"phoneTitle\":{\"edit\":{\"label\":\"phoneTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"phoneTitle\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"banner\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"banner\",\"size\":12}],[{\"name\":\"title\",\"size\":12}],[{\"name\":\"schedule_title\",\"size\":12}],[{\"name\":\"scheduleDescription\",\"size\":12}],[{\"name\":\"locationTitle\",\"size\":12}],[{\"name\":\"locationDescription\",\"size\":12}],[{\"name\":\"phoneTitle\",\"size\":12}]]}}','object',NULL,NULL),(255,'plugin_content_manager_configuration_components::shared.document','{\"uid\":\"shared.document\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"media\":{\"edit\":{\"label\":\"media\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"media\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"downloadText\":{\"edit\":{\"label\":\"downloadText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"downloadText\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"media\",\"title\",\"downloadText\"],\"edit\":[[{\"name\":\"media\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"downloadText\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(257,'plugin_content_manager_configuration_content_types::api::normativity.normativity','{\"uid\":\"api::normativity.normativity\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"abstract\":{\"edit\":{\"label\":\"abstract\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"abstract\",\"searchable\":false,\"sortable\":false}},\"pageUrl\":{\"edit\":{\"label\":\"pageUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pageUrl\",\"searchable\":true,\"sortable\":true}},\"pdfUrl\":{\"edit\":{\"label\":\"pdfUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pdfUrl\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"pageUrl\",\"pdfUrl\"],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"abstract\",\"size\":12}],[{\"name\":\"pageUrl\",\"size\":6},{\"name\":\"pdfUrl\",\"size\":6}]]}}','object',NULL,NULL),(261,'plugin_content_manager_configuration_components::section.heading','{\"uid\":\"section.heading\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"text\",\"defaultSortBy\":\"text\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"level\":{\"edit\":{\"label\":\"level\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"level\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"styles\":{\"edit\":{\"label\":\"styles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"styles\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"text\",\"level\",\"size\"],\"edit\":[[{\"name\":\"text\",\"size\":6},{\"name\":\"level\",\"size\":4}],[{\"name\":\"size\",\"size\":4},{\"name\":\"styles\",\"size\":6}]]},\"isComponent\":true}','object',NULL,NULL),(264,'plugin_content_manager_configuration_content_types::api::articulo.articulo','{\"uid\":\"api::articulo.articulo\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"cover\":{\"edit\":{\"label\":\"cover\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"cover\",\"searchable\":false,\"sortable\":false}},\"author\":{\"edit\":{\"label\":\"author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"author\",\"searchable\":true,\"sortable\":true}},\"category\":{\"edit\":{\"label\":\"category\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"category\",\"searchable\":true,\"sortable\":true}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"description\",\"slug\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"slug\",\"size\":6},{\"name\":\"cover\",\"size\":6}],[{\"name\":\"author\",\"size\":6},{\"name\":\"category\",\"size\":6}],[{\"name\":\"blocks\",\"size\":12}]]}}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_database_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schema` json DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES (152,'{\"tables\": [{\"name\": \"strapi_core_store_settings\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"value\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"environment\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"tag\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_webhooks\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"url\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"headers\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"events\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"enabled\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"admin_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"subject\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"properties\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"conditions\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"firstname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lastname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"registration_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_active\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"prefered_language\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"alternative_text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"caption\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"width\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"height\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"formats\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"hash\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"ext\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"mime\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"size\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"preview_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider_metadata\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_files_folder_path_index\", \"type\": null, \"columns\": [\"folder_path\"]}, {\"name\": \"upload_files_created_at_index\", \"type\": null, \"columns\": [\"created_at\"]}, {\"name\": \"upload_files_updated_at_index\", \"type\": null, \"columns\": [\"updated_at\"]}, {\"name\": \"upload_files_name_index\", \"type\": null, \"columns\": [\"name\"]}, {\"name\": \"upload_files_size_index\", \"type\": null, \"columns\": [\"size\"]}, {\"name\": \"upload_files_ext_index\", \"type\": null, \"columns\": [\"ext\"]}, {\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path_id\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_path_id_index\", \"type\": \"unique\", \"columns\": [\"path_id\"]}, {\"name\": \"upload_folders_path_index\", \"type\": \"unique\", \"columns\": [\"path\"]}, {\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"i18n_locale\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmation_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmed\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"abouts\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"work_schedule\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"location\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"abouts_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"abouts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"abouts_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"abouts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"accounts\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"bank\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"number\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"accounts_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"accounts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"accounts_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"accounts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"articulos\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unique\": true, \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"articulos_slug_unique\", \"type\": \"unique\", \"columns\": [\"slug\"]}, {\"name\": \"articulos_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"articulos_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"articulos_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"articulos_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"atencion_usuarios\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"schedule_description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"location_description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"atencion_usuarios_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"atencion_usuarios_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"atencion_usuarios_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"atencion_usuarios_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"authors\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"authors_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"authors_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"authors_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"authors_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"categories\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unique\": true, \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"categories_slug_unique\", \"type\": \"unique\", \"columns\": [\"slug\"]}, {\"name\": \"categories_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"categories_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"entities\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"address\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"work_schedule\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"nit\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"entities_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"entities_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"entities_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"entities_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"footers\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"disclaimer\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"footers_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"footers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"footers_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"footers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"headers\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"headers_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"headers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"headers_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"headers_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"homes\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"homes_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"homes_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"homes_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"homes_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"normatividad_pages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"normatividad_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"normatividad_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"normatividad_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"normatividad_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"normativities\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"abstract\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"page_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"pdf_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"normativities_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"normativities_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"normativities_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"normativities_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"quienes_somos_1\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"quienes_somos_1_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"quienes_somos_1_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"quienes_somos_1_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"quienes_somos_1_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"services\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"payment\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"disclaimer\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"services_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"services_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"services_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"services_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"servicios_pages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"servicios_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"servicios_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"servicios_pages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"servicios_pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sites\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sites_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"sites_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"sites_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"sites_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_shared_headings\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"level\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"size\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"styles\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_documents\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"download_text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_emails\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_fees\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"value\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_items\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"text\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"link\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_media\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_phones\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"number\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_quotes\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"body\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_rich_texts\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"body\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_seos\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"meta_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"meta_description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_sliders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_template_banners\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"background_color\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_template_lists\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_template_sections\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"priority\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"style\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"text_align\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"show_services\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"admin_permissions_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_role_links_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"admin_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_permissions_role_links_unique\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"admin_permissions_role_links_order_inv_fk\", \"columns\": [\"permission_order\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_role_links_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users_roles_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_roles_links_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"admin_users_roles_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_users_roles_links_unique\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"admin_users_roles_links_order_fk\", \"columns\": [\"role_order\"]}, {\"name\": \"admin_users_roles_links_order_inv_fk\", \"columns\": [\"user_order\"]}], \"foreignKeys\": [{\"name\": \"admin_users_roles_links_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_roles_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions_token_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"api_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_token_links_fk\", \"columns\": [\"api_token_permission_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_inv_fk\", \"columns\": [\"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_unique\", \"type\": \"unique\", \"columns\": [\"api_token_permission_id\", \"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_order_inv_fk\", \"columns\": [\"api_token_permission_order\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_token_links_fk\", \"columns\": [\"api_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_token_links_inv_fk\", \"columns\": [\"api_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions_token_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"transfer_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_token_links_fk\", \"columns\": [\"transfer_token_permission_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_inv_fk\", \"columns\": [\"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_unique\", \"type\": \"unique\", \"columns\": [\"transfer_token_permission_id\", \"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_order_inv_fk\", \"columns\": [\"transfer_token_permission_order\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_token_links_fk\", \"columns\": [\"transfer_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_links_inv_fk\", \"columns\": [\"transfer_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_related_morphs\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_related_morphs_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_related_morphs_order_index\", \"type\": null, \"columns\": [\"order\"]}, {\"name\": \"files_related_morphs_id_column_index\", \"type\": null, \"columns\": [\"related_id\"]}], \"foreignKeys\": [{\"name\": \"files_related_morphs_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_folder_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"file_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_folder_links_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_folder_links_inv_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"files_folder_links_unique\", \"type\": \"unique\", \"columns\": [\"file_id\", \"folder_id\"]}, {\"name\": \"files_folder_links_order_inv_fk\", \"columns\": [\"file_order\"]}], \"foreignKeys\": [{\"name\": \"files_folder_links_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_folder_links_inv_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders_parent_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_parent_links_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"upload_folders_parent_links_inv_fk\", \"columns\": [\"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_links_unique\", \"type\": \"unique\", \"columns\": [\"folder_id\", \"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_links_order_inv_fk\", \"columns\": [\"folder_order\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_parent_links_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_parent_links_inv_fk\", \"columns\": [\"inv_folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_role_links_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"up_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_permissions_role_links_unique\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"up_permissions_role_links_order_inv_fk\", \"columns\": [\"permission_order\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_role_links_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users_role_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_role_links_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"up_users_role_links_inv_fk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_users_role_links_unique\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"up_users_role_links_order_inv_fk\", \"columns\": [\"user_order\"]}], \"foreignKeys\": [{\"name\": \"up_users_role_links_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_role_links_inv_fk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"abouts_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"abouts_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"abouts_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"abouts_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"abouts_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"abouts_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"abouts\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"articulos_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"articulos_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"articulos_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"articulos_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"articulos_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"articulos_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"articulos\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"articulos_author_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"articulo_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"author_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"articulo_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"articulos_author_links_fk\", \"columns\": [\"articulo_id\"]}, {\"name\": \"articulos_author_links_inv_fk\", \"columns\": [\"author_id\"]}, {\"name\": \"articulos_author_links_unique\", \"type\": \"unique\", \"columns\": [\"articulo_id\", \"author_id\"]}, {\"name\": \"articulos_author_links_order_inv_fk\", \"columns\": [\"articulo_order\"]}], \"foreignKeys\": [{\"name\": \"articulos_author_links_fk\", \"columns\": [\"articulo_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"articulos\", \"referencedColumns\": [\"id\"]}, {\"name\": \"articulos_author_links_inv_fk\", \"columns\": [\"author_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"authors\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"articulos_category_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"articulo_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"category_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"articulo_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"articulos_category_links_fk\", \"columns\": [\"articulo_id\"]}, {\"name\": \"articulos_category_links_inv_fk\", \"columns\": [\"category_id\"]}, {\"name\": \"articulos_category_links_unique\", \"type\": \"unique\", \"columns\": [\"articulo_id\", \"category_id\"]}, {\"name\": \"articulos_category_links_order_inv_fk\", \"columns\": [\"articulo_order\"]}], \"foreignKeys\": [{\"name\": \"articulos_category_links_fk\", \"columns\": [\"articulo_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"articulos\", \"referencedColumns\": [\"id\"]}, {\"name\": \"articulos_category_links_inv_fk\", \"columns\": [\"category_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"categories\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"atencion_usuarios_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"atencion_usuarios_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"atencion_usuarios_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"atencion_usuarios_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"atencion_usuarios_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"atencion_usuarios_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"atencion_usuarios\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"entities_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"entities_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"entities_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"entities_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"entities_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"entities_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"entities\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"entities_accounts_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"account_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"account_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"entities_accounts_links_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"entities_accounts_links_inv_fk\", \"columns\": [\"account_id\"]}, {\"name\": \"entities_accounts_links_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"account_id\"]}, {\"name\": \"entities_accounts_links_order_fk\", \"columns\": [\"account_order\"]}], \"foreignKeys\": [{\"name\": \"entities_accounts_links_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"entities\", \"referencedColumns\": [\"id\"]}, {\"name\": \"entities_accounts_links_inv_fk\", \"columns\": [\"account_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"accounts\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"footers_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"footers_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"footers_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"footers_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"footers_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"footers_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"footers\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"headers_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"headers_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"headers_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"headers_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"headers_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"headers_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"headers\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"homes_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"homes_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"homes_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"homes_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"homes_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"homes_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"homes\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"normatividad_pages_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"normatividad_pages_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"normatividad_pages_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"normatividad_pages_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"normatividad_pages_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"normatividad_pages_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"normatividad_pages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"quienes_somos_1_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"quienes_somos_1_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"quienes_somos_1_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"quienes_somos_1_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"quienes_somos_1_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"quienes_somos_1_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"quienes_somos_1\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"services_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"services_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"services_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"services_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"services_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"services_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"services\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"services_account_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"service_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"account_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"services_account_links_fk\", \"columns\": [\"service_id\"]}, {\"name\": \"services_account_links_inv_fk\", \"columns\": [\"account_id\"]}, {\"name\": \"services_account_links_unique\", \"type\": \"unique\", \"columns\": [\"service_id\", \"account_id\"]}], \"foreignKeys\": [{\"name\": \"services_account_links_fk\", \"columns\": [\"service_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"services\", \"referencedColumns\": [\"id\"]}, {\"name\": \"services_account_links_inv_fk\", \"columns\": [\"account_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"accounts\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"servicios_pages_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"servicios_pages_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"servicios_pages_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"servicios_pages_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"servicios_pages_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"servicios_pages_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"servicios_pages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sites_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sites_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"sites_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"sites_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"sites_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"sites_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sites\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_template_banners_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_template_banners_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"components_template_banners_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"components_template_banners_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_template_banners_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_template_banners_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_template_banners\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_template_lists_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_template_lists_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"components_template_lists_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"components_template_lists_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_template_lists_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_template_lists_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_template_lists\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_template_sections_components\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_template_sections_field_index\", \"type\": null, \"columns\": [\"field\"]}, {\"name\": \"components_template_sections_component_type_index\", \"type\": null, \"columns\": [\"component_type\"]}, {\"name\": \"components_template_sections_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_template_sections_unique\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"component_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_template_sections_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_template_sections\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_template_sections_services_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"section_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"service_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"service_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_template_sections_services_links_fk\", \"columns\": [\"section_id\"]}, {\"name\": \"components_template_sections_services_links_inv_fk\", \"columns\": [\"service_id\"]}, {\"name\": \"components_template_sections_services_links_unique\", \"type\": \"unique\", \"columns\": [\"section_id\", \"service_id\"]}, {\"name\": \"components_template_sections_services_links_order_fk\", \"columns\": [\"service_order\"]}], \"foreignKeys\": [{\"name\": \"components_template_sections_services_links_fk\", \"columns\": [\"section_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_template_sections\", \"referencedColumns\": [\"id\"]}, {\"name\": \"components_template_sections_services_links_inv_fk\", \"columns\": [\"service_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"services\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_template_sections_normativities_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"section_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"normativity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"normativity_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_template_sections_normativities_links_fk\", \"columns\": [\"section_id\"]}, {\"name\": \"components_template_sections_normativities_links_inv_fk\", \"columns\": [\"normativity_id\"]}, {\"name\": \"components_template_sections_normativities_links_unique\", \"type\": \"unique\", \"columns\": [\"section_id\", \"normativity_id\"]}, {\"name\": \"components_template_sections_normativities_links_order_fk\", \"columns\": [\"normativity_order\"]}], \"foreignKeys\": [{\"name\": \"components_template_sections_normativities_links_fk\", \"columns\": [\"section_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_template_sections\", \"referencedColumns\": [\"id\"]}, {\"name\": \"components_template_sections_normativities_links_inv_fk\", \"columns\": [\"normativity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"normativities\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_template_sections_articulos_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"section_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"articulo_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"articulo_order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_template_sections_articulos_links_fk\", \"columns\": [\"section_id\"]}, {\"name\": \"components_template_sections_articulos_links_inv_fk\", \"columns\": [\"articulo_id\"]}, {\"name\": \"components_template_sections_articulos_links_unique\", \"type\": \"unique\", \"columns\": [\"section_id\", \"articulo_id\"]}, {\"name\": \"components_template_sections_articulos_links_order_fk\", \"columns\": [\"articulo_order\"]}], \"foreignKeys\": [{\"name\": \"components_template_sections_articulos_links_fk\", \"columns\": [\"section_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_template_sections\", \"referencedColumns\": [\"id\"]}, {\"name\": \"components_template_sections_articulos_links_inv_fk\", \"columns\": [\"articulo_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"articulos\", \"referencedColumns\": [\"id\"]}]}]}','2023-06-16 13:09:41','00538fb5fb003d27b4b898d70a6c11f7');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions`
--

LOCK TABLES `strapi_transfer_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions_token_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int unsigned DEFAULT NULL,
  `transfer_token_id` int unsigned DEFAULT NULL,
  `transfer_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_links_unique` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_links_inv_fk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_order_inv_fk` (`transfer_token_permission_order`),
  CONSTRAINT `strapi_transfer_token_permissions_token_links_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_links_inv_fk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions_token_links`
--

LOCK TABLES `strapi_transfer_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_tokens`
--

DROP TABLE IF EXISTS `strapi_transfer_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_tokens`
--

LOCK TABLES `strapi_transfer_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` json DEFAULT NULL,
  `events` json DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES (10,'plugin::users-permissions.user.me','2023-05-05 00:46:02.673000','2023-05-05 00:46:02.673000',NULL,NULL),(11,'plugin::users-permissions.auth.changePassword','2023-05-05 00:46:02.673000','2023-05-05 00:46:02.673000',NULL,NULL),(12,'plugin::users-permissions.auth.callback','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL),(13,'plugin::users-permissions.auth.connect','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL),(14,'plugin::users-permissions.auth.forgotPassword','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL),(15,'plugin::users-permissions.auth.resetPassword','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL),(16,'plugin::users-permissions.auth.register','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL),(17,'plugin::users-permissions.auth.emailConfirmation','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL),(18,'plugin::users-permissions.auth.sendEmailConfirmation','2023-05-05 00:46:02.686000','2023-05-05 00:46:02.686000',NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_links`
--

DROP TABLE IF EXISTS `up_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `up_permissions_role_links_fk` (`permission_id`),
  KEY `up_permissions_role_links_inv_fk` (`role_id`),
  KEY `up_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_links`
--

LOCK TABLES `up_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_links` DISABLE KEYS */;
INSERT INTO `up_permissions_role_links` VALUES (10,10,3,1),(11,11,3,1),(12,12,4,1),(13,13,4,1),(14,15,4,2),(15,16,4,2),(16,17,4,2),(17,14,4,2),(18,18,4,2);
/*!40000 ALTER TABLE `up_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES (3,'Authenticated','Default role given to authenticated user.','authenticated','2023-05-05 00:46:02.658000','2023-05-05 00:46:02.658000',NULL,NULL),(4,'Public','Default role given to unauthenticated user.','public','2023-05-05 00:46:02.664000','2023-05-05 00:46:02.664000',NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_links`
--

DROP TABLE IF EXISTS `up_users_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users_role_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  KEY `up_users_role_links_fk` (`user_id`),
  KEY `up_users_role_links_inv_fk` (`role_id`),
  KEY `up_users_role_links_order_inv_fk` (`user_order`),
  CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_links`
--

LOCK TABLES `up_users_role_links` WRITE;
/*!40000 ALTER TABLE `up_users_role_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders`
--

DROP TABLE IF EXISTS `upload_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders`
--

LOCK TABLES `upload_folders` WRITE;
/*!40000 ALTER TABLE `upload_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders_parent_links`
--

DROP TABLE IF EXISTS `upload_folders_parent_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders_parent_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned DEFAULT NULL,
  `inv_folder_id` int unsigned DEFAULT NULL,
  `folder_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_links_fk` (`folder_id`),
  KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`),
  CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders_parent_links`
--

LOCK TABLES `upload_folders_parent_links` WRITE;
/*!40000 ALTER TABLE `upload_folders_parent_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders_parent_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-20 23:45:05
