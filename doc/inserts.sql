


--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','Usuário','Usuários','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2020-04-02 19:05:19','2020-04-03 02:08:48'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-04-02 19:05:20','2020-04-02 19:05:20'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2020-04-02 19:05:20','2020-04-02 19:05:20'),(5,'publishers','publishers','Editora','Editoras','voyager-certificate','App\\Publisher',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-04-02 21:33:18','2020-04-03 02:06:20'),(6,'customers','customers','Cliente','Clientes','voyager-people','App\\Customer',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-04-02 21:40:38','2020-04-03 02:05:39'),(7,'books','books','Livro','Livros','voyager-book','App\\Book',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-04-02 21:47:19','2020-04-03 02:05:50'),(8,'sales','sales','Venda','Vendas','voyager-dollar','App\\Sale',NULL,'App\\Http\\Controllers\\SaleController',NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2020-04-02 22:36:35','2020-04-03 03:37:32');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'{}',1),(2,1,'name','text','Nome',1,1,1,1,1,1,'{}',2),(3,1,'email','text','Email',1,1,1,1,1,1,'{}',3),(4,1,'password','password','Senha',1,0,0,1,1,0,'{}',4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,'{}',5),(6,1,'created_at','timestamp','Criado Em',0,1,1,0,0,0,'{}',6),(7,1,'updated_at','timestamp','Atualizado Em',0,0,0,0,0,0,'{}',7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,'{}',8),(9,1,'user_belongsto_role_relationship','relationship','Permissão',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(10,1,'user_belongstomany_role_relationship','relationship','Permissões',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Configurações',0,0,0,0,0,0,'{}',12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',0,1,1,1,1,1,'{}',9),(22,5,'id','text','Id',1,1,1,0,0,0,'{}',1),(23,5,'name','text','Nome',1,1,1,1,1,1,'{}',2),(24,5,'created_at','timestamp','Criado Em',0,1,1,0,0,0,'{}',3),(25,5,'updated_at','timestamp','Atualizado Em',0,0,0,0,0,0,'{}',4),(26,6,'id','text','Id',1,1,1,0,0,0,'{}',1),(27,6,'name','text','Nome',1,1,1,1,1,1,'{}',2),(28,6,'code','text','CPF',1,1,1,1,1,1,'{}',3),(29,6,'created_at','timestamp','Criado Em',0,1,1,0,0,0,'{}',4),(30,6,'updated_at','timestamp','Atualizado Em',0,0,0,0,0,0,'{}',5),(31,7,'id','text','Id',1,1,1,0,0,0,'{}',1),(32,7,'name','text','Nome',1,1,1,1,1,1,'{}',2),(33,7,'description','text_area','Descrição',1,0,1,1,1,1,'{}',3),(34,7,'code','text','ISBN',1,1,1,1,1,1,'{}',4),(35,7,'author','text','Autor',1,1,1,1,1,1,'{}',5),(36,7,'publisher_id','number','Editora',1,1,1,1,1,1,'{}',6),(37,7,'year','number','Ano',1,1,1,1,1,1,'{}',8),(38,7,'price','number','Preço',1,1,1,1,1,1,'{}',9),(39,7,'created_at','timestamp','Criado Em',0,1,1,0,0,0,'{}',10),(40,7,'updated_at','timestamp','Atualizado Em',0,0,0,0,0,0,'{}',11),(41,7,'book_belongsto_publisher_relationship','relationship','Editora',0,1,1,1,1,1,'{\"model\":\"App\\\\Publisher\",\"table\":\"publishers\",\"type\":\"belongsTo\",\"column\":\"publisher_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}',7),(42,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(43,8,'book_id','number','Livro',1,0,0,1,1,1,'{}',2),(44,8,'customer_id','number','Cliente',1,1,1,1,1,1,'{}',4),(45,8,'user_id','hidden','Usuário',1,1,1,0,1,0,'{}',6),(46,8,'created_at','timestamp','Vendido Em',0,1,1,0,0,0,'{}',7),(47,8,'updated_at','timestamp','Atualizado Em',0,0,0,0,0,0,'{}',8),(48,8,'sale_belongsto_book_relationship','relationship','Livro',0,0,0,1,1,1,'{\"model\":\"App\\\\Book\",\"table\":\"books\",\"type\":\"belongsTo\",\"column\":\"book_id\",\"key\":\"id\",\"label\":\"full_book_info\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}',3),(49,8,'sale_belongsto_customer_relationship','relationship','Cliente',0,1,1,1,1,1,'{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"belongsTo\",\"column\":\"customer_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}',5),(50,1,'email_verified_at','timestamp','Confirmação do Email',0,1,1,1,1,1,'{}',6);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;








DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2020-04-02 19:05:21','2020-04-02 19:05:21','voyager.dashboard',NULL),(2,1,'Mídia','','_self','voyager-images','#000000',5,6,'2020-04-02 19:05:21','2020-04-03 02:15:03','voyager.media.index','null'),(3,1,'Usuários','','_self','voyager-person','#000000',NULL,6,'2020-04-02 19:05:21','2020-04-03 02:15:01','voyager.users.index','null'),(4,1,'Permissões','','_self','voyager-lock','#000000',NULL,7,'2020-04-02 19:05:21','2020-04-03 02:15:01','voyager.roles.index','null'),(5,1,'Ferramentas','','_self','voyager-tools','#000000',NULL,8,'2020-04-02 19:05:21','2020-04-03 02:15:03',NULL,''),(6,1,'Construtor de Menu','','_self','voyager-list','#000000',5,1,'2020-04-02 19:05:21','2020-04-03 02:14:50','voyager.menus.index','null'),(7,1,'Base de Dados','','_self','voyager-data','#000000',5,2,'2020-04-02 19:05:21','2020-04-03 02:14:50','voyager.database.index','null'),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2020-04-02 19:05:21','2020-04-03 02:14:50','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2020-04-02 19:05:21','2020-04-03 02:14:50','voyager.bread.index',NULL),(10,1,'Configurações','','_self','voyager-settings','#000000',5,7,'2020-04-02 19:05:21','2020-04-03 02:15:13','voyager.settings.index','null'),(11,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2020-04-02 19:05:25','2020-04-03 02:14:50','voyager.hooks',NULL),(12,1,'Editoras','','_self','voyager-certificate','#000000',NULL,2,'2020-04-02 21:33:18','2020-04-03 02:14:50','voyager.publishers.index','null'),(13,1,'Clientes','','_self','voyager-people','#000000',NULL,4,'2020-04-02 21:40:38','2020-04-03 02:14:56','voyager.customers.index','null'),(14,1,'Livros','','_self','voyager-book','#000000',NULL,3,'2020-04-02 21:47:20','2020-04-03 02:14:56','voyager.books.index','null'),(15,1,'Vendas','','_self','voyager-dollar','#000000',NULL,5,'2020-04-02 22:36:35','2020-04-03 03:09:53','voyager.sales.index','null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(32,1),(33,1),(34,1),(35,1),(37,1),(38,1),(39,1),(40,1),(42,1),(43,1),(45,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2020-04-02 19:05:22','2020-04-02 19:05:22'),(2,'browse_bread',NULL,'2020-04-02 19:05:22','2020-04-02 19:05:22'),(3,'browse_database',NULL,'2020-04-02 19:05:22','2020-04-02 19:05:22'),(4,'browse_media',NULL,'2020-04-02 19:05:22','2020-04-02 19:05:22'),(5,'browse_compass',NULL,'2020-04-02 19:05:22','2020-04-02 19:05:22'),(6,'browse_menus','menus','2020-04-02 19:05:22','2020-04-02 19:05:22'),(7,'read_menus','menus','2020-04-02 19:05:22','2020-04-02 19:05:22'),(8,'edit_menus','menus','2020-04-02 19:05:22','2020-04-02 19:05:22'),(9,'add_menus','menus','2020-04-02 19:05:22','2020-04-02 19:05:22'),(10,'delete_menus','menus','2020-04-02 19:05:22','2020-04-02 19:05:22'),(11,'browse_roles','roles','2020-04-02 19:05:22','2020-04-02 19:05:22'),(12,'read_roles','roles','2020-04-02 19:05:22','2020-04-02 19:05:22'),(13,'edit_roles','roles','2020-04-02 19:05:22','2020-04-02 19:05:22'),(14,'add_roles','roles','2020-04-02 19:05:22','2020-04-02 19:05:22'),(15,'delete_roles','roles','2020-04-02 19:05:22','2020-04-02 19:05:22'),(16,'browse_users','users','2020-04-02 19:05:22','2020-04-02 19:05:22'),(17,'read_users','users','2020-04-02 19:05:22','2020-04-02 19:05:22'),(18,'edit_users','users','2020-04-02 19:05:22','2020-04-02 19:05:22'),(19,'add_users','users','2020-04-02 19:05:22','2020-04-02 19:05:22'),(20,'delete_users','users','2020-04-02 19:05:23','2020-04-02 19:05:23'),(21,'browse_settings','settings','2020-04-02 19:05:23','2020-04-02 19:05:23'),(22,'read_settings','settings','2020-04-02 19:05:23','2020-04-02 19:05:23'),(23,'edit_settings','settings','2020-04-02 19:05:23','2020-04-02 19:05:23'),(24,'add_settings','settings','2020-04-02 19:05:23','2020-04-02 19:05:23'),(25,'delete_settings','settings','2020-04-02 19:05:23','2020-04-02 19:05:23'),(26,'browse_hooks',NULL,'2020-04-02 19:05:25','2020-04-02 19:05:25'),(27,'browse_publishers','publishers','2020-04-02 21:33:18','2020-04-02 21:33:18'),(28,'read_publishers','publishers','2020-04-02 21:33:18','2020-04-02 21:33:18'),(29,'edit_publishers','publishers','2020-04-02 21:33:18','2020-04-02 21:33:18'),(30,'add_publishers','publishers','2020-04-02 21:33:18','2020-04-02 21:33:18'),(31,'delete_publishers','publishers','2020-04-02 21:33:18','2020-04-02 21:33:18'),(32,'browse_customers','customers','2020-04-02 21:40:38','2020-04-02 21:40:38'),(33,'read_customers','customers','2020-04-02 21:40:38','2020-04-02 21:40:38'),(34,'edit_customers','customers','2020-04-02 21:40:38','2020-04-02 21:40:38'),(35,'add_customers','customers','2020-04-02 21:40:38','2020-04-02 21:40:38'),(36,'delete_customers','customers','2020-04-02 21:40:38','2020-04-02 21:40:38'),(37,'browse_books','books','2020-04-02 21:47:20','2020-04-02 21:47:20'),(38,'read_books','books','2020-04-02 21:47:20','2020-04-02 21:47:20'),(39,'edit_books','books','2020-04-02 21:47:20','2020-04-02 21:47:20'),(40,'add_books','books','2020-04-02 21:47:20','2020-04-02 21:47:20'),(41,'delete_books','books','2020-04-02 21:47:20','2020-04-02 21:47:20'),(42,'browse_sales','sales','2020-04-02 22:36:35','2020-04-02 22:36:35'),(43,'read_sales','sales','2020-04-02 22:36:35','2020-04-02 22:36:35'),(44,'edit_sales','sales','2020-04-02 22:36:35','2020-04-02 22:36:35'),(45,'add_sales','sales','2020-04-02 22:36:35','2020-04-02 22:36:35'),(46,'delete_sales','sales','2020-04-02 22:36:35','2020-04-02 22:36:35');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2020-04-02 19:05:21','2020-04-02 19:05:21'),(2,'user','Normal User','2020-04-02 19:05:21','2020-04-02 19:05:21');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','BookStore','','text',1,'Admin'),(7,'admin.description','Admin Description','Livraria Virtual','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;






