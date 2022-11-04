-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 04 Lis 2022, 21:03
-- Wersja serwera: 5.7.31
-- Wersja PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `krovea`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_commentmeta`
--

DROP TABLE IF EXISTS `akr_commentmeta`;
CREATE TABLE IF NOT EXISTS `akr_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_comments`
--

DROP TABLE IF EXISTS `akr_comments`;
CREATE TABLE IF NOT EXISTS `akr_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_comments`
--

INSERT INTO `akr_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Komentator WordPressa', 'wapuu@wordpress.example', 'https://pl.wordpress.org/', '', '2022-11-03 21:21:29', '2022-11-03 20:21:29', 'Cześć, to jest komentarz.\nAby zapoznać się z moderowaniem, edycją i usuwaniem komentarzy, należy odwiedzić ekran komentarzy w kokpicie.\nAwatary komentujących pochodzą z <a href=\"https://pl.gravatar.com/\">Gravatara</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_links`
--

DROP TABLE IF EXISTS `akr_links`;
CREATE TABLE IF NOT EXISTS `akr_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_options`
--

DROP TABLE IF EXISTS `akr_options`;
CREATE TABLE IF NOT EXISTS `akr_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=577 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_options`
--

INSERT INTO `akr_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/krovea', 'yes'),
(2, 'home', 'http://localhost/krovea', 'yes'),
(3, 'blogname', 'Krovea', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'm.kowalski.devjs@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'Y-m-d', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:95:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=2&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'krovea/resources', 'yes'),
(41, 'stylesheet', 'krovea/resources', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '53496', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '0', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', 'Europe/Warsaw', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '2', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '19', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1683058889', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '53496', 'yes'),
(100, 'akr_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'pl_PL', 'yes'),
(103, 'user_count', '1', 'no'),
(104, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:156:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Ostatnie wpisy</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:232:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Najnowsze komentarze</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:145:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archiwa</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:149:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Kategorie</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:8:{i:1667596889;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1667636489;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1667636527;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1667679689;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1667679727;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1667679728;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1668198089;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(122, 'recovery_keys', 'a:0:{}', 'yes'),
(125, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:35:\"Zapytanie HTTPS nie powiodło się.\";}}', 'yes'),
(126, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:63:\"https://downloads.wordpress.org/release/pl_PL/wordpress-6.1.zip\";s:6:\"locale\";s:5:\"pl_PL\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:63:\"https://downloads.wordpress.org/release/pl_PL/wordpress-6.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:3:\"6.1\";s:7:\"version\";s:3:\"6.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1667593319;s:15:\"version_checked\";s:3:\"6.1\";s:12:\"translations\";a:0:{}}', 'no'),
(207, 'bodhi_svgs_settings', 'a:1:{s:22:\"sanitize_svg_front_end\";s:2:\"on\";}', 'yes'),
(203, '_transient_timeout_acf_plugin_updates', '1667682619', 'no'),
(204, '_transient_acf_plugin_updates', 'a:4:{s:7:\"plugins\";a:0:{}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.0.3\";}}', 'no'),
(534, '_site_transient_timeout_theme_roots', '1667595106', 'no'),
(535, '_site_transient_theme_roots', 'a:1:{s:16:\"krovea/resources\";s:7:\"/themes\";}', 'no'),
(131, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1667593320;s:7:\"checked\";a:1:{s:16:\"krovea/resources\";s:5:\"1.0.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(206, 'bodhi_svgs_plugin_version', '2.5.1', 'yes'),
(132, '_site_transient_timeout_browser_792de51e4d5be52a35f55f3570193fc3', '1668111727', 'no'),
(133, '_site_transient_browser_792de51e4d5be52a35f55f3570193fc3', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"107.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(134, '_site_transient_timeout_php_check_e26e33de4a278e301580d402dcb3d659', '1668111728', 'no'),
(135, '_site_transient_php_check_e26e33de4a278e301580d402dcb3d659', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(156, 'finished_updating_comment_type', '1', 'yes'),
(139, 'can_compress_scripts', '1', 'no'),
(536, '_transient_health-check-site-status-result', '{\"good\":16,\"recommended\":5,\"critical\":0}', 'yes'),
(157, 'recently_activated', 'a:1:{s:27:\"svg-support/svg-support.php\";i:1667510197;}', 'yes'),
(160, 'theme_mods_twentytwentythree', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1667506994;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(161, 'current_theme', 'Krovea', 'yes'),
(162, 'theme_mods_krovea/resources', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:10:\"krove_menu\";i:2;}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(163, 'theme_switched', '', 'yes'),
(164, 'acf_version', '6.0.3', 'yes'),
(175, 'options_logo', '15', 'no'),
(176, '_options_logo', 'field_636424a8a5128', 'no'),
(177, 'options_additionals_btns_0_icon', '21', 'no'),
(178, '_options_additionals_btns_0_icon', 'field_6364251aa512c', 'no'),
(179, 'options_additionals_btns_0_link', '/', 'no'),
(180, '_options_additionals_btns_0_link', 'field_6364252ea512d', 'no'),
(181, 'options_additionals_btns_0_title', 'Przejdź do strony logowania', 'no'),
(182, '_options_additionals_btns_0_title', 'field_6364254ea512e', 'no'),
(183, 'options_additionals_btns', '1', 'no'),
(184, '_options_additionals_btns', 'field_63642502a512b', 'no'),
(185, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(190, 'options_free_shipping', 'Free Shipping for all orders above $50', 'no'),
(191, '_options_free_shipping', 'field_6364293e6663a', 'no'),
(205, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1667593320;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"6.0.3\";}}', 'no'),
(575, '_transient_timeout_global_styles_krovea/resources', '1667595840', 'no'),
(576, '_transient_global_styles_krovea/resources', 'body{--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--duotone--dark-grayscale: url(\'#wp-duotone-dark-grayscale\');--wp--preset--duotone--grayscale: url(\'#wp-duotone-grayscale\');--wp--preset--duotone--purple-yellow: url(\'#wp-duotone-purple-yellow\');--wp--preset--duotone--blue-red: url(\'#wp-duotone-blue-red\');--wp--preset--duotone--midnight: url(\'#wp-duotone-midnight\');--wp--preset--duotone--magenta-yellow: url(\'#wp-duotone-magenta-yellow\');--wp--preset--duotone--purple-green: url(\'#wp-duotone-purple-green\');--wp--preset--duotone--blue-orange: url(\'#wp-duotone-blue-orange\');--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;--wp--preset--spacing--20: 0.44rem;--wp--preset--spacing--30: 0.67rem;--wp--preset--spacing--40: 1rem;--wp--preset--spacing--50: 1.5rem;--wp--preset--spacing--60: 2.25rem;--wp--preset--spacing--70: 3.38rem;--wp--preset--spacing--80: 5.06rem;}:where(.is-layout-flex){gap: 0.5em;}body .is-layout-flow > .alignleft{float: left;margin-inline-start: 0;margin-inline-end: 2em;}body .is-layout-flow > .alignright{float: right;margin-inline-start: 2em;margin-inline-end: 0;}body .is-layout-flow > .aligncenter{margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > .alignleft{float: left;margin-inline-start: 0;margin-inline-end: 2em;}body .is-layout-constrained > .alignright{float: right;margin-inline-start: 2em;margin-inline-end: 0;}body .is-layout-constrained > .aligncenter{margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > :where(:not(.alignleft):not(.alignright):not(.alignfull)){max-width: var(--wp--style--global--content-size);margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > .alignwide{max-width: var(--wp--style--global--wide-size);}body .is-layout-flex{display: flex;}body .is-layout-flex{flex-wrap: wrap;align-items: center;}body .is-layout-flex > *{margin: 0;}:where(.wp-block-columns.is-layout-flex){gap: 2em;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}', 'no');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_postmeta`
--

DROP TABLE IF EXISTS `akr_postmeta`;
CREATE TABLE IF NOT EXISTS `akr_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_postmeta`
--

INSERT INTO `akr_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 2, '_edit_lock', '1667595754:1'),
(4, 7, '_edit_last', '1'),
(5, 7, '_edit_lock', '1667582413:1'),
(6, 15, '_wp_attached_file', '2022/11/logo.svg'),
(7, 15, '_wp_attachment_metadata', 'a:1:{s:8:\"filesize\";i:3780;}'),
(44, 24, '_menu_item_target', ''),
(20, 21, '_wp_attached_file', '2022/11/user.svg'),
(21, 21, '_wp_attachment_metadata', 'a:1:{s:8:\"filesize\";i:761;}'),
(53, 25, '_menu_item_target', ''),
(52, 25, '_menu_item_object', 'custom'),
(51, 25, '_menu_item_object_id', '25'),
(50, 25, '_menu_item_menu_item_parent', '0'),
(49, 25, '_menu_item_type', 'custom'),
(45, 24, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(46, 24, '_menu_item_xfn', ''),
(47, 24, '_menu_item_url', '/'),
(18, 20, '_wp_trash_meta_status', 'publish'),
(19, 20, '_wp_trash_meta_time', '1667508015'),
(13, 18, '_wp_attached_file', '2022/11/favicon.png'),
(14, 18, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:19:\"2022/11/favicon.png\";s:8:\"filesize\";i:6863;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"favicon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31164;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"favicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8853;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(15, 19, '_wp_attached_file', '2022/11/cropped-favicon.png'),
(16, 19, '_wp_attachment_context', 'site-icon'),
(17, 19, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:27:\"2022/11/cropped-favicon.png\";s:8:\"filesize\";i:4857;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31164;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8853;}s:13:\"site_icon-270\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:23822;}s:13:\"site_icon-192\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:2983;}s:13:\"site_icon-180\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10992;}s:12:\"site_icon-32\";a:5:{s:4:\"file\";s:25:\"cropped-favicon-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:332;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(43, 24, '_menu_item_object', 'custom'),
(42, 24, '_menu_item_object_id', '24'),
(41, 24, '_menu_item_menu_item_parent', '0'),
(40, 24, '_menu_item_type', 'custom'),
(54, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(55, 25, '_menu_item_xfn', ''),
(56, 25, '_menu_item_url', '/'),
(296, 61, 'hero_title', 'Lorem Ipsum'),
(58, 26, '_menu_item_type', 'custom'),
(59, 26, '_menu_item_menu_item_parent', '0'),
(60, 26, '_menu_item_object_id', '26'),
(61, 26, '_menu_item_object', 'custom'),
(62, 26, '_menu_item_target', ''),
(63, 26, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(64, 26, '_menu_item_xfn', ''),
(65, 26, '_menu_item_url', '/'),
(297, 61, '_hero_title', 'field_636526ee7dc07'),
(67, 27, '_menu_item_type', 'custom'),
(68, 27, '_menu_item_menu_item_parent', '24'),
(69, 27, '_menu_item_object_id', '27'),
(70, 27, '_menu_item_object', 'custom'),
(71, 27, '_menu_item_target', ''),
(72, 27, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(73, 27, '_menu_item_xfn', ''),
(74, 27, '_menu_item_url', '/'),
(76, 28, '_menu_item_type', 'custom'),
(77, 28, '_menu_item_menu_item_parent', '27'),
(78, 28, '_menu_item_object_id', '28'),
(79, 28, '_menu_item_object', 'custom'),
(80, 28, '_menu_item_target', ''),
(81, 28, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(82, 28, '_menu_item_xfn', ''),
(83, 28, '_menu_item_url', '/'),
(298, 61, 'hero_content', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
(85, 29, '_menu_item_type', 'custom'),
(86, 29, '_menu_item_menu_item_parent', '27'),
(87, 29, '_menu_item_object_id', '29'),
(88, 29, '_menu_item_object', 'custom'),
(89, 29, '_menu_item_target', ''),
(90, 29, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(91, 29, '_menu_item_xfn', ''),
(92, 29, '_menu_item_url', '/'),
(285, 15, '_wp_attachment_image_alt', 'Krovea Logo'),
(94, 30, '_menu_item_type', 'custom'),
(95, 30, '_menu_item_menu_item_parent', '27'),
(96, 30, '_menu_item_object_id', '30'),
(97, 30, '_menu_item_object', 'custom'),
(98, 30, '_menu_item_target', ''),
(99, 30, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(100, 30, '_menu_item_xfn', ''),
(101, 30, '_menu_item_url', '/'),
(103, 31, '_menu_item_type', 'custom'),
(104, 31, '_menu_item_menu_item_parent', '27'),
(105, 31, '_menu_item_object_id', '31'),
(106, 31, '_menu_item_object', 'custom'),
(107, 31, '_menu_item_target', ''),
(108, 31, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(109, 31, '_menu_item_xfn', ''),
(110, 31, '_menu_item_url', '/'),
(286, 21, '_wp_attachment_image_alt', 'Account icon'),
(112, 32, '_menu_item_type', 'custom'),
(113, 32, '_menu_item_menu_item_parent', '27'),
(114, 32, '_menu_item_object_id', '32'),
(115, 32, '_menu_item_object', 'custom'),
(116, 32, '_menu_item_target', ''),
(117, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(118, 32, '_menu_item_xfn', ''),
(119, 32, '_menu_item_url', '/'),
(121, 33, '_menu_item_type', 'custom'),
(122, 33, '_menu_item_menu_item_parent', '24'),
(123, 33, '_menu_item_object_id', '33'),
(124, 33, '_menu_item_object', 'custom'),
(125, 33, '_menu_item_target', ''),
(126, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(127, 33, '_menu_item_xfn', ''),
(128, 33, '_menu_item_url', '/'),
(287, 57, '_edit_last', '1'),
(130, 34, '_menu_item_type', 'custom'),
(131, 34, '_menu_item_menu_item_parent', '33'),
(132, 34, '_menu_item_object_id', '34'),
(133, 34, '_menu_item_object', 'custom'),
(134, 34, '_menu_item_target', ''),
(135, 34, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(136, 34, '_menu_item_xfn', ''),
(137, 34, '_menu_item_url', '/'),
(288, 57, '_edit_lock', '1667573375:1'),
(139, 35, '_menu_item_type', 'custom'),
(140, 35, '_menu_item_menu_item_parent', '33'),
(141, 35, '_menu_item_object_id', '35'),
(142, 35, '_menu_item_object', 'custom'),
(143, 35, '_menu_item_target', ''),
(144, 35, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(145, 35, '_menu_item_xfn', ''),
(146, 35, '_menu_item_url', '/'),
(289, 2, '_edit_last', '1'),
(148, 36, '_menu_item_type', 'custom'),
(149, 36, '_menu_item_menu_item_parent', '33'),
(150, 36, '_menu_item_object_id', '36'),
(151, 36, '_menu_item_object', 'custom'),
(152, 36, '_menu_item_target', ''),
(153, 36, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(154, 36, '_menu_item_xfn', ''),
(155, 36, '_menu_item_url', '/'),
(290, 2, 'hero_title', 'Lorem Ipsum'),
(157, 37, '_menu_item_type', 'custom'),
(158, 37, '_menu_item_menu_item_parent', '33'),
(159, 37, '_menu_item_object_id', '37'),
(160, 37, '_menu_item_object', 'custom'),
(161, 37, '_menu_item_target', ''),
(162, 37, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(163, 37, '_menu_item_xfn', ''),
(164, 37, '_menu_item_url', '/'),
(291, 2, '_hero_title', 'field_636526ee7dc07'),
(166, 38, '_menu_item_type', 'custom'),
(167, 38, '_menu_item_menu_item_parent', '33'),
(168, 38, '_menu_item_object_id', '38'),
(169, 38, '_menu_item_object', 'custom'),
(170, 38, '_menu_item_target', ''),
(171, 38, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(172, 38, '_menu_item_xfn', ''),
(173, 38, '_menu_item_url', '/'),
(292, 2, 'hero_content', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
(175, 39, '_menu_item_type', 'custom'),
(176, 39, '_menu_item_menu_item_parent', '24'),
(177, 39, '_menu_item_object_id', '39'),
(178, 39, '_menu_item_object', 'custom'),
(179, 39, '_menu_item_target', ''),
(180, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(181, 39, '_menu_item_xfn', ''),
(182, 39, '_menu_item_url', '/'),
(184, 40, '_menu_item_type', 'custom'),
(185, 40, '_menu_item_menu_item_parent', '39'),
(186, 40, '_menu_item_object_id', '40'),
(187, 40, '_menu_item_object', 'custom'),
(188, 40, '_menu_item_target', ''),
(189, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(190, 40, '_menu_item_xfn', ''),
(191, 40, '_menu_item_url', '/'),
(193, 41, '_menu_item_type', 'custom'),
(194, 41, '_menu_item_menu_item_parent', '39'),
(195, 41, '_menu_item_object_id', '41'),
(196, 41, '_menu_item_object', 'custom'),
(197, 41, '_menu_item_target', ''),
(198, 41, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(199, 41, '_menu_item_xfn', ''),
(200, 41, '_menu_item_url', '/'),
(202, 42, '_menu_item_type', 'custom'),
(203, 42, '_menu_item_menu_item_parent', '39'),
(204, 42, '_menu_item_object_id', '42'),
(205, 42, '_menu_item_object', 'custom'),
(206, 42, '_menu_item_target', ''),
(207, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(208, 42, '_menu_item_xfn', ''),
(209, 42, '_menu_item_url', '/'),
(211, 43, '_menu_item_type', 'custom'),
(212, 43, '_menu_item_menu_item_parent', '39'),
(213, 43, '_menu_item_object_id', '43'),
(214, 43, '_menu_item_object', 'custom'),
(215, 43, '_menu_item_target', ''),
(216, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(217, 43, '_menu_item_xfn', ''),
(218, 43, '_menu_item_url', '/'),
(220, 44, '_menu_item_type', 'custom'),
(221, 44, '_menu_item_menu_item_parent', '39'),
(222, 44, '_menu_item_object_id', '44'),
(223, 44, '_menu_item_object', 'custom'),
(224, 44, '_menu_item_target', ''),
(225, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(226, 44, '_menu_item_xfn', ''),
(227, 44, '_menu_item_url', '/'),
(229, 45, '_menu_item_type', 'custom'),
(230, 45, '_menu_item_menu_item_parent', '24'),
(231, 45, '_menu_item_object_id', '45'),
(232, 45, '_menu_item_object', 'custom'),
(233, 45, '_menu_item_target', ''),
(234, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(235, 45, '_menu_item_xfn', ''),
(236, 45, '_menu_item_url', '/'),
(238, 46, '_menu_item_type', 'custom'),
(239, 46, '_menu_item_menu_item_parent', '45'),
(240, 46, '_menu_item_object_id', '46'),
(241, 46, '_menu_item_object', 'custom'),
(242, 46, '_menu_item_target', ''),
(243, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(244, 46, '_menu_item_xfn', ''),
(245, 46, '_menu_item_url', '/'),
(247, 47, '_menu_item_type', 'custom'),
(248, 47, '_menu_item_menu_item_parent', '45'),
(249, 47, '_menu_item_object_id', '47'),
(250, 47, '_menu_item_object', 'custom'),
(251, 47, '_menu_item_target', ''),
(252, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(253, 47, '_menu_item_xfn', ''),
(254, 47, '_menu_item_url', '/'),
(293, 2, '_hero_content', 'field_636526f67dc08'),
(256, 48, '_menu_item_type', 'custom'),
(257, 48, '_menu_item_menu_item_parent', '45'),
(258, 48, '_menu_item_object_id', '48'),
(259, 48, '_menu_item_object', 'custom'),
(260, 48, '_menu_item_target', ''),
(261, 48, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(262, 48, '_menu_item_xfn', ''),
(263, 48, '_menu_item_url', '/'),
(265, 49, '_menu_item_type', 'custom'),
(266, 49, '_menu_item_menu_item_parent', '45'),
(267, 49, '_menu_item_object_id', '49'),
(268, 49, '_menu_item_object', 'custom'),
(269, 49, '_menu_item_target', ''),
(270, 49, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(271, 49, '_menu_item_xfn', ''),
(272, 49, '_menu_item_url', '/'),
(294, 2, 'hero', ''),
(274, 50, '_menu_item_type', 'custom'),
(275, 50, '_menu_item_menu_item_parent', '45'),
(276, 50, '_menu_item_object_id', '50'),
(277, 50, '_menu_item_object', 'custom'),
(278, 50, '_menu_item_target', ''),
(279, 50, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(280, 50, '_menu_item_xfn', ''),
(281, 50, '_menu_item_url', '/'),
(295, 2, '_hero', 'field_636526e27dc06'),
(299, 61, '_hero_content', 'field_636526f67dc08'),
(300, 61, 'hero', ''),
(301, 61, '_hero', 'field_636526e27dc06');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_posts`
--

DROP TABLE IF EXISTS `akr_posts`;
CREATE TABLE IF NOT EXISTS `akr_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_posts`
--

INSERT INTO `akr_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2022-11-03 21:21:29', '2022-11-03 20:21:29', '<!-- wp:paragraph -->\n<p>Witamy w WordPressie. To jest twój pierwszy wpis. Edytuj go lub usuń, a następnie zacznij pisać!</p>\n<!-- /wp:paragraph -->', 'Witaj, świecie!', '', 'publish', 'open', 'open', '', 'witaj-swiecie', '', '', '2022-11-03 21:21:29', '2022-11-03 20:21:29', '', 0, 'http://localhost/krovea/?p=1', 0, 'post', '', 1),
(2, 1, '2022-11-03 21:21:29', '2022-11-03 20:21:29', '', 'Krovea', '', 'publish', 'closed', 'open', '', 'przykladowa-strona', '', '', '2022-11-04 15:52:51', '2022-11-04 14:52:51', '', 0, 'http://localhost/krovea/?page_id=2', 0, 'page', '', 0),
(7, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:20:\"acf-options-naglowek\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}', 'Nagłówek', 'naglowek', 'publish', 'closed', 'closed', '', 'group_636424a7a4050', '', '', '2022-11-03 21:49:35', '2022-11-03 20:49:35', '', 0, 'http://localhost/krovea/?post_type=acf-field-group&#038;p=7', 0, 'acf-field-group', '', 0),
(8, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Logo', 'logo', 'publish', 'closed', 'closed', '', 'field_636424d5a5129', '', '', '2022-11-03 21:32:43', '2022-11-03 20:32:43', '', 7, 'http://localhost/krovea/?post_type=acf-field&p=8', 0, 'acf-field', '', 0),
(9, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:16:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}', 'Logo', 'logo', 'publish', 'closed', 'closed', '', 'field_636424a8a5128', '', '', '2022-11-03 21:32:43', '2022-11-03 20:32:43', '', 7, 'http://localhost/krovea/?post_type=acf-field&p=9', 1, 'acf-field', '', 0),
(10, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Dodatkowe przyciski', 'dodatkowe_przyciski', 'publish', 'closed', 'closed', '', 'field_636424f6a512a', '', '', '2022-11-03 21:32:43', '2022-11-03 20:32:43', '', 7, 'http://localhost/krovea/?post_type=acf-field&p=10', 2, 'acf-field', '', 0),
(3, 1, '2022-11-03 21:21:29', '2022-11-03 20:21:29', '<!-- wp:heading --><h2>Kim jesteśmy</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Adres naszej strony internetowej to: http://localhost/krovea.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Komentarze</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Kiedy odwiedzający witrynę zostawia komentarz, zbieramy dane widoczne w formularzu komentowania, jak i adres IP odwiedzającego oraz podpis jego przeglądarki jako pomoc przy wykrywaniu spamu.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Anonimizowany ciąg znaków utworzony z twojego adresu e-mail (zwany też hashem) może zostać przesłany do usługi Gravatar w celu sprawdzenia czy jest używany. Polityka prywatności usługi Gravatar jest dostępna pod adresem: https://automattic.com/privacy/. Po zatwierdzeniu komentarza twój obrazek profilowy jest widoczny publicznie w kontekście twojego komentarza.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli jesteś zarejestrowanym użytkownikiem i wgrywasz na witrynę obrazki, powinieneś unikać przesyłania obrazków z tagami EXIF lokalizacji. Odwiedzający stronę mogą pobrać i odczytać pełne dane lokalizacyjne z obrazków w witrynie.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Ciasteczka</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli skomentujesz coś w witrynie, będzie można wybrać opcję zapisu nazwy, adresu e-mail i witryny internetowej w ciasteczkach, dzięki którym podczas pisania kolejnych komentarzy powyższe informacje będą już dogodnie uzupełnione. Ciasteczka wygasają po roku.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jeśli odwiedzisz stronę logowania, utworzymy tymczasowe ciasteczko na potrzeby sprawdzenia czy twoja przeglądarka akceptuje ciasteczka. Nie zawiera ono żadnych danych osobistych i zostanie usunięte, kiedy przeglądarka zostanie zamknięta.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Podczas logowania tworzymy dodatkowo kilka ciasteczek potrzebnych do zapisu twoich informacji logowania oraz wybranych opcji ekranu. Ciasteczka logowania wygasają po dwóch dniach, a opcji ekranu po roku. Jeśli zaznaczysz opcję &bdquo;Pamiętaj mnie&rdquo;, logowanie wygaśnie po dwóch tygodniach. Jeśli wylogujesz się ze swojego konta, ciasteczka logowania zostaną usunięte.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Jeśli zmodyfikujesz albo opublikujesz artykuł, w twojej przeglądarce zostanie zapisane dodatkowe ciasteczko. To ciasteczko nie zawiera żadnych danych osobistych, wskazując po prostu na identyfikator przed chwilą edytowanego artykułu. Wygasa ono po 1 dniu.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Osadzone treści z innych witryn</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Artykuły na tej witrynie mogą zawierać osadzone treści (np. filmy, obrazki, artykuły itp.). Osadzone treści z innych witryn zachowują się analogicznie do tego, jakby użytkownik odwiedził bezpośrednio konkretną witrynę.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Witryny mogą zbierać informacje o tobie, używać ciasteczek, dołączać dodatkowe, zewnętrzne systemy śledzenia i monitorować twoje interakcje z osadzonym materiałem, włączając w to śledzenie twoich interakcji z osadzonym materiałem jeśli posiadasz konto i jesteś zalogowany w tamtej witrynie.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Z kim dzielimy się danymi</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zażądasz zresetowania hasła, twój adres IP zostanie dołączony do wysyłanej wiadomości.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Jak długo przechowujemy twoje dane</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli zostawisz komentarz, jego treść i metadane będą przechowywane przez czas nieokreślony. Dzięki temu jesteśmy w stanie rozpoznawać i zatwierdzać kolejne komentarze automatycznie, bez wysyłania ich do każdorazowej moderacji.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Dla użytkowników którzy zarejestrowali się na naszej stronie internetowej (jeśli tacy są), przechowujemy również informacje osobiste wprowadzone w profilu. Każdy użytkownik może dokonać wglądu, korekty albo skasować swoje informacje osobiste w dowolnej chwili (nie licząc nazwy użytkownika, której nie można zmienić). Administratorzy strony również mogą przeglądać i modyfikować te informacje.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Jakie masz prawa do swoich danych</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Jeśli masz konto użytkownika albo dodałeś komentarze w tej witrynie, możesz zażądać dostarczenia pliku z wyeksportowanym kompletem twoich danych osobistych będących w naszym posiadaniu, w tym całość tych dostarczonych przez ciebie. Możesz również zażądać usunięcia przez nas całości twoich danych osobistych w naszym posiadaniu. Nie dotyczy to żadnych danych które jesteśmy zobligowani zachować ze względów administracyjnych, prawnych albo bezpieczeństwa.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Gdzie wysłamy twoje dane</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Sugerowany tekst: </strong>Komentarze gości mogą być sprawdzane za pomocą automatycznej usługi wykrywania spamu.</p><!-- /wp:paragraph -->', 'Polityka prywatności', '', 'draft', 'closed', 'open', '', 'polityka-prywatnosci', '', '', '2022-11-03 21:21:29', '2022-11-03 20:21:29', '', 0, 'http://localhost/krovea/?page_id=3', 0, 'page', '', 0),
(4, 1, '2022-11-03 21:22:08', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'open', 'open', '', '', '', '', '2022-11-03 21:22:08', '0000-00-00 00:00:00', '', 0, 'http://localhost/krovea/?p=4', 0, 'post', '', 0),
(6, 1, '2022-11-03 21:23:05', '2022-11-03 20:23:05', '', 'Krovea', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2022-11-03 21:23:05', '2022-11-03 20:23:05', '', 2, 'http://localhost/krovea/?p=6', 0, 'revision', '', 0),
(5, 1, '2022-11-03 21:23:01', '2022-11-03 20:23:01', '<!-- wp:paragraph -->\n<p>Przykładowa strona. Strony są inne niż wpisy na blogu, ponieważ nie tylko znajdują się zawsze w jednym miejscu, ale także pojawiają się w menu witryny (w większości motywów). Większość użytkowników zaczyna od strony z informacjami o sobie, która zapozna ich przed odwiedzającymi witrynę. Taka strona może zawierać na przykład taką treść:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><!-- wp:paragraph -->\n<p>Cześć! Za dnia jestem kurierem rowerowym, nocą próbuję swoich sił w aktorstwie, a to jest moja witryna. Mieszkam w Krakowie, mam wspaniałego psa który wabi się Reks i lubię piña coladę (oraz spacery, gdy pada deszcz).</p>\n<!-- /wp:paragraph --></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...albo coś takiego:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><!-- wp:paragraph -->\n<p>Firma XYZ Doohickey została założona w 1971 roku i od tamtej pory dostarcza społeczeństwu dobrej jakości gadżety. Znajdująca się w Gotham City XYZ zatrudnia ponad 2000 osób i robi niesamowite rzeczy dla społeczności Gotham.</p>\n<!-- /wp:paragraph --></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Jako nowy użytkownik WordPressa, powinieneś przejść do <a href=\"http://localhost/krovea/wp-admin/\">swojego kokpitu</a> aby usunąć tę stronę i stworzyć nowe z własną treścią. Dobrej zabawy!</p>\n<!-- /wp:paragraph -->', 'Krovea', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2022-11-03 21:23:01', '2022-11-03 20:23:01', '', 2, 'http://localhost/krovea/?p=5', 0, 'revision', '', 0),
(11, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:13:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"table\";s:10:\"pagination\";i:0;s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:9:\"collapsed\";s:0:\"\";s:12:\"button_label\";s:0:\"\";s:13:\"rows_per_page\";i:20;}', 'Dodatkowe przyciski', 'additionals_btns', 'publish', 'closed', 'closed', '', 'field_63642502a512b', '', '', '2022-11-03 21:32:43', '2022-11-03 20:32:43', '', 7, 'http://localhost/krovea/?post_type=acf-field&p=11', 3, 'acf-field', '', 0),
(12, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:16:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:2:\"id\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}', 'Ikona', 'icon', 'publish', 'closed', 'closed', '', 'field_6364251aa512c', '', '', '2022-11-03 21:32:43', '2022-11-03 20:32:43', '', 11, 'http://localhost/krovea/?post_type=acf-field&p=12', 0, 'acf-field', '', 0),
(13, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}', 'Link', 'link', 'publish', 'closed', 'closed', '', 'field_6364252ea512d', '', '', '2022-11-03 21:40:34', '2022-11-03 20:40:34', '', 11, 'http://localhost/krovea/?post_type=acf-field&#038;p=13', 1, 'acf-field', '', 0),
(14, 1, '2022-11-03 21:32:43', '2022-11-03 20:32:43', 'a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}', 'Tytuł linka', 'title', 'publish', 'closed', 'closed', '', 'field_6364254ea512e', '', '', '2022-11-03 21:32:43', '2022-11-03 20:32:43', '', 11, 'http://localhost/krovea/?post_type=acf-field&p=14', 2, 'acf-field', '', 0),
(15, 1, '2022-11-03 21:37:09', '2022-11-03 20:37:09', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2022-11-03 22:21:49', '2022-11-03 21:21:49', '', 0, 'http://localhost/krovea/wp-content/uploads/2022/11/logo.svg', 0, 'attachment', 'image/svg+xml', 0),
(18, 1, '2022-11-03 21:40:00', '2022-11-03 20:40:00', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon', '', '', '2022-11-03 21:40:00', '2022-11-03 20:40:00', '', 0, 'http://localhost/krovea/wp-content/uploads/2022/11/favicon.png', 0, 'attachment', 'image/png', 0),
(19, 1, '2022-11-03 21:40:02', '2022-11-03 20:40:02', 'http://localhost/krovea/wp-content/uploads/2022/11/cropped-favicon.png', 'cropped-favicon.png', '', 'inherit', 'open', 'closed', '', 'cropped-favicon-png', '', '', '2022-11-03 21:40:02', '2022-11-03 20:40:02', '', 0, 'http://localhost/krovea/wp-content/uploads/2022/11/cropped-favicon.png', 0, 'attachment', 'image/png', 0),
(20, 1, '2022-11-03 21:40:15', '2022-11-03 20:40:15', '{\n    \"site_icon\": {\n        \"value\": 19,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2022-11-03 20:40:15\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'bab9238a-3fa9-4a0f-948d-e36400094de8', '', '', '2022-11-03 21:40:15', '2022-11-03 20:40:15', '', 0, 'http://localhost/krovea/2022/11/03/bab9238a-3fa9-4a0f-948d-e36400094de8/', 0, 'customize_changeset', '', 0),
(21, 1, '2022-11-03 21:41:10', '2022-11-03 20:41:10', '', 'user', '', 'inherit', 'open', 'closed', '', 'user', '', '', '2022-11-03 22:22:05', '2022-11-03 21:22:05', '', 0, 'http://localhost/krovea/wp-content/uploads/2022/11/user.svg', 0, 'attachment', 'image/svg+xml', 0),
(26, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=26', 27, 'nav_menu_item', '', 0),
(25, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=25', 26, 'nav_menu_item', '', 0),
(24, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'All Products', '', 'publish', 'closed', 'closed', '', 'all-products', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=24', 1, 'nav_menu_item', '', 0),
(27, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Men', '', 'publish', 'closed', 'closed', '', 'men', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=27', 2, 'nav_menu_item', '', 0),
(28, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Hoodies', '', 'publish', 'closed', 'closed', '', 'hoodies', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=28', 3, 'nav_menu_item', '', 0),
(29, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'T-shirts', '', 'publish', 'closed', 'closed', '', 't-shirts', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=29', 4, 'nav_menu_item', '', 0),
(30, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Sportswear', '', 'publish', 'closed', 'closed', '', 'sportswear', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=30', 5, 'nav_menu_item', '', 0),
(31, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Shoes', '', 'publish', 'closed', 'closed', '', 'shoes', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=31', 6, 'nav_menu_item', '', 0),
(32, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'News-In', '', 'publish', 'closed', 'closed', '', 'news-in', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=32', 7, 'nav_menu_item', '', 0),
(33, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Woomen', '', 'publish', 'closed', 'closed', '', 'woomen', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=33', 8, 'nav_menu_item', '', 0),
(34, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Hoodies', '', 'publish', 'closed', 'closed', '', 'hoodies-2', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=34', 9, 'nav_menu_item', '', 0),
(35, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'T-shirts', '', 'publish', 'closed', 'closed', '', 't-shirts-2', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=35', 10, 'nav_menu_item', '', 0),
(36, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Sportswear', '', 'publish', 'closed', 'closed', '', 'sportswear-2', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=36', 11, 'nav_menu_item', '', 0),
(37, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Shoes', '', 'publish', 'closed', 'closed', '', 'shoes-2', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=37', 12, 'nav_menu_item', '', 0),
(38, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'News-In', '', 'publish', 'closed', 'closed', '', 'news-in-2', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=38', 13, 'nav_menu_item', '', 0),
(39, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Kids', '', 'publish', 'closed', 'closed', '', 'kids', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=39', 14, 'nav_menu_item', '', 0),
(40, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'Hoodies', '', 'publish', 'closed', 'closed', '', 'hoodies-3', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=40', 15, 'nav_menu_item', '', 0),
(41, 1, '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 'T-shirts', '', 'publish', 'closed', 'closed', '', 't-shirts-3', '', '', '2022-11-03 21:47:26', '2022-11-03 20:47:26', '', 0, 'http://localhost/krovea/?p=41', 16, 'nav_menu_item', '', 0),
(42, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Sportswear', '', 'publish', 'closed', 'closed', '', 'sportswear-3', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=42', 17, 'nav_menu_item', '', 0),
(43, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Shoes', '', 'publish', 'closed', 'closed', '', 'shoes-3', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=43', 18, 'nav_menu_item', '', 0),
(44, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'News-In', '', 'publish', 'closed', 'closed', '', 'news-in-3', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=44', 19, 'nav_menu_item', '', 0),
(45, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Accessories', '', 'publish', 'closed', 'closed', '', 'accessories', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=45', 20, 'nav_menu_item', '', 0),
(46, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Hats', '', 'publish', 'closed', 'closed', '', 'hats', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=46', 21, 'nav_menu_item', '', 0),
(47, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Watches', '', 'publish', 'closed', 'closed', '', 'watches', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=47', 22, 'nav_menu_item', '', 0),
(48, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Belts', '', 'publish', 'closed', 'closed', '', 'belts', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=48', 23, 'nav_menu_item', '', 0),
(49, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Eyeglasses', '', 'publish', 'closed', 'closed', '', 'eyeglasses', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=49', 24, 'nav_menu_item', '', 0),
(50, 1, '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 'Jewlery', '', 'publish', 'closed', 'closed', '', 'jewlery', '', '', '2022-11-03 21:47:27', '2022-11-03 20:47:27', '', 0, 'http://localhost/krovea/?p=50', 25, 'nav_menu_item', '', 0),
(51, 1, '2022-11-03 21:49:35', '2022-11-03 20:49:35', 'a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Pasek darmowej dostawy', 'pasek_darowej_dostawy', 'publish', 'closed', 'closed', '', 'field_636428f966639', '', '', '2022-11-03 21:49:35', '2022-11-03 20:49:35', '', 7, 'http://localhost/krovea/?post_type=acf-field&p=51', 4, 'acf-field', '', 0),
(52, 1, '2022-11-03 21:49:35', '2022-11-03 20:49:35', 'a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}', 'Treść', 'free_shipping', 'publish', 'closed', 'closed', '', 'field_6364293e6663a', '', '', '2022-11-03 21:49:35', '2022-11-03 20:49:35', '', 7, 'http://localhost/krovea/?post_type=acf-field&p=52', 5, 'acf-field', '', 0),
(54, 1, '2022-11-03 23:17:09', '2022-11-03 22:17:09', '{\"version\": 2, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-krovea%2fresources', '', '', '2022-11-03 23:17:09', '2022-11-03 22:17:09', '', 0, 'http://localhost/krovea/2022/11/03/wp-global-styles-krovea%2fresources/', 0, 'wp_global_styles', '', 0),
(56, 1, '2022-11-03 23:48:33', '0000-00-00 00:00:00', '', 'Automatycznie zapisany szkic', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2022-11-03 23:48:33', '0000-00-00 00:00:00', '', 0, 'http://localhost/krovea/?post_type=acf-field-group&p=56', 0, 'acf-field-group', '', 0),
(57, 1, '2022-11-04 15:51:43', '2022-11-04 14:51:43', 'a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"page_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:10:\"front_page\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}', 'Hero', 'hero', 'publish', 'closed', 'closed', '', 'group_636526cf39834', '', '', '2022-11-04 15:51:57', '2022-11-04 14:51:57', '', 0, 'http://localhost/krovea/?post_type=acf-field-group&#038;p=57', 0, 'acf-field-group', '', 0),
(58, 1, '2022-11-04 15:51:43', '2022-11-04 14:51:43', 'a:8:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"group\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:6:\"layout\";s:5:\"block\";s:10:\"sub_fields\";a:0:{}}', 'Hero', 'hero', 'publish', 'closed', 'closed', '', 'field_636526e27dc06', '', '', '2022-11-04 15:51:43', '2022-11-04 14:51:43', '', 57, 'http://localhost/krovea/?post_type=acf-field&p=58', 0, 'acf-field', '', 0),
(59, 1, '2022-11-04 15:51:43', '2022-11-04 14:51:43', 'a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}', 'Tytuł', 'title', 'publish', 'closed', 'closed', '', 'field_636526ee7dc07', '', '', '2022-11-04 15:51:43', '2022-11-04 14:51:43', '', 58, 'http://localhost/krovea/?post_type=acf-field&p=59', 0, 'acf-field', '', 0),
(60, 1, '2022-11-04 15:51:43', '2022-11-04 14:51:43', 'a:11:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:7:\"wysiwyg\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:4:\"tabs\";s:3:\"all\";s:7:\"toolbar\";s:4:\"full\";s:12:\"media_upload\";i:1;s:5:\"delay\";i:0;}', 'Treść', 'content', 'publish', 'closed', 'closed', '', 'field_636526f67dc08', '', '', '2022-11-04 15:51:43', '2022-11-04 14:51:43', '', 58, 'http://localhost/krovea/?post_type=acf-field&p=60', 1, 'acf-field', '', 0),
(61, 1, '2022-11-04 15:52:51', '2022-11-04 14:52:51', '', 'Krovea', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2022-11-04 15:52:51', '2022-11-04 14:52:51', '', 2, 'http://localhost/krovea/?p=61', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_termmeta`
--

DROP TABLE IF EXISTS `akr_termmeta`;
CREATE TABLE IF NOT EXISTS `akr_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_terms`
--

DROP TABLE IF EXISTS `akr_terms`;
CREATE TABLE IF NOT EXISTS `akr_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_terms`
--

INSERT INTO `akr_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Bez kategorii', 'bez-kategorii', 0),
(2, 'Menu', 'menu', 0),
(3, 'krovea/resources', 'krovea-resources', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_term_relationships`
--

DROP TABLE IF EXISTS `akr_term_relationships`;
CREATE TABLE IF NOT EXISTS `akr_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_term_relationships`
--

INSERT INTO `akr_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(27, 2, 0),
(24, 2, 0),
(28, 2, 0),
(29, 2, 0),
(30, 2, 0),
(31, 2, 0),
(32, 2, 0),
(33, 2, 0),
(34, 2, 0),
(35, 2, 0),
(36, 2, 0),
(37, 2, 0),
(38, 2, 0),
(39, 2, 0),
(40, 2, 0),
(41, 2, 0),
(42, 2, 0),
(43, 2, 0),
(44, 2, 0),
(45, 2, 0),
(46, 2, 0),
(47, 2, 0),
(48, 2, 0),
(49, 2, 0),
(50, 2, 0),
(25, 2, 0),
(26, 2, 0),
(54, 3, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_term_taxonomy`
--

DROP TABLE IF EXISTS `akr_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `akr_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_term_taxonomy`
--

INSERT INTO `akr_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 27),
(3, 3, 'wp_theme', '', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_usermeta`
--

DROP TABLE IF EXISTS `akr_usermeta`;
CREATE TABLE IF NOT EXISTS `akr_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_usermeta`
--

INSERT INTO `akr_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'marcin.devjs'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'akr_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'akr_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '0'),
(16, 1, 'session_tokens', 'a:3:{s:64:\"e96958e550e7c02ce18fd26357d06b3414c2e3dce527a5a931ce82bf42be32ee\";a:4:{s:10:\"expiration\";i:1667679726;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36\";s:5:\"login\";i:1667506926;}s:64:\"8f1bf883881bdf88001555d3f8ab7ad5e153e3edba87763209a8309b945e066f\";a:4:{s:10:\"expiration\";i:1667746115;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36\";s:5:\"login\";i:1667573315;}s:64:\"cf42f54e16857a7b43b1af24c84e4523cbe1986ea9fe65496b42377813d78e27\";a:4:{s:10:\"expiration\";i:1668783036;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36\";s:5:\"login\";i:1667573436;}}'),
(17, 1, 'akr_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:60:\"dashboard_site_health,dashboard_activity,dashboard_right_now\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
(19, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(20, 1, 'metaboxhidden_dashboard', 'a:4:{i:0;s:18:\"dashboard_activity\";i:1;s:19:\"dashboard_right_now\";i:2;s:21:\"dashboard_quick_press\";i:3;s:17:\"dashboard_primary\";}'),
(21, 1, 'akr_user-settings', 'libraryContent=browse'),
(22, 1, 'akr_user-settings-time', '1667507917'),
(23, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(24, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `akr_users`
--

DROP TABLE IF EXISTS `akr_users`;
CREATE TABLE IF NOT EXISTS `akr_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Zrzut danych tabeli `akr_users`
--

INSERT INTO `akr_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'marcin.devjs', '$P$BusDCWA0y2gre9l/NnWYcI/rnB3Qgv0', 'marcin-devjs', 'm.kowalski.devjs@gmail.com', 'http://localhost/krovea', '2022-11-03 20:21:29', '', 0, 'marcin.devjs');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
