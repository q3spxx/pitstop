-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 01 2018 г., 14:44
-- Версия сервера: 5.5.57-log
-- Версия PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vh292800_pitstop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify`
--

CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_admin_notify`
--

INSERT INTO `b_admin_notify` (`ID`, `MODULE_ID`, `TAG`, `MESSAGE`, `ENABLE_CLOSE`, `PUBLIC_SECTION`, `NOTIFY_TYPE`) VALUES
(160, 'MAIN', 'BACKUP', 'The last automatic backup has failed. Please check your <a href=\"/bitrix/admin/event_log.php?set_filter=Y&find_type=audit_type_id&find_audit_type[]=BACKUP_ERROR\">system log<a>', 'Y', 'N', 'E'),
(163, 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href=\"/bitrix/admin/site_checker.php?lang=ru&start_test=Y\">Проверить и исправить.</a>', 'Y', 'N', 'M');

-- --------------------------------------------------------

--
-- Структура таблицы `b_admin_notify_lang`
--

CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_admin_notify_lang`
--

INSERT INTO `b_admin_notify_lang` (`ID`, `NOTIFY_ID`, `LID`, `MESSAGE`) VALUES
(13, 160, 'ru', 'В процессе создания резервной копии произошла ошибка. Подробности в <a href=\"/bitrix/admin/event_log.php?set_filter=Y&find_type=audit_type_id&find_audit_type[]=BACKUP_ERROR\">системном журнале</a>'),
(14, 160, 'ua', 'В процессе создания резервной копии произошла ошибка. Подробности в <a href=\"/bitrix/admin/event_log.php?set_filter=Y&find_type=audit_type_id&find_audit_type[]=BACKUP_ERROR\">системном журнале</a>'),
(15, 160, 'en', ''),
(16, 160, 'de', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_agent`
--

CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_agent`
--

INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`) VALUES
(1, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2018-07-01 11:28:34', '2018-07-02 11:28:34', NULL, 86400, 'N', NULL, 'N'),
(2, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2018-07-01 11:28:34', '2018-07-02 11:28:34', NULL, 86400, 'N', NULL, 'N'),
(3, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2018-07-01 13:13:33', '2018-07-01 14:13:33', NULL, 3600, 'N', NULL, 'N'),
(4, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2018-07-01 11:28:34', '2018-07-02 11:28:34', NULL, 86400, 'N', NULL, 'N'),
(5, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2018-07-01 11:28:34', '2018-07-02 11:28:34', NULL, 86400, 'N', NULL, 'N'),
(6, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2018-07-01 11:28:35', '2018-07-02 11:28:35', NULL, 86400, 'N', NULL, 'N'),
(7, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2018-07-01 14:11:35', '2018-07-01 14:12:35', NULL, 60, 'N', NULL, 'N'),
(8, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2018-07-01 11:28:35', '2018-07-02 11:28:35', NULL, 86400, 'N', NULL, 'N'),
(9, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2018-07-01 11:28:35', '2018-07-02 11:28:35', NULL, 86400, 'N', NULL, 'N'),
(10, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2018-07-01 13:13:33', '2018-07-01 14:13:33', NULL, 3600, 'N', NULL, 'N'),
(11, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2018-07-01 11:28:35', '2018-07-02 11:28:35', NULL, 86400, 'N', NULL, 'N'),
(12, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2018-07-01 13:13:33', '2018-07-01 14:13:33', NULL, 3600, 'N', NULL, 'N'),
(62, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2018-07-01 11:28:35', '2018-07-02 11:28:35', NULL, 86400, 'N', NULL, 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_app_password`
--

CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_b24connector_buttons`
--

CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_bitrixcloud_option`
--

CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_bitrixcloud_option`
--

INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
(4, 'monitoring_expire_time', 0, '0', '1530414414'),
(5, 'backup_files', 0, '20180608_051519_13839390.enc.gz', '68050735'),
(6, 'backup_files', 1, '20180608_051519_13839390.enc.gz.1', '82122924'),
(7, 'backup_files', 2, '20180608_051519_13839390.enc.gz.2', '94144163'),
(8, 'backup_files', 3, '20180608_051519_13839390.enc.gz.3', '13085982'),
(9, 'backup_files', 4, '20180615_050808_72799284.enc.gz', '68040961'),
(10, 'backup_files', 5, '20180615_050808_72799284.enc.gz.1', '82129835'),
(11, 'backup_files', 6, '20180615_050808_72799284.enc.gz.2', '94135108'),
(12, 'backup_files', 7, '20180615_050808_72799284.enc.gz.3', '13117789'),
(13, 'backup_files', 8, '20180622_053509_66727021.enc.gz', '68042475'),
(14, 'backup_files', 9, '20180622_053509_66727021.enc.gz.1', '82127553'),
(15, 'backup_files', 10, '20180622_053509_66727021.enc.gz.2', '94140832'),
(16, 'backup_files', 11, '20180622_053509_66727021.enc.gz.3', '13102544'),
(17, 'backup_quota', 0, '0', '2147483648'),
(18, 'backup_total_size', 0, '0', '772240901'),
(19, 'backup_last_backup_time', 0, '0', '1529704996');

-- --------------------------------------------------------

--
-- Структура таблицы `b_cache_tag`
--

CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_cache_tag`
--

INSERT INTO `b_cache_tag` (`SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
(NULL, NULL, '0:1530434657', '**'),
('s1', '/74c', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/7a8', '/s1/bitrix/search.tags.cloud/7a8', 'bitrix:search.tags.cloud'),
('s1', '/7a8', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/e25', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/6f8', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/fc1', '/s1/bitrix/search.tags.cloud/fc1', 'bitrix:search.tags.cloud'),
('s1', '/fc1', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/749', '/s1/bitrix/news.list/749', 'iblock_id_8'),
('s1', '/749', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/e37', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/40e', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/315', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/fbe', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/23c', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/9ae', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/7a8', '/s1/bitrix/news.list/7a8', 'iblock_id_14'),
('s1', '/74c', '/s1/bitrix/news.detail/74c', 'iblock_id_14'),
('s1', '/c0b', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/61e', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/e37', '/s1/bitrix/news.detail/e37', 'iblock_id_1'),
('s1', '/fc1', '/s1/bitrix/news.list/fc1', 'iblock_id_1'),
('s1', '/61e', '/s1/bitrix/news.detail/61e', 'iblock_id_15'),
('s1', '/fbe', '/s1/bitrix/news.list/fbe', 'iblock_id_7'),
('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_9'),
('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_7'),
('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_1'),
('s1', '/e25', '/s1/bitrix/news.list/e25', 'iblock_id_6'),
('s1', '/40e', '/s1/bitrix/news.list/40e', 'iblock_id_5'),
('s1', '/40e', '/s1/bitrix/news.detail/40e', 'iblock_id_5'),
('s1', '/50b', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/803', '/s1/bitrix/news.list/803', 'iblock_id_5'),
('s1', '/dc7', '/s1/bitrix/news.list/dc7', 'iblock_id_5'),
('s1', '/2e9', '/s1/bitrix/news.list/2e9', 'iblock_id_5'),
('s1', '/d80', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/6bd', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/654', '/s1/bitrix/news.list/345', 'iblock_id_8'),
('s1', '/6bd', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/e25', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/315', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/6f8', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/50b', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/40e', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/fbe', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/749', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/7a8', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/e37', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/fc1', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/74c', '/s1/bitrix/menu/06f', 'bitrix:menu'),
('s1', '/61e', '/s1/bitrix/menu/06f', 'bitrix:menu');

-- --------------------------------------------------------

--
-- Структура таблицы `b_captcha`
--

CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_checklist`
--

CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_checklist`
--

INSERT INTO `b_checklist` (`ID`, `DATE_CREATE`, `TESTER`, `COMPANY_NAME`, `PICTURE`, `TOTAL`, `SUCCESS`, `FAILED`, `PENDING`, `SKIP`, `STATE`, `REPORT_COMMENT`, `REPORT`, `EMAIL`, `PHONE`, `SENDED_TO_BITRIX`, `HIDDEN`) VALUES
(1, '17.01.2018 11:08:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a:65:{s:6:\"QD0020\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:2:{s:6:\"SYSTEM\";a:2:{s:7:\"PREVIEW\";s:54:\"Проверено: 2 шаблон(a,ов) сайта.\";s:6:\"DETAIL\";s:0:\"\";}s:8:\"PERFOMER\";s:31:\"Панель отключена\";}}s:6:\"QD0010\";a:2:{s:8:\"COMMENTS\";N;s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0050\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0080\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0090\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0100\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0110\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QD0120\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QM0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QM0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QS0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0030\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:96:\"У всех кастомизированных компонентов есть описания!\";}}}s:6:\"QC0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0050\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0080\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0090\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:36:\"Проверено файлов: 41\n\";}}}s:6:\"QC0100\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0110\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0120\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0130\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0140\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0150\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QC0160\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QE0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0010\";a:2:{s:8:\"COMMENTS\";a:2:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:137:\"Модуль проактивной защиты не установлен либо в вашу редакцию он не входит.\n\";}s:8:\"PERFOMER\";s:50:\"Не входит в редакцию \"Старт\"\";}s:6:\"STATUS\";s:1:\"A\";}s:8:\"QSEC0020\";a:2:{s:8:\"COMMENTS\";a:2:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:129:\"Уровень безопасности административной группы не является повышенным\n\";}s:8:\"PERFOMER\";s:96:\"Двухфакторная авторизация - на усмотрение заказчика\";}s:6:\"STATUS\";s:1:\"A\";}s:8:\"QSEC0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0040\";a:2:{s:8:\"COMMENTS\";a:1:{s:8:\"PERFOMER\";s:44:\"Тестовые данные удалены\";}s:6:\"STATUS\";s:1:\"A\";}s:8:\"QSEC0050\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:82:\"Недочетов не выявлено. Пароль к БД безопасен.\";}}}s:8:\"QSEC0060\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:0:{}}}s:8:\"QSEC0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:8:\"QSEC0080\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:2:{s:7:\"PREVIEW\";s:97:\"Проверенно файлов: 79 Найдено потенциальных проблем: 0\";s:6:\"DETAIL\";s:0:\"\";}}}s:6:\"QP0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0020\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:123:\"Конфигурация PHP <a href=\"/bitrix/admin/perfmon_php.php?lang=ru\" target=\"_blank\">неоптимальна</a>.\n\";}}}s:6:\"QP0030\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:48:\"Автокеширование включено\n\";}}}s:6:\"QP0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0050\";a:2:{s:6:\"STATUS\";s:1:\"F\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:231:\"Проверка не удалась. Проведите тестирование конфигурации в <a href=\"/bitrix/admin/perfmon_panel.php?lang=ru\" target=\"_blank\">панели производительности</a>.\n\";}}}s:6:\"QP0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0070\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0080\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QP0100\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0010\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0020\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QH0050\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:119:\"Резервное копирование осуществляется. В папке /bitrix/backup 4 файл(a,ов)\";}}}s:6:\"QH0060\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QJ0010\";a:2:{s:6:\"STATUS\";s:1:\"A\";s:8:\"COMMENTS\";a:1:{s:6:\"SYSTEM\";a:1:{s:7:\"PREVIEW\";s:56:\"Лицензионный ключ активирован\";}}}s:6:\"QJ0020\";a:2:{s:8:\"COMMENTS\";a:2:{s:6:\"SYSTEM\";a:2:{s:7:\"PREVIEW\";s:120:\"Проверено файлов: 8293\nПроверено модулей: 12\nМодифицировано файлов: 8\";s:6:\"DETAIL\";s:2111:\"<div class=\"checklist-dot-line\"></div>Модуль bitrixcloud не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль clouds не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль compression не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль fileman не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль highloadblock не модифицировался\n<div class=\"checklist-dot-line\"></div>В модуле iblock модифицированы файлы:\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/.default/bitrix/news.list/list/template.php\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/web20/bitrix/news.list/list/template.php\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/.default/template.php\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/official/template.php\n<div class=\"checklist-dot-line\"></div>В модуле main модифицированы файлы:\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/breadcrumb/templates/.default/template.php\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/menu/templates/horizontal_multilevel/template.php\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/.default/template.php\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/orange/template.php\n<div class=\"checklist-dot-line\"></div>Модуль perfmon не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль search не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль seo не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль socialservices не модифицировался\n<div class=\"checklist-dot-line\"></div>Модуль translate не модифицировался\n\";}s:8:\"PERFOMER\";s:173:\"Модифицированы только шаблоны компонентов, все модификации перенесены в текущий шаблон сайта\";}s:6:\"STATUS\";s:1:\"A\";}s:6:\"QJ0030\";a:1:{s:6:\"STATUS\";s:1:\"W\";}s:6:\"QJ0040\";a:1:{s:6:\"STATUS\";s:1:\"W\";}}', NULL, 'N', NULL, NULL, 'N', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_bucket`
--

CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_resize`
--

CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_clouds_file_upload`
--

CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_component_params`
--

CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_component_params`
--

INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
(111, 's1', 'bitrix:breadcrumb', '', '/aktsii/index.php', 'N', NULL, 97, 281, 'a:3:{s:10:\"START_FROM\";s:1:\"0\";s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";}'),
(166, 's1', 'bitrix:breadcrumb', '', '/contacts/index.php', 'N', NULL, 161, 291, 'a:3:{s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";s:10:\"START_FROM\";s:1:\"0\";}'),
(177, 's1', 'bitrix:breadcrumb', '', '/site-map/index.php', 'N', NULL, 103, 263, 'a:3:{s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";s:10:\"START_FROM\";s:1:\"0\";}'),
(178, 's1', 'bitrix:news.detail', 'site-map', '/site-map/index.php', 'N', NULL, 1853, 4341, 'a:46:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:0:\"\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:12:\"ELEMENT_CODE\";s:0:\"\";s:10:\"ELEMENT_ID\";s:2:\"94\";s:10:\"FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:9:\"IBLOCK_ID\";s:2:\"15\";s:11:\"IBLOCK_TYPE\";s:5:\"servo\";s:10:\"IBLOCK_URL\";s:0:\"\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:16:\"Страница\";s:13:\"PROPERTY_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"SET_BROWSER_TITLE\";s:1:\"N\";s:17:\"SET_CANONICAL_URL\";s:1:\"N\";s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:20:\"SET_META_DESCRIPTION\";s:1:\"N\";s:17:\"SET_META_KEYWORDS\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"Y\";s:9:\"SET_TITLE\";s:1:\"N\";s:8:\"SHOW_404\";s:1:\"N\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";}'),
(199, 's1', 'bitrix:breadcrumb', '', '/cafe/index.php', 'N', NULL, 523, 707, 'a:3:{s:10:\"START_FROM\";s:1:\"0\";s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";}'),
(200, 's1', 'bitrix:news.list', 'cafe', '/cafe/index.php', 'N', NULL, 877, 2884, 'a:39:{s:11:\"IBLOCK_TYPE\";s:4:\"cafe\";s:9:\"IBLOCK_ID\";s:1:\"8\";s:10:\"NEWS_COUNT\";s:3:\"100\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:13:\"PROPERTY_CODE\";a:1:{i:0;s:4:\"cafe\";}s:11:\"SECTION_URL\";s:30:\"/#IBLOCK_CODE#/#SECTION_CODE#/\";s:10:\"DETAIL_URL\";s:21:\"/#SECTION_CODE#/#ID#/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:2:\"10\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:16:\"Франшиза\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";}'),
(231, 's1', 'bitrix:breadcrumb', '', '/menu/index.php', 'N', NULL, 496, 626, 'a:3:{s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";s:10:\"START_FROM\";s:1:\"0\";}'),
(232, 's1', 'bitrix:news', 'menu', '/menu/index.php', 'Y', '/menu/', 643, 3000, 'a:74:{s:17:\"ADD_ELEMENT_CHAIN\";s:1:\"Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"Y\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"Y\";s:13:\"BROWSER_TITLE\";s:1:\"-\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:8:\"36000000\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:9:\"COLOR_NEW\";s:6:\"3E74E6\";s:9:\"COLOR_OLD\";s:6:\"C0C0C0\";s:25:\"DETAIL_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:27:\"DETAIL_DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:24:\"DETAIL_DISPLAY_TOP_PAGER\";s:1:\"N\";s:17:\"DETAIL_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:21:\"DETAIL_PAGER_SHOW_ALL\";s:1:\"Y\";s:21:\"DETAIL_PAGER_TEMPLATE\";s:0:\"\";s:18:\"DETAIL_PAGER_TITLE\";s:16:\"Страница\";s:20:\"DETAIL_PROPERTY_CODE\";a:2:{i:0;s:14:\"menucategories\";i:1;s:0:\"\";}s:24:\"DETAIL_SET_CANONICAL_URL\";s:1:\"N\";s:17:\"DISPLAY_AS_RATING\";s:6:\"rating\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"Y\";s:12:\"DISPLAY_DATE\";s:1:\"Y\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:8:\"FONT_MAX\";s:2:\"50\";s:8:\"FONT_MIN\";s:2:\"10\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"5\";s:11:\"IBLOCK_TYPE\";s:4:\"menu\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:23:\"LIST_ACTIVE_DATE_FORMAT\";s:5:\"d.m.Y\";s:15:\"LIST_FIELD_CODE\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:18:\"LIST_PROPERTY_CODE\";a:3:{i:0;s:0:\"\";i:1;s:14:\"menucategories\";i:2;s:0:\"\";}s:11:\"MESSAGE_404\";s:0:\"\";s:16:\"META_DESCRIPTION\";s:1:\"-\";s:13:\"META_KEYWORDS\";s:1:\"-\";s:10:\"NEWS_COUNT\";s:2:\"50\";s:22:\"PAGER_BASE_LINK_ENABLE\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:8:\".default\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:15:\"PERIOD_NEW_TAGS\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:0:\"\";s:10:\"SEF_FOLDER\";s:6:\"/menu/\";s:8:\"SEF_MODE\";s:1:\"Y\";s:17:\"SEF_URL_TEMPLATES\";a:3:{s:6:\"detail\";s:15:\"#ELEMENT_CODE#/\";s:4:\"news\";s:0:\"\";s:7:\"section\";s:0:\"\";}s:17:\"SET_LAST_MODIFIED\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"Y\";s:8:\"SHOW_404\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:4:\"SORT\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:3:\"ASC\";s:20:\"STRICT_SECTION_CHECK\";s:1:\"N\";s:19:\"TAGS_CLOUD_ELEMENTS\";s:3:\"150\";s:16:\"TAGS_CLOUD_WIDTH\";s:4:\"100%\";s:14:\"USE_CATEGORIES\";s:1:\"N\";s:10:\"USE_FILTER\";s:1:\"N\";s:15:\"USE_PERMISSIONS\";s:1:\"N\";s:10:\"USE_RATING\";s:1:\"N\";s:7:\"USE_RSS\";s:1:\"N\";s:10:\"USE_SEARCH\";s:1:\"N\";s:9:\"USE_SHARE\";s:1:\"N\";}'),
(233, 's1', 'bitrix:breadcrumb', '', '/franchising/index.php', 'N', NULL, 530, 714, 'a:3:{s:10:\"START_FROM\";s:1:\"0\";s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";}'),
(234, 's1', 'bitrix:news.list', 'franch', '/franchising/index.php', 'N', NULL, 880, 2733, 'a:37:{s:11:\"IBLOCK_TYPE\";s:6:\"franch\";s:9:\"IBLOCK_ID\";s:1:\"7\";s:10:\"NEWS_COUNT\";s:1:\"3\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:32:\"/news/#SECTION_ID#/#ELEMENT_ID#/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:2:\"10\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:16:\"Франшиза\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";}'),
(259, 's1', 'bitrix:breadcrumb', '', '/menu/index_old.php', 'N', NULL, 97, 281, 'a:3:{s:10:\"START_FROM\";s:1:\"0\";s:4:\"PATH\";s:0:\"\";s:7:\"SITE_ID\";s:1:\"-\";}'),
(260, 's1', 'bitrix:news.list', 'menu-list', '/menu/index_old.php', 'N', NULL, 1977, 4052, 'a:41:{s:11:\"IBLOCK_TYPE\";s:4:\"menu\";s:9:\"IBLOCK_ID\";s:1:\"5\";s:10:\"NEWS_COUNT\";s:3:\"100\";s:8:\"SORT_BY1\";s:23:\"PROPERTY_menucategories\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:8:\"SORT_BY2\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER2\";s:4:\"DESC\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:13:\"PROPERTY_CODE\";a:1:{i:0;s:4:\"cafe\";}s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:2:\"10\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:8:\"Меню\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";}'),
(275, 's1', 'bitrix:news.list', 'slider-list', '/index.php', 'N', NULL, 834, 2001, 'a:37:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:2:\"10\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:19:\"/menu/#ELEMENT_ID#/\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"9\";s:11:\"IBLOCK_TYPE\";s:4:\"menu\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:10:\"NEWS_COUNT\";s:2:\"50\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:11:\"PAGER_TITLE\";s:8:\"Меню\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";}'),
(276, 's1', 'bitrix:news.list', 'franch', '/index.php', 'N', NULL, 4023, 5203, 'a:37:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:2:\"10\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:32:\"/news/#SECTION_ID#/#ELEMENT_ID#/\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"7\";s:11:\"IBLOCK_TYPE\";s:6:\"franch\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:10:\"NEWS_COUNT\";s:1:\"3\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:11:\"PAGER_TITLE\";s:16:\"Франшиза\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";}'),
(277, 's1', 'bitrix:news.list', 'index-news', '/index.php', 'N', NULL, 6246, 7542, 'a:41:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:2:\"10\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:32:\"/news/#SECTION_ID#/#ELEMENT_ID#/\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"1\";s:11:\"IBLOCK_TYPE\";s:4:\"news\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:10:\"NEWS_COUNT\";s:1:\"4\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:11:\"PAGER_TITLE\";s:14:\"Новости\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:3:\"300\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:8:\"SORT_BY1\";s:11:\"ACTIVE_FROM\";s:8:\"SORT_BY2\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_ORDER1\";s:4:\"DESC\";s:11:\"SORT_ORDER2\";s:4:\"DESC\";}'),
(278, 's1', 'bitrix:news.list', 'gallery-list', '/index.php', 'N', NULL, 7938, 9106, 'a:37:{s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:9:\"AJAX_MODE\";s:1:\"N\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:10:\"CACHE_TIME\";s:2:\"10\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:10:\"DETAIL_URL\";s:19:\"/menu/#ELEMENT_ID#/\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:9:\"IBLOCK_ID\";s:1:\"6\";s:11:\"IBLOCK_TYPE\";s:4:\"menu\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:10:\"NEWS_COUNT\";s:2:\"60\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:11:\"PAGER_TITLE\";s:8:\"Меню\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";}'),
(282, 's1', 'bitrix:menu', 'horizontal_multilevel', '/bitrix/templates/pitstop/header.php', 'N', NULL, 2141, 2776, 'a:8:{s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:9:\"MAX_LEVEL\";s:1:\"2\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:7:\"USE_EXT\";s:1:\"Y\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:15:\"MENU_CACHE_TIME\";s:8:\"36000000\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:19:\"MENU_CACHE_GET_VARS\";s:0:\"\";}'),
(287, 's1', 'bitrix:system.auth.authorize', 'flat2', '/auth/index.php', 'N', NULL, 197, 346, 'a:2:{s:11:\"AUTH_RESULT\";s:29:\"={$APPLICATION->arAuthResult}\";s:14:\"NOT_SHOW_LINKS\";s:1:\"Y\";}'),
(289, 's1', 'bitrix:news.list', 'cafe-map', '/bitrix/templates/pitstop/footer.php', 'N', NULL, 13597, 15549, 'a:38:{s:11:\"IBLOCK_TYPE\";s:4:\"cafe\";s:9:\"IBLOCK_ID\";s:1:\"8\";s:10:\"NEWS_COUNT\";s:3:\"100\";s:11:\"CHECK_DATES\";s:1:\"Y\";s:13:\"PROPERTY_CODE\";a:1:{i:0;s:4:\"cafe\";}s:10:\"DETAIL_URL\";s:32:\"/news/#SECTION_ID#/#ELEMENT_ID#/\";s:9:\"AJAX_MODE\";s:1:\"N\";s:18:\"AJAX_OPTION_SHADOW\";s:1:\"N\";s:16:\"AJAX_OPTION_JUMP\";s:1:\"N\";s:17:\"AJAX_OPTION_STYLE\";s:1:\"N\";s:19:\"AJAX_OPTION_HISTORY\";s:1:\"N\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:2:\"10\";s:12:\"CACHE_FILTER\";s:1:\"N\";s:12:\"CACHE_GROUPS\";s:1:\"Y\";s:20:\"PREVIEW_TRUNCATE_LEN\";s:4:\"1500\";s:18:\"ACTIVE_DATE_FORMAT\";s:5:\"d-m-Y\";s:13:\"DISPLAY_PANEL\";s:1:\"N\";s:9:\"SET_TITLE\";s:1:\"N\";s:14:\"SET_STATUS_404\";s:1:\"N\";s:25:\"INCLUDE_IBLOCK_INTO_CHAIN\";s:1:\"N\";s:18:\"ADD_SECTIONS_CHAIN\";s:1:\"N\";s:24:\"HIDE_LINK_WHEN_NO_DETAIL\";s:1:\"N\";s:14:\"PARENT_SECTION\";s:0:\"\";s:19:\"PARENT_SECTION_CODE\";s:0:\"\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:16:\"Франшиза\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:14:\"PAGER_TEMPLATE\";s:0:\"\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:4:\"3600\";s:14:\"PAGER_SHOW_ALL\";s:1:\"N\";s:12:\"DISPLAY_DATE\";s:1:\"N\";s:12:\"DISPLAY_NAME\";s:1:\"Y\";s:15:\"DISPLAY_PICTURE\";s:1:\"Y\";s:20:\"DISPLAY_PREVIEW_TEXT\";s:1:\"Y\";s:22:\"AJAX_OPTION_ADDITIONAL\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_log`
--

CREATE TABLE `b_composite_log` (
  `ID` int(18) NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(18) NOT NULL DEFAULT '0',
  `PAGE_ID` int(18) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_composite_page`
--

CREATE TABLE `b_composite_page` (
  `ID` int(18) NOT NULL,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `REWRITES` int(18) NOT NULL DEFAULT '0',
  `SIZE` int(18) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_agreement`
--

CREATE TABLE `b_consent_agreement` (
  `ID` int(18) NOT NULL,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_field`
--

CREATE TABLE `b_consent_field` (
  `ID` int(18) NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_consent_user_consent`
--

CREATE TABLE `b_consent_user_consent` (
  `ID` int(18) NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_counter_data`
--

CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_culture`
--

CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_culture`
--

INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`) VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y'),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event`
--

CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_attachment`
--

CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_log`
--

CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_log`
--

INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
(342, '2018-06-24 06:51:50', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(343, '2018-06-25 07:29:30', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(344, '2018-06-26 07:30:39', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(345, '2018-06-27 07:48:30', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(346, '2018-06-27 13:32:05', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '176.101.120.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 YaBrowser/18.4.1.872 Yowser/2.5 Safari/537.36', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fmenu%2Findex_old.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"menu/index_old.php\";}'),
(347, '2018-06-27 13:33:05', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '176.101.120.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 YaBrowser/18.4.1.872 Yowser/2.5 Safari/537.36', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fmenu%2Findex_old.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"menu/index_old.php\";}'),
(348, '2018-06-27 13:34:39', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '176.101.120.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 YaBrowser/18.4.1.872 Yowser/2.5 Safari/537.36', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fmenu%2Findex_old.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"menu/index_old.php\";}'),
(349, '2018-06-27 13:34:44', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '176.101.120.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 YaBrowser/18.4.1.872 Yowser/2.5 Safari/537.36', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fmenu%2Findex_old.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"menu/index_old.php\";}'),
(350, '2018-06-27 13:34:56', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '176.101.120.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 YaBrowser/18.4.1.872 Yowser/2.5 Safari/537.36', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fmenu%2Findex_old.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"menu/index_old.php\";}'),
(351, '2018-06-27 13:35:04', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '176.101.120.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 YaBrowser/18.4.1.872 Yowser/2.5 Safari/537.36', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fmenu%2Findex_old.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"menu/index_old.php\";}'),
(352, '2018-06-28 08:10:07', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/favicon.ico', 's1', NULL, NULL, ''),
(353, '2018-06-28 08:33:56', 'UNKNOWN', 'FILE_ADD', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_html_edit.php?lang=ru', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(354, '2018-06-28 08:40:49', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(355, '2018-06-28 08:41:38', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(356, '2018-06-28 08:43:06', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(357, '2018-06-28 08:49:22', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(358, '2018-06-28 08:49:47', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(359, '2018-06-28 08:49:56', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(360, '2018-06-28 08:57:29', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(361, '2018-06-28 08:58:28', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(362, '2018-06-28 08:58:48', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(363, '2018-06-28 09:11:07', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(364, '2018-06-28 09:14:06', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(365, '2018-06-28 09:14:52', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(366, '2018-06-28 09:15:33', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(367, '2018-06-28 09:15:53', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(368, '2018-06-28 09:17:03', 'UNKNOWN', 'SECTION_DELETE', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&path=%2F', NULL, 1, NULL, 'a:2:{s:9:\"file_name\";s:5:\"flat2\";s:4:\"path\";s:5:\"flat2\";}'),
(369, '2018-06-28 09:18:17', 'UNKNOWN', 'SECTION_DELETE', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&site=s1&path=%2Fbitrix%2Fcomponents%2Fbitrix%2Fsystem.auth.authorize%2Ftemplates&show_perms_for=0&table_id=tbl_fileman_admin', NULL, 1, NULL, 'a:2:{s:9:\"file_name\";s:5:\"flat2\";s:4:\"path\";s:62:\"bitrix/components/bitrix/system.auth.authorize/templates/flat2\";}'),
(370, '2018-06-28 09:18:41', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(371, '2018-06-28 09:19:03', 'UNKNOWN', 'SECTION_DELETE', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&site=s1&path=%2Fbitrix%2Fcomponents%2Fbitrix%2Fsystem.auth.authorize%2Ftemplates&show_perms_for=0&table_id=tbl_fileman_admin', NULL, 1, NULL, 'a:2:{s:9:\"file_name\";s:5:\"flat2\";s:4:\"path\";s:62:\"bitrix/components/bitrix/system.auth.authorize/templates/flat2\";}'),
(372, '2018-06-28 09:19:49', 'UNKNOWN', 'SECTION_RENAME', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&site=s1&path=%2Fbitrix%2Fcomponents%2Fbitrix%2Fsystem.auth.authorize%2Ftemplates&show_perms_for=0&table_id=tbl_fileman_admin', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:62:\"bitrix/components/bitrix/system.auth.authorize/templates/flat2\";}'),
(373, '2018-06-28 09:20:20', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(374, '2018-06-28 09:20:44', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(375, '2018-06-28 09:21:10', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(376, '2018-06-28 09:21:48', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Fcomponents%2Fbitrix%2Fsystem.auth.authorize%2Ftemplates%2Fflat2%2Ftemplate.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/components/bitrix/system.auth.authorize/templates/flat2/template.php\";}'),
(377, '2018-06-28 09:25:22', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(378, '2018-06-28 09:37:52', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(379, '2018-06-28 09:38:54', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(380, '2018-06-28 12:16:54', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcomponents%2Fbitrix%2Fnews.list%2Fmenu-list%2Ftemplate.php&back_url=%2Fmenu%2F%3Fbitrix_include_areas%3DY&lang=ru&siteTemplateId=pitstop', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/templates/pitstop/components/bitrix/news.list/menu-list/template.php\";}'),
(381, '2018-06-28 12:19:10', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcomponents%2Fbitrix%2Fnews.list%2Fmenu-list%2Ftemplate.php&back_url=%2Fmenu%2F&lang=ru&siteTemplateId=pitstop', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/templates/pitstop/components/bitrix/news.list/menu-list/template.php\";}'),
(382, '2018-06-28 12:22:41', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcomponents%2Fbitrix%2Fnews.list%2Fmenu-list%2Ftemplate.php&back_url=%2Fmenu%2F&lang=ru&siteTemplateId=pitstop', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/templates/pitstop/components/bitrix/news.list/menu-list/template.php\";}'),
(383, '2018-06-28 12:23:45', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcomponents%2Fbitrix%2Fnews.list%2Fmenu-list%2Ftemplate.php&back_url=%2Fmenu%2F%3Fclear_cache%3DY&lang=ru&siteTemplateId=pitstop', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/templates/pitstop/components/bitrix/news.list/menu-list/template.php\";}'),
(384, '2018-06-28 14:05:16', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(385, '2018-06-28 14:21:19', 'UNKNOWN', 'FILE_RENAME', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages&set_filter=Y&adm_filter_applied=0&find_name=bg&table_id=tbl_fileman_admin', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:40:\"bitrix/templates/pitstop/images/bg2_.jpg\";}'),
(386, '2018-06-28 14:21:43', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:39:\"bitrix/templates/pitstop/images/bg2.jpg\";}'),
(387, '2018-06-28 14:22:33', 'UNKNOWN', 'FILE_DELETE', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?ID=bg2.jpg&action_button=delete&lang=ru&lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages&show_perms_for=0&mode=list&table_id=tbl_fileman_admin', NULL, 1, NULL, 'a:2:{s:9:\"file_name\";s:7:\"bg2.jpg\";s:4:\"path\";s:31:\"bitrix/templates/pitstop/images\";}'),
(388, '2018-06-28 14:22:40', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:39:\"bitrix/templates/pitstop/images/bg2.jpg\";}'),
(389, '2018-06-28 14:26:20', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcomponents%2Fbitrix%2Fnews%2Fmenu%2Fnews.php&back_url=%2Fmenu%2F%3Fbitrix_include_areas%3DY&lang=ru&siteTemplateId=pitstop', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:61:\"bitrix/templates/pitstop/components/bitrix/news/menu/news.php\";}'),
(390, '2018-06-28 14:31:41', 'UNKNOWN', 'SECTION_RENAME', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&site=s1&path=&del_filter=Y&find_name=bg&table_id=tbl_fileman_admin', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:13:\"knowledgebase\";}'),
(391, '2018-06-28 14:45:48', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fheader.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/header.php\";}'),
(392, '2018-06-28 14:46:17', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fheader.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/header.php\";}'),
(393, '2018-06-28 14:46:43', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(394, '2018-06-28 14:47:15', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(395, '2018-06-28 14:47:38', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(396, '2018-06-28 14:48:58', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fheader.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/header.php\";}'),
(397, '2018-06-28 15:02:10', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fheader.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/header.php\";}'),
(398, '2018-06-28 15:03:18', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(399, '2018-06-28 15:03:37', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(400, '2018-06-28 15:13:06', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Ffooter.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/footer.php\";}'),
(401, '2018-06-28 15:14:05', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Ffooter.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/footer.php\";}'),
(402, '2018-06-28 15:14:32', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Ffooter.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/footer.php\";}'),
(403, '2018-06-28 15:22:48', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Ffooter.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/footer.php\";}'),
(404, '2018-06-29 02:17:16', 'WARNING', 'BACKUP_ERROR', 'main', 'UNKNOWN', '54.217.223.231', NULL, '/bitrix/tools/backup.php', 's1', NULL, NULL, '[410] Error writing header<br>Can\'t write header to file: /var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/backup/20180629_051627_93078559.enc.gz'),
(405, '2018-06-29 02:18:05', 'WARNING', 'BACKUP_ERROR', 'main', '/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/backup/20180629_051805_38046431.sql', '54.217.223.231', NULL, '/bitrix/tools/backup.php', 's1', NULL, NULL, '[100] No free disk space or no permission to create backup on server'),
(406, '2018-06-29 02:19:31', 'WARNING', 'BACKUP_ERROR', 'main', '/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/backup/20180629_051931_38541967.sql', '54.217.223.231', NULL, '/bitrix/tools/backup.php', 's1', NULL, NULL, '[100] No free disk space or no permission to create backup on server'),
(407, '2018-06-29 02:21:49', 'WARNING', 'BACKUP_ERROR', 'main', '/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/backup/20180629_052149_41709812.sql', '54.217.223.231', NULL, '/bitrix/tools/backup.php', 's1', NULL, NULL, '[100] No free disk space or no permission to create backup on server'),
(408, '2018-06-29 07:37:06', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:20:\"download/.access.php\";}'),
(409, '2018-06-29 07:37:06', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"download/.htaccess\";}'),
(410, '2018-06-29 07:37:06', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:17:\"download/auth.php\";}'),
(411, '2018-06-29 07:37:06', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:29:\"download/download_private.php\";}'),
(412, '2018-06-29 07:37:36', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload%2Ffiles', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:24:\"download/files/.htaccess\";}'),
(413, '2018-06-29 07:39:19', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload%2Ffiles', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:40:\"download/files/Pitstop_brandbook_1.0.pdf\";}'),
(414, '2018-06-29 07:39:19', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fdownload%2Ffiles', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:49:\"download/files/Pitstop_communication strategy.pdf\";}'),
(415, '2018-06-29 07:41:30', 'UNKNOWN', 'FILE_RENAME', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&site=s1&path=%2Fdownload%2Ffiles', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:49:\"download/files/Pitstop_communication_strategy.pdf\";}'),
(416, '2018-06-29 07:43:50', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fdownload%2F.htaccess', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"download/.htaccess\";}'),
(417, '2018-06-29 08:12:53', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?&interval=0&k=66c01746fd09a03eed3c07fd9ed1f728', 's1', NULL, NULL, ''),
(418, '2018-06-29 08:50:38', 'UNKNOWN', 'SECTION_RENAME', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_admin.php?mode=frame&lang=ru&path=%2F', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:4:\"auth\";}'),
(419, '2018-06-29 08:53:35', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fdownload%2Fdownload_private.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:29:\"download/download_private.php\";}'),
(420, '2018-06-29 08:58:57', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Fcomponents%2Fbitrix%2Fsystem.auth.authorize%2Ftemplates%2Fflat2%2Ftemplate.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/components/bitrix/system.auth.authorize/templates/flat2/template.php\";}'),
(421, '2018-06-29 08:59:45', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fauth%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:14:\"auth/index.php\";}'),
(422, '2018-06-29 09:05:59', 'UNKNOWN', 'MENU_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_newfolder.php?', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),
(423, '2018-06-29 09:05:59', 'UNKNOWN', 'SECTION_ADD', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_newfolder.php?', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";s:11:\"baza-znaniy\";}'),
(424, '2018-06-29 09:06:03', 'UNKNOWN', 'FILE_ADD', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_html_edit.php?lang=ru', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(425, '2018-06-29 09:09:39', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(426, '2018-06-29 09:12:31', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(427, '2018-06-29 09:13:07', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(428, '2018-06-29 09:17:13', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(429, '2018-06-29 09:17:35', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(430, '2018-06-29 09:18:05', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(431, '2018-06-29 09:20:12', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(432, '2018-06-29 09:21:46', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(433, '2018-06-29 09:23:00', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(434, '2018-06-29 09:23:23', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(435, '2018-06-29 09:24:13', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(436, '2018-06-29 09:24:57', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(437, '2018-06-29 09:25:56', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&logical=Y&path=%2Fbaza-znaniy%2Findex.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:21:\"baza-znaniy/index.php\";}'),
(438, '2018-06-29 09:41:01', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Fcomponents%2Fbitrix%2Fsystem.auth.authorize%2Ftemplates%2Fflat2%2Ftemplate.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:75:\"bitrix/components/bitrix/system.auth.authorize/templates/flat2/template.php\";}'),
(439, '2018-06-29 09:43:50', 'UNKNOWN', 'MENU_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_menu_edit.php?', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";b:0;}'),
(440, '2018-06-29 10:54:01', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:40:\"bitrix/templates/pitstop/images/ent1.png\";}'),
(441, '2018-06-29 10:54:01', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:40:\"bitrix/templates/pitstop/images/ent2.png\";}'),
(442, '2018-06-29 10:56:45', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(443, '2018-06-29 10:59:34', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(444, '2018-06-29 11:00:09', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(445, '2018-06-29 11:01:01', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(446, '2018-06-29 11:02:57', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(447, '2018-06-29 11:05:31', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(448, '2018-06-29 12:58:12', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(449, '2018-06-29 12:58:48', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Finclude%2Fsocial.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:18:\"include/social.php\";}'),
(450, '2018-06-29 13:03:14', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Ffooter.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/footer.php\";}'),
(451, '2018-06-29 13:03:24', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Ffooter.php', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:35:\"bitrix/templates/pitstop/footer.php\";}'),
(452, '2018-06-29 13:51:49', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(453, '2018-06-29 13:55:11', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(454, '2018-06-29 14:01:23', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(455, '2018-06-29 14:02:11', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(456, '2018-06-29 14:05:49', 'UNKNOWN', 'FILE_ADD', 'main', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_upload.php?lang=ru&site=s1&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fimages', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:40:\"bitrix/templates/pitstop/images/ent2.jpg\";}'),
(457, '2018-06-29 14:09:27', 'UNKNOWN', 'FILE_EDIT', 'fileman', 'UNKNOWN', '80.240.221.52', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', '/bitrix/admin/fileman_file_edit.php?lang=ru&path=%2Fbitrix%2Ftemplates%2Fpitstop%2Fcss%2Fstyle.css', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:38:\"bitrix/templates/pitstop/css/style.css\";}'),
(458, '2018-06-30 08:16:17', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
(459, '2018-07-01 08:28:35', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/site-map/', 's1', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message`
--

CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message`
--

INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
(1, '2018-01-14 23:19:40', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2018-01-14 23:19:40', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2018-01-14 23:19:40', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2018-01-14 23:19:40', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2018-01-14 23:19:40', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2018-01-14 23:19:40', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2018-01-14 23:19:40', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_attachment`
--

CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_message_site`
--

CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_message_site`
--

INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_event_type`
--

CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_event_type`
--

INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`) VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7),
(8, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1),
(9, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2),
(10, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3),
(11, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4),
(12, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5),
(13, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6),
(14, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `b_favorite`
--

CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_file`
--

CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_file`
--

INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
(62, '2018-01-29 18:07:14', 'iblock', 313, 556, 228467, 'image/jpeg', 'iblock/44c', '44caea2b6eea47afdd4fed9fdf3526d3.jpg', 'img7.jpg', '', NULL, '6e5460b4251628eb411198d10a1bcebf'),
(64, '2018-01-29 18:07:14', 'iblock', 313, 556, 228467, 'image/jpeg', 'iblock/7ed', '7ed7bc23525d65dbe62b16e7f143c13b.jpg', 'img7.jpg', '', NULL, '32ffd7f59762163205570ff82c6b56a2'),
(75, '2018-06-06 13:31:44', 'iblock', 70, 50, 2480, 'image/png', 'iblock/a5f', 'a5fdade835fde7cd7cc017aa1102f6c3.png', 'ico11.png', '', NULL, 'bab468eee2d717f68cba4e5d53ae6284'),
(76, '2018-06-06 12:48:09', 'iblock', 70, 68, 2955, 'image/png', 'iblock/b79', 'b79dafc56a66b0f7a60634007ccf29a7.png', 'ico12.png', '', NULL, '5f2f2bd1b208406785f09d7b99f7a599'),
(77, '2018-06-06 11:40:56', 'iblock', 70, 68, 2439, 'image/png', 'iblock/e68', 'e680370b0c39f3526f19bd8fcfc89db6.png', 'ico13.png', '', NULL, '3068793bc6ec440bac050b2a4fbcda84'),
(83, '2018-01-25 13:07:41', 'iblock', 377, 1082, 419378, 'image/jpeg', 'iblock/d01', 'd01b9f5a8056c692cd6042457868abac.jpg', 'slide1.jpg', '', NULL, '9ea660b38d3fcc6f5671f25f175d5181'),
(95, '2018-06-27 14:04:13', 'iblock', 354, 530, 34897, 'image/jpeg', 'iblock/5f7', '5f726ce059b8ed444f79533c7e2853ee.jpg', 'Меню_десерты (3).jpg', '', NULL, '22f0c1d74f3f40ee1ed04b45197f7900'),
(96, '2018-06-26 08:21:31', 'iblock', 389, 584, 52186, 'image/jpeg', 'iblock/bae', 'bae684b6467ba36c20dd9cbb68cf2f72.jpg', 'Меню_десерты (1).jpg', '', NULL, 'c8b83b43650a161dae65fd8d1cdf86bf'),
(100, '2018-06-26 08:20:57', 'iblock', 398, 597, 39773, 'image/jpeg', 'iblock/5a2', '5a27ed0f319b8e1da79eba4934605278.jpg', 'Меню_выпечка (2).jpg', '', NULL, 'dc9dc426e6eaa116b0d5e3777e971a97'),
(101, '2018-06-26 08:21:42', 'iblock', 398, 697, 45940, 'image/jpeg', 'iblock/e04', 'e04eee38252bc85b4ce44b37a6d93fbd.jpg', 'Меню_выпечка (1).jpg', '', NULL, '493d0cd05de31929236109fad69e083d'),
(102, '2018-06-27 13:55:10', 'iblock', 398, 597, 47900, 'image/jpeg', 'iblock/9d7', '9d7e6f704af4d406536a34d608ca72a6.jpg', 'Меню_Кулинария (2).jpg', '', NULL, '802bc2be5e05e0cd7bff5f8bfa3c0661'),
(105, '2018-06-27 13:48:27', 'iblock', 1200, 800, 288696, 'image/jpeg', 'iblock/7f0', '7f03901b273d3d49fefabf0b9b82ee78.jpg', 'Меню_Кофе_Американо.jpg', '', NULL, '04f0d0a7edf3fe40513a05c869b321b2'),
(106, '2018-06-27 13:48:52', 'iblock', 1200, 800, 298812, 'image/jpeg', 'iblock/403', '4033a3f8b84de3aa46619ef9f06e3a35.jpg', 'Меню_Кофе_Капучино.jpg', '', NULL, '657428105ae9294b080d8cf768e64e8d'),
(107, '2018-06-27 13:48:45', 'iblock', 1200, 800, 252692, 'image/jpeg', 'iblock/9a3', '9a3c7e0d9207616eae804cb61d792d12.jpg', 'Меню_Кофе_Латте.jpg', '', NULL, '186dc73e49d5c97c5b65e52b5f3a2b31'),
(110, '2018-01-24 14:50:21', 'iblock', 800, 1200, 356810, 'image/jpeg', 'iblock/6e8', '6e8df7a959ed7cb13daf89ac7a5eba00.jpg', 'Галерея (3).jpg', '', NULL, 'a26b1b5d9e1011a9ce99be284698a265'),
(111, '2018-01-24 14:50:33', 'iblock', 800, 1200, 291559, 'image/jpeg', 'iblock/67d', '67d2bccc7ce02e95b7a3bb78deb5e014.jpg', 'Галерея (4).jpg', '', NULL, '70704454f2574f5d7d23d7a932216f97'),
(112, '2018-01-24 14:51:05', 'iblock', 533, 800, 262481, 'image/jpeg', 'iblock/ef3', 'ef37d8f479de93533be4170b1ddfa422.jpg', 'IMG_5873.CR2.jpg', '', NULL, '1170ccc80f903b04c701d24e6949f1ec'),
(113, '2018-01-24 14:51:23', 'iblock', 532, 800, 319823, 'image/jpeg', 'iblock/ff1', 'ff18c2629d9a34ec44984903d2c498af.jpg', 'IMG_5877.CR2.jpg', '', NULL, '77038da3f533fe57a8635ee679587e4d'),
(114, '2018-01-24 14:51:42', 'iblock', 533, 800, 245146, 'image/jpeg', 'iblock/e1c', 'e1ccc41d6d1722d8ad6b7f9de8274244.jpg', 'IMG_5861.CR2.jpg', '', NULL, '211b8f0ee114e4608d41b6efccae5231'),
(115, '2018-01-24 14:52:15', 'iblock', 533, 800, 232188, 'image/jpeg', 'iblock/88f', '88fae6bcb19959b3507169d397aef5ca.jpg', 'IMG_5824.CR2.jpg', '', NULL, '5cb0ed03da543a222a59fc2de637202f'),
(116, '2018-01-24 14:53:52', 'iblock', 533, 800, 313259, 'image/jpeg', 'iblock/6f4', '6f47eb596ded28bdc516d7f21e41ab11.jpg', 'IMG_5753.CR2.jpg', '', NULL, '1de864feb1132c67b391dc04fbb73f88'),
(117, '2018-01-24 14:54:11', 'iblock', 534, 800, 68201, 'image/jpeg', 'iblock/8bd', '8bd4d45eb437432125f95617dcdcabc6.jpg', 'IMG_5781.CR2.jpg', '', NULL, '0bdb61749118e98dfd1472ae1e23da3e'),
(118, '2018-01-24 14:54:50', 'iblock', 533, 800, 288804, 'image/jpeg', 'iblock/d0e', 'd0e051c2eb98fbf10978d9f249265f79.jpg', 'IMG_5841.CR2.jpg', '', NULL, '766acf42be7531c6cf4ee448df739d9d'),
(119, '2018-01-24 14:56:02', 'iblock', 533, 800, 280917, 'image/jpeg', 'iblock/b06', 'b06a5c5e4f6728d80cad12392ecb80d0.jpg', 'IMG_5835.CR2.jpg', '', NULL, '9069c851f1aaa907676c711f21d74c82'),
(120, '2018-01-24 14:56:42', 'iblock', 534, 800, 90019, 'image/jpeg', 'iblock/7de', '7de053acf27a9a5b95c2a538fe978d63.jpg', 'IMG_5845.CR2.jpg', '', NULL, '285f86ad5a5e1f4309d281ea525243db'),
(125, '2018-01-25 13:06:45', 'iblock', 584, 1200, 397015, 'image/jpeg', 'iblock/b62', 'b621fb3752a6edf1cae61338ba5456ca.jpg', 'IMG_0060.jpg', '', NULL, 'aa866e772e3f07fca7f11bb9b05f86fd'),
(126, '2018-01-25 13:07:11', 'iblock', 607, 1200, 403589, 'image/jpeg', 'iblock/836', '83659b3c9a3f3c77a3ad8b2e68fa1b05.jpg', 'IMG_0054.jpg', '', NULL, '37e922eb89133911e44b0dc820bb653e'),
(138, '2018-04-05 10:14:57', 'iblock', 302, 556, 27031, 'image/jpeg', 'iblock/276', '27635cb484c96f940db740797af13d1f.jpg', 'vxPO1nEFMjY.jpg', '', NULL, 'bd767ec96a7484c7077b39b7d1921b54'),
(148, '2018-05-11 13:16:26', 'iblock', 283, 510, 46773, 'image/jpeg', 'iblock/060', '06091d72264028783e1eba3b56a0a046.jpg', 'ilovepdf_com-1.jpg', '', NULL, '8e6c931a5d1610e2be46bb0bd5b049f8'),
(151, '2018-05-11 13:16:27', 'iblock', 150, 200, 56669, 'image/png', 'iblock/6aa', '6aa570de648db5765999e8fb0983b85c.png', 'Без названия.png', '', NULL, 'ccc608c2b6e11d27dece1fde86eac84b'),
(153, '2018-05-11 13:18:01', 'iblock', 799, 573, 43982, 'image/jpeg', 'iblock/905', '90534e87dcbc2eb8d971024bc151c733.jpg', '2018-03-28-pitstop-A4-3-001.jpg', '', NULL, 'af5abef4e3a64406d614628df0df8904'),
(154, '2018-05-16 16:08:45', 'iblock', 533, 800, 232188, 'image/jpeg', 'iblock/1ef', '1ef391838e4aad11eb79cc37705e7a23.jpg', '88fae6bcb19959b3507169d397aef5ca.jpg', '', NULL, 'e38d59c7240e351b2ae8f61344f26c7d'),
(155, '2018-05-18 08:21:14', 'iblock', 640, 480, 49164, 'image/jpeg', 'iblock/2ed', '2edec041da782eb666ca6bb5d3eff57d.JPG', 'Открытие Авиамоторной.JPG', '', NULL, '0b2c8ea6c72b75f4df75646b4fb9c7cb'),
(156, '2018-05-18 08:21:14', 'iblock', 640, 480, 49164, 'image/jpeg', 'iblock/952', '952a2a871b96a7d2601055dde17fa09b.JPG', 'Открытие Авиамоторной.JPG', '', NULL, 'd66e3dd637a2813ccf90938b5e79a923'),
(157, '2018-05-18 08:22:08', 'iblock', 480, 640, 105804, 'image/jpeg', 'iblock/438', '4382352860c92ffa19fdd473ecc67ac2.JPG', 'открытие БЦ Омега Плаза.JPG', '', NULL, 'b4327418a6f4f5f4f92aba16e9024941'),
(158, '2018-05-18 08:22:08', 'iblock', 480, 640, 105804, 'image/jpeg', 'iblock/afa', 'afabb4d0d78cd904f3987550e2718545.JPG', 'открытие БЦ Омега Плаза.JPG', '', NULL, '4214fab40e4d115c2ea74cf363bc7644'),
(159, '2018-05-18 08:25:58', 'iblock', 548, 640, 153756, 'image/jpeg', 'iblock/76e', '76e931b9cc8294096720a1ad0185e253.JPG', 'Открытие Павелецкой.JPG', '', NULL, '3dfa477e7671ea270b7c0c2e7d68169f'),
(160, '2018-05-18 08:25:58', 'iblock', 548, 640, 153756, 'image/jpeg', 'iblock/415', '41553f4618a09c5b9508a85384ee9bf5.JPG', 'Открытие Павелецкой.JPG', '', NULL, '98a5ad6e418a936bad5b501bfef5d3eb'),
(161, '2018-05-18 08:26:52', 'iblock', 440, 640, 114223, 'image/jpeg', 'iblock/346', '3469fb4746ae39659655c6ba0757529f.JPG', 'франшиза_3.JPG', '', NULL, '02e616dd45ce6a1dabc23bc992426ede'),
(162, '2018-05-18 08:26:52', 'iblock', 440, 640, 114223, 'image/jpeg', 'iblock/f05', 'f05f9e7c3f9ca967d57f17518d12dbec.JPG', 'франшиза_3.JPG', '', NULL, '6cc0ffbd08677cf1f393504686b0ffe4'),
(163, '2018-05-18 08:28:23', 'iblock', 427, 640, 40538, 'image/jpeg', 'iblock/0c9', '0c9056cc40d52a81e7d7e9e823a7584e.jpg', 'японские блюда.jpg', '', NULL, '4b98d7db136a3c5d9fbac6866375e064'),
(164, '2018-05-18 08:28:23', 'iblock', 427, 640, 40538, 'image/jpeg', 'iblock/94c', '94c7f78c8d6a8e64c24d689a8ef1314e.jpg', 'японские блюда.jpg', '', NULL, '827c970b644958b451d08cdc201765ce'),
(165, '2018-05-18 09:13:45', 'iblock', 533, 800, 262481, 'image/jpeg', 'iblock/f8f', 'f8f83643c759b4f893bdda961fb45cae.jpg', 'ef37d8f479de93533be4170b1ddfa422.jpg', '', NULL, 'add0df27d5474594473d119acf882b41'),
(166, '2018-05-18 09:16:31', 'iblock', 534, 800, 90019, 'image/jpeg', 'iblock/fa5', 'fa57789c7d1963feea8951b3d331172e.jpg', '7de053acf27a9a5b95c2a538fe978d63.jpg', '', NULL, '9d793d519f4bd52ac48e1ea4f7d4b067'),
(170, '2018-06-27 13:48:45', 'iblock', 675, 450, 61628, 'image/jpeg', 'iblock/4d8', '4d86f3a30583371c08b9168b9cb2c380.jpg', 'Меню_Кофе_Латте_1.jpg', '', NULL, 'ba4e240ea86da10ca7c1ebc8034a8714'),
(171, '2018-06-27 13:48:52', 'iblock', 675, 450, 73959, 'image/jpeg', 'iblock/307', '3070bf6a5a364b302a4475c51fa5ae98.jpg', 'Меню_Кофе_Капучино_1.jpg', '', NULL, 'a378bad77fe1442acd3cef720274a10c'),
(172, '2018-06-27 13:48:27', 'iblock', 675, 450, 70406, 'image/jpeg', 'iblock/2a2', '2a20c7ab05d16722e7cfcbf8a2dce196.jpg', 'Меню_Кофе_Американо_1.jpg', '', NULL, '2e8965135dc71408267b59eae24991c5'),
(173, '2018-06-27 13:55:10', 'iblock', 300, 450, 53917, 'image/jpeg', 'iblock/925', '925d49ca5fb891c96af7026555ba9839.jpg', 'Меню_Кулинария (2)_1.jpg', '', NULL, 'd42de4483e77074f1530242b4fa18dc8'),
(174, '2018-06-26 08:21:42', 'iblock', 300, 450, 24883, 'image/jpeg', 'iblock/74d', '74df6878bc41e6a79c12e4cf41bf2e59.jpg', '_MG_4994_1.jpg', '', NULL, '1103b695bad8233bfb1e44692c04dd2a'),
(176, '2018-06-26 08:21:31', 'iblock', 300, 450, 21195, 'image/jpeg', 'iblock/abb', 'abbb574c0b7d6731b0db71e97b4fe535.jpg', '_MG_5133_1.jpg', '', NULL, 'f94bc94c4d19b25b27fb5de87acceb42'),
(177, '2018-06-27 14:04:13', 'iblock', 300, 450, 50239, 'image/jpeg', 'iblock/6d4', '6d40c888bf1001f7b187640aa516f8f0.jpg', 'Меню_десерты (3)_.jpg', '', NULL, '936f2d3ee8c252e05063d4fc8ccc00a7'),
(178, '2018-06-26 08:20:57', 'iblock', 300, 450, 32878, 'image/jpeg', 'iblock/81d', '81d33d5b23cd452d5b49486a265d3ed0.jpg', '_MG_5005_1.jpg', '', NULL, '444aa22d1902eca3225800d887382746'),
(179, '2018-05-22 08:12:24', 'iblock', 413, 550, 125590, 'image/jpeg', 'iblock/f4d', 'f4def2e3877eb6f49d0b80a3a4e03541.jpg', 'BayBrand.jpg', '', NULL, '59ea0aa3d12fb2274ab77078691bbcd2'),
(180, '2018-05-22 08:12:24', 'iblock', 413, 550, 125590, 'image/jpeg', 'iblock/b07', 'b074ca4ab45f8995b298f82e6177e4a0.jpg', 'BayBrand.jpg', '', NULL, '3f16634ef6c015b580253d15ae3044f8'),
(181, '2018-05-22 08:13:26', 'iblock', 367, 550, 105950, 'image/jpeg', 'iblock/2f1', '2f16f158a6c9f751e1d409a6e602285d.jpg', 'Открытие Савелы.jpg', '', NULL, 'f3e30e28773aa411de563212bd71895c'),
(182, '2018-05-22 08:13:26', 'iblock', 367, 550, 105950, 'image/jpeg', 'iblock/d7e', 'd7eb3e71c4b5c1975786994a0143c94a.jpg', 'Открытие Савелы.jpg', '', NULL, '0e8622b8cd886fd39e472996db197fbb'),
(183, '2018-05-22 08:16:15', 'iblock', 303, 550, 68070, 'image/jpeg', 'iblock/1d7', '1d7bbb54f36cd7c8bc58d5b37341174f.jpg', 'Открытие точки Город столиц.jpg', '', NULL, '49a9215c0f0079a90a26e5d0f07478b4'),
(184, '2018-05-22 08:16:15', 'iblock', 303, 550, 68070, 'image/jpeg', 'iblock/06e', '06ea6b1910c885c6c9d2b92a85eeeff5.jpg', 'Открытие точки Город столиц.jpg', '', NULL, '04ddaad351ba186c09ff6549a7cbd2f9'),
(191, '2018-06-27 13:48:04', 'iblock', 679, 450, 268964, 'image/jpeg', 'iblock/535', '5353679ecc771e9b1673384722d11edf.jpg', 'kofe34324.jpg', '', NULL, 'f3b23d5cba8c79ec2a8efffa4a61eb0c'),
(192, '2018-06-27 13:48:04', 'iblock', 679, 450, 268964, 'image/jpeg', 'iblock/ca1', 'ca1229e7ae1a5b3b012a8725359b3535.jpg', 'kofe34324.jpg', '', NULL, '66aa262267a2485e514f2d1abaf60e1c'),
(193, '2018-06-27 13:52:29', 'iblock', 300, 450, 69997, 'image/jpeg', 'iblock/c6a', 'c6abd1debe61411c604ca6ecade76ba8.jpg', 'yapon1432.jpg', '', NULL, '8751d5548f5c5f168e078e782def6a9b'),
(194, '2018-06-27 13:52:29', 'iblock', 298, 446, 59847, 'image/jpeg', 'iblock/f3f', 'f3f5974967e12f3264976480cff17549.jpg', 'yapon14312.jpg', '', NULL, '9aea4aac474acfae98cd7f777bcdda9f'),
(195, '2018-06-27 13:54:31', 'iblock', 298, 446, 68309, 'image/jpeg', 'iblock/1b5', '1b57e062e84116e95606dee18dfa4173.jpg', 'salatvasort1.jpg', '', NULL, 'a5094fe6b11eaa92c3e5702730977318'),
(196, '2018-06-27 13:54:31', 'iblock', 300, 450, 69075, 'image/jpeg', 'iblock/869', '869f50e25ad191152d786931c10fe576.jpg', 'salatvasort.jpg', '', NULL, '705337c1399f649142a3ada3b15b701f'),
(197, '2018-06-27 13:58:05', 'iblock', 298, 446, 88868, 'image/jpeg', 'iblock/a34', 'a34f08f9ef93a8dd89475e77ec8cf27d.jpg', 'Tosta123.jpg', '', NULL, 'ced9a7d2441894d7a9989b57b1cab49a'),
(198, '2018-06-27 13:58:05', 'iblock', 300, 450, 88966, 'image/jpeg', 'iblock/b16', 'b16f8bc902f8bac5401c8370ebe3984f.jpg', 'Tosta.jpg', '', NULL, '54a511e9d0410076b59e353b083227fd'),
(199, '2018-06-27 14:03:28', 'iblock', 298, 446, 76059, 'image/jpeg', 'iblock/59e', '59e3a7fe8e9320ed65ab34121fe5852d.jpg', 'sirniki123.jpg', '', NULL, '9c983a78b6a6e880d02ab1e68207101b'),
(200, '2018-06-27 14:03:28', 'iblock', 300, 450, 74377, 'image/jpeg', 'iblock/70e', '70e8c2412686731dae1db05dab9b05a4.jpg', 'sirniki.jpg', '', NULL, 'a1049b1e8c90fc35d60b982234984ad7'),
(201, '2018-06-27 14:06:15', 'iblock', 298, 446, 52945, 'image/jpeg', 'iblock/755', '755666963e8a04c5cb1077f903ab9d56.jpg', 'chele123.jpg', '', NULL, '419438c1dc090f3a5673dfb554394e6b'),
(202, '2018-06-27 14:06:15', 'iblock', 300, 450, 59313, 'image/jpeg', 'iblock/cb4', 'cb4ff5a6b6aaa1f16cf3e861d7e67fe6.jpg', 'chele.jpg', '', NULL, '0f2e7dd66c68e3e7d16f11285cf561cb'),
(203, '2018-06-27 14:08:50', 'iblock', 298, 446, 85075, 'image/jpeg', 'iblock/345', '345c13ae209477210772b3977532df73.jpg', 'kruasan1.jpg', '', NULL, 'e79cc45ab59d20e99e26e0884a761f3b'),
(204, '2018-06-27 14:08:50', 'iblock', 300, 450, 95308, 'image/jpeg', 'iblock/d0d', 'd0dca642af62c21f4ce96201840e0c73.jpg', 'kruasan.jpg', '', NULL, 'ee9bcf73b8fdd074578808725aa83305'),
(205, '2018-06-27 14:12:32', 'iblock', 298, 446, 101462, 'image/jpeg', 'iblock/7f1', '7f1b04f6afbfa80cfe6392645cacf345.jpg', 'krekona.jpg', '', NULL, '05455fb0fb1e432904449867f753cc2d'),
(206, '2018-06-27 14:12:32', 'iblock', 300, 450, 102191, 'image/jpeg', 'iblock/271', '271dfccad983d12120382cbb5a72557e.jpg', 'krekona11.jpg', '', NULL, 'c081600940eaed7681a89d00a631c8cb');

-- --------------------------------------------------------

--
-- Структура таблицы `b_file_search`
--

CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_filters`
--

CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_finder_dest`
--

CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_geoip_handlers`
--

CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL,
  `SORT` int(10) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_geoip_handlers`
--

INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_group`
--

CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_group`
--

INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
(1, '2018-01-14 23:19:40', 'Y', 1, 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, '2018-01-14 23:19:40', 'Y', 2, 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, '2018-01-14 23:19:40', 'Y', 3, 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, '2018-01-14 23:19:40', 'Y', 4, 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY'),
(5, '2018-01-14 23:22:10', 'Y', 300, 'N', 'Контент-редакторы', NULL, NULL, 'content_editor');

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_collection_task`
--

CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_subordinate`
--

CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_group_task`
--

CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_group_task`
--

INSERT INTO `b_group_task` (`GROUP_ID`, `TASK_ID`, `EXTERNAL_ID`) VALUES
(5, 22, ''),
(5, 44, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity`
--

CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) UNSIGNED NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_lang`
--

CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) UNSIGNED NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hlblock_entity_rights`
--

CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) UNSIGNED NOT NULL,
  `HL_ID` int(11) UNSIGNED NOT NULL,
  `TASK_ID` int(11) UNSIGNED NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys`
--

CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys`
--

INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_hot_keys_code`
--

CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_hot_keys_code`
--

INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock`
--

CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock`
--

INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
(1, '2018-01-17 23:28:40', 'news', 's1', 'furniture_news_s1', 'Новости', 'Y', 500, '#SITE_DIR#/news/', '#SITE_DIR#/news/#ID#/', NULL, '', NULL, '', 'text', 24, 'Y', 'N', 0, 0, 'N', 'furniture_news_s1', '7b5ab74dcba40a150ee9f3f7afdac449', 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Новости', 'Новость'),
(5, '2018-05-10 08:47:14', 'menu', 's1', 'pitsop_menu_s1', 'Меню', 'Y', 500, '/#SITE_DIR#/menu/', '/#SITE_DIR#/menu/#ELEMENT_CODE#/', '/#SITE_DIR#/menu/', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, '329f8dd90b94950c30a4768442b88d00', 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(6, '2018-01-17 08:26:45', 'gallery', 's1', 'pitstop_gallery_s1', 'Галерея', 'Y', 500, '#SITE_DIR#/gallery/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/gallery/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/gallery/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(7, '2018-01-17 08:38:51', 'franchise', 's1', 'pitstop_franchise_s1', 'Инфо о франшизе', 'Y', 500, '#SITE_DIR#/franchise/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/franchise/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/franchise/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(8, '2018-01-17 12:08:47', 'cafe', 's1', 'pitstop_cafe_s1', 'Адреса кофеен', 'Y', 500, '#SITE_DIR#/cafe/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/cafe/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/cafe/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', NULL, NULL, 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
(9, '2018-01-18 11:32:33', 'main_slider_s1', 's1', 'main_slider', 'Слайдер на главной', 'Y', 500, '#SITE_DIR#/main_slider_s1/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/main_slider_s1/detail.php?ID=#ELEMENT_ID#', NULL, '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', NULL, NULL, 'Элементы', 'Элемент'),
(14, '2018-04-05 09:03:16', 'news', 's1', 'actsii_s1_v2', 'Акции', 'Y', 500, '#SITE_DIR#/aktsii/', '#SITE_DIR#/aktsii/#ID#/', NULL, '', NULL, '', 'text', 24, 'N', 'N', 10, 7, 'N', NULL, NULL, 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', NULL, NULL, 'Элементы', 'Элемент'),
(15, '2018-05-18 09:00:07', 'servo', 's1', '', 'Карта сайта', 'Y', 500, '#SITE_DIR#/servo/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/servo/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/servo/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_cache`
--

CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element`
--

CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element`
--

INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
(33, '2018-05-18 11:21:14', 1, '2018-01-16 11:13:27', 1, 1, NULL, 'Y', '2016-06-15 00:00:00', NULL, 500, 'Открытие новой точки Авиамоторная', 155, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', 'text', 156, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', 'text', 'Открытие новой точки Авиамоторная\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', 1, NULL, NULL, NULL, NULL, NULL, 'N', '33', '', '', '0', NULL, 97, '2018-01-18 11:46:18'),
(34, '2018-05-22 11:16:15', 1, '2018-01-16 11:14:10', 1, 1, NULL, 'Y', '2016-01-05 00:00:00', NULL, 500, 'Открытие новой точки в БЦ Город Столиц', 183, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!', 'text', 184, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!', 'text', 'Открытие новой точки в БЦ Город Столиц\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!', 1, NULL, NULL, NULL, NULL, NULL, 'N', '34', '', '', '0', NULL, 89, '2018-01-18 14:09:38'),
(35, '2018-05-22 11:13:26', 1, '2018-01-16 11:14:26', 1, 1, NULL, 'Y', '2017-02-20 00:00:00', NULL, 500, 'Открытие новой точки в БЦ Савеловский Сити', 181, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', 'text', 182, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', 'text', 'Открытие новой точки в БЦ Савеловский Сити\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', 1, NULL, NULL, NULL, NULL, NULL, 'N', '35', '', '', '0', NULL, 123, '2018-01-18 14:20:25'),
(36, '2018-05-18 11:22:08', 1, '2018-01-16 11:14:55', 1, 1, NULL, 'Y', '2017-07-01 00:00:00', NULL, 500, 'Открытие новой точки в БЦ Омега Плаза', 157, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!', 'text', 158, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!', 'text', 'Открытие новой точки в БЦ Омега Плаза\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!', 1, NULL, NULL, NULL, NULL, NULL, 'N', '36', '', '', '0', NULL, 108, '2018-01-18 11:30:04'),
(37, '2018-05-18 11:26:52', 1, '2018-01-16 11:15:52', 1, 1, NULL, 'Y', '2018-01-16 00:00:00', NULL, 500, 'Запуск продажи франшиз', 161, 'Дорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PitStop начав свое дело. Подробности в разделе <a href=\"/franchising/\">Франшиза</a>.', 'html', 162, 'Дорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PitStop начав свое дело. Подробности в разделе Франшиза.', 'text', 'Запуск продажи франшиз\r\nДорогие гости, рады сообщить что теперь \r\nу каждого появилась возможность стать частью \r\nбольшой команды PITSTOP начав свое дело. Подробности \r\nв разделе Франшиза [ /FRANCHISING/ ] .\r\nДорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PITSTOP начав свое дело. Подробности в разделе Франшиза.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '37', '', '', '0', NULL, 210, '2018-01-18 02:49:00'),
(38, '2018-05-18 11:28:23', 1, '2018-01-16 11:16:04', 1, 1, NULL, 'Y', '2017-08-14 00:00:00', NULL, 500, 'Японские блюда в меню', 163, 'Дорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и Wok', 'text', 164, 'Дорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и Wok', 'text', 'Японские блюда в меню\r\nДорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и WOK\r\nДорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и WOK', 1, NULL, NULL, NULL, NULL, NULL, 'N', '38', '', '', '0', NULL, 113, '2018-01-18 11:40:46'),
(39, '2018-05-22 11:12:24', 1, '2018-01-16 11:16:17', 1, 1, NULL, 'Y', '2017-09-25 00:00:00', NULL, 500, 'BUYBRAND EXPO 2017', 179, 'Дорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PitStop на 15-ой международной выставке франшиз BUYBRAND Expo. Приглашаем вас посетить наш стенд.', 'text', 180, 'Дорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PitStop на 15-ой международной выставке франшиз BUYBRAND Expo. Приглашаем вас посетить наш стенд.', 'text', 'BUYBRAND EXPO 2017\r\nДорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PITSTOP на 15-ой международной выставке франшиз BUYBRAND EXPO. Приглашаем вас посетить наш стенд.\r\nДорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PITSTOP на 15-ой международной выставке франшиз BUYBRAND EXPO. Приглашаем вас посетить наш стенд.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '39', '', '', '0', NULL, 165, '2018-01-18 02:33:07'),
(40, '2018-01-29 21:07:14', 1, '2018-01-16 11:16:28', 1, 1, NULL, 'Y', '2018-01-15 00:00:00', NULL, 500, 'Кофе в цифрах', 64, 'Дорогие гости, сегодня мы посчитали сколько же кофе мы приготовили и сколько гостей пришло к нам в прошлом году и сразу решили поделиться. За прошлый 2017год, нашими клиентами стали около 300.000 гостей. И специально для них мы сварили 250.000 чашек ароматного кофе.', 'text', 62, 'Дорогие гости, сегодня мы посчитали сколько же кофе мы приготовили и сколько гостей пришло к нам в прошлом году и сразу решили поделиться. За прошлый 2017год, нашими клиентами стали около 300.000 гостей. И специально для них мы сварили 250.000 чашек ароматного кофе.', 'text', 'КОФЕ В ЦИФРАХ\r\nДОРОГИЕ ГОСТИ, СЕГОДНЯ МЫ ПОСЧИТАЛИ СКОЛЬКО ЖЕ КОФЕ МЫ ПРИГОТОВИЛИ И СКОЛЬКО ГОСТЕЙ ПРИШЛО К НАМ В ПРОШЛОМ ГОДУ И СРАЗУ РЕШИЛИ ПОДЕЛИТЬСЯ. ЗА ПРОШЛЫЙ 2017ГОД, НАШИМИ КЛИЕНТАМИ СТАЛИ ОКОЛО 300.000 ГОСТЕЙ. И СПЕЦИАЛЬНО ДЛЯ НИХ МЫ СВАРИЛИ 250.000 ЧАШЕК АРОМАТНОГО КОФЕ.\r\nДОРОГИЕ ГОСТИ, СЕГОДНЯ МЫ ПОСЧИТАЛИ СКОЛЬКО ЖЕ КОФЕ МЫ ПРИГОТОВИЛИ И СКОЛЬКО ГОСТЕЙ ПРИШЛО К НАМ В ПРОШЛОМ ГОДУ И СРАЗУ РЕШИЛИ ПОДЕЛИТЬСЯ. ЗА ПРОШЛЫЙ 2017ГОД, НАШИМИ КЛИЕНТАМИ СТАЛИ ОКОЛО 300.000 ГОСТЕЙ. И СПЕЦИАЛЬНО ДЛЯ НИХ МЫ СВАРИЛИ 250.000 ЧАШЕК АРОМАТНОГО КОФЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '40', '', '', '0', NULL, 194, '2018-01-18 02:49:25'),
(41, '2018-05-18 11:25:58', 1, '2018-01-16 17:13:21', 1, 1, NULL, 'Y', '2018-01-31 00:00:00', NULL, 500, 'Открытие новой точки на Павелецкой', 159, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!', 'text', 160, 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!', 'text', 'Открытие новой точки на Павелецкой\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!', 1, NULL, NULL, NULL, NULL, NULL, 'N', '41', '', '', '0', NULL, 183, '2018-01-18 02:48:56'),
(44, '2018-06-06 16:31:44', 1, '2018-01-17 14:30:56', 1, 7, NULL, 'Y', NULL, NULL, 1, 'ВАРИАНТЫ РАБОТЫ', 75, '<p class=\"fcb_text\">\r\n    <span class=\"fcbt_bold\">Мы предлагаем</span> своим франчайзи <span class=\"fcbt_red\">готовую бизнес-модель</span>, доказавшую свою эффективность.  На выбор предлагается несколько\r\nформатов кафе:\r\n</p>\r\n<ul class=\"fcb_list\">\r\n    <li><p><span>Кофе поинт</span></p><br> Стоимость до 800.000р включая\r\nпаушальный взнос</p></li>\r\n    <li><p><span>Экспресс кафе</span></p><br> Стоимость от 800.000р включая\r\nпаушальный взнос</p></li>\r\n    <li><p><span>Индивидуальный формат</span></p><br>Стоимость обсуждается индивидуально<br> с\r\nкаждым партнером</li>\r\n</ul>', 'html', NULL, '', 'text', 'ВАРИАНТЫ РАБОТЫ\r\nМы предлагаем своим франчайзи готовую \r\nбизнес-модель, доказавшую свою эффективность. \r\nНа выбор предлагается несколько форматов \r\nкафе: \r\n\r\n- \r\n\r\nКофе поинт\r\nСтоимость до 800.000р включая паушальный взнос \r\n- \r\n\r\nЭкспресс кафе\r\nСтоимость от 800.000р включая паушальный взнос \r\n- \r\n\r\nИндивидуальный формат\r\nСтоимость обсуждается индивидуально\r\nс каждым партнером\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '44', '', '', '0', NULL, NULL, NULL),
(45, '2018-06-06 15:48:09', 1, '2018-01-17 14:35:00', 1, 7, NULL, 'Y', NULL, NULL, 2, 'ФРАНШИЗА PitstopКафе', 76, '<p class=\"fcb_text\">\r\n</p>\r\n<ul class=\"fcb_list\">\r\n    <li><p><span>Консультации и помощь</span></p><br> Консультации по вопросам выбора помещения/места под кафе и помощь в разработке всех разрешительных и проектных документов</p></li>\r\n    <li><p><span>Дизайн и обучение </span></p><br>Индивидуальный дизайн кафе и обучение персонала.</li>\r\n    <li><p><span>Систему управления и IT- инструменты </span></p><br>Централизованную систему управления заказами и контроля поставками продукции и IT- инструменты для анализа работы кафе</li>\r\n    <li><p><span>Команду и поддержку</span></p><br>Старт-ап команду на открытие кофейни и поддержку по управлению и продвижению кафе.</li>\r\n\r\n</ul>\r\n', 'html', NULL, '', 'text', 'ФРАНШИЗА PITSTOPКафе\r\n- \r\n\r\nКонсультации и помощь\r\nКонсультации по вопросам выбора помещения/места \r\nпод кафе и помощь в разработке всех разрешительных \r\nи проектных документов \r\n- \r\n\r\nДизайн и обучение \r\nИндивидуальный дизайн кафе и обучение \r\nперсонала. \r\n- \r\n\r\nСистему управления и IT- инструменты \r\nЦентрализованную систему управления заказами \r\nи контроля поставками продукции и IT- инструменты \r\nдля анализа работы кафе \r\n- \r\n\r\nКоманду и поддержку\r\nСтарт-ап команду на открытие кофейни и \r\nподдержку по управлению и продвижению кафе.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '45', '', '', '0', NULL, NULL, NULL),
(46, '2018-06-06 14:40:56', 1, '2018-01-17 14:36:04', 1, 7, NULL, 'Y', NULL, NULL, 3, 'ЦИФРЫ', 77, '<ul class=\"fcb_list\">\r\n                    <li><p> <span>Концепция рассчитана до мелочей </span><br> на площади до 50 кв. м</p></li>\r\n                    <li><p> <span>Открытие кофейни </span><br> от 2 недель</p></li>\r\n                    <li><p> <span>Срок окупаемости бизнеса </span><br> от 12 месяцев</p></li>\r\n                    <li><p> <span>Среднемесячный доход одной кофейни </span><br> от 100 тыс. рублей</p></li>\r\n</ul>', 'html', NULL, '', 'text', 'ЦИФРЫ\r\n- \r\n\r\nКонцепция рассчитана до мелочей \r\nна площади до 50 кв. м \r\n- \r\n\r\nОткрытие кофейни \r\nот 2 недель \r\n- \r\n\r\nСрок окупаемости бизнеса \r\nот 12 месяцев \r\n- \r\n\r\nСреднемесячный доход одной кофейни \r\nот 100 тыс. рублей\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '46', '', '', '0', NULL, NULL, NULL),
(47, '2018-01-25 15:52:33', 1, '2018-01-17 15:10:55', 1, 8, NULL, 'Y', NULL, NULL, 500, 'БЦ «ОМЕГА ПЛАЗА»', NULL, '', 'text', NULL, '', 'text', 'БЦ «ОМЕГА ПЛАЗА»\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '47', '', '', '0', NULL, NULL, NULL),
(48, '2018-01-25 15:52:14', 1, '2018-01-17 15:12:02', 1, 8, NULL, 'Y', NULL, NULL, 500, 'БЦ САВЁЛОВСКИЙ СИТИ', NULL, '', 'text', NULL, '', 'text', 'БЦ САВЁЛОВСКИЙ СИТИ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '48', '', '', '0', NULL, NULL, NULL),
(49, '2018-01-25 15:51:49', 1, '2018-01-17 15:12:51', 1, 8, NULL, 'Y', NULL, NULL, 500, 'МОСКВА СИТИ, БАШНИ ГОРОД СТОЛИЦ', NULL, '', 'text', NULL, '', 'text', 'МОСКВА СИТИ, БАШНИ ГОРОД СТОЛИЦ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '49', '', '', '0', NULL, NULL, NULL),
(50, '2018-01-25 15:51:23', 1, '2018-01-17 15:13:46', 1, 8, NULL, 'Y', NULL, NULL, 500, 'М. АВИАМОТОРНАЯ', NULL, '', 'text', NULL, '', 'text', 'М. АВИАМОТОРНАЯ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '50', '', '', '0', NULL, NULL, NULL),
(52, '2018-06-27 16:55:10', 1, '2018-01-18 03:53:44', 1, 5, NULL, 'Y', NULL, NULL, 2, 'СЭНДВИЧИ И РОЛЛЫ', 102, '', 'text', 173, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Специально для тех, кто живет в ритме мегаполиса, мы предлагаем вкусные сэндвичи и роллы, купить которые Вы можете в любой из сети наших кофеен «ПитСтоп». </p>\r\n<h2><b>Вкусные сэндвичи и роллы с собой</b></h2>\r\n<p>Кажется, что готовить цезарь-роллы  сложно. Но всегда есть решение -  возьмите с собой любые сэнвичи, сделав заказ у нас. Если вы запланировали поездку или решили быстро перекусить в дороге, по пути на работу, то еда должна быть такой, чтобы ее хранение можно было осуществить вне холодильника. </p>\r\n<p>Преимущества заказа сэндвичей в наших кофейнях: </p>\r\n<ul>\r\n<li>быстрое приготовление ролла или сэндвича и подача заказа; </li>\r\n<li>только свежие продукты, используемые в составе блюд; </li>\r\n<li>низкие цены на весь ассортимент меню. </li>\r\n</ul>\r\n<p>Сэндвичи – это самая распространенная еда в поездках, которую берут в кафе «PitStopКафе». В наших кофейнях это блюдо является дополнением к кофе, можете купить ролл или сэндвич как с овощами, так с мясом и сырами. К тому же, если Вы следите за фигурой, то можете не бояться покупать роллы, т.к. лепешки, в которые заворачивается начинка, делаются из высоких сортов муки. </p>\r\nТакже к кофе Вы всегда можете взять вкусный <a href=\"http://pitstop-cafe.ru/menu/maffin-s-shokoladom/\">маффин с шоколадом</a>.', 'html', 'СЭНДВИЧИ И РОЛЛЫ\r\n\r\nСпециально для тех, кто живет в ритме мегаполиса, \r\nмы предлагаем вкусные сэндвичи и роллы, \r\nкупить которые Вы можете в любой из сети \r\nнаших кофеен «ПитСтоп». Вкусные сэндвичи \r\nи роллы с собой \r\n\r\nКажется, что готовить цезарь-роллы сложно. \r\nНо всегда есть решение - возьмите с собой \r\nлюбые сэнвичи, сделав заказ у нас. Если вы \r\nзапланировали поездку или решили быстро \r\nперекусить в дороге, по пути на работу, то \r\nеда должна быть такой, чтобы ее хранение \r\nможно было осуществить вне холодильника. \r\n\r\nПреимущества заказа сэндвичей в наших \r\nкофейнях: \r\n\r\n- быстрое приготовление ролла или сэндвича \r\nи подача заказа; \r\n- только свежие продукты, используемые \r\nв составе блюд; \r\n- низкие цены на весь ассортимент меню. \r\n\r\nСэндвичи – это самая распространенная \r\nеда в поездках, которую берут в кафе «PITSTOPКафе». \r\nВ наших кофейнях это блюдо является дополнением \r\nк кофе, можете купить ролл или сэндвич как \r\nс овощами, так с мясом и сырами. К тому же, \r\nесли Вы следите за фигурой, то можете не \r\nбояться покупать роллы, т.к. лепешки, в которые \r\nзаворачивается начинка, делаются из высоких \r\nсортов муки. Также к кофе Вы всегда можете \r\nвзять вкусный маффин с шоколадом [ HTTP://PITSTOP-CAFE.RU/MENU/MAFFIN-S-SHOKOLADOM/ ] \r\n.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '52', 'sendvichi-i-rolly', '', '0', NULL, 96, '2018-05-11 14:08:21'),
(53, '2018-06-26 11:20:57', 1, '2018-01-18 03:54:07', 1, 5, NULL, 'Y', NULL, NULL, 4, 'СЛОЙКА С ПОВИДЛОМ', 100, '', 'text', 178, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Мы знаем, что нужно нашим гостям в течение дня. Поэтому предлагаем только ароматную и свежую выпечку, чтобы Вы могли насладиться перекусом или просто минутами отдыха в наших кофейнях. </p>\r\n<h2><b>Слойки с повидлом в кафе</b></h2>\r\n<p>Мы убеждены в том, что качество еды всегда имеет влияние на настроение посетителя. В наших кофейнях готовится только здоровая еда, свежие продукты — все, чтобы ваше самочувствие было на высшем уровне. Также в «ПитСтоп» можно заказать закуски,  которые мы упакуем в удобные, одноразовые контейнеры. Чтобы не переживать о том, из каких ингредиентов сделано ваше блюдо, мы можем Вам рассказать о составе стандартных слоек из теста с повидлом: </p>\r\n<ul>\r\n<li>мука пшеничная, масло сливочное; </li>\r\n <li>сахар, повидло, яйца; </li>\r\n<li>молоко, дрожжи, соль; </li>\r\n<li>ванилин, вода питьевая. </li>\r\n</ul>\r\n<p>При приготовлении каких-либо блюд в сети наших кофеен не используются химикаты, искусственные добавки, ароматизаторы и красители. Мы заботимся своих гостях и предоставляем только вкусную и полезную выпечку. </p>\r\n<p>Наши закуски всегда выполнены из ингредиентов высокого качества. Сладкая и вкусная слойка - идеальное дополнение к горячему кофе. </p>\r\nТакже предлагаем Вам попробовать вкусные <a href=\"http://pitstop-cafe.ru/menu/syrniki-tvorozhnye/\">творожные сырники</a> в наших кофейнях.', 'html', 'СЛОЙКА С ПОВИДЛОМ\r\n\r\nМы знаем, что нужно нашим гостям в течение \r\nдня. Поэтому предлагаем только ароматную \r\nи свежую выпечку, чтобы Вы могли насладиться \r\nперекусом или просто минутами отдыха в \r\nнаших кофейнях. Слойки с повидлом в кафе \r\n\r\nМы убеждены в том, что качество еды всегда \r\nимеет влияние на настроение посетителя. \r\nВ наших кофейнях готовится только здоровая \r\nеда, свежие продукты — все, чтобы ваше самочувствие \r\nбыло на высшем уровне. Также в «ПитСтоп» \r\nможно заказать закуски, которые мы упакуем \r\nв удобные, одноразовые контейнеры. Чтобы \r\nне переживать о том, из каких ингредиентов \r\nсделано ваше блюдо, мы можем Вам рассказать \r\nо составе стандартных слоек из теста с повидлом: \r\n\r\n- мука пшеничная, масло сливочное; \r\n- сахар, повидло, яйца; \r\n- молоко, дрожжи, соль; \r\n- ванилин, вода питьевая. \r\n\r\nПри приготовлении каких-либо блюд в сети \r\nнаших кофеен не используются химикаты, \r\nискусственные добавки, ароматизаторы и \r\nкрасители. Мы заботимся своих гостях и предоставляем \r\nтолько вкусную и полезную выпечку. \r\n\r\nНаши закуски всегда выполнены из ингредиентов \r\nвысокого качества. Сладкая и вкусная слойка \r\n- идеальное дополнение к горячему кофе. \r\nТакже предлагаем Вам попробовать вкусные \r\nтворожные сырники [ HTTP://PITSTOP-CAFE.RU/MENU/SYRNIKI-TVOROZHNYE/ ] \r\nв наших кофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '53', 'sloyka-s-povidlom', '', '0', NULL, 61, '2018-05-11 14:08:26'),
(54, '2018-06-26 11:21:42', 1, '2018-01-18 03:54:43', 1, 5, NULL, 'Y', NULL, NULL, 4, 'МАФФИН С ШОКОЛАДОМ', 101, '', 'text', 174, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Маффины - это разновидность кексов, приготовленных в форме корзинки. В России эти кондитерские изделия особенно популярны, в основном, из-за пышности, воздушности и того, как они тают во рту. </p>\r\n<p>Шоколадные бисквитные лакомства, которые Вы можете купить в нашей кофейне, используют в своем составе натуральные ингредиенты высокого качества. </p>\r\n<h2><b>Шоколадные маффины в кафе</b></h2>\r\n<p>Маффины отличаются следующими вкусовыми особенностями: </p>\r\n<ul>\r\n<li>Они представляют собой сытную выпечку, с красивым внешним видом. Шоколадные изделия особенно популярны под кофе. </li>\r\n<li>Их можно взять и съесть в поездке. Также их подают в виде закуски и заказывают на любые праздники и часто на корпоративы. </li>\r\n<li>Muffin, который представляет собой воздушный мякиш, имеет отменный шоколадный вкус. В основном, они хранятся не больше дня, поэтому есть их нужно сразу. Это очень вкусно! </li>\r\n</ul>\r\n<p>Вы можете заказать маффины в Москве в нашей сети кофеен pitstop-cafe.ru. Эта аппетитная выпечка берет свое начало из Англии, по сути это - бисквитные кексы. В нашей сети кофеен Вы можете купить  шоколадные маффины, а также любые другие кондитерские изделия. </p>\r\nЕсли Вам нравятся легкие, фруктовые десерты, Вы можете взять <a href=\"http://pitstop-cafe.ru/menu/zhele/\">желе</a> в наших кофейнях.', 'html', 'МАФФИН С ШОКОЛАДОМ\r\n\r\nМаффины - это разновидность кексов, приготовленных \r\nв форме корзинки. В России эти кондитерские \r\nизделия особенно популярны, в основном, \r\nиз-за пышности, воздушности и того, как они \r\nтают во рту. \r\n\r\nШоколадные бисквитные лакомства, которые \r\nВы можете купить в нашей кофейне, используют \r\nв своем составе натуральные ингредиенты \r\nвысокого качества. Шоколадные маффины в \r\nкафе \r\n\r\nМаффины отличаются следующими вкусовыми \r\nособенностями: \r\n\r\n- Они представляют собой сытную выпечку, \r\nс красивым внешним видом. Шоколадные изделия \r\nособенно популярны под кофе. \r\n- Их можно взять и съесть в поездке. Также \r\nих подают в виде закуски и заказывают на \r\nлюбые праздники и часто на корпоративы. \r\n- MUFFIN, который представляет собой воздушный \r\nмякиш, имеет отменный шоколадный вкус. В \r\nосновном, они хранятся не больше дня, поэтому \r\nесть их нужно сразу. Это очень вкусно! \r\n\r\nВы можете заказать маффины в Москве в нашей \r\nсети кофеен PITSTOP-CAFE.RU. Эта аппетитная выпечка \r\nберет свое начало из Англии, по сути это \r\n- бисквитные кексы. В нашей сети кофеен Вы \r\nможете купить шоколадные маффины, а также \r\nлюбые другие кондитерские изделия. Если \r\nВам нравятся легкие, фруктовые десерты, \r\nВы можете взять желе [ HTTP://PITSTOP-CAFE.RU/MENU/ZHELE/ ] \r\nв наших кофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '54', 'maffin-s-shokoladom', '', '0', NULL, 66, '2018-05-11 14:08:22'),
(55, '2018-06-27 17:06:15', 1, '2018-01-18 03:55:07', 1, 5, NULL, 'Y', NULL, NULL, 3, 'ЖЕЛЕ', 201, '', 'text', 202, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Такой десерт, как желе из сока и желатина, очень полезен. Кроме этого, неотъемлемой составляющей продукта является глицин, имеющий следующие преимущества: </p>\r\n<ul>\r\n<li>помогает в случае повреждения костной ткани; </li>\r\n<li>является средством профилактики против артрита; </li>\r\n<li>способствует быстрому восстановлению после травм. </li>\r\n</ul>\r\n<p>В сети наших кофеен в Москве можно увидеть немало изысканных десертов, которые можно попробовать, а кроме того, существуют такие разновидности желе, как: </p>\r\n<ul>\r\n<li>панна-котта; </li>\r\n<li>бланманже  - французский десерт из миндального молока; </li>\r\n<li>вагаси - японское желе с живыми цветами. </li>\r\n</ul>\r\n\r\n<p>Купить вкусное желе из фруктов в дополнение к какому-либо из кофейных напитков Вы можете в любой точке наших кофеен. </p>\r\nПредлагаем Вам купить вкусные <a href=\"http://pitstop-cafe.ru/menu/pirozhnye-v-assortimente/\">пирожные в ассортименте</a> в наших кофейнях.', 'html', 'ЖЕЛЕ\r\n\r\nТакой десерт, как желе из сока и желатина, \r\nочень полезен. Кроме этого, неотъемлемой \r\nсоставляющей продукта является глицин, \r\nимеющий следующие преимущества: \r\n\r\n- помогает в случае повреждения костной \r\nткани; \r\n- является средством профилактики против \r\nартрита; \r\n- способствует быстрому восстановлению \r\nпосле травм. \r\n\r\nВ сети наших кофеен в Москве можно увидеть \r\nнемало изысканных десертов, которые можно \r\nпопробовать, а кроме того, существуют такие \r\nразновидности желе, как: \r\n\r\n- панна-котта; \r\n- бланманже - французский десерт из миндального \r\nмолока; \r\n- вагаси - японское желе с живыми цветами. \r\n\r\nКупить вкусное желе из фруктов в дополнение \r\nк какому-либо из кофейных напитков Вы можете \r\nв любой точке наших кофеен. Предлагаем Вам \r\nкупить вкусные пирожные в ассортименте \r\n[ HTTP://PITSTOP-CAFE.RU/MENU/PIROZHNYE-V-ASSORTIMENTE/ ] в наших \r\nкофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '55', 'zhele', '', '0', NULL, 55, '2018-05-11 14:08:23'),
(56, '2018-06-27 17:04:13', 1, '2018-01-18 04:18:30', 1, 5, NULL, 'Y', NULL, NULL, 3, 'ФРУКТОВАЯ НАРЕЗКА', 95, '', 'text', 177, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Фруктовая нарезка—  это красиво, привлекательно, и вкусно. Такое блюдо в наших кофейнях подают к кофе с фруктами. Красивая нарезка выполнена с самым важным условием условие – все плоды свежие и спелые. </p>\r\n<h2><b>Нарезка из фруктов в кафе</b></h2>\r\n<p>Все нарезки оригинально оформлены, подаются, как отдельное блюдо или как десерт к напитку. Самые популярные варианты нарезки фруктов: </p>\r\n<ul>\r\n<li>В полоску. </li>\r\n<li>Картина из фруктов. </li>\r\n<li>Цветы из фруктов. </li>\r\n<li>Нарезка по цветовой палитре. </li>\r\n</ul>\r\n<p>В наших кофейнях всегда строго следят за тем, чтобы ингредиенты были свежими, нарезка из фруктов была красиво подана и гости остались довольны. Такие нарезки подаются, как отдельное блюдо или как закуска к кофе. Их более часто заказывают летом, т.к. фрукты и ягоды подаются охлажденными. Также нарезку можно взять с собой. Или просто заказать любой кофейный напиток вместе с фруктовым десертом. </p>\r\n<p>В сети кофеен «ПитСтоп» Вы можете приятно провести время с друзьями или поcле работы, а также просто прийти в любую из наших точек и сделать заказ любого, понравившегося Вам, блюда. </p>\r\nТакже предлагаем Вам попробовать свежие, вкусные <a href=\"http://pitstop-cafe.ru/menu/sloyka-s-povidlom/\">слойки с повидлом</a> в наших кофейнях.', 'html', 'ФРУКТОВАЯ НАРЕЗКА\r\n\r\nФруктовая нарезка— это красиво, привлекательно, \r\nи вкусно. Такое блюдо в наших кофейнях подают \r\nк кофе с фруктами. Красивая нарезка выполнена \r\nс самым важным условием условие – все плоды \r\nсвежие и спелые. Нарезка из фруктов в кафе \r\n\r\nВсе нарезки оригинально оформлены, подаются, \r\nкак отдельное блюдо или как десерт к напитку. \r\nСамые популярные варианты нарезки фруктов: \r\n\r\n- В полоску. \r\n- Картина из фруктов. \r\n- Цветы из фруктов. \r\n- Нарезка по цветовой палитре. \r\n\r\nВ наших кофейнях всегда строго следят за \r\nтем, чтобы ингредиенты были свежими, нарезка \r\nиз фруктов была красиво подана и гости остались \r\nдовольны. Такие нарезки подаются, как отдельное \r\nблюдо или как закуска к кофе. Их более часто \r\nзаказывают летом, т.к. фрукты и ягоды подаются \r\nохлажденными. Также нарезку можно взять \r\nс собой. Или просто заказать любой кофейный \r\nнапиток вместе с фруктовым десертом. \r\n\r\nВ сети кофеен «ПитСтоп» Вы можете приятно \r\nпровести время с друзьями или поCле работы, \r\nа также просто прийти в любую из наших точек \r\nи сделать заказ любого, понравившегося \r\nВам, блюда. Также предлагаем Вам попробовать \r\nсвежие, вкусные слойки с повидлом [ HTTP://PITSTOP-CAFE.RU/MENU/SLOYKA-S-POVIDLOM/ ] \r\nв наших кофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '56', 'fruktovaya-narezka', '', '0', NULL, 68, '2018-05-11 14:08:25'),
(57, '2018-01-25 16:07:41', 1, '2018-01-18 14:34:42', 1, 9, NULL, 'Y', NULL, NULL, 499, 'Не думай о цене - выбирай по вкусу', 83, '', 'text', NULL, '', 'text', 'НЕ ДУМАЙ О ЦЕНЕ - ВЫБИРАЙ ПО ВКУСУ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '57', '', '', '0', NULL, NULL, NULL),
(58, '2018-01-25 16:06:45', 1, '2018-01-18 14:34:55', 1, 9, NULL, 'Y', NULL, NULL, 500, 'Не думай о цене - выбирай по вкусу', 125, '', 'text', NULL, '', 'text', 'НЕ ДУМАЙ О ЦЕНЕ - ВЫБИРАЙ ПО ВКУСУ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '58', '', '', '0', NULL, NULL, NULL),
(59, '2018-01-25 16:07:11', 1, '2018-01-18 14:35:14', 1, 9, NULL, 'Y', NULL, NULL, 500, 'Не думай о цене - выбирай по вкусу', 126, '', 'text', NULL, '', 'text', 'НЕ ДУМАЙ О ЦЕНЕ - ВЫБИРАЙ ПО ВКУСУ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '59', '', '', '0', NULL, NULL, NULL),
(60, '2018-06-26 11:21:31', 1, '2018-01-24 06:34:23', 1, 5, NULL, 'Y', NULL, NULL, 3, 'ПИРОЖНЫЕ В АССОРТИМЕНТЕ', 96, '', 'text', 176, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Пирожные, насыщенные кремовые и воздушные— это маленький, вкусный праздник в миниатюре. В сети кофеен «ПитСтоп» для Вас ежедневно представлены самые аппетитные пирожные. </p>\r\n<h2><b>Вкусные десерты пирожные в Москве</b></h2>\r\n<p>Мы предлагаем Вашему вниманию самый широкий ассортимент десертов и пирожных, которые вы можете купить в виде десерта к кофе: </p>\r\n<ul>\r\n<li>Песочные – по стандарту изготовляют из теста, в которое входят яйца, сахар и разрыхлители. </li>\r\n<li>Бисквитные – такие пирожные делают из муки с использованием яично-сахарной смеси. </li>\r\n<li>Заварные – изготавливают из заваренной муки, в которую добавляют масло, соль и яйца. </li>\r\n</ul>\r\n<p>Как видите, ингредиенты для продукции, которая есть в наших кофейнях, только натуральные, а последующие изделия самые вкусные и всегда свежие. </p>\r\n<p>Для украшения таких кондитерских изделий используются ягоды, фрукты, различные крема, шоколад, специи (ваниль, корица и т.д.). </p>\r\n<p>Предлагаем Вам посетить любую из наших кофеен и насладиться свежей выпечкой. </p>\r\nТакже Вы можете попробовать вкусную, легкую <a href=\"http://pitstop-cafe.ru/menu/fruktovaya-narezka/\">фруктовую нарезку</a> в наших кофейнях.', 'html', 'ПИРОЖНЫЕ В АССОРТИМЕНТЕ\r\n\r\nПирожные, насыщенные кремовые и воздушные— \r\nэто маленький, вкусный праздник в миниатюре. \r\nВ сети кофеен «ПитСтоп» для Вас ежедневно \r\nпредставлены самые аппетитные пирожные. \r\nВкусные десерты пирожные в Москве \r\n\r\nМы предлагаем Вашему вниманию самый широкий \r\nассортимент десертов и пирожных, которые \r\nвы можете купить в виде десерта к кофе: \r\n\r\n- Песочные – по стандарту изготовляют из \r\nтеста, в которое входят яйца, сахар и разрыхлители. \r\n- Бисквитные – такие пирожные делают из \r\nмуки с использованием яично-сахарной смеси. \r\n- Заварные – изготавливают из заваренной \r\nмуки, в которую добавляют масло, соль и яйца. \r\n\r\nКак видите, ингредиенты для продукции, \r\nкоторая есть в наших кофейнях, только натуральные, \r\nа последующие изделия самые вкусные и всегда \r\nсвежие. \r\n\r\nДля украшения таких кондитерских изделий \r\nиспользуются ягоды, фрукты, различные крема, \r\nшоколад, специи (ваниль, корица и т.д.). \r\n\r\nПредлагаем Вам посетить любую из наших \r\nкофеен и насладиться свежей выпечкой. Также \r\nВы можете попробовать вкусную, легкую фруктовую \r\nнарезку [ HTTP://PITSTOP-CAFE.RU/MENU/FRUKTOVAYA-NAREZKA/ ] в наших \r\nкофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '60', 'pirozhnye-v-assortimente', '', '0', NULL, 56, '2018-05-11 14:08:24'),
(62, '2018-05-18 12:13:45', 1, '2018-01-24 07:06:19', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #1', 165, '', 'text', NULL, '', 'text', 'Слайд #1\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '62', '', '', '0', NULL, NULL, NULL),
(63, '2018-01-24 17:50:21', 1, '2018-01-24 07:06:40', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #2', 110, '', 'text', NULL, '', 'text', 'СЛАЙД #2\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '63', '', '', '0', NULL, NULL, NULL),
(64, '2018-01-24 17:50:33', 1, '2018-01-24 07:09:10', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #3', 111, '', 'text', NULL, '', 'text', 'СЛАЙД #3\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '64', '', '', '0', NULL, NULL, NULL),
(65, '2018-01-24 17:51:05', 1, '2018-01-24 07:09:21', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #4', 112, '', 'text', NULL, '', 'text', 'СЛАЙД #4\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '65', '', '', '0', NULL, NULL, NULL),
(66, '2018-01-24 17:51:23', 1, '2018-01-24 07:09:28', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #5', 113, '', 'text', NULL, '', 'text', 'СЛАЙД #5\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '66', '', '', '0', NULL, NULL, NULL),
(67, '2018-01-24 17:51:42', 1, '2018-01-24 07:09:56', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #6', 114, '', 'text', NULL, '', 'text', 'СЛАЙД #6\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '67', '', '', '0', NULL, NULL, NULL),
(68, '2018-01-24 17:52:15', 1, '2018-01-24 07:10:12', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #7', 115, '', 'text', NULL, '', 'text', 'СЛАЙД #7\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '68', '', '', '0', NULL, NULL, NULL),
(69, '2018-06-27 16:54:31', 1, '2018-01-24 17:35:58', 1, 5, NULL, 'Y', NULL, NULL, 2, 'САЛАТЫ В АССОРТИМЕНТЕ', 195, '', 'text', 196, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Салат - это дополнительное блюдо на ужин и завтрак, в которое могут входить абсолютно различные ингредиенты. Помимо того, что будет входить в салат, важную роль играет то, как он будет заправлен, ведь это позволяет раскрыть вкус еще больше. Салат является отличным вариантом перекуса, а также входит в состав основного блюда практически любого приема пищи.  </p>\r\n<h2><b>Ассортимент овощных салатов в нашем кафе</b></h2>\r\n<p>В нашей кофейне можно ознакомиться с меню, которое располагает выбором вкусных салатов. Их сразу хочется съесть, потому что над созданием блюд работают профессиональные  повара сети кофеен «PitStopКафе», которые всегда делают вкусные закуски, перекусы и кофе нашим гостям. </p>\r\n<p>Для приготовления салатов мы используем: </p>\r\n<ul>\r\n<li>свежие овощи; </li>\r\n<li>мясные и рыбные нарезки; </li>\r\n<li>заправки; </li>\r\n<li>специи и другие ингредиенты. </li>\r\n</ul>\r\n<p>Мы очень любим своих клиентов, поэтому делаем так, чтобы еда была не только вкусной, но и доступной. Кафе «Питстоп»  – это разнообразное меню блюд, недорогой кофе, забота о гостях и  широкий ассортимент салатов в Москве. </p>\r\nВ нашем меню есть <a href=\"http://pitstop-cafe.ru/menu/sendvichi-i-rolly/\">сэндвичи и роллы</a> на любой вкус.', 'html', 'САЛАТЫ В АССОРТИМЕНТЕ\r\n\r\nСалат - это дополнительное блюдо на ужин \r\nи завтрак, в которое могут входить абсолютно \r\nразличные ингредиенты. Помимо того, что \r\nбудет входить в салат, важную роль играет \r\nто, как он будет заправлен, ведь это позволяет \r\nраскрыть вкус еще больше. Салат является \r\nотличным вариантом перекуса, а также входит \r\nв состав основного блюда практически любого \r\nприема пищи. Ассортимент овощных салатов \r\nв нашем кафе \r\n\r\nВ нашей кофейне можно ознакомиться с меню, \r\nкоторое располагает выбором вкусных салатов. \r\nИх сразу хочется съесть, потому что над \r\nсозданием блюд работают профессиональные \r\nповара сети кофеен «PITSTOPКафе», которые всегда \r\nделают вкусные закуски, перекусы и кофе \r\nнашим гостям. \r\n\r\nДля приготовления салатов мы используем: \r\n\r\n- свежие овощи; \r\n- мясные и рыбные нарезки; \r\n- заправки; \r\n- специи и другие ингредиенты. \r\n\r\nМы очень любим своих клиентов, поэтому \r\nделаем так, чтобы еда была не только вкусной, \r\nно и доступной. Кафе «Питстоп» – это разнообразное \r\nменю блюд, недорогой кофе, забота о гостях \r\nи широкий ассортимент салатов в Москве. \r\nВ нашем меню есть сэндвичи и роллы [ HTTP://PITSTOP-CAFE.RU/MENU/SENDVICHI-I-ROLLY/ ] \r\nна любой вкус.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '69', 'salaty-v-assortimente', '', '0', NULL, 85, '2018-05-11 14:08:20'),
(70, '2018-06-27 16:52:29', 1, '2018-01-24 17:36:43', 1, 5, NULL, 'Y', NULL, NULL, 2, 'ЯПОНСКАЯ КУХНЯ', 194, '', 'text', 193, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Мы предлагаем широкий выбор блюд для своих посетителей, которые хотят вкусно перекусить. Наши треугольные сэндвичи порадуют своим вкусом каждого гостя сети кофеен «PitStop». </p>\r\n<p>Есть мнение, что фастфуд является вредной пищей для здоровья людей, но и она может быть здоровой. Например, начиненные овощами, сыром, салатом  и мясом сендвичи панини и чиабатта, купить которые вы можете в наших кофейнях «ПитСтоп», позволят быстро утолить свой голод и насладиться вкусом приготовленной еды в нашей кофейне. Салаты также изготавливаются быстро и без использования искусственных заменителей вкуса. Мы заботимся о своих гостях и об их здоровье. </p>\r\n<h2><b>Купить сэндвичи и салаты в кафе</b></h2>\r\n<p>Идея «PitStopКафе»- это не только вкусный кофе, но и сэндвичи со свежими салатами, которые можно как попробовать в наших кофейнях, так и взять с собой в дорогу. Вся наша продукция приготовлена из тех ингредиентов, которые не содержат каких-либо неполезных пищевых добавок. </p>\r\n<p>Преимущества заказа сэндвичей и салатов у нас: </p>\r\n<ul>\r\n<li>абсолютная безопасность ингредиентов; </li>\r\n<li>качественные продукты. </li>\r\n</ul>\r\n<p>Наши сэндвичи предлагаются с различными вариантами начинки, а калорийность салатов не так высока, поэтому вы можете вкусно перекусить, не беспокоясь о безопасности своего здоровья! А пока вы будете ожидать приготовление своего заказа, можете насладиться приятной музыкой и уютной атмосферой. </p>\r\nПредлагаем Вам посмотреть меню <a href=\"http://pitstop-cafe.ru/menu/salaty-v-assortimente/\">салатов в ассортименте</a>, представленных в наших кофейнях.', 'html', 'ЯПОНСКАЯ КУХНЯ\r\n\r\nМы предлагаем широкий выбор блюд для своих \r\nпосетителей, которые хотят вкусно перекусить. \r\nНаши треугольные сэндвичи порадуют своим \r\nвкусом каждого гостя сети кофеен «PITSTOP». \r\n\r\nЕсть мнение, что фастфуд является вредной \r\nпищей для здоровья людей, но и она может \r\nбыть здоровой. Например, начиненные овощами, \r\nсыром, салатом и мясом сендвичи панини и \r\nчиабатта, купить которые вы можете в наших \r\nкофейнях «ПитСтоп», позволят быстро утолить \r\nсвой голод и насладиться вкусом приготовленной \r\nеды в нашей кофейне. Салаты также изготавливаются \r\nбыстро и без использования искусственных \r\nзаменителей вкуса. Мы заботимся о своих \r\nгостях и об их здоровье. Купить сэндвичи \r\nи салаты в кафе \r\n\r\nИдея «PITSTOPКафе»- это не только вкусный кофе, \r\nно и сэндвичи со свежими салатами, которые \r\nможно как попробовать в наших кофейнях, \r\nтак и взять с собой в дорогу. Вся наша продукция \r\nприготовлена из тех ингредиентов, которые \r\nне содержат каких-либо неполезных пищевых \r\nдобавок. \r\n\r\nПреимущества заказа сэндвичей и салатов \r\nу нас: \r\n\r\n- абсолютная безопасность ингредиентов; \r\n- качественные продукты. \r\n\r\nНаши сэндвичи предлагаются с различными \r\nвариантами начинки, а калорийность салатов \r\nне так высока, поэтому вы можете вкусно \r\nперекусить, не беспокоясь о безопасности \r\nсвоего здоровья! А пока вы будете ожидать \r\nприготовление своего заказа, можете насладиться \r\nприятной музыкой и уютной атмосферой. Предлагаем \r\nВам посмотреть меню салатов в ассортименте \r\n[ HTTP://PITSTOP-CAFE.RU/MENU/SALATY-V-ASSORTIMENTE/ ] , представленных \r\nв наших кофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '70', 'sendvichi-i-salaty', '', '0', NULL, 89, '2018-05-11 14:08:19'),
(71, '2018-06-27 16:48:27', 1, '2018-01-24 17:38:30', 1, 5, NULL, 'Y', NULL, NULL, 1, 'КОФЕ АМЕРИКАНО 300мл', 105, '', 'text', 172, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Многие из нас уже не могут начать полноценно своё утро или рабочий день без глотка кофе. Без его мягкого, горьковатого и бодрящего вкуса. Любовь к такому напитку объяснена необычными рецептами его приготовления, о  которых Вы можете узнать в нашем кафе, либо, приготовив  его самостоятельно. </p>\r\n<h2><b>Купить кофе американо в Москве</b></h2>\r\n<p>Кофе американо — один из первых видов приготовления кофе. В наших кофейнях кофе всегда свежесмолотый, причем степень его помола всегда высока, чтобы кофейная гуща не ощущалась во рту. </p>\r\n<p>Преимущества напитка американо: </p>\r\n<ul>\r\n<li>придает бодрость; </li>\r\n<li>в него можно добавить молоко, сиропы, маршмеллоу – этот напиток, в отличии от капучино или латте, не содержит в своем составе ничего, кроме эспрессо и воды; </li>\r\n<li>помогает расслабиться среди рабочего дня, благодаря своему аромату; </li>\r\n<li>его можно взять с собой в одной из наших кофеен, а его стоимость будет всего 77 рублей. </li>\r\n</ul>\r\n<p>Каждый из наших гостей находит в любом из видов кофе что-то свое, а мы всегда предлагаем широкий ассортимент зернового кофе и вкуснейших десертов к нему. </p>\r\nЕсли вы хотите просто и вкусно перекусить, предлагаем Вам взять <a href=\"http://pitstop-cafe.ru/menu/sendvichi-i-salaty/\">сэндвичи и салаты</a> в наших кофейнях.</p>\r\n<p>Кофе американо можно купить увеличенную порцию 500мл.</p> <p>* в некоторых кафе цена может отличаться.</p>', 'html', 'КОФЕ АМЕРИКАНО 300мл\r\n\r\nМногие из нас уже не могут начать полноценно \r\nсвоё утро или рабочий день без глотка кофе. \r\nБез его мягкого, горьковатого и бодрящего \r\nвкуса. Любовь к такому напитку объяснена \r\nнеобычными рецептами его приготовления, \r\nо которых Вы можете узнать в нашем кафе, \r\nлибо, приготовив его самостоятельно. Купить \r\nкофе американо в Москве \r\n\r\nКофе американо — один из первых видов приготовления \r\nкофе. В наших кофейнях кофе всегда свежесмолотый, \r\nпричем степень его помола всегда высока, \r\nчтобы кофейная гуща не ощущалась во рту. \r\n\r\nПреимущества напитка американо: \r\n\r\n- придает бодрость; \r\n- в него можно добавить молоко, сиропы, маршмеллоу \r\n– этот напиток, в отличии от капучино или \r\nлатте, не содержит в своем составе ничего, \r\nкроме эспрессо и воды; \r\n- помогает расслабиться среди рабочего \r\nдня, благодаря своему аромату; \r\n- его можно взять с собой в одной из наших \r\nкофеен, а его стоимость будет всего 77 рублей. \r\n\r\nКаждый из наших гостей находит в любом \r\nиз видов кофе что-то свое, а мы всегда предлагаем \r\nширокий ассортимент зернового кофе и вкуснейших \r\nдесертов к нему. Если вы хотите просто и \r\nвкусно перекусить, предлагаем Вам взять \r\nсэндвичи и салаты [ HTTP://PITSTOP-CAFE.RU/MENU/SENDVICHI-I-SALATY/ ] \r\nв наших кофейнях. \r\n\r\nКофе американо можно купить увеличенную \r\nпорцию 500мл. \r\n\r\n* в некоторых кафе цена может отличаться.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '71', 'kofe-amerikano', '', '0', NULL, 68, '2018-05-11 14:08:19'),
(72, '2018-06-27 16:48:52', 1, '2018-01-24 17:38:56', 1, 5, NULL, 'Y', NULL, NULL, 1, 'КОФЕ КАПУЧИНО 300мл', 106, '', 'text', 171, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Наша сеть заведений готовит вкусный капучино в Москве для всех гостей, в этом уверены многие гости кофеен «ПитСтоп». Кроме различного кофе, здесь есть десерты и быстрые  варианты перекусов. </p>\r\n<h2><b>Вкусный кофе капучино в Москве</b></h2>\r\n<p>Кофе от «PitStopКафе» подходит тем, кто предпочитает напитки на основе крепкого кофе (эспрессо) с необычными способами варки и приготовления. У нас есть всё для знакомства с кофейной культурой: </p>\r\n<ul>\r\n<li>наши бариста могут рассказать вам всё о различных сортах кофе; </li>\r\n<li>пока вы в процессе ожидания приготовления капучино, можете ознакомиться и с остальными его сортами. </li>\r\n</ul>\r\n<p>Также такой напиток, как капучино, обладает следующими преимуществами: </p>\r\n<ul>\r\n<li>кофе рекомендуется пить с молоком, т.к. он вымывает из организма кальций, а такой вариант, как капучино идеально подходит для этого, сочетая в себе все необходимые ингредиенты; </li>\r\n<li>этот напиток помогает расслабиться среди рабочего дня, немного отойти от сторонних мыслей; </li>\r\n<li>капучино, в отличие от других сортов кофе, имеет более мягкий вкус. </li>\r\n</ul>\r\n<p>Купить с собой вкусный кофе капучино Вы можете в любой из наших кофеен. Сколько же стоит молотый кофе капучино? Всего 77р! </p>\r\nТакже предлагаем Вам купить вкусный <a href=\"http://pitstop-cafe.ru/menu/kofe-amerikano/\">кофе американо</a> в наших кофейнях.</p>\r\n<p>Кофе капучино можно купить увеличенную порцию 500мл.</p> <p>* в некоторых кафе цена может отличаться.</p>', 'html', 'КОФЕ КАПУЧИНО 300мл\r\n\r\nНаша сеть заведений готовит вкусный капучино \r\nв Москве для всех гостей, в этом уверены \r\nмногие гости кофеен «ПитСтоп». Кроме различного \r\nкофе, здесь есть десерты и быстрые варианты \r\nперекусов. Вкусный кофе капучино в Москве \r\n\r\nКофе от «PITSTOPКафе» подходит тем, кто предпочитает \r\nнапитки на основе крепкого кофе (эспрессо) \r\nс необычными способами варки и приготовления. \r\nУ нас есть всё для знакомства с кофейной \r\nкультурой: \r\n\r\n- наши бариста могут рассказать вам всё \r\nо различных сортах кофе; \r\n- пока вы в процессе ожидания приготовления \r\nкапучино, можете ознакомиться и с остальными \r\nего сортами. \r\n\r\nТакже такой напиток, как капучино, обладает \r\nследующими преимуществами: \r\n\r\n- кофе рекомендуется пить с молоком, т.к. \r\nон вымывает из организма кальций, а такой \r\nвариант, как капучино идеально подходит \r\nдля этого, сочетая в себе все необходимые \r\nингредиенты; \r\n- этот напиток помогает расслабиться среди \r\nрабочего дня, немного отойти от сторонних \r\nмыслей; \r\n- капучино, в отличие от других сортов кофе, \r\nимеет более мягкий вкус. \r\n\r\nКупить с собой вкусный кофе капучино Вы \r\nможете в любой из наших кофеен. Сколько \r\nже стоит молотый кофе капучино? Всего 77р! \r\nТакже предлагаем Вам купить вкусный кофе \r\nамерикано [ HTTP://PITSTOP-CAFE.RU/MENU/KOFE-AMERIKANO/ ] в наших \r\nкофейнях. \r\n\r\nКофе капучино можно купить увеличенную \r\nпорцию 500мл. \r\n\r\n* в некоторых кафе цена может отличаться.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '72', 'kofe-kapuchino', '', '0', NULL, 72, '2018-05-11 14:08:18');
INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
(73, '2018-06-27 16:48:45', 1, '2018-01-24 17:39:16', 1, 5, NULL, 'Y', NULL, NULL, 1, 'КОФЕ ЛАТТЕ 300мл', 107, '', 'text', 170, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>У жителей Москвы сейчас очень много требований к современным кофейням: обычного, хорошего расположения гостям заведения уже недостаточно,  приходят только за напитками высокого качества. Кофейни «ПитСтоп» всегда с особым подходом относятся к выбору кофейных зерен и не экономят на используемой технике, потому что она позволяет сохранить вкус напитка. </p>\r\n<h2><b>Купить кофе латте в Москве</b></h2>\r\n<p>Мы варим кофе латте в Москве, купить который Вы можете в одной из кофеен нашей сети. Также в наших кофейнях есть следующие преимущества: </p>\r\n<ul>\r\n<li>в любую кофейню удобно прийти с ноутбуком; </li>\r\n<li>можно почитать книгу за чашечкой свежесваренного латте. </li>\r\n</ul>\r\n<p>Родина такого напитка как кофе латте - Италия. Жители этой страны, знают толк в кофейных напитках. Кстати, он не пользуется такой большой популярностью на родине, как в России. </p>\r\n<p>В кафе «PitStopКафе»  варят не только качественный латте (latte  переводится с итальянского «молоко»), но и предлагают вкусные дополнения: десерты, пирожные. Все кофейные напитки, которые Вы можете попробовать у нас или же просто купить и взять с собой в дорогу, приготовлены из свежеобжареных зерен и могут отлично дополнить сладкое. Цена на кофе латте – всего 77р! </p>\r\nТакже предлагаем Вам взять вкусный <a href=\"http://pitstop-cafe.ru/menu/kofe-kapuchino/\">кофе капучино</a> в наших кофейнях.</p>\r\n<p>Кофе латте можно купить увеличенную порцию 500мл.</p> <p>* в некоторых кафе цена может отличаться.</p>\r\n', 'html', 'КОФЕ ЛАТТЕ 300мл\r\n\r\nУ жителей Москвы сейчас очень много требований \r\nк современным кофейням: обычного, хорошего \r\nрасположения гостям заведения уже недостаточно, \r\nприходят только за напитками высокого качества. \r\nКофейни «ПитСтоп» всегда с особым подходом \r\nотносятся к выбору кофейных зерен и не экономят \r\nна используемой технике, потому что она \r\nпозволяет сохранить вкус напитка. Купить \r\nкофе латте в Москве \r\n\r\nМы варим кофе латте в Москве, купить который \r\nВы можете в одной из кофеен нашей сети. Также \r\nв наших кофейнях есть следующие преимущества: \r\n\r\n- в любую кофейню удобно прийти с ноутбуком; \r\n- можно почитать книгу за чашечкой свежесваренного \r\nлатте. \r\n\r\nРодина такого напитка как кофе латте - Италия. \r\nЖители этой страны, знают толк в кофейных \r\nнапитках. Кстати, он не пользуется такой \r\nбольшой популярностью на родине, как в России. \r\n\r\nВ кафе «PITSTOPКафе» варят не только качественный \r\nлатте (LATTE переводится с итальянского «молоко»), \r\nно и предлагают вкусные дополнения: десерты, \r\nпирожные. Все кофейные напитки, которые \r\nВы можете попробовать у нас или же просто \r\nкупить и взять с собой в дорогу, приготовлены \r\nиз свежеобжареных зерен и могут отлично \r\nдополнить сладкое. Цена на кофе латте – \r\nвсего 77р! Также предлагаем Вам взять вкусный \r\nкофе капучино [ HTTP://PITSTOP-CAFE.RU/MENU/KOFE-KAPUCHINO/ ] \r\nв наших кофейнях. \r\n\r\nКофе латте можно купить увеличенную порцию \r\n500мл. \r\n\r\n* в некоторых кафе цена может отличаться.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '73', 'kofe-latte', '', '0', NULL, 82, '2018-05-11 14:08:08'),
(74, '2018-06-27 17:03:28', 1, '2018-01-24 17:41:00', 1, 5, NULL, 'Y', NULL, NULL, 3, 'СЫРНИКИ ТВОРОЖНЫЕ', 199, '', 'text', 200, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Что может дополнить чашечку мягкого кофе? Мы предлагаем нашим гостям свежие и вкусные творожные сырники с мягким ароматом и легким вкусом. Такие творожные десерты широко востребованы за пределами России. Наши сырники выпекаются из такого теста, в которое мы можем  добавить свежие ягоды, какие-либо орехи, конечно же, творог и любые другие ингредиенты, пряные специи. Кроме традиционных, сладких вариантов, во многих странах выпекаются также и другие сырники – с зеленью, сыром, несладкие и многие другие. </p>\r\n<h2><b>Сырники из творога в кафе</b></h2>\r\n<p>Мы предлагаем Вам вкусные сырники в кафе, для приготовления которых используем те сочетания ингредиентов , которые полюбились нашими клиентами. Наши кондитерские изделия имеют высокий спрос, благодаря тому, что: </p>\r\n<ul>\r\n<li>изготавливаются из продуктов высокого качества; </li>\r\n<li>мы используем свежие ингредиенты; </li>\r\n<li>мы не придумываем сочетания вкусов. </li>\r\n</ul>\r\n<p>Их также покупают и на организацию различных мероприятий, начиная от  фуршетов и детских праздников. Если вы любите эту популярную выпечку, вы можете купить  творожные сырники в Москве в одной из наших кофеен! </p>\r\nТакже предлагаем Вам взять вкусный <a href=\"http://pitstop-cafe.ru/menu/kofe-latte/\"  link=\"red\">кофе латте</a> в наших кофейнях.', 'html', 'СЫРНИКИ ТВОРОЖНЫЕ\r\n\r\nЧто может дополнить чашечку мягкого кофе? \r\nМы предлагаем нашим гостям свежие и вкусные \r\nтворожные сырники с мягким ароматом и легким \r\nвкусом. Такие творожные десерты широко \r\nвостребованы за пределами России. Наши \r\nсырники выпекаются из такого теста, в которое \r\nмы можем добавить свежие ягоды, какие-либо \r\nорехи, конечно же, творог и любые другие \r\nингредиенты, пряные специи. Кроме традиционных, \r\nсладких вариантов, во многих странах выпекаются \r\nтакже и другие сырники – с зеленью, сыром, \r\nнесладкие и многие другие. Сырники из творога \r\nв кафе \r\n\r\nМы предлагаем Вам вкусные сырники в кафе, \r\nдля приготовления которых используем те \r\nсочетания ингредиентов , которые полюбились \r\nнашими клиентами. Наши кондитерские изделия \r\nимеют высокий спрос, благодаря тому, что: \r\n\r\n- изготавливаются из продуктов высокого \r\nкачества; \r\n- мы используем свежие ингредиенты; \r\n- мы не придумываем сочетания вкусов. \r\n\r\nИх также покупают и на организацию различных \r\nмероприятий, начиная от фуршетов и детских \r\nпраздников. Если вы любите эту популярную \r\nвыпечку, вы можете купить творожные сырники \r\nв Москве в одной из наших кофеен! Также предлагаем \r\nВам взять вкусный кофе латте [ HTTP://PITSTOP-CAFE.RU/MENU/KOFE-LATTE/ ] \r\nв наших кофейнях.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '74', 'syrniki-tvorozhnye', '', '0', NULL, 106, '2018-05-11 13:27:22'),
(75, '2018-01-24 17:53:52', 1, '2018-01-24 17:53:52', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #8', 116, '', 'text', NULL, '', 'text', 'СЛАЙД #8\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '75', '', '', '0', NULL, NULL, NULL),
(76, '2018-01-24 17:54:11', 1, '2018-01-24 17:54:11', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #9', 117, '', 'text', NULL, '', 'text', 'СЛАЙД #9\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '76', '', '', '0', NULL, NULL, NULL),
(77, '2018-01-24 17:54:50', 1, '2018-01-24 17:54:50', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #10', 118, '', 'text', NULL, '', 'text', 'СЛАЙД #10\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '77', '', '', '0', NULL, NULL, NULL),
(78, '2018-01-24 17:56:02', 1, '2018-01-24 17:56:02', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #11', 119, '', 'text', NULL, '', 'text', 'СЛАЙД #11\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '78', '', '', '0', NULL, NULL, NULL),
(79, '2018-01-24 17:56:42', 1, '2018-01-24 17:56:42', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #12', 120, '', 'text', NULL, '', 'text', 'СЛАЙД #12\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '79', '', '', '0', NULL, NULL, NULL),
(80, '2018-01-25 15:53:33', 1, '2018-01-25 15:53:33', 1, 8, NULL, 'Y', NULL, NULL, 500, 'ПАВЕЛЕЦКИЙ ВОКЗАЛ', NULL, '', 'text', NULL, '', 'text', 'ПАВЕЛЕЦКИЙ ВОКЗАЛ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '80', '', '', '0', NULL, NULL, NULL),
(86, '2018-05-11 16:18:01', 1, '2018-04-05 12:04:11', 1, 14, NULL, 'Y', NULL, NULL, 500, 'Вместе всю неделю', NULL, 'Друзья, мы очень любим делать маленькие приятности своим гостям и сегодня хотим поделиться с Вами очень радостным событием из жизни PitStopКафе. Мы объявляем неделю кoфемании - с 28.03.18 во всех кофейнях PitStop на территории Москвы cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". Все любители кофе могут ликовать, потому что при покупке 4-х любых напитков из ассортимента:', 'html', 153, '<p>Друзья, мы очень любим делать маленькие приятности своим гостям и сегодня хотим поделиться с Вами очень радостным событием из жизни PitStopКафе. Мы объявляем неделю кофемании - с 28.03.18 во всех кофейнях PitStop на территории Москвы cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". Все любители кофе могут ликовать, потому что при покупке 4-х любых напитков из ассортимента: </p>\r\n<ul>\r\n\r\n<li>кофе Латте </li>\r\n<li>кофе Капучино </li>\r\n<li>кофе Эспрессо </li>\r\n<li>кофе двойной Эспрессо </li>\r\n<li>кофе Американо </li>\r\n</ul>\r\n\r\n<p>5-ый Вы получаете в ПОДАРОК! Нам радостно от того, что мы можем согреть Вас чашечкой ароматного кофе в холодную погоду. ', 'html', 'Вместе всю неделю\r\nДрузья, мы очень любим делать маленькие \r\nприятности своим гостям и сегодня хотим \r\nподелиться с Вами очень радостным событием \r\nиз жизни PITSTOPКафе. Мы объявляем неделю кOфемании \r\n- с 28.03.18 во всех кофейнях PITSTOP на территории \r\nМосквы Cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". \r\nВсе любители кофе могут ликовать, потому \r\nчто при покупке 4-х любых напитков из ассортимента:\r\nДрузья, мы очень любим делать маленькие \r\nприятности своим гостям и сегодня хотим \r\nподелиться с Вами очень радостным событием \r\nиз жизни PITSTOPКафе. Мы объявляем неделю кофемании \r\n- с 28.03.18 во всех кофейнях PITSTOP на территории \r\nМосквы Cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". \r\nВсе любители кофе могут ликовать, потому \r\nчто при покупке 4-х любых напитков из ассортимента: \r\n\r\n- кофе Латте \r\n- кофе Капучино \r\n- кофе Эспрессо \r\n- кофе двойной Эспрессо \r\n- кофе Американо \r\n\r\n5-ый Вы получаете в ПОДАРОК! Нам радостно \r\nот того, что мы можем согреть Вас чашечкой \r\nароматного кофе в холодную погоду.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '86', 'vmeste-vsu-nedelu', '', '0', NULL, 114, '2018-04-05 12:40:45'),
(87, '2018-05-11 16:16:27', 1, '2018-04-05 12:53:53', 1, 14, NULL, 'Y', NULL, NULL, 500, 'Кофе-гигант', 148, 'Кофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!', 'text', 151, '<p> Кофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!</p>\r\n\r\n<p>С сегодняшнего дня во всех кофейнях PitStop <a href=\"http://pitstop-cafe.ru/cafe/ \" >http://pitstop-cafe.ru/cafe/</a> вы можете купить самый большой кофе объемом 500 мл и всего за 100 рублей ❗ Такого вы не найдете нигде!!!!</p>\r\n\r\n<p>Подумайте сами: зачем переплачивать за стандартный стаканчик капучино (250 мл) 250 рублей, если можно купить в два раза больше и заплатить за это в два раза меньше? И продлить наслаждение любимым вкусом и ароматом еще на несколько мгновений! Кофе - Гигант уже ждет своих покупателей и готов делиться своим кофейным позитивом с гостями.</p>', 'html', 'Кофе-гигант\r\nКофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!\r\nКофеманы да возрадуются!!!!! С 03.04.18 мы запускаем \r\nУЛЕТНОЕ предложение, от которого невозможно \r\nотказаться! \r\n\r\nС сегодняшнего дня во всех кофейнях PITSTOP \r\nHTTP://PITSTOP-CAFE.RU/CAFE/ [ HTTP://PITSTOP-CAFE.RU/CAFE/  ] вы можете \r\nкупить самый большой кофе объемом 500 мл \r\nи всего за 100 рублей ❗ Такого вы не найдете \r\nнигде!!!! \r\n\r\nПодумайте сами: зачем переплачивать за \r\nстандартный стаканчик капучино (250 мл) 250 \r\nрублей, если можно купить в два раза больше \r\nи заплатить за это в два раза меньше? И продлить \r\nнаслаждение любимым вкусом и ароматом еще \r\nна несколько мгновений! Кофе - Гигант уже \r\nждет своих покупателей и готов делиться \r\nсвоим кофейным позитивом с гостями.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '87', '', '', '0', NULL, 96, '2018-04-05 12:54:06'),
(91, '2018-05-11 18:17:04', 1, '2018-05-11 18:17:04', 1, 7, NULL, 'Y', NULL, NULL, 500, 'Карта сайта', NULL, '', 'text', NULL, '', 'text', 'Карта сайта\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '91', '', '', '0', NULL, NULL, NULL),
(93, '2018-05-16 19:08:45', 1, '2018-05-16 19:08:45', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Тут всё для кофе', 154, '', 'text', NULL, '', 'text', 'Тут всё для кофе\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '93', '', '', '0', NULL, NULL, NULL),
(94, '2018-05-22 17:07:25', 1, '2018-05-18 12:09:36', 1, 15, NULL, 'Y', '2018-05-18 00:00:00', NULL, 1, 'Карта сайта', NULL, '<ul>\r\n<p> <a href=http://pitstop-cafe.ru/cafe/>Кофейни</a> </p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/>Меню</a></p>\r\n<ul>\r\n<p> <a href=http://pitstop-cafe.ru/menu/syrniki-tvorozhnye/ >Сырники творожные</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/kofe-latte/ >Кофе латте</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/kofe-kapuchino/ >Кофе капучино</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/kofe-amerikano/ >Кофе американо</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/sendvichi-i-salaty/ >Сэндвичи и салаты</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/salaty-v-assortimente/ >Салаты в ассортименте</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/sendvichi-i-rolly/ >Сэндвичи и роллы</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/maffin-s-shokoladom/ >Маффины с шоколадом</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/zhele/ >Желе</a></p>\r\n<p><a href=http://pitstop-cafe.ru/menu/pirozhnye-v-assortimente/ >Пирожные в ассортименте</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/fruktovaya-narezka/>Фруктовые нарезки</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/menu/sloyka-s-povidlom/ >Слойки с повидлом</a></p>\r\n</ul>\r\n<p> <a href=http://pitstop-cafe.ru/franchising/>Франчайзинг</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/news/>Новости</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/aktsii/>Акции</a></p>\r\n<p> <a href=http://pitstop-cafe.ru/contacts/>Контакты</a></p>\r\n</ul>\r\n', 'html', NULL, '', 'text', 'Карта сайта\r\nКофейни [  ] \r\n\r\nМеню [  ] \r\n\r\n\r\nСырники творожные [  ] \r\n\r\nКофе латте [  ] \r\n\r\nКофе капучино [  ] \r\n\r\nКофе американо [  ] \r\n\r\nСэндвичи и салаты [  ] \r\n\r\nСалаты в ассортименте [  ] \r\n\r\nСэндвичи и роллы [  ] \r\n\r\nМаффины с шоколадом [  ] \r\n\r\nЖеле [  ] \r\n\r\nПирожные в ассортименте [  ] \r\n\r\nФруктовые нарезки [  ] \r\n\r\nСлойки с повидлом [  ] \r\n\r\nФранчайзинг [  ] \r\n\r\nНовости [  ] \r\n\r\nАкции [  ] \r\n\r\nКонтакты [  ]\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '94', 'ssylka-dlya-karty', '', '0', NULL, 53, '2018-05-18 12:26:03'),
(96, '2018-05-18 12:16:31', 1, '2018-05-18 12:16:31', 1, 6, NULL, 'Y', NULL, NULL, 500, 'Слайд #14', 166, '', 'text', NULL, '', 'text', 'Слайд #14\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '96', '', '', '0', NULL, NULL, NULL),
(97, '2018-06-27 16:48:04', 1, '2018-06-26 11:07:39', 1, 5, NULL, 'Y', NULL, NULL, 1, 'КОФЕ 500мл', 192, '', 'text', 191, '<style>\r\n   A {\r\n    color: #FF0000; /* Цвет текста */\r\n    padding: 2px; /* Поля вокруг текста */\r\n   }\r\n  </style><p>Что мы предлагаем нашим клиентам к чашечке мягкого кофе? Мы предлагаем им свежие и вкусные творожные сырники с мягким ароматом и легким вкусом. Такие творожные десерты широко востребованы за пределами России. Наши сырники выпекаются из такого теста, в которое мы можем  добавить свежие ягоды, какие-либо орехи, конечно же, творог и любые другие ингредиенты, пряные специи. Кроме традиционных, сладких вариантов, во многих странах выпекаются также и другие сырники – с зеленью, сыром, несладкие и многие другие. </p>\r\n<h2><b>Сырники из творога в кафе</b></h2>\r\n<p>Мы предлагаем Вам вкусные сырники в кафе, для приготовления которых используем те сочетания ингредиентов , которые полюбились нашими клиентами. Наши кондитерские изделия имеют высокий спрос, благодаря тому, что: </p>\r\n<ul>\r\n<li>изготавливаются из продуктов высокого качества; </li>\r\n<li>мы используем свежие ингредиенты; </li>\r\n<li>мы не придумываем сочетания вкусов. </li>\r\n</ul>\r\n<p>Их также покупают и на организацию различных мероприятий, начиная от  фуршетов и детских праздников. Если вы любите эту популярную выпечку, вы можете купить  творожные сырники в Москве в одной из наших кофеен! </p>\r\nТакже предлагаем Вам взять вкусный <a href=\"http://pitstop-cafe.ru/menu/kofe-latte/\"  link=\"red\">кофе латте</a> в наших кофейнях.</p>\r\n<p>* в некоторых кафе цена может отличаться.</p>', 'html', 'КОФЕ 500мл\r\n\r\nЧто мы предлагаем нашим клиентам к чашечке \r\nмягкого кофе? Мы предлагаем им свежие и \r\nвкусные творожные сырники с мягким ароматом \r\nи легким вкусом. Такие творожные десерты \r\nшироко востребованы за пределами России. \r\nНаши сырники выпекаются из такого теста, \r\nв которое мы можем добавить свежие ягоды, \r\nкакие-либо орехи, конечно же, творог и любые \r\nдругие ингредиенты, пряные специи. Кроме \r\nтрадиционных, сладких вариантов, во многих \r\nстранах выпекаются также и другие сырники \r\n– с зеленью, сыром, несладкие и многие другие. \r\nСырники из творога в кафе \r\n\r\nМы предлагаем Вам вкусные сырники в кафе, \r\nдля приготовления которых используем те \r\nсочетания ингредиентов , которые полюбились \r\nнашими клиентами. Наши кондитерские изделия \r\nимеют высокий спрос, благодаря тому, что: \r\n\r\n- изготавливаются из продуктов высокого \r\nкачества; \r\n- мы используем свежие ингредиенты; \r\n- мы не придумываем сочетания вкусов. \r\n\r\nИх также покупают и на организацию различных \r\nмероприятий, начиная от фуршетов и детских \r\nпраздников. Если вы любите эту популярную \r\nвыпечку, вы можете купить творожные сырники \r\nв Москве в одной из наших кофеен! Также предлагаем \r\nВам взять вкусный кофе латте [ HTTP://PITSTOP-CAFE.RU/MENU/KOFE-LATTE/ ] \r\nв наших кофейнях. \r\n\r\n* в некоторых кафе цена может отличаться.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '97', 'avtorskiy-kofe', '', '0', NULL, 23, '2018-06-26 11:09:34'),
(98, '2018-06-27 16:59:38', 1, '2018-06-26 14:21:50', 1, 5, NULL, 'N', NULL, NULL, 2, 'ПИРОГИ СЫТНЫЕ', NULL, '', 'text', NULL, '', 'text', 'ПИРОГИ СЫТНЫЕ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '98', 'pirogi-sytnye', '', '0', NULL, 2, '2018-06-26 14:27:22'),
(99, '2018-06-27 17:06:46', 1, '2018-06-26 14:23:32', 1, 5, NULL, 'N', NULL, NULL, 3, 'СЫРНИКИ', NULL, '', 'text', NULL, '', 'text', 'СЫРНИКИ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '99', 'syrniki', '', '0', NULL, 2, '2018-06-26 19:13:08'),
(100, '2018-06-27 17:08:50', 1, '2018-06-26 14:24:50', 1, 5, NULL, 'Y', NULL, NULL, 4, 'КРУАСАН', 203, '', 'text', 204, '', 'text', 'КРУАСАН\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '100', 'kruasan', '', '0', NULL, 7, '2018-06-27 05:24:09'),
(101, '2018-06-27 17:12:32', 1, '2018-06-26 14:25:32', 1, 5, NULL, 'Y', NULL, NULL, 4, 'КРЕКЕЛИНЫ', 205, '', 'text', 206, '', 'text', 'КРЕКЕЛИНЫ\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '101', 'krekeliny', '', '0', NULL, 10, '2018-06-26 14:27:39'),
(102, '2018-06-27 16:58:05', 1, '2018-06-27 16:58:05', 1, 5, NULL, 'Y', NULL, NULL, 2, 'Тосты с ветчиной или рыбой', 197, '', 'text', 198, '', 'text', 'Тосты с ветчиной или рыбой\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '102', 'tosty-s-vetchinoy-ili-ryboy', '', '0', NULL, 11, '2018-06-27 19:54:23');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_iprop`
--

CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element_iprop`
--

INSERT INTO `b_iblock_element_iprop` (`IBLOCK_ID`, `SECTION_ID`, `ELEMENT_ID`, `IPROP_ID`, `VALUE`) VALUES
(5, 0, 52, 31, 'Сэндвич ролл - заказать в кофейне PitStop за 77 руб'),
(5, 0, 52, 32, 'сэндавич ролл цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 52, 33, 'Сытный сэндвич ролл в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 53, 43, 'Слойки с повидлом в кафе PitStop за 77 руб'),
(5, 0, 53, 44, 'слойки повидло слоеное тесто заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 53, 45, 'Слойки с повидлом из слоеного теста в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 54, 40, 'Шоколадный маффины в кафе PitStop за 77 руб'),
(5, 0, 54, 41, 'маффины шоколадные шоколад заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 54, 42, 'Маффины с шоколадом в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 55, 28, 'Десерт-желе из сока и желатина - заказать в кофейне PitStop за 77 руб'),
(5, 0, 55, 29, 'десерт желе фруктовое сок молочное цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 55, 30, 'Очень вкусное фруктовое желе в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 56, 37, 'Красивая фруктовая нарезка - заказать в кофейне PitStop за 77 руб'),
(5, 0, 56, 38, 'фруктовая нарезка фруктов фото заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 56, 39, 'Заказать нарезку фруктов в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 60, 34, 'Десерт пирожное - заказать в кофейне PitStop за 77 руб'),
(5, 0, 60, 35, 'ассортимент пирожные вкусные кондитерская заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 60, 36, 'Самые вкусные пирожные в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 69, 25, 'Ассортимент салатов в Москве в кофейне PitStop - все за 77 руб'),
(5, 0, 69, 26, 'ассортимент овощных салатов цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 69, 27, 'Ассортимент овощных салатов в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 70, 22, 'Салаты и сэндвичи - заказать в кофейне PitStop за 77 руб'),
(5, 0, 70, 23, 'вкусные сэндвичи салаты цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт\r\n'),
(5, 0, 70, 24, 'Сытные сэндвичи и салаты в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 71, 16, 'Кофе американо - заказать в кофейне PitStop за 77 руб'),
(5, 0, 71, 17, 'кофе цена американо pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 71, 18, 'Кофе амеркано в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 72, 13, 'Чашка кофе капучино - заказать в кофейне PitStop за 77 руб'),
(5, 0, 72, 14, 'кофе цена капучино pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 72, 15, 'Кофе молотый капучино в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 73, 10, 'Вкусный кофе латте - заказать в кофейне PitStop за 77 руб'),
(5, 0, 73, 11, 'вкусный кофе латте pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 73, 12, 'Варим самый вкусный латте в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(5, 0, 74, 19, 'Сырники творожные - заказать в кофейне PitStop за 77 руб'),
(5, 0, 74, 20, 'сырники творожные цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(5, 0, 74, 21, 'Творожные сырники в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(14, 0, 86, 1, 'Акции PitStop  - Вместе всю неделю'),
(14, 0, 86, 2, 'Вместе всю неделю'),
(14, 0, 86, 3, 'Акции кофейни PitStop - Вместе всю неделю '),
(14, 0, 87, 4, 'Акции - Кофе-гигант'),
(14, 0, 87, 5, 'Кофе-гигант'),
(14, 0, 87, 6, 'Акции в кофейне PitStop - Кофе-гигант.'),
(5, 0, 97, 46, 'КОФЕ - заказать в кофейне PitStop'),
(5, 0, 97, 48, 'КОФЕ в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_lock`
--

CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_property`
--

CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_element_property`
--

INSERT INTO `b_iblock_element_property` (`ID`, `IBLOCK_PROPERTY_ID`, `IBLOCK_ELEMENT_ID`, `VALUE`, `VALUE_TYPE`, `VALUE_ENUM`, `VALUE_NUM`, `DESCRIPTION`) VALUES
(148, 10, 47, 'Москва, ул. Ленинская Слобода, 19', 'text', NULL, '0.0000', ''),
(149, 11, 47, 'пн-пт с 8:00 до 20:00', 'text', NULL, '0.0000', ''),
(150, 12, 47, 'м. Автозаводская', 'text', NULL, '0.0000', ''),
(151, 13, 47, '55.708354, 37.652705', 'text', NULL, '55.7084', ''),
(152, 10, 48, 'Москва, ул. Новодмитровская, 2, корп. 1', 'text', NULL, '0.0000', ''),
(153, 11, 48, 'пн-пт с 8:00 до 20:00', 'text', NULL, '0.0000', ''),
(154, 12, 48, 'м. Дмитровская', 'text', NULL, '0.0000', ''),
(155, 13, 48, '55.804936, 37.589922', 'text', NULL, '55.8049', ''),
(156, 10, 49, 'Москва, Пресненская наб., 8с1', 'text', NULL, '0.0000', ''),
(157, 11, 49, 'пн-пт с 8:00 до 20:00, сб с 9:00 до 18:00, вс выходной.', 'text', NULL, '0.0000', ''),
(158, 12, 49, 'м. Выставочная, м. Деловой центр и МЦК Деловой центр', 'text', NULL, '0.0000', ''),
(159, 13, 49, '55.747115, 37.539078', 'text', NULL, '55.7471', ''),
(160, 10, 50, 'Москва, м. Авиамоторная, Шоссе Энтузиастов 24/43', 'text', NULL, '0.0000', ''),
(161, 11, 50, 'пн-пт с 7:00 до 20:00, сб с 9:00 до 18:00, вс выходной', 'text', NULL, '0.0000', ''),
(162, 12, 50, 'м. Авиамоторная', 'text', NULL, '0.0000', ''),
(163, 13, 50, '55.751052, 37.718300', 'text', NULL, '55.7511', ''),
(187, 10, 80, 'Москва, ул. Павелецкая площадь, 1А, стр. 1', 'text', NULL, '0.0000', ''),
(188, 11, 80, 'ежедневно с 7:00 до 22:00', 'text', NULL, '0.0000', ''),
(189, 12, 80, 'м. Павелецкая', 'text', NULL, '0.0000', ''),
(190, 13, 80, '55.729741, 37.639455', 'text', NULL, '55.7297', ''),
(317, 14, 53, '8', 'text', 8, NULL, NULL),
(319, 14, 60, '7', 'text', 7, NULL, NULL),
(320, 14, 54, '8', 'text', 8, NULL, NULL),
(322, 14, 99, '7', 'text', 7, NULL, NULL),
(336, 14, 97, '5', 'text', 5, NULL, NULL),
(337, 14, 71, '5', 'text', 5, NULL, NULL),
(338, 14, 73, '5', 'text', 5, NULL, NULL),
(339, 14, 72, '5', 'text', 5, NULL, NULL),
(341, 14, 70, '6', 'text', 6, NULL, NULL),
(342, 14, 69, '6', 'text', 6, NULL, NULL),
(343, 14, 52, '6', 'text', 6, NULL, NULL),
(344, 14, 102, '6', 'text', 6, NULL, NULL),
(345, 14, 98, '6', 'text', 6, NULL, NULL),
(346, 14, 74, '7', 'text', 7, NULL, NULL),
(348, 14, 56, '7', 'text', 7, NULL, NULL),
(349, 14, 55, '7', 'text', 7, NULL, NULL),
(350, 14, 100, '8', 'text', 8, NULL, NULL),
(351, 14, 101, '8', 'text', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_element_right`
--

CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_fields`
--

CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_fields`
--

INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', '=today'),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:0:\"\";s:11:\"TRANS_SPACE\";b:0;s:11:\"TRANS_OTHER\";b:0;s:9:\"TRANS_EAT\";s:1:\"N\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"Y\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:0:\"\";s:11:\"COMPRESSION\";s:0:\"\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"Y\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"Y\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'Y', ''),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";i:738;s:6:\"HEIGHT\";i:415;s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"Y\";s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";i:738;s:6:\"HEIGHT\";i:415;s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:100;s:18:\"DELETE_WITH_DETAIL\";s:1:\"Y\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"Y\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SORT', 'N', '0'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'Y', ''),
(1, 'XML_IMPORT_START_TIME', 'N', '2018-01-15 02:22:10'),
(5, 'ACTIVE', 'Y', 'Y'),
(5, 'ACTIVE_FROM', 'N', ''),
(5, 'ACTIVE_TO', 'N', ''),
(5, 'CODE', 'Y', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(5, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'DETAIL_TEXT', 'N', ''),
(5, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(5, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(5, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(5, 'LOG_ELEMENT_ADD', 'N', NULL),
(5, 'LOG_ELEMENT_DELETE', 'N', NULL),
(5, 'LOG_ELEMENT_EDIT', 'N', NULL),
(5, 'LOG_SECTION_ADD', 'N', NULL),
(5, 'LOG_SECTION_DELETE', 'N', NULL),
(5, 'LOG_SECTION_EDIT', 'N', NULL),
(5, 'NAME', 'Y', ''),
(5, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'PREVIEW_TEXT', 'N', ''),
(5, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(5, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(5, 'SECTION_CODE', 'Y', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(5, 'SECTION_DESCRIPTION', 'N', ''),
(5, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(5, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(5, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'SECTION_NAME', 'Y', ''),
(5, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(5, 'SECTION_XML_ID', 'N', ''),
(5, 'SORT', 'N', '0'),
(5, 'TAGS', 'N', ''),
(5, 'XML_ID', 'Y', ''),
(5, 'XML_IMPORT_START_TIME', 'N', NULL),
(6, 'ACTIVE', 'Y', 'Y'),
(6, 'ACTIVE_FROM', 'N', ''),
(6, 'ACTIVE_TO', 'N', ''),
(6, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(6, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'DETAIL_TEXT', 'N', ''),
(6, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(6, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(6, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(6, 'LOG_ELEMENT_ADD', 'N', NULL),
(6, 'LOG_ELEMENT_DELETE', 'N', NULL),
(6, 'LOG_ELEMENT_EDIT', 'N', NULL),
(6, 'LOG_SECTION_ADD', 'N', NULL),
(6, 'LOG_SECTION_DELETE', 'N', NULL),
(6, 'LOG_SECTION_EDIT', 'N', NULL),
(6, 'NAME', 'Y', ''),
(6, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'PREVIEW_TEXT', 'N', ''),
(6, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(6, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(6, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(6, 'SECTION_DESCRIPTION', 'N', ''),
(6, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(6, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(6, 'SECTION_DETAIL_PICTURE', 'Y', 'a:17:{s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";i:1800;s:6:\"HEIGHT\";i:900;s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:100;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'SECTION_NAME', 'Y', ''),
(6, 'SECTION_PICTURE', 'Y', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"Y\";s:5:\"SCALE\";s:1:\"Y\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"Y\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(6, 'SECTION_XML_ID', 'N', ''),
(6, 'SORT', 'N', '0'),
(6, 'TAGS', 'N', ''),
(6, 'XML_ID', 'Y', ''),
(6, 'XML_IMPORT_START_TIME', 'N', NULL),
(7, 'ACTIVE', 'Y', 'Y'),
(7, 'ACTIVE_FROM', 'N', ''),
(7, 'ACTIVE_TO', 'N', ''),
(7, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(7, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(7, 'DETAIL_TEXT', 'N', ''),
(7, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(7, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(7, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(7, 'LOG_ELEMENT_ADD', 'N', NULL),
(7, 'LOG_ELEMENT_DELETE', 'N', NULL),
(7, 'LOG_ELEMENT_EDIT', 'N', NULL),
(7, 'LOG_SECTION_ADD', 'N', NULL),
(7, 'LOG_SECTION_DELETE', 'N', NULL),
(7, 'LOG_SECTION_EDIT', 'N', NULL),
(7, 'NAME', 'Y', ''),
(7, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(7, 'PREVIEW_TEXT', 'N', ''),
(7, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(7, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(7, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(7, 'SECTION_DESCRIPTION', 'N', ''),
(7, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(7, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(7, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(7, 'SECTION_NAME', 'Y', ''),
(7, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(7, 'SECTION_XML_ID', 'N', ''),
(7, 'SORT', 'N', '0'),
(7, 'TAGS', 'N', ''),
(7, 'XML_ID', 'Y', ''),
(7, 'XML_IMPORT_START_TIME', 'N', NULL),
(8, 'ACTIVE', 'Y', 'Y'),
(8, 'ACTIVE_FROM', 'N', ''),
(8, 'ACTIVE_TO', 'N', ''),
(8, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(8, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(8, 'DETAIL_TEXT', 'N', ''),
(8, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(8, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(8, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(8, 'LOG_ELEMENT_ADD', 'N', NULL),
(8, 'LOG_ELEMENT_DELETE', 'N', NULL),
(8, 'LOG_ELEMENT_EDIT', 'N', NULL),
(8, 'LOG_SECTION_ADD', 'N', NULL),
(8, 'LOG_SECTION_DELETE', 'N', NULL),
(8, 'LOG_SECTION_EDIT', 'N', NULL),
(8, 'NAME', 'Y', ''),
(8, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(8, 'PREVIEW_TEXT', 'N', ''),
(8, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(8, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(8, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(8, 'SECTION_DESCRIPTION', 'N', ''),
(8, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(8, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(8, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(8, 'SECTION_NAME', 'Y', ''),
(8, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(8, 'SECTION_XML_ID', 'N', ''),
(8, 'SORT', 'N', '0'),
(8, 'TAGS', 'N', ''),
(8, 'XML_ID', 'Y', ''),
(8, 'XML_IMPORT_START_TIME', 'N', NULL),
(9, 'ACTIVE', 'Y', 'Y'),
(9, 'ACTIVE_FROM', 'N', ''),
(9, 'ACTIVE_TO', 'N', ''),
(9, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(9, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(9, 'DETAIL_TEXT', 'N', ''),
(9, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(9, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(9, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(9, 'LOG_ELEMENT_ADD', 'N', NULL),
(9, 'LOG_ELEMENT_DELETE', 'N', NULL),
(9, 'LOG_ELEMENT_EDIT', 'N', NULL),
(9, 'LOG_SECTION_ADD', 'N', NULL),
(9, 'LOG_SECTION_DELETE', 'N', NULL),
(9, 'LOG_SECTION_EDIT', 'N', NULL),
(9, 'NAME', 'Y', ''),
(9, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(9, 'PREVIEW_TEXT', 'N', ''),
(9, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(9, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(9, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(9, 'SECTION_DESCRIPTION', 'N', ''),
(9, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(9, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(9, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(9, 'SECTION_NAME', 'Y', ''),
(9, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(9, 'SECTION_XML_ID', 'N', ''),
(9, 'SORT', 'N', '0'),
(9, 'TAGS', 'N', ''),
(9, 'XML_ID', 'Y', ''),
(9, 'XML_IMPORT_START_TIME', 'N', NULL),
(14, 'ACTIVE', 'Y', 'Y'),
(14, 'ACTIVE_FROM', 'N', ''),
(14, 'ACTIVE_TO', 'N', ''),
(14, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(14, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(14, 'DETAIL_TEXT', 'N', ''),
(14, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(14, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(14, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(14, 'LOG_ELEMENT_ADD', 'N', NULL),
(14, 'LOG_ELEMENT_DELETE', 'N', NULL),
(14, 'LOG_ELEMENT_EDIT', 'N', NULL),
(14, 'LOG_SECTION_ADD', 'N', NULL),
(14, 'LOG_SECTION_DELETE', 'N', NULL),
(14, 'LOG_SECTION_EDIT', 'N', NULL),
(14, 'NAME', 'Y', ''),
(14, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(14, 'PREVIEW_TEXT', 'N', ''),
(14, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(14, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(14, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(14, 'SECTION_DESCRIPTION', 'N', ''),
(14, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(14, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(14, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(14, 'SECTION_NAME', 'Y', ''),
(14, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(14, 'SECTION_XML_ID', 'N', ''),
(14, 'SORT', 'N', '0'),
(14, 'TAGS', 'N', ''),
(14, 'XML_ID', 'Y', ''),
(14, 'XML_IMPORT_START_TIME', 'N', NULL),
(15, 'ACTIVE', 'Y', 'Y'),
(15, 'ACTIVE_FROM', 'N', '=today'),
(15, 'ACTIVE_TO', 'N', ''),
(15, 'CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(15, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(15, 'DETAIL_TEXT', 'N', ''),
(15, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(15, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(15, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(15, 'LOG_ELEMENT_ADD', 'N', NULL),
(15, 'LOG_ELEMENT_DELETE', 'N', NULL),
(15, 'LOG_ELEMENT_EDIT', 'N', NULL),
(15, 'LOG_SECTION_ADD', 'N', NULL),
(15, 'LOG_SECTION_DELETE', 'N', NULL),
(15, 'LOG_SECTION_EDIT', 'N', NULL),
(15, 'NAME', 'Y', ''),
(15, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(15, 'PREVIEW_TEXT', 'N', ''),
(15, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(15, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(15, 'SECTION_CODE', 'N', 'a:8:{s:6:\"UNIQUE\";s:1:\"N\";s:15:\"TRANSLITERATION\";s:1:\"N\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(15, 'SECTION_DESCRIPTION', 'N', ''),
(15, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(15, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(15, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(15, 'SECTION_NAME', 'Y', ''),
(15, 'SECTION_PICTURE', 'N', 'a:20:{s:11:\"FROM_DETAIL\";s:1:\"N\";s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";N;}'),
(15, 'SECTION_XML_ID', 'N', ''),
(15, 'SORT', 'N', '0'),
(15, 'TAGS', 'N', ''),
(15, 'XML_ID', 'Y', ''),
(15, 'XML_IMPORT_START_TIME', 'N', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_group`
--

CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_group`
--

INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
(1, 1, 'X'),
(1, 2, 'R'),
(5, 1, 'X'),
(5, 2, 'R'),
(6, 1, 'X'),
(6, 2, 'R'),
(7, 1, 'X'),
(7, 2, 'R'),
(8, 1, 'X'),
(8, 2, 'R'),
(9, 1, 'X'),
(9, 2, 'R'),
(14, 1, 'X'),
(14, 2, 'R'),
(15, 1, 'X'),
(15, 2, 'R');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iblock_iprop`
--

CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_iproperty`
--

CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_iproperty`
--

INSERT INTO `b_iblock_iproperty` (`ID`, `IBLOCK_ID`, `CODE`, `ENTITY_TYPE`, `ENTITY_ID`, `TEMPLATE`) VALUES
(1, 14, 'ELEMENT_META_TITLE', 'E', 86, 'Акции PitStop  - {=this.Name}'),
(2, 14, 'ELEMENT_META_KEYWORDS', 'E', 86, '{=this.Name}'),
(3, 14, 'ELEMENT_META_DESCRIPTION', 'E', 86, 'Акции кофейни PitStop - {=this.Name} '),
(4, 14, 'ELEMENT_META_TITLE', 'E', 87, 'Акции - {=this.Name}'),
(5, 14, 'ELEMENT_META_KEYWORDS', 'E', 87, '{=this.Name}'),
(6, 14, 'ELEMENT_META_DESCRIPTION', 'E', 87, 'Акции в кофейне PitStop - {=this.Name}.'),
(10, 5, 'ELEMENT_META_TITLE', 'E', 73, 'Вкусный кофе латте - заказать в кофейне PitStop за 77 руб'),
(11, 5, 'ELEMENT_META_KEYWORDS', 'E', 73, 'вкусный кофе латте pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(12, 5, 'ELEMENT_META_DESCRIPTION', 'E', 73, 'Варим самый вкусный латте в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(13, 5, 'ELEMENT_META_TITLE', 'E', 72, 'Чашка кофе капучино - заказать в кофейне PitStop за 77 руб'),
(14, 5, 'ELEMENT_META_KEYWORDS', 'E', 72, 'кофе цена капучино pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(15, 5, 'ELEMENT_META_DESCRIPTION', 'E', 72, 'Кофе молотый капучино в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(16, 5, 'ELEMENT_META_TITLE', 'E', 71, 'Кофе американо - заказать в кофейне PitStop за 77 руб'),
(17, 5, 'ELEMENT_META_KEYWORDS', 'E', 71, 'кофе цена американо pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(18, 5, 'ELEMENT_META_DESCRIPTION', 'E', 71, 'Кофе амеркано в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(19, 5, 'ELEMENT_META_TITLE', 'E', 74, 'Сырники творожные - заказать в кофейне PitStop за 77 руб'),
(20, 5, 'ELEMENT_META_KEYWORDS', 'E', 74, 'сырники творожные цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(21, 5, 'ELEMENT_META_DESCRIPTION', 'E', 74, 'Творожные сырники в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(22, 5, 'ELEMENT_META_TITLE', 'E', 70, 'Салаты и сэндвичи - заказать в кофейне PitStop за 77 руб'),
(23, 5, 'ELEMENT_META_KEYWORDS', 'E', 70, 'вкусные сэндвичи салаты цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт\r\n'),
(24, 5, 'ELEMENT_META_DESCRIPTION', 'E', 70, 'Сытные сэндвичи и салаты в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(25, 5, 'ELEMENT_META_TITLE', 'E', 69, 'Ассортимент салатов в Москве в кофейне PitStop - все за 77 руб'),
(26, 5, 'ELEMENT_META_KEYWORDS', 'E', 69, 'ассортимент овощных салатов цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(27, 5, 'ELEMENT_META_DESCRIPTION', 'E', 69, 'Ассортимент овощных салатов в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(28, 5, 'ELEMENT_META_TITLE', 'E', 55, 'Десерт-желе из сока и желатина - заказать в кофейне PitStop за 77 руб'),
(29, 5, 'ELEMENT_META_KEYWORDS', 'E', 55, 'десерт желе фруктовое сок молочное цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(30, 5, 'ELEMENT_META_DESCRIPTION', 'E', 55, 'Очень вкусное фруктовое желе в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(31, 5, 'ELEMENT_META_TITLE', 'E', 52, 'Сэндвич ролл - заказать в кофейне PitStop за 77 руб'),
(32, 5, 'ELEMENT_META_KEYWORDS', 'E', 52, 'сэндавич ролл цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(33, 5, 'ELEMENT_META_DESCRIPTION', 'E', 52, 'Сытный сэндвич ролл в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(34, 5, 'ELEMENT_META_TITLE', 'E', 60, 'Десерт пирожное - заказать в кофейне PitStop за 77 руб'),
(35, 5, 'ELEMENT_META_KEYWORDS', 'E', 60, 'ассортимент пирожные вкусные кондитерская заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(36, 5, 'ELEMENT_META_DESCRIPTION', 'E', 60, 'Самые вкусные пирожные в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(37, 5, 'ELEMENT_META_TITLE', 'E', 56, 'Красивая фруктовая нарезка - заказать в кофейне PitStop за 77 руб'),
(38, 5, 'ELEMENT_META_KEYWORDS', 'E', 56, 'фруктовая нарезка фруктов фото заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(39, 5, 'ELEMENT_META_DESCRIPTION', 'E', 56, 'Заказать нарезку фруктов в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(40, 5, 'ELEMENT_META_TITLE', 'E', 54, 'Шоколадный маффины в кафе PitStop за 77 руб'),
(41, 5, 'ELEMENT_META_KEYWORDS', 'E', 54, 'маффины шоколадные шоколад заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(42, 5, 'ELEMENT_META_DESCRIPTION', 'E', 54, 'Маффины с шоколадом в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(43, 5, 'ELEMENT_META_TITLE', 'E', 53, 'Слойки с повидлом в кафе PitStop за 77 руб'),
(44, 5, 'ELEMENT_META_KEYWORDS', 'E', 53, 'слойки повидло слоеное тесто заказать десерт цена pitstop кафе кофейня питстоп москва меню сеть официальный сайт'),
(45, 5, 'ELEMENT_META_DESCRIPTION', 'E', 53, 'Слойки с повидлом из слоеного теста в кофейне ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.'),
(46, 5, 'ELEMENT_META_TITLE', 'E', 97, 'КОФЕ - заказать в кофейне PitStop'),
(48, 5, 'ELEMENT_META_DESCRIPTION', 'E', 97, 'КОФЕ в кафе ПитСтоп в Москве - официальный сайт кафе PitStop. Телефон в Москве: +7 (495) 181-61-59.');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_messages`
--

CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_messages`
--

INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
(1, 'ELEMENT_ADD', 'Добавить новость'),
(1, 'ELEMENT_DELETE', 'Удалить новость'),
(1, 'ELEMENT_EDIT', 'Изменить новость'),
(1, 'ELEMENT_NAME', 'Новость'),
(1, 'ELEMENTS_NAME', 'Новости'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы'),
(5, 'ELEMENT_ADD', 'Добавить элемент'),
(5, 'ELEMENT_DELETE', 'Удалить элемент'),
(5, 'ELEMENT_EDIT', 'Изменить элемент'),
(5, 'ELEMENT_NAME', 'Элемент'),
(5, 'ELEMENTS_NAME', 'Элементы'),
(5, 'SECTION_ADD', 'Добавить раздел'),
(5, 'SECTION_DELETE', 'Удалить раздел'),
(5, 'SECTION_EDIT', 'Изменить раздел'),
(5, 'SECTION_NAME', 'Раздел'),
(5, 'SECTIONS_NAME', 'Разделы'),
(6, 'ELEMENT_ADD', 'Добавить элемент'),
(6, 'ELEMENT_DELETE', 'Удалить элемент'),
(6, 'ELEMENT_EDIT', 'Изменить элемент'),
(6, 'ELEMENT_NAME', 'Элемент'),
(6, 'ELEMENTS_NAME', 'Элементы'),
(6, 'SECTION_ADD', 'Добавить раздел'),
(6, 'SECTION_DELETE', 'Удалить раздел'),
(6, 'SECTION_EDIT', 'Изменить раздел'),
(6, 'SECTION_NAME', 'Раздел'),
(6, 'SECTIONS_NAME', 'Разделы'),
(7, 'ELEMENT_ADD', 'Добавить элемент'),
(7, 'ELEMENT_DELETE', 'Удалить элемент'),
(7, 'ELEMENT_EDIT', 'Изменить элемент'),
(7, 'ELEMENT_NAME', 'Элемент'),
(7, 'ELEMENTS_NAME', 'Элементы'),
(7, 'SECTION_ADD', 'Добавить раздел'),
(7, 'SECTION_DELETE', 'Удалить раздел'),
(7, 'SECTION_EDIT', 'Изменить раздел'),
(7, 'SECTION_NAME', 'Раздел'),
(7, 'SECTIONS_NAME', 'Разделы'),
(8, 'ELEMENT_ADD', 'Добавить элемент'),
(8, 'ELEMENT_DELETE', 'Удалить элемент'),
(8, 'ELEMENT_EDIT', 'Изменить элемент'),
(8, 'ELEMENT_NAME', 'Элемент'),
(8, 'ELEMENTS_NAME', 'Элементы'),
(8, 'SECTION_ADD', 'Добавить раздел'),
(8, 'SECTION_DELETE', 'Удалить раздел'),
(8, 'SECTION_EDIT', 'Изменить раздел'),
(8, 'SECTION_NAME', 'Раздел'),
(8, 'SECTIONS_NAME', 'Разделы'),
(9, 'ELEMENT_ADD', 'Добавить элемент'),
(9, 'ELEMENT_DELETE', 'Удалить элемент'),
(9, 'ELEMENT_EDIT', 'Изменить элемент'),
(9, 'ELEMENT_NAME', 'Элемент'),
(9, 'ELEMENTS_NAME', 'Элементы'),
(14, 'ELEMENT_ADD', 'Добавить элемент'),
(14, 'ELEMENT_DELETE', 'Удалить элемент'),
(14, 'ELEMENT_EDIT', 'Изменить элемент'),
(14, 'ELEMENT_NAME', 'Элемент'),
(14, 'ELEMENTS_NAME', 'Элементы'),
(15, 'ELEMENT_ADD', 'Добавить элемент'),
(15, 'ELEMENT_DELETE', 'Удалить элемент'),
(15, 'ELEMENT_EDIT', 'Изменить элемент'),
(15, 'ELEMENT_NAME', 'Элемент'),
(15, 'ELEMENTS_NAME', 'Элементы'),
(15, 'SECTION_ADD', 'Добавить раздел'),
(15, 'SECTION_DELETE', 'Удалить раздел'),
(15, 'SECTION_EDIT', 'Изменить раздел'),
(15, 'SECTION_NAME', 'Раздел'),
(15, 'SECTIONS_NAME', 'Разделы');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_offers_tmp`
--

CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) UNSIGNED NOT NULL,
  `PRODUCT_IBLOCK_ID` int(11) UNSIGNED NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) UNSIGNED NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property`
--

CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_property`
--

INSERT INTO `b_iblock_property` (`ID`, `TIMESTAMP_X`, `IBLOCK_ID`, `NAME`, `ACTIVE`, `SORT`, `CODE`, `DEFAULT_VALUE`, `PROPERTY_TYPE`, `ROW_COUNT`, `COL_COUNT`, `LIST_TYPE`, `MULTIPLE`, `XML_ID`, `FILE_TYPE`, `MULTIPLE_CNT`, `TMP_ID`, `LINK_IBLOCK_ID`, `WITH_DESCRIPTION`, `SEARCHABLE`, `FILTRABLE`, `IS_REQUIRED`, `VERSION`, `USER_TYPE`, `USER_TYPE_SETTINGS`, `HINT`) VALUES
(10, '2018-01-17 12:30:39', 8, 'Адрес кофейни', 'Y', 1, 'cafe_address', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(11, '2018-01-17 12:30:39', 8, 'Время работы', 'Y', 2, 'cafe_worktime', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(12, '2018-01-17 12:30:39', 8, 'Ближайшая станция метро', 'Y', 3, 'cafe_metro', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(13, '2018-01-17 12:30:39', 8, 'Координаты для карты (x, y)', 'Y', 4, 'cafe_position', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
(14, '2018-01-18 01:01:12', 5, 'Категория меню', 'Y', 500, 'menucategories', '', 'L', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_property_enum`
--

CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_property_enum`
--

INSERT INTO `b_iblock_property_enum` (`ID`, `PROPERTY_ID`, `VALUE`, `DEF`, `SORT`, `XML_ID`, `TMP_ID`) VALUES
(5, 14, 'Кофе', 'N', 1, 'cat_1', NULL),
(6, 14, 'Кулинария', 'N', 2, 'cat_2', NULL),
(7, 14, 'Десерты', 'N', 3, 'cat_3', NULL),
(8, 14, 'Выпечка', 'N', 4, 'cat_4', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_right`
--

CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_rss`
--

CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section`
--

CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_element`
--

CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_iprop`
--

CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_property`
--

CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_section_right`
--

CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_sequence`
--

CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_site`
--

CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_site`
--

INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
(1, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(14, 's1'),
(15, 's1');

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type`
--

CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type`
--

INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
('aktsii', 'Y', '', '', 'N', 500),
('cafe', 'Y', '', '', 'N', 500),
('franchise', 'Y', '', '', 'N', 500),
('gallery', 'Y', '', '', 'N', 500),
('main_slider_s1', 'N', '', '', 'N', 500),
('menu', 'Y', '', '', 'N', 500),
('news', 'N', NULL, NULL, 'Y', 50),
('servo', 'Y', '', '', 'N', 500);

-- --------------------------------------------------------

--
-- Структура таблицы `b_iblock_type_lang`
--

CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_iblock_type_lang`
--

INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
('news', 'en', 'News', '', 'News'),
('news', 'ru', 'Новости', '', 'Новости'),
('menu', 'ru', 'Меню', 'Разделы', 'Меню'),
('menu', 'en', 'Menu', 'Categories', 'Menu'),
('gallery', 'ru', 'Галерея', 'Разделы', 'Галерея'),
('gallery', 'en', 'Gallery', 'Categories', 'Gallery'),
('franchise', 'ru', 'Франшиза', 'Разделы', 'Франшиза'),
('franchise', 'en', 'Franchise', 'Categories', 'Franchise'),
('cafe', 'ru', 'Кофейни', 'Разделы', 'Кофейни'),
('cafe', 'en', 'Cafe', 'Categories', 'Cafe'),
('main_slider_s1', 'ru', 'Слайдер', '', 'Элемент слайдера'),
('main_slider_s1', 'en', 'Slider', '', 'Slider element'),
('aktsii', 'ru', 'Акции', '', 'Акции'),
('aktsii', 'en', 'Aktsii', '', 'Акции'),
('servo', 'ru', 'Карта сайта', '', ''),
('servo', 'en', ' Карта сайта', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang`
--

CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_lang`
--

INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
('ie', 100, 'N', 'Y', 'ie', '/site_ie/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', 'pitstop-cafe.ru', 'ie', 'totohatta@gmail.com', 1),
('s1', 1, 'Y', 'Y', 'PitStop site', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'Y', 'pitstop-cafe.ru', 'PitStop site', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_language`
--

CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_language`
--

INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_lang_domain`
--

CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_lang_domain`
--

INSERT INTO `b_lang_domain` (`LID`, `DOMAIN`) VALUES
('s1', 'pitstop-cafe.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection`
--

CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_collection_item`
--

CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_item`
--

CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_medialib_type`
--

CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_medialib_type`
--

INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_module`
--

CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module`
--

INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
('bitrix.sitecorporate', '2018-01-14 23:19:43'),
('bitrixcloud', '2018-01-14 23:19:43'),
('clouds', '2018-01-14 23:19:44'),
('compression', '2018-01-14 23:19:44'),
('fileman', '2018-01-14 23:19:44'),
('highloadblock', '2018-01-14 23:19:45'),
('iblock', '2018-01-14 23:19:46'),
('main', '2018-01-14 23:19:40'),
('perfmon', '2018-01-14 23:19:47'),
('search', '2018-01-14 23:19:48'),
('seo', '2018-01-14 23:19:48'),
('socialservices', '2018-01-14 23:19:48'),
('translate', '2018-01-14 23:19:49');

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_group`
--

CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module_group`
--

INSERT INTO `b_module_group` (`ID`, `MODULE_ID`, `GROUP_ID`, `G_ACCESS`, `SITE_ID`) VALUES
(1, 'main', 5, 'Q', NULL),
(2, 'fileman', 5, 'F', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_module_to_module`
--

CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_module_to_module`
--

INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`) VALUES
(1, '2018-01-14 23:19:40', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1),
(2, '2018-01-14 23:19:40', 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1),
(3, '2018-01-14 23:19:40', 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1),
(4, '2018-01-14 23:19:40', 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1),
(5, '2018-01-14 23:19:40', 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1),
(6, '2018-01-14 23:19:40', 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1),
(7, '2018-01-14 23:19:40', 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1),
(8, '2018-01-14 23:19:40', 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1),
(9, '2018-01-14 23:19:40', 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1),
(10, '2018-01-14 23:19:40', 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1),
(11, '2018-01-14 23:19:40', 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1),
(12, '2018-01-14 23:19:40', 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1),
(13, '2018-01-14 23:19:40', 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1),
(14, '2018-01-14 23:19:40', 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1),
(15, '2018-01-14 23:19:40', 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1),
(16, '2018-01-14 23:19:40', 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1),
(17, '2018-01-14 23:19:40', 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1),
(18, '2018-01-14 23:19:40', 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1),
(19, '2018-01-14 23:19:40', 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1),
(20, '2018-01-14 23:19:40', 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1),
(21, '2018-01-14 23:19:40', 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1),
(22, '2018-01-14 23:19:40', 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1),
(23, '2018-01-14 23:19:40', 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1),
(24, '2018-01-14 23:19:40', 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1),
(25, '2018-01-14 23:19:40', 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1),
(26, '2018-01-14 23:19:40', 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1),
(27, '2018-01-14 23:19:40', 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1),
(28, '2018-01-14 23:19:40', 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1),
(29, '2018-01-14 23:19:40', 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1),
(30, '2018-01-14 23:19:40', 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1),
(31, '2018-01-14 23:19:40', 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1),
(32, '2018-01-14 23:19:40', 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1),
(33, '2018-01-14 23:19:40', 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1),
(34, '2018-01-14 23:19:40', 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1),
(35, '2018-01-14 23:19:40', 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1),
(36, '2018-01-14 23:19:40', 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1),
(37, '2018-01-14 23:19:40', 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1),
(38, '2018-01-14 23:19:40', 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1),
(39, '2018-01-14 23:19:40', 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1),
(40, '2018-01-14 23:19:40', 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1),
(41, '2018-01-14 23:19:40', 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1),
(42, '2018-01-14 23:19:40', 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1),
(43, '2018-01-14 23:19:40', 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1),
(44, '2018-01-14 23:19:40', 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1),
(45, '2018-01-14 23:19:40', 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1),
(46, '2018-01-14 23:19:40', 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1),
(47, '2018-01-14 23:19:40', 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1),
(48, '2018-01-14 23:19:40', 100, 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(49, '2018-01-14 23:19:40', 100, 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(50, '2018-01-14 23:19:40', 100, 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
(51, '2018-01-14 23:19:40', 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1),
(52, '2018-01-14 23:19:40', 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1),
(53, '2018-01-14 23:19:40', 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2),
(54, '2018-01-14 23:19:40', 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2),
(55, '2018-01-14 23:19:40', 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2),
(56, '2018-01-14 23:19:43', 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1),
(57, '2018-01-14 23:19:43', 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1),
(58, '2018-01-14 23:19:43', 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1),
(59, '2018-01-14 23:19:43', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', 1),
(60, '2018-01-14 23:19:43', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1),
(61, '2018-01-14 23:19:43', 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1),
(62, '2018-01-14 23:19:44', 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1),
(63, '2018-01-14 23:19:44', 100, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1),
(64, '2018-01-14 23:19:44', 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1),
(65, '2018-01-14 23:19:44', 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1),
(66, '2018-01-14 23:19:44', 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1),
(67, '2018-01-14 23:19:44', 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1),
(68, '2018-01-14 23:19:44', 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1),
(69, '2018-01-14 23:19:44', 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1),
(70, '2018-01-14 23:19:44', 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1),
(71, '2018-01-14 23:19:44', 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1),
(72, '2018-01-14 23:19:44', 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1),
(73, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1),
(74, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1),
(75, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1),
(76, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1),
(77, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1),
(78, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1),
(79, '2018-01-14 23:19:44', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1),
(80, '2018-01-14 23:19:44', 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1),
(81, '2018-01-14 23:19:44', 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1),
(82, '2018-01-14 23:19:44', 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1),
(83, '2018-01-14 23:19:44', 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1),
(84, '2018-01-14 23:19:44', 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1),
(85, '2018-01-14 23:19:44', 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1),
(86, '2018-01-14 23:19:44', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1),
(87, '2018-01-14 23:19:44', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1),
(88, '2018-01-14 23:19:44', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1),
(89, '2018-01-14 23:19:44', 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1),
(90, '2018-01-14 23:19:44', 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1),
(91, '2018-01-14 23:19:44', 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1),
(92, '2018-01-14 23:19:44', 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1),
(93, '2018-01-14 23:19:45', 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1),
(94, '2018-01-14 23:19:45', 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1),
(95, '2018-01-14 23:19:45', 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1),
(96, '2018-01-14 23:19:45', 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1),
(97, '2018-01-14 23:19:45', 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1),
(98, '2018-01-14 23:19:46', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1),
(99, '2018-01-14 23:19:46', 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1),
(100, '2018-01-14 23:19:46', 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1),
(101, '2018-01-14 23:19:46', 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1),
(102, '2018-01-14 23:19:46', 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1),
(103, '2018-01-14 23:19:46', 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1),
(104, '2018-01-14 23:19:46', 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1),
(105, '2018-01-14 23:19:46', 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1),
(106, '2018-01-14 23:19:46', 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1),
(107, '2018-01-14 23:19:46', 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1),
(108, '2018-01-14 23:19:46', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1),
(109, '2018-01-14 23:19:46', 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1),
(110, '2018-01-14 23:19:46', 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1),
(111, '2018-01-14 23:19:46', 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1),
(112, '2018-01-14 23:19:46', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1),
(113, '2018-01-14 23:19:46', 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1),
(114, '2018-01-14 23:19:46', 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1),
(115, '2018-01-14 23:19:46', 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1),
(116, '2018-01-14 23:19:46', 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1),
(117, '2018-01-14 23:19:46', 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1),
(118, '2018-01-14 23:19:46', 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1),
(119, '2018-01-14 23:19:46', 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1),
(120, '2018-01-14 23:19:46', 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1),
(121, '2018-01-14 23:19:46', 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1),
(122, '2018-01-14 23:19:47', 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1),
(123, '2018-01-14 23:19:48', 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1),
(124, '2018-01-14 23:19:48', 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1),
(125, '2018-01-14 23:19:48', 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1),
(126, '2018-01-14 23:19:48', 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1),
(127, '2018-01-14 23:19:48', 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1),
(128, '2018-01-14 23:19:48', 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1),
(129, '2018-01-14 23:19:48', 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1),
(130, '2018-01-14 23:19:48', 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1),
(131, '2018-01-14 23:19:48', 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1),
(132, '2018-01-14 23:19:48', 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2),
(133, '2018-01-14 23:19:48', 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2),
(134, '2018-01-14 23:19:48', 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2),
(135, '2018-01-14 23:19:48', 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2),
(136, '2018-01-14 23:19:48', 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2),
(137, '2018-01-14 23:19:48', 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2),
(138, '2018-01-14 23:19:48', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2),
(139, '2018-01-14 23:19:48', 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2),
(140, '2018-01-14 23:19:48', 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2),
(141, '2018-01-14 23:19:48', 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2),
(142, '2018-01-14 23:19:48', 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2),
(143, '2018-01-14 23:19:48', 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2),
(144, '2018-01-14 23:19:48', 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2),
(145, '2018-01-14 23:19:48', 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2),
(146, '2018-01-14 23:19:48', 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2),
(147, '2018-01-14 23:19:48', 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2),
(148, '2018-01-14 23:19:48', 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2),
(149, '2018-01-14 23:19:48', 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2),
(150, '2018-01-14 23:19:48', 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2),
(151, '2018-01-14 23:19:48', 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2),
(152, '2018-01-14 23:19:48', 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2),
(153, '2018-01-14 23:19:48', 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2),
(154, '2018-01-14 23:19:48', 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2),
(155, '2018-01-14 23:19:48', 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2),
(156, '2018-01-14 23:19:48', 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2),
(157, '2018-01-14 23:19:48', 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2),
(158, '2018-01-14 23:19:48', 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
(159, '2018-01-14 23:19:48', 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
(160, '2018-01-14 23:19:48', 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1),
(161, '2018-01-14 23:19:48', 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1),
(162, '2018-01-14 23:19:48', 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1),
(163, '2018-01-14 23:19:48', 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1),
(164, '2018-01-14 23:19:48', 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1),
(165, '2018-01-14 23:19:48', 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1),
(166, '2018-01-14 23:19:48', 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1),
(167, '2018-01-14 23:19:49', 100, 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', 1),
(168, '2018-01-14 23:20:52', 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `b_operation`
--

CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_operation`
--

INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
(39, 'clouds_browse', 'clouds', NULL, 'module'),
(40, 'clouds_upload', 'clouds', NULL, 'module'),
(41, 'clouds_config', 'clouds', NULL, 'module'),
(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(48, 'fileman_admin_files', 'fileman', '', 'module'),
(49, 'fileman_admin_folders', 'fileman', '', 'module'),
(50, 'fileman_view_permissions', 'fileman', '', 'module'),
(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(52, 'fileman_upload_files', 'fileman', '', 'module'),
(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
(54, 'fileman_install_control', 'fileman', '', 'module'),
(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
(59, 'medialib_access', 'fileman', '', 'medialib'),
(60, 'medialib_new_item', 'fileman', '', 'medialib'),
(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
(62, 'medialib_del_item', 'fileman', '', 'medialib'),
(63, 'sticker_view', 'fileman', '', 'stickers'),
(64, 'sticker_edit', 'fileman', '', 'stickers'),
(65, 'sticker_new', 'fileman', '', 'stickers'),
(66, 'sticker_del', 'fileman', '', 'stickers'),
(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(70, 'section_read', 'iblock', NULL, 'iblock'),
(71, 'element_read', 'iblock', NULL, 'iblock'),
(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(74, 'element_edit', 'iblock', NULL, 'iblock'),
(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
(76, 'element_delete', 'iblock', NULL, 'iblock'),
(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(78, 'section_edit', 'iblock', NULL, 'iblock'),
(79, 'section_delete', 'iblock', NULL, 'iblock'),
(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(85, 'iblock_export', 'iblock', NULL, 'iblock'),
(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(88, 'seo_settings', 'seo', '', 'module'),
(89, 'seo_tools', 'seo', '', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_option`
--

CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_option`
--

INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
('main', '~ft_b_user', 'a:1:{s:14:\"SEARCH_CONTENT\";b:0;}', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'distributive6', 'Y', NULL, NULL),
('main', '~new_license11_sign', 'Y', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'admin_passwordh', 'FVkQemYUBgYtCUVcDxcDCgsTAQ==', NULL, NULL),
('main', 'server_uniq_id', 'c1b6a1a84cb8703867bd47a91bb1254e', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('main', 'email_from', 'totohatta@gmail.com', NULL, NULL),
('fileman', 'different_set', 'Y', NULL, NULL),
('fileman', 'menutypes', 'a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}', NULL, 's1'),
('main', 'wizard_template_id', 'furniture', NULL, 's1'),
('main', 'wizard_site_logo', '0', NULL, 's1'),
('main', 'wizard_furniture_theme_id', 'gray', NULL, 's1'),
('socialnetwork', 'allow_tooltip', 'N', NULL, NULL),
('fileman', 'propstypes', 'a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}', NULL, 's1'),
('search', 'suggest_save_days', '250', NULL, NULL),
('search', 'use_tf_cache', 'Y', NULL, NULL),
('search', 'use_word_distance', 'Y', NULL, NULL),
('search', 'use_social_rating', 'Y', NULL, NULL),
('iblock', 'use_htmledit', 'Y', NULL, NULL),
('socialservices', 'auth_services', 'a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}', NULL, NULL),
('main', 'wizard_firstcorp_furniture_s1', 'Y', NULL, NULL),
('main', 'wizard_solution', 'corp_furniture', NULL, 's1'),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('main', 'signer_default_key', 'b503c08085b40bc04c080d40250d01e7dc0d3e2d03f87c879133844612051bb0358b1fb06e97553a2165603531c92a786ef33ca933d96c05600678e3e879c92e', NULL, NULL),
('fileman', 'GROUP_DEFAULT_TASK', '18', NULL, NULL),
('main', '~update_autocheck_result', 'a:3:{s:10:\"check_date\";i:0;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";}', NULL, NULL),
('main', 'update_system_check', '28.06.2018 11:41:48', NULL, NULL),
('main', 'site_checker_success', 'N', NULL, NULL),
('main', 'dump_bucket_id', '0', NULL, NULL),
('main', 'dump_encrypt', '0', NULL, NULL),
('main', 'dump_use_compression', '1', NULL, NULL),
('main', 'skip_symlinks', '0', NULL, NULL),
('main', 'dump_max_exec_time', '20', NULL, NULL),
('main', 'dump_max_exec_time_sleep', '1', NULL, NULL),
('main', 'dump_archive_size_limit', '104857600', NULL, NULL),
('main', 'dump_max_file_size', '0', NULL, NULL),
('main', 'dump_file_public', '1', NULL, NULL),
('main', 'dump_file_kernel', '1', NULL, NULL),
('main', 'dump_base', '1', NULL, NULL),
('main', 'dump_base_skip_stat', '0', NULL, NULL),
('main', 'dump_base_skip_search', '0', NULL, NULL),
('main', 'dump_base_skip_log', '0', NULL, NULL),
('main', 'dump_integrity_check', '1', NULL, NULL),
('main', 'dump_do_clouds', '0', NULL, NULL),
('main', 'skip_mask', '0', NULL, NULL),
('main', 'dump_site_id', 'a:0:{}', NULL, NULL),
('main', 'site_name', 'pitstop-cafe.ru', NULL, NULL),
('main', 'server_name', 'pitstop-cafe.ru', NULL, NULL),
('main', 'cookie_name', 'BITRIX_SM', NULL, NULL),
('main', 'ALLOW_SPREAD_COOKIE', 'Y', NULL, NULL),
('main', 'header_200', 'N', NULL, NULL),
('main', 'error_reporting', '85', NULL, NULL),
('main', 'use_hot_keys', 'Y', NULL, NULL),
('main', 'smile_gallery_id', '1', NULL, NULL),
('main', 'all_bcc', '', NULL, NULL),
('main', 'send_mid', 'N', NULL, NULL),
('main', 'fill_to_mail', 'N', NULL, NULL),
('main', 'CONVERT_UNIX_NEWLINE_2_WINDOWS', 'N', NULL, NULL),
('main', 'convert_mail_header', 'Y', NULL, NULL),
('main', 'attach_images', 'N', NULL, NULL),
('main', 'max_file_size', '0', NULL, NULL),
('main', 'mail_event_period', '14', NULL, NULL),
('main', 'mail_event_bulk', '5', NULL, NULL),
('main', 'mail_additional_parameters', '', NULL, NULL),
('main', 'disk_space', '', NULL, NULL),
('main', 'upload_dir', 'upload', NULL, NULL),
('main', 'save_original_file_name', 'N', NULL, NULL),
('main', 'translit_original_file_name', 'N', NULL, NULL),
('main', 'convert_original_file_name', 'Y', NULL, NULL),
('main', 'image_resize_quality', '95', NULL, NULL),
('main', 'bx_fast_download', 'N', NULL, NULL),
('main', 'profile_image_width', '', NULL, NULL),
('main', 'profile_image_height', '', NULL, NULL),
('main', 'profile_image_size', '', NULL, NULL),
('main', 'use_minified_assets', 'Y', NULL, NULL),
('main', 'move_js_to_body', 'N', NULL, NULL),
('main', 'compres_css_js_files', 'N', NULL, NULL),
('main', 'translate_key_yandex', '', NULL, NULL),
('main', 'use_time_zones', 'N', NULL, NULL),
('main', 'auto_time_zone', 'N', NULL, NULL),
('main', 'phone_number_default_country', '16', NULL, NULL),
('main', 'map_top_menu_type', 'top', NULL, NULL),
('main', 'map_left_menu_type', 'left', NULL, NULL),
('main', 'url_preview_enable', 'N', NULL, NULL),
('main', 'url_preview_save_images', 'N', NULL, NULL),
('main', 'update_devsrv', 'N', NULL, NULL),
('main', 'update_site_proxy_addr', '', NULL, NULL),
('main', 'update_site_proxy_port', '', NULL, NULL),
('main', 'update_site_proxy_user', '', NULL, NULL),
('main', 'update_site_proxy_pass', '', NULL, NULL),
('main', 'strong_update_check', 'Y', NULL, NULL),
('main', 'stable_versions_only', 'Y', NULL, NULL),
('main', 'update_autocheck', '', NULL, NULL),
('main', 'update_stop_autocheck', 'N', NULL, NULL),
('main', 'update_is_gzip_installed', 'Y', NULL, NULL),
('main', 'update_load_timeout', '30', NULL, NULL),
('main', 'store_password', 'Y', NULL, NULL),
('main', 'use_secure_password_cookies', 'N', NULL, NULL),
('main', 'auth_multisite', 'N', NULL, NULL),
('main', 'allow_socserv_authorization', 'Y', NULL, NULL),
('main', 'use_digest_auth', 'N', NULL, NULL),
('main', 'custom_register_page', '', NULL, NULL),
('main', 'auth_components_template', '', NULL, NULL),
('main', 'captcha_restoring_password', 'N', NULL, NULL),
('main', 'use_encrypted_auth', 'N', NULL, NULL),
('main', 'new_user_registration', 'Y', NULL, NULL),
('main', 'captcha_registration', 'N', NULL, NULL),
('main', 'new_user_email_required', 'Y', NULL, NULL),
('main', 'new_user_registration_email_confirmation', 'N', NULL, NULL),
('main', 'new_user_registration_cleanup_days', '7', NULL, NULL),
('main', 'new_user_email_uniq_check', 'N', NULL, NULL),
('main', 'session_expand', 'Y', NULL, NULL),
('main', 'session_auth_only', 'Y', NULL, NULL),
('main', 'session_show_message', 'Y', NULL, NULL),
('main', 'event_log_cleanup_days', '7', NULL, NULL),
('main', 'event_log_logout', 'N', NULL, NULL),
('main', 'event_log_login_success', 'N', NULL, NULL),
('main', 'event_log_login_fail', 'N', NULL, NULL),
('main', 'event_log_register', 'N', NULL, NULL),
('main', 'event_log_register_fail', 'N', NULL, NULL),
('main', 'event_log_password_request', 'N', NULL, NULL),
('main', 'event_log_password_change', 'N', NULL, NULL),
('main', 'event_log_user_edit', 'N', NULL, NULL),
('main', 'event_log_user_delete', 'N', NULL, NULL),
('main', 'event_log_user_groups', 'N', NULL, NULL),
('main', 'event_log_group_policy', 'N', NULL, NULL),
('main', 'event_log_module_access', 'N', NULL, NULL),
('main', 'event_log_file_access', 'N', NULL, NULL),
('main', 'event_log_task', 'N', NULL, NULL),
('main', 'event_log_marketplace', 'Y', NULL, NULL),
('main', 'auth_controller_sso', 'N', NULL, NULL),
('main', 'show_panel_for_users', 'N;', NULL, NULL),
('main', 'hide_panel_for_users', 'N;', NULL, NULL),
('main', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('main', '~support_finish_date', '2019-02-02', NULL, NULL),
('main', '~PARAM_MAX_USERS', 'c703a8aee24d4084d7d62abb064ac99fb116ef00501f4c4e749d29addb207bce.0', NULL, NULL),
('main', '~PARAM_MAX_SERVERS', '2', NULL, NULL),
('main', '~PARAM_COMPOSITE', 'N', NULL, NULL),
('main', '~PARAM_PHONE_SIP', 'N', NULL, NULL),
('main', '~PARAM_PARTNER_ID', '0', NULL, NULL),
('main', '~new_license17_5_sign', 'Y', NULL, NULL),
('main', 'crc_code', 'UlE1czQ2dE55bw==', NULL, NULL),
('main', 'dump_temporary_cache', 'UBDQ1sexC16FYp7xnf8Q2Er6upxbnEL4', NULL, NULL),
('main', 'dump_bucket_id_auto', '-1', NULL, NULL),
('main', 'dump_auto_time_auto', '190', NULL, NULL),
('main', 'dump_auto_interval_auto', '7', NULL, NULL),
('main', 'last_backup_start_time', '0', NULL, NULL),
('main', 'last_backup_end_time', '1529635475', NULL, NULL),
('main', 'backup_secret_key', 'EdNrFsEJp0bI0wq2Jj5RnGqe5lsssciA', NULL, NULL),
('main', 'dump_auto_enable_auto', '2', NULL, NULL),
('main', 'dump_site_id_auto', 'a:1:{i:0;s:2:\"s1\";}', NULL, NULL),
('main', 'dump_delete_old_auto', '1', NULL, NULL),
('main', 'dump_old_time_auto', '0', NULL, NULL),
('main', 'dump_old_cnt_auto', '3', NULL, NULL),
('main', 'dump_old_size_auto', '0', NULL, NULL),
('main', 'dump_integrity_check_auto', '1', NULL, NULL),
('main', 'dump_use_compression_auto', '1', NULL, NULL),
('main', 'dump_max_exec_time_auto', '20', NULL, NULL),
('main', 'dump_max_exec_time_sleep_auto', '3', NULL, NULL),
('main', 'dump_archive_size_limit_auto', '104857600', NULL, NULL),
('main', 'dump_do_clouds_auto', '0', NULL, NULL),
('main', 'dump_base_auto', '1', NULL, NULL),
('main', 'dump_base_skip_stat_auto', '0', NULL, NULL),
('main', 'dump_base_skip_search_auto', '0', NULL, NULL),
('main', 'dump_base_skip_log_auto', '0', NULL, NULL),
('main', 'dump_file_kernel_auto', '1', NULL, NULL),
('main', 'dump_file_public_auto', '1', NULL, NULL),
('main', 'skip_mask_auto', '0', NULL, NULL),
('main', 'skip_mask_array_auto', 'N;', NULL, NULL),
('main', 'dump_max_file_size_auto', '0', NULL, NULL),
('main', 'skip_symlinks_auto', '0', NULL, NULL),
('main', 'last_files_count', '26355', NULL, NULL),
('perfmon', 'bitrix_optimal', 'N', NULL, NULL),
('perfmon', 'total_mark_value', 'calc', NULL, NULL),
('perfmon', 'total_mark_duration', '300', NULL, NULL),
('perfmon', 'mark_php_page_rate', '25.51', NULL, NULL),
('perfmon', 'mark_php_page_time', '0.0392', NULL, NULL),
('perfmon', 'mark_php_cpu_value', '11.9', NULL, NULL),
('perfmon', 'mark_php_files_value', '2 457.2', NULL, NULL),
('perfmon', 'mark_php_mail_value', '1.0576', NULL, NULL),
('perfmon', 'mark_php_session_time_value', '0.0002', NULL, NULL),
('perfmon', 'mark_php_is_good', 'N', NULL, NULL),
('perfmon', 'mark_db_insert_value', '983', NULL, NULL),
('perfmon', 'mark_db_read_value', '16 007', NULL, NULL),
('perfmon', 'mark_db_update_value', '3 745', NULL, NULL),
('perfmon', 'mark_php_page_date', '08.02.2018 07:36:02', NULL, NULL),
('perfmon', 'end_time', '1518064865', NULL, NULL),
('main', 'site_checker_access', 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cache`
--

CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_cluster`
--

CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_component`
--

CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_perf_component`
--

INSERT INTO `b_perf_component` (`ID`, `HIT_ID`, `NN`, `CACHE_TYPE`, `CACHE_SIZE`, `CACHE_COUNT_R`, `CACHE_COUNT_W`, `CACHE_COUNT_C`, `COMPONENT_TIME`, `QUERIES`, `QUERIES_TIME`, `COMPONENT_NAME`) VALUES
(1, 1, 0, '', 0, 0, 0, 0, 0.247734, 3, 0.0795143, 'bitrix:desktop'),
(2, 6, 0, '', 0, 0, 0, 0, 0.123333, 3, 0.000518799, 'bitrix:desktop');

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_error`
--

CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_history`
--

CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_perf_history`
--

INSERT INTO `b_perf_history` (`ID`, `TIMESTAMP_X`, `TOTAL_MARK`, `ACCELERATOR_ENABLED`) VALUES
(1, '2018-02-08 04:36:02', 25.51, 'Y');

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_hit`
--

CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_perf_hit`
--

INSERT INTO `b_perf_hit` (`ID`, `DATE_HIT`, `IS_ADMIN`, `REQUEST_METHOD`, `SERVER_NAME`, `SERVER_PORT`, `SCRIPT_NAME`, `REQUEST_URI`, `INCLUDED_FILES`, `MEMORY_PEAK_USAGE`, `CACHE_TYPE`, `CACHE_SIZE`, `CACHE_COUNT_R`, `CACHE_COUNT_W`, `CACHE_COUNT_C`, `QUERIES`, `QUERIES_TIME`, `COMPONENTS`, `COMPONENTS_TIME`, `SQL_LOG`, `PAGE_TIME`, `PROLOG_TIME`, `PROLOG_BEFORE_TIME`, `AGENTS_TIME`, `PROLOG_AFTER_TIME`, `WORK_AREA_TIME`, `EPILOG_TIME`, `EPILOG_BEFORE_TIME`, `EVENTS_TIME`, `EPILOG_AFTER_TIME`, `MENU_RECALC`) VALUES
(1, '2018-02-08 07:36:24', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/index.php', '/bitrix/admin/index.php', 353, 9320448, 'Y', 0, 0, 0, 0, 11, 0.0870104, 1, 0.247734, 'Y', 0.403582, 0.1142, 0.0817981, 0.00474715, 0.037169, 0.248489, 0.0361259, 0.0024941, 0.000613213, 0.0330186, 0),
(2, '2018-02-08 07:36:35', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/site_speed.php', '/bitrix/admin/site_speed.php?lang=ru', 190, 5909280, 'Y', 0, 0, 0, 0, 6, 0.0550067, 0, 0, 'Y', 0.124267, 0.0489, 0.0443199, 0.000788927, 0.00540805, 0.0619411, 0.012598, 0.00238585, 0.000522852, 0.00968933, 0),
(3, '2018-02-08 07:36:44', 'Y', 'POST', 'pitstop-cafe.ru', 80, '/bitrix/admin/site_speed.php', '/bitrix/admin/site_speed.php?login=yes&lang=ru', 121, 4858928, 'Y', 0, 0, 0, 0, 8, 0.0298073, 0, 0, 'Y', 0.0778599, NULL, NULL, 0.00080514, NULL, NULL, NULL, NULL, 0, NULL, 0),
(4, '2018-02-08 07:36:44', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/site_speed.php', '/bitrix/admin/site_speed.php?lang=ru', 164, 5048056, 'Y', 0, 0, 0, 0, 2, 0.000257015, 0, 0, 'Y', 0.079906, 0.0773, 0.0699451, 0.00101709, 0.00833392, -1518060000, 1518060000, 0, 0, NULL, 0),
(5, '2018-02-08 07:36:44', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/site_speed.php', '/bitrix/admin/site_speed.php?lang=ru&_r=595', 189, 5843904, 'Y', 0, 0, 0, 0, 2, 0.000249147, 0, 0, 'Y', 0.067951, 0.0507, 0.0460219, 0.000504971, 0.00522709, 0.00548291, 0.011219, 0.00234222, 0.000567198, 0.0083096, 0),
(6, '2018-02-08 07:36:53', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/index.php', '/bitrix/admin/index.php', 351, 9297008, 'Y', 0, 0, 0, 0, 11, 0.00240946, 1, 0.123333, 'Y', 0.232251, 0.0859, 0.063014, 0.000506163, 0.023417, 0.123805, 0.0220149, 0.00161481, 0.000560999, 0.019839, 0),
(7, '2018-02-08 07:37:45', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/user_options.php', '/bitrix/admin/user_options.php?p[0][c]=favorite&p[0][n]=favorite_menu&p[0][v][stick]=N&p[1][c]=admin_menu&p[1][n]=pos&p[1][v][sections]=menu_iblock_%2Fcafe%2F8%2Cmenu_iblock_%252Fmenu%252F5%2Cmenu_highloadblock%2Chighloadblock_tools%2Cmenu_fileman_file_s1_%2Cmenu_iblock_%2Fmain_slider_s1%2Cmenu_iblock_%2Fgallery%2Ciblock_admin%2Cmenu_iblock_%2Fmenu%2Cmenu_fileman%2Cbackup%2Cmenu_iblock_%2Fnews%2Cmenu_iblock_%2Fcafe%2Cmenu_system&sessid=d7213ebe0377c4a611a103e83f68eb28&_=1518064654947', 145, 5063088, 'Y', 0, 0, 0, 0, 2, 0.386547, 0, 0, 'Y', 9.59081, NULL, NULL, 9.16068, NULL, NULL, NULL, NULL, 0.000797987, NULL, 0),
(8, '2018-02-08 07:37:46', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/agent_list.php', '/bitrix/admin/agent_list.php?lang=ru', 278, 9208064, 'Y', 0, 0, 0, 0, 14, 0.0191307, 0, 0, 'Y', 0.181687, 0.1175, 0.0604548, 0.00170684, 0.058799, 0.032336, 0.030097, 0.00186992, 0.000792027, 0.0274351, 0),
(9, '2018-02-08 07:37:54', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/user_options.php', '/bitrix/admin/user_options.php?p[0][c]=favorite&p[0][n]=favorite_menu&p[0][v][stick]=N&sessid=d7213ebe0377c4a611a103e83f68eb28&_=1518064673957', 142, 5022768, 'Y', 0, 0, 0, 0, 1, 0.000353098, 0, 0, 'Y', 0.0397742, NULL, NULL, 0.000545979, NULL, NULL, NULL, NULL, 0.000557899, NULL, 0),
(10, '2018-02-08 07:38:04', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist_detail.php', '/bitrix/admin/checklist_detail.php?TEST_ID=QJ0020&lang=ru&bxpublic=Y&bxsender=core_window_cadmindialog', 178, 6260552, 'Y', 0, 0, 0, 0, 2, 0.207073, 0, 0, 'Y', 0.382102, 0.0398, 0.0381131, 0.000545979, 0.00221992, -1518060000, 1518060000, 1518060000, 0.000609159, 0.0464687, 0),
(11, '2018-02-08 07:38:22', 'Y', 'POST', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist.php', '/bitrix/admin/checklist.php?bxpublic=Y&sessid=d7213ebe0377c4a611a103e83f68eb28', 162, 7151360, 'Y', 0, 0, 0, 0, 14, 0.0838218, 0, 0, 'Y', 4.19323, 0.0459, 0.044152, 0.000720978, 0.00251198, -1518060000, 1518060000, 0, 0, NULL, 0),
(12, '2018-02-08 07:39:25', 'Y', 'POST', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist.php', '/bitrix/admin/checklist.php?bxpublic=Y&sessid=d7213ebe0377c4a611a103e83f68eb28', 160, 7097760, 'Y', 0, 0, 0, 0, 9, 0.00977206, 0, 0, 'Y', 3.81605, 0.0462, 0.0688801, 0.0252171, 0.00250101, -1518060000, 1518060000, 0, 0, NULL, 0),
(13, '2018-02-08 07:39:30', 'Y', 'POST', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist.php', '/bitrix/admin/checklist.php?bxpublic=Y&sessid=d7213ebe0377c4a611a103e83f68eb28', 160, 7096960, 'Y', 0, 0, 0, 0, 9, 0.0212476, 0, 0, 'Y', 3.4347, 0.0385, 0.0410931, 0.00484896, 0.00224304, -1518060000, 1518060000, 0, 0, NULL, 0),
(14, '2018-02-08 07:39:42', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist_detail.php', '/bitrix/admin/checklist_detail.php?TEST_ID=QSEC0020&lang=ru&bxpublic=Y&bxsender=core_window_cadmindialog', 178, 6266712, 'Y', 0, 0, 0, 0, 2, 0.000546694, 0, 0, 'Y', 0.149389, 0.0365, 0.0570669, 0.022711, 0.00212312, -1518060000, 1518060000, 1518060000, 0.000524998, 0.00365615, 0),
(15, '2018-02-08 07:39:55', 'Y', 'POST', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist.php', '/bitrix/admin/checklist.php?bxpublic=Y&sessid=d7213ebe0377c4a611a103e83f68eb28', 161, 7141536, 'Y', 0, 0, 0, 0, 13, 0.017906, 0, 0, 'Y', 4.41122, 0.0424, 0.040663, 0.000787973, 0.00248289, -1518060000, 1518060000, 0, 0, NULL, 0),
(16, '2018-02-08 07:39:56', 'Y', 'GET', 'pitstop-cafe.ru', 80, '/bitrix/admin/checklist_detail.php', '/bitrix/admin/checklist_detail.php?TEST_ID=QP0050&lang=ru&bxpublic=Y&bxsender=core_window_cadmindialog', 178, 6271920, 'Y', 0, 0, 0, 0, 2, 0.00216389, 0, 0, 'Y', 0.132368, 0.0368, 0.0393159, 0.00470304, 0.00216508, -1518060000, 1518060000, 1518060000, 0.000528097, 0.00367689, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_ban`
--

CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_complete`
--

CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest`
--

CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_index_suggest_sql`
--

CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql`
--

CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_perf_sql`
--

INSERT INTO `b_perf_sql` (`ID`, `HIT_ID`, `COMPONENT_ID`, `NN`, `QUERY_TIME`, `NODE_ID`, `MODULE_NAME`, `COMPONENT_NAME`, `SQL_TEXT`) VALUES
(1, 1, NULL, 1, 0.000137806, 0, 'main', NULL, 'SELECT \n	`highloadblock_highload_block`.`ID` AS `ID`,\n	`highloadblock_highload_block`.`NAME` AS `NAME`,\n	`highloadblock_highload_block`.`TABLE_NAME` AS `TABLE_NAME`,\n	`highloadblock_highload_block_lang`.`NAME` AS `NAME_LANG`\nFROM `b_hlblock_entity` `highloadblock_highload_block` \nLEFT JOIN `b_hlblock_entity_lang` `highloadblock_highload_block_lang` ON `highloadblock_highload_block`.`ID` = `highloadblock_highload_block_lang`.`ID`\nAND `highloadblock_highload_block_lang`.`LID` = \'ru\'\nORDER BY `NAME_LANG` ASC, `NAME` ASC'),
(2, 1, NULL, 2, 0.00019598, -1, 'iblock', NULL, '\n				SELECT DISTINCT\n					B.*\n					,B.XML_ID as EXTERNAL_ID\n					,DATE_FORMAT(B.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\') as TIMESTAMP_X\n					,L.DIR as LANG_DIR\n					,L.SERVER_NAME\n				FROM\n					b_iblock B\n					INNER JOIN b_lang L ON L.LID=B.LID\n				WHERE 1 = 1\n					\n					\n			 ORDER BY  B.SORT asc , B.NAME asc '),
(3, 1, NULL, 3, 0.0000929832, -1, 'iblock', NULL, 'SELECT DISTINCT BS.ID AS ID,\nBS.IBLOCK_SECTION_ID AS IBLOCK_SECTION_ID,\nBS.NAME AS NAME,\nBS.LEFT_MARGIN AS LEFT_MARGIN,\nBS.RIGHT_MARGIN AS RIGHT_MARGIN\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'8\')))) \n				AND  (((BS.IBLOCK_SECTION_ID IS  NULL))) \n				AND  ((((B.ID = \'8\')))) \n			\n				ORDER BY  BS.LEFT_MARGIN asc '),
(4, 1, NULL, 4, 0.0002141, -1, 'clouds', NULL, '\n			SELECT \n			s.ID, s.ACTIVE, s.READ_ONLY, s.SORT, s.SERVICE_ID, s.LOCATION, s.BUCKET, s.SETTINGS, s.CNAME, s.PREFIX, s.FILE_COUNT, s.FILE_SIZE, s.LAST_FILE_ID, s.FILE_RULES\n			FROM\n				b_clouds_file_bucket s\n			\n		\n				ORDER BY\n				SORT DESC, ID ASC\n			'),
(5, 1, NULL, 5, 0.000254154, -1, 'main', NULL, 'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID, 	C.FORMAT_DATE, C.FORMAT_DATETIME, C.FORMAT_NAME, C.WEEK_START, C.CHARSET, C.DIRECTION FROM b_language L, b_culture C WHERE C.ID = L.CULTURE_ID  AND (L.LID=\'ru\')  ORDER BY L.SORT '),
(6, 1, NULL, 6, 0.000104904, 0, 'main', NULL, 'SELECT \n	`main_localization_language`.`LID` AS `LID`,\n	`main_localization_language`.`SORT` AS `SORT`,\n	`main_localization_language`.`DEF` AS `DEF`,\n	`main_localization_language`.`ACTIVE` AS `ACTIVE`,\n	`main_localization_language`.`NAME` AS `NAME`,\n	`main_localization_language`.`CULTURE_ID` AS `CULTURE_ID`\nFROM `b_language` `main_localization_language` \n\nWHERE UPPER(`main_localization_language`.`ACTIVE`) like upper(\'Y\')\nORDER BY `SORT` ASC'),
(7, 1, NULL, 7, 0.000217199, -1, 'main', NULL, '\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.MENU_ID, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN, F.CODE_ID,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%d.%m.%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'ru\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),
(8, 1, NULL, 8, 0.00627899, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'favorite\', \'favorite_menu\', \'a:1:{s:5:\\\"stick\\\";s:1:\\\"Y\\\";}\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'a:1:{s:5:\\\"stick\\\";s:1:\\\"Y\\\";}\', `COMMON` = \'N\'\n			'),
(9, 1, 1, 9, 0.0594323, -1, 'iblock', 'bitrix:desktop', '\n				SELECT DISTINCT\n					B.*\n					,B.XML_ID as EXTERNAL_ID\n					,DATE_FORMAT(B.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\') as TIMESTAMP_X\n					,L.DIR as LANG_DIR\n					,L.SERVER_NAME\n				FROM\n					b_iblock B\n					INNER JOIN b_lang L ON L.LID=B.LID\n				WHERE 1 = 1\n					\n					\n			'),
(10, 1, 1, 10, 0.0199189, -1, 'main', 'bitrix:desktop', 'SELECT COUNT(\'x\') as C FROM b_user'),
(11, 1, 1, 11, 0.000163078, -1, 'main', 'bitrix:desktop', 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(12, 2, NULL, 1, 0.000166893, -1, 'main', NULL, 'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID, 	C.FORMAT_DATE, C.FORMAT_DATETIME, C.FORMAT_NAME, C.WEEK_START, C.CHARSET, C.DIRECTION FROM b_language L, b_culture C WHERE C.ID = L.CULTURE_ID  AND (L.LID=\'ru\')  ORDER BY L.SORT '),
(13, 2, NULL, 2, 0.0000882149, 0, 'main', NULL, 'SELECT \n	`main_localization_language`.`LID` AS `LID`,\n	`main_localization_language`.`SORT` AS `SORT`,\n	`main_localization_language`.`DEF` AS `DEF`,\n	`main_localization_language`.`ACTIVE` AS `ACTIVE`,\n	`main_localization_language`.`NAME` AS `NAME`,\n	`main_localization_language`.`CULTURE_ID` AS `CULTURE_ID`\nFROM `b_language` `main_localization_language` \n\nWHERE UPPER(`main_localization_language`.`ACTIVE`) like upper(\'Y\')\nORDER BY `SORT` ASC'),
(14, 2, NULL, 3, 0.00945187, -1, 'main', NULL, '\n			SELECT\n				UF.ID\n				,UF.ENTITY_ID\n				,UF.FIELD_NAME\n				,UF.USER_TYPE_ID\n				,UF.XML_ID\n				,UF.SORT\n				,UF.MULTIPLE\n				,UF.MANDATORY\n				,UF.SHOW_FILTER\n				,UF.SHOW_IN_LIST\n				,UF.EDIT_IN_LIST\n				,UF.IS_SEARCHABLE\n				,UF.SETTINGS\n				\n			FROM\n				b_user_field UF\n				\n			\nWHERE UF.ENTITY_ID = \'USER\'\nORDER BY UF.SORT ASC, UF.ID ASC'),
(15, 2, NULL, 4, 0.015415, -1, 'main', NULL, 'SELECT U.ID, U.LOGIN, U.LOGIN_ATTEMPTS\n			\n		\n			FROM\n				b_user U\n				\n				\n			WHERE\n				(1=1\n					AND\n					(\n						U.LOGIN=\'pitstop_admin\'\n					)\n					\n					AND\n					(\n						(U.EXTERNAL_AUTH_ID IS NULL OR U.EXTERNAL_AUTH_ID=\'\')\n					)\n					)\n			ORDER BY U.LOGIN desc'),
(16, 2, NULL, 5, 0.0000648499, -1, 'main', NULL, 'SELECT G.SECURITY_POLICY FROM b_group G WHERE G.ID=2'),
(17, 2, NULL, 6, 0.02982, -1, 'main', NULL, 'SELECT UG.GROUP_ID, G.SECURITY_POLICY FROM b_user_group UG, b_group G WHERE UG.USER_ID = 1 	AND UG.GROUP_ID = G.ID 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) '),
(18, 3, NULL, 1, 0.00049901, -1, 'main', NULL, 'SELECT U.ID, U.LOGIN, U.ACTIVE, U.PASSWORD, U.LOGIN_ATTEMPTS, U.CONFIRM_CODE, U.EMAIL FROM b_user U  WHERE U.LOGIN=\'pitstop_admin\' 	AND (EXTERNAL_AUTH_ID IS NULL OR EXTERNAL_AUTH_ID=\'\') '),
(19, 3, NULL, 2, 0.0000607967, -1, 'main', NULL, 'SELECT G.SECURITY_POLICY FROM b_group G WHERE G.ID=2'),
(20, 3, NULL, 3, 0.000279188, -1, 'main', NULL, 'SELECT UG.GROUP_ID, G.SECURITY_POLICY FROM b_user_group UG, b_group G WHERE UG.USER_ID = 1 	AND UG.GROUP_ID = G.ID 	AND ((UG.DATE_ACTIVE_FROM IS NULL) OR (UG.DATE_ACTIVE_FROM <= now())) 	AND ((UG.DATE_ACTIVE_TO IS NULL) OR (UG.DATE_ACTIVE_TO >= now())) '),
(21, 3, NULL, 4, 0.000299692, -1, 'main', NULL, 'SELECT U.* FROM b_user U  WHERE U.ID=\'1\' '),
(22, 3, NULL, 5, 0.00019002, 0, 'main', NULL, 'SELECT \n	`main_group`.`ID` AS `ID`\nFROM `b_group` `main_group` \n\nWHERE `main_group`.`ANONYMOUS` = \'Y\'\nAND `main_group`.`ACTIVE` = \'Y\''),
(23, 3, NULL, 6, 0.000300407, 0, 'main', NULL, 'SELECT \n	`main_group`.`ID` AS `ID`\nFROM `b_group` `main_group` \nLEFT JOIN `b_user_group` `main_group_user_group_group` ON `main_group_user_group_group`.`GROUP_ID` = `main_group`.`ID`\nWHERE `main_group_user_group_group`.`USER_ID` = 1\nAND `main_group`.`ACTIVE` = \'Y\'\nAND (\n	(`main_group_user_group_group`.`DATE_ACTIVE_FROM` IS NULL)\n	OR `main_group_user_group_group`.`DATE_ACTIVE_FROM` <= NOW()\n)\nAND (\n	(`main_group_user_group_group`.`DATE_ACTIVE_TO` IS NULL)\n	OR `main_group_user_group_group`.`DATE_ACTIVE_TO` >= NOW()\n)\nAND (\n	(`main_group`.`ANONYMOUS` IS NULL OR `main_group`.`ANONYMOUS` <> \'Y\')\n	OR (`main_group`.`ANONYMOUS` IS NULL OR `main_group`.`ANONYMOUS` = \'\')\n)'),
(24, 3, NULL, 7, 0.000541925, -1, 'main', NULL, '\n					UPDATE b_user SET\n						STORED_HASH = NULL,\n						LAST_LOGIN = now(),\n						TIMESTAMP_X = TIMESTAMP_X,\n						LOGIN_ATTEMPTS = 0\n						\n						\n					WHERE\n						ID=1'),
(25, 3, NULL, 8, 0.0276363, -1, 'main', NULL, 'select * from b_user_access where user_id=1 and provider_id=\'group\''),
(26, 4, NULL, 1, 0.000173092, -1, 'main', NULL, 'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID, 	C.FORMAT_DATE, C.FORMAT_DATETIME, C.FORMAT_NAME, C.WEEK_START, C.CHARSET, C.DIRECTION FROM b_language L, b_culture C WHERE C.ID = L.CULTURE_ID  AND (L.LID=\'ru\')  ORDER BY L.SORT '),
(27, 4, NULL, 2, 0.0000839233, 0, 'main', NULL, 'SELECT \n	`main_localization_language`.`LID` AS `LID`,\n	`main_localization_language`.`SORT` AS `SORT`,\n	`main_localization_language`.`DEF` AS `DEF`,\n	`main_localization_language`.`ACTIVE` AS `ACTIVE`,\n	`main_localization_language`.`NAME` AS `NAME`,\n	`main_localization_language`.`CULTURE_ID` AS `CULTURE_ID`\nFROM `b_language` `main_localization_language` \n\nWHERE UPPER(`main_localization_language`.`ACTIVE`) like upper(\'Y\')\nORDER BY `SORT` ASC'),
(28, 5, NULL, 1, 0.0001688, -1, 'main', NULL, 'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID, 	C.FORMAT_DATE, C.FORMAT_DATETIME, C.FORMAT_NAME, C.WEEK_START, C.CHARSET, C.DIRECTION FROM b_language L, b_culture C WHERE C.ID = L.CULTURE_ID  AND (L.LID=\'ru\')  ORDER BY L.SORT '),
(29, 5, NULL, 2, 0.0000803471, 0, 'main', NULL, 'SELECT \n	`main_localization_language`.`LID` AS `LID`,\n	`main_localization_language`.`SORT` AS `SORT`,\n	`main_localization_language`.`DEF` AS `DEF`,\n	`main_localization_language`.`ACTIVE` AS `ACTIVE`,\n	`main_localization_language`.`NAME` AS `NAME`,\n	`main_localization_language`.`CULTURE_ID` AS `CULTURE_ID`\nFROM `b_language` `main_localization_language` \n\nWHERE UPPER(`main_localization_language`.`ACTIVE`) like upper(\'Y\')\nORDER BY `SORT` ASC'),
(30, 6, NULL, 1, 0.000153065, 0, 'main', NULL, 'SELECT \n	`highloadblock_highload_block`.`ID` AS `ID`,\n	`highloadblock_highload_block`.`NAME` AS `NAME`,\n	`highloadblock_highload_block`.`TABLE_NAME` AS `TABLE_NAME`,\n	`highloadblock_highload_block_lang`.`NAME` AS `NAME_LANG`\nFROM `b_hlblock_entity` `highloadblock_highload_block` \nLEFT JOIN `b_hlblock_entity_lang` `highloadblock_highload_block_lang` ON `highloadblock_highload_block`.`ID` = `highloadblock_highload_block_lang`.`ID`\nAND `highloadblock_highload_block_lang`.`LID` = \'ru\'\nORDER BY `NAME_LANG` ASC, `NAME` ASC'),
(31, 6, NULL, 2, 0.000158072, -1, 'iblock', NULL, '\n				SELECT DISTINCT\n					B.*\n					,B.XML_ID as EXTERNAL_ID\n					,DATE_FORMAT(B.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\') as TIMESTAMP_X\n					,L.DIR as LANG_DIR\n					,L.SERVER_NAME\n				FROM\n					b_iblock B\n					INNER JOIN b_lang L ON L.LID=B.LID\n				WHERE 1 = 1\n					\n					\n			 ORDER BY  B.SORT asc , B.NAME asc '),
(32, 6, NULL, 3, 0.0000810623, -1, 'iblock', NULL, 'SELECT DISTINCT BS.ID AS ID,\nBS.IBLOCK_SECTION_ID AS IBLOCK_SECTION_ID,\nBS.NAME AS NAME,\nBS.LEFT_MARGIN AS LEFT_MARGIN,\nBS.RIGHT_MARGIN AS RIGHT_MARGIN\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'8\')))) \n				AND  (((BS.IBLOCK_SECTION_ID IS  NULL))) \n				AND  ((((B.ID = \'8\')))) \n			\n				ORDER BY  BS.LEFT_MARGIN asc '),
(33, 6, NULL, 4, 0.0000920296, -1, 'clouds', NULL, '\n			SELECT \n			s.ID, s.ACTIVE, s.READ_ONLY, s.SORT, s.SERVICE_ID, s.LOCATION, s.BUCKET, s.SETTINGS, s.CNAME, s.PREFIX, s.FILE_COUNT, s.FILE_SIZE, s.LAST_FILE_ID, s.FILE_RULES\n			FROM\n				b_clouds_file_bucket s\n			\n		\n				ORDER BY\n				SORT DESC, ID ASC\n			'),
(34, 6, NULL, 5, 0.0000870228, -1, 'main', NULL, 'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID, 	C.FORMAT_DATE, C.FORMAT_DATETIME, C.FORMAT_NAME, C.WEEK_START, C.CHARSET, C.DIRECTION FROM b_language L, b_culture C WHERE C.ID = L.CULTURE_ID  AND (L.LID=\'ru\')  ORDER BY L.SORT '),
(35, 6, NULL, 6, 0.000272036, 0, 'main', NULL, 'SELECT \n	`main_localization_language`.`LID` AS `LID`,\n	`main_localization_language`.`SORT` AS `SORT`,\n	`main_localization_language`.`DEF` AS `DEF`,\n	`main_localization_language`.`ACTIVE` AS `ACTIVE`,\n	`main_localization_language`.`NAME` AS `NAME`,\n	`main_localization_language`.`CULTURE_ID` AS `CULTURE_ID`\nFROM `b_language` `main_localization_language` \n\nWHERE UPPER(`main_localization_language`.`ACTIVE`) like upper(\'Y\')\nORDER BY `SORT` ASC'),
(36, 6, NULL, 7, 0.000755072, -1, 'main', NULL, '\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.MENU_ID, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN, F.CODE_ID,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%d.%m.%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'ru\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),
(37, 6, NULL, 8, 0.000292301, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'favorite\'\n						'),
(38, 6, 2, 9, 0.000182867, -1, 'iblock', 'bitrix:desktop', '\n				SELECT DISTINCT\n					B.*\n					,B.XML_ID as EXTERNAL_ID\n					,DATE_FORMAT(B.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\') as TIMESTAMP_X\n					,L.DIR as LANG_DIR\n					,L.SERVER_NAME\n				FROM\n					b_iblock B\n					INNER JOIN b_lang L ON L.LID=B.LID\n				WHERE 1 = 1\n					\n					\n			'),
(39, 6, 2, 10, 0.000231743, -1, 'main', 'bitrix:desktop', 'SELECT COUNT(\'x\') as C FROM b_user'),
(40, 6, 2, 11, 0.000104189, -1, 'main', 'bitrix:desktop', 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(41, 7, NULL, 1, 0.38618, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'favorite\', \'favorite_menu\', \'a:1:{s:5:\\\"stick\\\";s:1:\\\"N\\\";}\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'a:1:{s:5:\\\"stick\\\";s:1:\\\"N\\\";}\', `COMMON` = \'N\'\n			'),
(42, 7, NULL, 2, 0.000366926, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'admin_menu\', \'pos\', \'a:3:{s:8:\\\"sections\\\";s:252:\\\"menu_iblock_/cafe/8,menu_iblock_%2Fmenu%2F5,menu_highloadblock,highloadblock_tools,menu_fileman_file_s1_,menu_iblock_/main_slider_s1,menu_iblock_/gallery,iblock_admin,menu_iblock_/menu,menu_fileman,backup,menu_iblock_/news,menu_iblock_/cafe,menu_system\\\";s:3:\\\"ver\\\";s:2:\\\"on\\\";s:5:\\\"width\\\";s:3:\\\"300\\\";}\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'a:3:{s:8:\\\"sections\\\";s:252:\\\"menu_iblock_/cafe/8,menu_iblock_%2Fmenu%2F5,menu_highloadblock,highloadblock_tools,menu_fileman_file_s1_,menu_iblock_/main_slider_s1,menu_iblock_/gallery,iblock_admin,menu_iblock_/menu,menu_fileman,backup,menu_iblock_/news,menu_iblock_/cafe,menu_system\\\";s:3:\\\"ver\\\";s:2:\\\"on\\\";s:5:\\\"width\\\";s:3:\\\"300\\\";}\', `COMMON` = \'N\'\n			'),
(43, 8, NULL, 1, 0.000629902, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'list\'\n						'),
(44, 8, NULL, 2, 0.000627995, -1, 'main', NULL, 'SELECT A.ID, A.MODULE_ID, A.USER_ID, B.LOGIN, B.NAME as USER_NAME, B.LAST_NAME, A.SORT, A.NAME, A.ACTIVE, A.RUNNING, DATE_FORMAT(A.LAST_EXEC, \'%d.%m.%Y %H:%i:%s\') as LAST_EXEC, DATE_FORMAT(A.NEXT_EXEC, \'%d.%m.%Y %H:%i:%s\') as NEXT_EXEC, DATE_FORMAT(A.DATE_CHECK, \'%d.%m.%Y %H:%i:%s\') as DATE_CHECK, A.AGENT_INTERVAL, A.IS_PERIOD FROM b_agent A LEFT JOIN b_user B ON(A.USER_ID = B.ID) ORDER BY A.SORT ASC'),
(45, 8, NULL, 3, 0.000354052, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'admin_menu\'\n						'),
(46, 8, NULL, 4, 0.000108004, 0, 'main', NULL, 'SELECT \n	`highloadblock_highload_block`.`ID` AS `ID`,\n	`highloadblock_highload_block`.`NAME` AS `NAME`,\n	`highloadblock_highload_block`.`TABLE_NAME` AS `TABLE_NAME`,\n	`highloadblock_highload_block_lang`.`NAME` AS `NAME_LANG`\nFROM `b_hlblock_entity` `highloadblock_highload_block` \nLEFT JOIN `b_hlblock_entity_lang` `highloadblock_highload_block_lang` ON `highloadblock_highload_block`.`ID` = `highloadblock_highload_block_lang`.`ID`\nAND `highloadblock_highload_block_lang`.`LID` = \'ru\'\nORDER BY `NAME_LANG` ASC, `NAME` ASC'),
(47, 8, NULL, 5, 0.000192642, -1, 'iblock', NULL, '\n				SELECT DISTINCT\n					B.*\n					,B.XML_ID as EXTERNAL_ID\n					,DATE_FORMAT(B.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\') as TIMESTAMP_X\n					,L.DIR as LANG_DIR\n					,L.SERVER_NAME\n				FROM\n					b_iblock B\n					INNER JOIN b_lang L ON L.LID=B.LID\n				WHERE 1 = 1\n					\n					\n			 ORDER BY  B.SORT asc , B.NAME asc '),
(48, 8, NULL, 6, 0.0000860691, -1, 'iblock', NULL, 'SELECT DISTINCT BS.ID AS ID,\nBS.IBLOCK_SECTION_ID AS IBLOCK_SECTION_ID,\nBS.NAME AS NAME,\nBS.LEFT_MARGIN AS LEFT_MARGIN,\nBS.RIGHT_MARGIN AS RIGHT_MARGIN\n				FROM b_iblock_section BS\n					INNER JOIN b_iblock B ON BS.IBLOCK_ID = B.ID\n					\n				\n				WHERE 1=1\n				\n				\n				AND  ((((BS.IBLOCK_ID = \'8\')))) \n				AND  (((BS.IBLOCK_SECTION_ID IS  NULL))) \n				AND  ((((B.ID = \'8\')))) \n			\n				ORDER BY  BS.LEFT_MARGIN asc '),
(49, 8, NULL, 7, 0.0000941753, -1, 'clouds', NULL, '\n			SELECT \n			s.ID, s.ACTIVE, s.READ_ONLY, s.SORT, s.SERVICE_ID, s.LOCATION, s.BUCKET, s.SETTINGS, s.CNAME, s.PREFIX, s.FILE_COUNT, s.FILE_SIZE, s.LAST_FILE_ID, s.FILE_RULES\n			FROM\n				b_clouds_file_bucket s\n			\n		\n				ORDER BY\n				SORT DESC, ID ASC\n			'),
(50, 8, NULL, 8, 0.0000910759, -1, 'main', NULL, 'SELECT L.*, L.LID as ID, L.LID as LANGUAGE_ID, 	C.FORMAT_DATE, C.FORMAT_DATETIME, C.FORMAT_NAME, C.WEEK_START, C.CHARSET, C.DIRECTION FROM b_language L, b_culture C WHERE C.ID = L.CULTURE_ID  AND (L.LID=\'ru\')  ORDER BY L.SORT '),
(51, 8, NULL, 9, 0.0000779629, 0, 'main', NULL, 'SELECT \n	`main_localization_language`.`LID` AS `LID`,\n	`main_localization_language`.`SORT` AS `SORT`,\n	`main_localization_language`.`DEF` AS `DEF`,\n	`main_localization_language`.`ACTIVE` AS `ACTIVE`,\n	`main_localization_language`.`NAME` AS `NAME`,\n	`main_localization_language`.`CULTURE_ID` AS `CULTURE_ID`\nFROM `b_language` `main_localization_language` \n\nWHERE UPPER(`main_localization_language`.`ACTIVE`) like upper(\'Y\')\nORDER BY `SORT` ASC'),
(52, 8, NULL, 10, 0.000111103, -1, 'main', NULL, '\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.MENU_ID, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN, F.CODE_ID,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%d.%m.%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'ru\'\n					)\n					)\n			 ORDER BY  F.COMMON ASC, F.C_SORT ASC, F.NAME ASC'),
(53, 8, NULL, 11, 0.000434875, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'favorite\'\n						'),
(54, 8, NULL, 12, 0.00458193, -1, 'main', NULL, '\n			SELECT\n				F.ID, F.C_SORT, F.NAME, F.MENU_ID, F.URL, F.MODIFIED_BY, F.CREATED_BY, F.MODULE_ID, F.LANGUAGE_ID,\n				F.COMMENTS, F.COMMON, F.USER_ID, UM.LOGIN AS M_LOGIN, UC.LOGIN as C_LOGIN, U.LOGIN, F.CODE_ID,\n				DATE_FORMAT(F.TIMESTAMP_X, \'%d.%m.%Y %H:%i:%s\')	TIMESTAMP_X,\n				DATE_FORMAT(F.DATE_CREATE, \'%d.%m.%Y %H:%i:%s\')	DATE_CREATE,\n				concat(ifnull(UM.NAME, \'\') , \' \' , ifnull(UM.LAST_NAME, \'\')) as M_USER_NAME,\n				concat(ifnull(UC.NAME, \'\') , \' \' , ifnull(UC.LAST_NAME, \'\')) as C_USER_NAME,\n				concat(ifnull(U.NAME, \'\') , \' \' , ifnull(U.LAST_NAME, \'\')) as USER_NAME\n			FROM\n				b_favorite F\n				LEFT JOIN b_user UM ON (UM.ID = F.MODIFIED_BY)\n				LEFT JOIN b_user UC ON (UC.ID = F.CREATED_BY)\n				LEFT JOIN b_user U ON (U.ID = F.USER_ID)\n			WHERE\n			(1=1\n					AND\n					(\n						( \n					(upper(F.URL) like upper(\'%%agent_list.php%%\') and F.URL is not null)\n					 )\n					)\n					\n					AND\n					(\n						(F.USER_ID=1 OR F.COMMON=\'Y\')\n					)\n					\n					AND\n					(\n						F.LANGUAGE_ID = \'ru\'\n					)\n					)\n			 ORDER BY F.ID DESC'),
(55, 8, NULL, 13, 0.000209808, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'filter\'\n						'),
(56, 8, NULL, 14, 0.0115311, -1, 'main', NULL, '\n			SELECT\n				F.ID, F.USER_ID, F.NAME, F.FILTER_ID, F.FIELDS, F.COMMON, F.PRESET, F.LANGUAGE_ID, F.PRESET_ID, F.SORT, F.SORT_FIELD\n			FROM\n				b_filters F\n			WHERE\n			(1=1\n					AND\n					(\n						F.USER_ID=1 OR F.COMMON=\'Y\'\n					)\n					\n					AND\n					(\n						F.FILTER_ID = \'tbl_agent_list_filter\'\n					)\n					)\n			 ORDER BY F.ID ASC'),
(57, 9, NULL, 1, 0.000353098, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'favorite\', \'favorite_menu\', \'a:1:{s:5:\\\"stick\\\";s:1:\\\"N\\\";}\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'a:1:{s:5:\\\"stick\\\";s:1:\\\"N\\\";}\', `COMMON` = \'N\'\n			'),
(58, 10, NULL, 1, 0.000170946, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(59, 10, NULL, 2, 0.206902, -1, 'main', NULL, '\n			SELECT\n				U.*\n			FROM\n				b_undo U\n			WHERE\n				(1=1\n					AND\n					(\n						(U.ID like \'24c%\')\n					)\n					)\n			ORDER BY U.ID asc'),
(60, 11, NULL, 1, 0.000524998, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'checklist\'\n						'),
(61, 11, NULL, 2, 0.000100136, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(62, 11, NULL, 3, 0.0000700951, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(63, 11, NULL, 4, 0.000267983, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'N\'\n			'),
(64, 11, NULL, 5, 0.0254378, -1, 'main', NULL, 'SELECT ID FROM b_checklist WHERE REPORT <> \'Y\''),
(65, 11, NULL, 6, 0.000124931, -1, 'main', NULL, 'SELECT * FROM `b_checklist` LIMIT 0'),
(66, 11, NULL, 7, 0.0210719, -1, 'main', NULL, 'UPDATE b_checklist SET `STATE` = \'a:65:{s:6:\\\"QD0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:54:\\\"Проверено: 2 шаблон(a,ов) сайта.\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}s:8:\\\"PERFOMER\\\";s:31:\\\"Панель отключена\\\";}}s:6:\\\"QD0010\\\";a:2:{s:8:\\\"COMMENTS\\\";N;s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0090\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:96:\\\"У всех кастомизированных компонентов есть описания!\\\";}}}s:6:\\\"QC0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0090\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:36:\\\"Проверено файлов: 41\\n\\\";}}}s:6:\\\"QC0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0130\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0140\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0150\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0160\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0010\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:137:\\\"Модуль проактивной защиты не установлен либо в вашу редакцию он не входит.\\n\\\";}s:8:\\\"PERFOMER\\\";s:50:\\\"Не входит в редакцию \\\"Старт\\\"\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:129:\\\"Уровень безопасности административной группы не является повышенным\\n\\\";}s:8:\\\"PERFOMER\\\";s:96:\\\"Двухфакторная авторизация - на усмотрение заказчика\\\";}}s:8:\\\"QSEC0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0040\\\";a:2:{s:8:\\\"COMMENTS\\\";a:1:{s:8:\\\"PERFOMER\\\";s:44:\\\"Тестовые данные удалены\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:82:\\\"Недочетов не выявлено. Пароль к БД безопасен.\\\";}}}s:8:\\\"QSEC0060\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:0:{}}}s:8:\\\"QSEC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0080\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:97:\\\"Проверенно файлов: 79 Найдено потенциальных проблем: 0\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}}}s:6:\\\"QP0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:123:\\\"Конфигурация PHP <a href=\\\"/bitrix/admin/perfmon_php.php?lang=ru\\\" target=\\\"_blank\\\">неоптимальна</a>.\\n\\\";}}}s:6:\\\"QP0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:48:\\\"Автокеширование включено\\n\\\";}}}s:6:\\\"QP0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:231:\\\"Проверка не удалась. Проведите тестирование конфигурации в <a href=\\\"/bitrix/admin/perfmon_panel.php?lang=ru\\\" target=\\\"_blank\\\">панели производительности</a>.\\n\\\";}}}s:6:\\\"QP0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:119:\\\"Резервное копирование осуществляется. В папке /bitrix/backup 4 файл(a,ов)\\\";}}}s:6:\\\"QH0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0010\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:56:\\\"Лицензионный ключ активирован\\\";}}}s:6:\\\"QJ0020\\\";a:2:{s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:120:\\\"Проверено файлов: 8293\\nПроверено модулей: 12\\nМодифицировано файлов: 8\\\";s:6:\\\"DETAIL\\\";s:2111:\\\"<div class=\\\"checklist-dot-line\\\"></div>Модуль bitrixcloud не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль clouds не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль compression не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль fileman не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль highloadblock не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле iblock модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/.default/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/web20/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/official/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле main модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/breadcrumb/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/menu/templates/horizontal_multilevel/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/orange/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль perfmon не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль search не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль seo не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль socialservices не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль translate не модифицировался\\n\\\";}}s:6:\\\"STATUS\\\";s:1:\\\"F\\\";}s:6:\\\"QJ0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}}\', `REPORT` = \'N\' WHERE ID=1'),
(67, 11, NULL, 8, 0.000202894, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (0, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'Y\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'Y\'\n			'),
(68, 11, NULL, 9, 0.023741, 0, 'main', NULL, 'INSERT INTO b_cache_tag (SITE_ID, CACHE_SALT, RELATIVE_PATH, TAG) VALUES (\'*\', \'*\', \'/bitrix/managed_cache/MYSQL/user_option.~678665\', \'*\')'),
(69, 11, NULL, 10, 0.00029397, -1, 'main', NULL, 'SELECT A.ID, A.MODULE_ID, A.USER_ID, B.LOGIN, B.NAME as USER_NAME, B.LAST_NAME, A.SORT, A.NAME, A.ACTIVE, A.RUNNING, DATE_FORMAT(A.LAST_EXEC, \'%d.%m.%Y %H:%i:%s\') as LAST_EXEC, DATE_FORMAT(A.NEXT_EXEC, \'%d.%m.%Y %H:%i:%s\') as NEXT_EXEC, DATE_FORMAT(A.DATE_CHECK, \'%d.%m.%Y %H:%i:%s\') as DATE_CHECK, A.AGENT_INTERVAL, A.IS_PERIOD FROM b_agent A LEFT JOIN b_user B ON(A.USER_ID = B.ID) WHERE A.NAME LIKE \'\\\\\\\\Bitrix\\\\\\\\Main\\\\\\\\Data\\\\\\\\CacheEngineFiles::delayedDelete(%\' ORDER BY A.ID DESC'),
(70, 11, NULL, 11, 0.0116122, -1, 'main', NULL, '\n			SELECT ID\n			FROM b_agent\n			WHERE NAME = \'\\\\Bitrix\\\\Main\\\\Data\\\\CacheEngineFiles::delayedDelete();\'\n			AND USER_ID IS NULL'),
(71, 11, NULL, 12, 0.000105858, 0, 'main', NULL, 'INSERT INTO b_cache_tag (SITE_ID, CACHE_SALT, RELATIVE_PATH, TAG) VALUES (\'*\', \'*\', \'/bitrix/managed_cache/MYSQL/agents.~174938\', \'*\')'),
(72, 11, NULL, 13, 0.0000939369, -1, 'main', NULL, 'SELECT * FROM `b_agent` LIMIT 0'),
(73, 11, NULL, 14, 0.000174046, -1, 'main', NULL, 'INSERT INTO b_agent(`MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `NEXT_EXEC`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`) VALUES(\'main\', \'100\', \'\\\\Bitrix\\\\Main\\\\Data\\\\CacheEngineFiles::delayedDelete();\', \'Y\', CURRENT_DATE, \'1\', \'Y\',  NULL )'),
(74, 12, NULL, 1, 0.000443935, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'global\'\n						'),
(75, 12, NULL, 2, 0.000104904, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'checklist\'\n						'),
(76, 12, NULL, 3, 0.000298262, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(77, 12, NULL, 4, 0.0000870228, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(78, 12, NULL, 5, 0.000253916, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'N\'\n			'),
(79, 12, NULL, 6, 0.000424862, -1, 'main', NULL, 'SELECT ID FROM b_checklist WHERE REPORT <> \'Y\''),
(80, 12, NULL, 7, 0.00011301, -1, 'main', NULL, 'SELECT * FROM `b_checklist` LIMIT 0'),
(81, 12, NULL, 8, 0.00784302, -1, 'main', NULL, 'UPDATE b_checklist SET `STATE` = \'a:65:{s:6:\\\"QD0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:54:\\\"Проверено: 2 шаблон(a,ов) сайта.\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}s:8:\\\"PERFOMER\\\";s:31:\\\"Панель отключена\\\";}}s:6:\\\"QD0010\\\";a:2:{s:8:\\\"COMMENTS\\\";N;s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0090\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:96:\\\"У всех кастомизированных компонентов есть описания!\\\";}}}s:6:\\\"QC0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0090\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:36:\\\"Проверено файлов: 41\\n\\\";}}}s:6:\\\"QC0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0130\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0140\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0150\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0160\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0010\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:137:\\\"Модуль проактивной защиты не установлен либо в вашу редакцию он не входит.\\n\\\";}s:8:\\\"PERFOMER\\\";s:50:\\\"Не входит в редакцию \\\"Старт\\\"\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:129:\\\"Уровень безопасности административной группы не является повышенным\\n\\\";}s:8:\\\"PERFOMER\\\";s:96:\\\"Двухфакторная авторизация - на усмотрение заказчика\\\";}}s:8:\\\"QSEC0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0040\\\";a:2:{s:8:\\\"COMMENTS\\\";a:1:{s:8:\\\"PERFOMER\\\";s:44:\\\"Тестовые данные удалены\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:82:\\\"Недочетов не выявлено. Пароль к БД безопасен.\\\";}}}s:8:\\\"QSEC0060\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:0:{}}}s:8:\\\"QSEC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0080\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:97:\\\"Проверенно файлов: 79 Найдено потенциальных проблем: 0\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}}}s:6:\\\"QP0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:123:\\\"Конфигурация PHP <a href=\\\"/bitrix/admin/perfmon_php.php?lang=ru\\\" target=\\\"_blank\\\">неоптимальна</a>.\\n\\\";}}}s:6:\\\"QP0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:48:\\\"Автокеширование включено\\n\\\";}}}s:6:\\\"QP0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:231:\\\"Проверка не удалась. Проведите тестирование конфигурации в <a href=\\\"/bitrix/admin/perfmon_panel.php?lang=ru\\\" target=\\\"_blank\\\">панели производительности</a>.\\n\\\";}}}s:6:\\\"QP0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:119:\\\"Резервное копирование осуществляется. В папке /bitrix/backup 4 файл(a,ов)\\\";}}}s:6:\\\"QH0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0010\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:56:\\\"Лицензионный ключ активирован\\\";}}}s:6:\\\"QJ0020\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:120:\\\"Проверено файлов: 8293\\nПроверено модулей: 12\\nМодифицировано файлов: 8\\\";s:6:\\\"DETAIL\\\";s:2111:\\\"<div class=\\\"checklist-dot-line\\\"></div>Модуль bitrixcloud не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль clouds не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль compression не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль fileman не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль highloadblock не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле iblock модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/.default/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/web20/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/official/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле main модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/breadcrumb/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/menu/templates/horizontal_multilevel/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/orange/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль perfmon не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль search не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль seo не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль socialservices не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль translate не модифицировался\\n\\\";}s:8:\\\"PERFOMER\\\";s:173:\\\"Модифицированы только шаблоны компонентов, все модификации перенесены в текущий шаблон сайта\\\";}s:6:\\\"STATUS\\\";s:1:\\\"F\\\";}s:6:\\\"QJ0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}}\', `REPORT` = \'N\' WHERE ID=1'),
(82, 12, NULL, 9, 0.000203133, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (0, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'Y\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'Y\'\n			'),
(83, 13, NULL, 1, 0.000124931, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'global\'\n						'),
(84, 13, NULL, 2, 0.000112057, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'checklist\'\n						'),
(85, 13, NULL, 3, 0.00037694, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(86, 13, NULL, 4, 0.0000679493, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(87, 13, NULL, 5, 0.00742888, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'N\'\n			'),
(88, 13, NULL, 6, 0.000396013, -1, 'main', NULL, 'SELECT ID FROM b_checklist WHERE REPORT <> \'Y\''),
(89, 13, NULL, 7, 0.000128031, -1, 'main', NULL, 'SELECT * FROM `b_checklist` LIMIT 0');
INSERT INTO `b_perf_sql` (`ID`, `HIT_ID`, `COMPONENT_ID`, `NN`, `QUERY_TIME`, `NODE_ID`, `MODULE_NAME`, `COMPONENT_NAME`, `SQL_TEXT`) VALUES
(90, 13, NULL, 8, 0.00530386, -1, 'main', NULL, 'UPDATE b_checklist SET `STATE` = \'a:65:{s:6:\\\"QD0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:54:\\\"Проверено: 2 шаблон(a,ов) сайта.\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}s:8:\\\"PERFOMER\\\";s:31:\\\"Панель отключена\\\";}}s:6:\\\"QD0010\\\";a:2:{s:8:\\\"COMMENTS\\\";N;s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0090\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:96:\\\"У всех кастомизированных компонентов есть описания!\\\";}}}s:6:\\\"QC0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0090\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:36:\\\"Проверено файлов: 41\\n\\\";}}}s:6:\\\"QC0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0130\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0140\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0150\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0160\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0010\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:137:\\\"Модуль проактивной защиты не установлен либо в вашу редакцию он не входит.\\n\\\";}s:8:\\\"PERFOMER\\\";s:50:\\\"Не входит в редакцию \\\"Старт\\\"\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:129:\\\"Уровень безопасности административной группы не является повышенным\\n\\\";}s:8:\\\"PERFOMER\\\";s:96:\\\"Двухфакторная авторизация - на усмотрение заказчика\\\";}}s:8:\\\"QSEC0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0040\\\";a:2:{s:8:\\\"COMMENTS\\\";a:1:{s:8:\\\"PERFOMER\\\";s:44:\\\"Тестовые данные удалены\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:82:\\\"Недочетов не выявлено. Пароль к БД безопасен.\\\";}}}s:8:\\\"QSEC0060\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:0:{}}}s:8:\\\"QSEC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0080\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:97:\\\"Проверенно файлов: 79 Найдено потенциальных проблем: 0\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}}}s:6:\\\"QP0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:123:\\\"Конфигурация PHP <a href=\\\"/bitrix/admin/perfmon_php.php?lang=ru\\\" target=\\\"_blank\\\">неоптимальна</a>.\\n\\\";}}}s:6:\\\"QP0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:48:\\\"Автокеширование включено\\n\\\";}}}s:6:\\\"QP0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:231:\\\"Проверка не удалась. Проведите тестирование конфигурации в <a href=\\\"/bitrix/admin/perfmon_panel.php?lang=ru\\\" target=\\\"_blank\\\">панели производительности</a>.\\n\\\";}}}s:6:\\\"QP0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:119:\\\"Резервное копирование осуществляется. В папке /bitrix/backup 4 файл(a,ов)\\\";}}}s:6:\\\"QH0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0010\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:56:\\\"Лицензионный ключ активирован\\\";}}}s:6:\\\"QJ0020\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:120:\\\"Проверено файлов: 8293\\nПроверено модулей: 12\\nМодифицировано файлов: 8\\\";s:6:\\\"DETAIL\\\";s:2111:\\\"<div class=\\\"checklist-dot-line\\\"></div>Модуль bitrixcloud не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль clouds не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль compression не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль fileman не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль highloadblock не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле iblock модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/.default/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/web20/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/official/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле main модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/breadcrumb/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/menu/templates/horizontal_multilevel/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/orange/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль perfmon не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль search не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль seo не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль socialservices не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль translate не модифицировался\\n\\\";}s:8:\\\"PERFOMER\\\";s:173:\\\"Модифицированы только шаблоны компонентов, все модификации перенесены в текущий шаблон сайта\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:6:\\\"QJ0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}}\', `REPORT` = \'N\' WHERE ID=1'),
(91, 13, NULL, 9, 0.00730896, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (0, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'Y\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'Y\'\n			'),
(92, 14, NULL, 1, 0.000108004, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'global\'\n						'),
(93, 14, NULL, 2, 0.00043869, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(94, 15, NULL, 1, 0.000164986, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'checklist\'\n						'),
(95, 15, NULL, 2, 0.000110149, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(96, 15, NULL, 3, 0.0000751019, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc'),
(97, 15, NULL, 4, 0.005337, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (1, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'N\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'N\'\n			'),
(98, 15, NULL, 5, 0.000418902, -1, 'main', NULL, 'SELECT ID FROM b_checklist WHERE REPORT <> \'Y\''),
(99, 15, NULL, 6, 0.000127077, -1, 'main', NULL, 'SELECT * FROM `b_checklist` LIMIT 0'),
(100, 15, NULL, 7, 0.00707698, -1, 'main', NULL, 'UPDATE b_checklist SET `STATE` = \'a:65:{s:6:\\\"QD0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:54:\\\"Проверено: 2 шаблон(a,ов) сайта.\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}s:8:\\\"PERFOMER\\\";s:31:\\\"Панель отключена\\\";}}s:6:\\\"QD0010\\\";a:2:{s:8:\\\"COMMENTS\\\";N;s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0090\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QD0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QM0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QS0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:96:\\\"У всех кастомизированных компонентов есть описания!\\\";}}}s:6:\\\"QC0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0050\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0090\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:36:\\\"Проверено файлов: 41\\n\\\";}}}s:6:\\\"QC0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0110\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0120\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0130\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0140\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0150\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QC0160\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QE0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0010\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:137:\\\"Модуль проактивной защиты не установлен либо в вашу редакцию он не входит.\\n\\\";}s:8:\\\"PERFOMER\\\";s:50:\\\"Не входит в редакцию \\\"Старт\\\"\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0020\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:129:\\\"Уровень безопасности административной группы не является повышенным\\n\\\";}s:8:\\\"PERFOMER\\\";s:96:\\\"Двухфакторная авторизация - на усмотрение заказчика\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0040\\\";a:2:{s:8:\\\"COMMENTS\\\";a:1:{s:8:\\\"PERFOMER\\\";s:44:\\\"Тестовые данные удалены\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:8:\\\"QSEC0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:82:\\\"Недочетов не выявлено. Пароль к БД безопасен.\\\";}}}s:8:\\\"QSEC0060\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:0:{}}}s:8:\\\"QSEC0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:8:\\\"QSEC0080\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:97:\\\"Проверенно файлов: 79 Найдено потенциальных проблем: 0\\\";s:6:\\\"DETAIL\\\";s:0:\\\"\\\";}}}s:6:\\\"QP0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0020\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:123:\\\"Конфигурация PHP <a href=\\\"/bitrix/admin/perfmon_php.php?lang=ru\\\" target=\\\"_blank\\\">неоптимальна</a>.\\n\\\";}}}s:6:\\\"QP0030\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:48:\\\"Автокеширование включено\\n\\\";}}}s:6:\\\"QP0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"F\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:231:\\\"Проверка не удалась. Проведите тестирование конфигурации в <a href=\\\"/bitrix/admin/perfmon_panel.php?lang=ru\\\" target=\\\"_blank\\\">панели производительности</a>.\\n\\\";}}}s:6:\\\"QP0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0070\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0080\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QP0100\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0010\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0020\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QH0050\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:119:\\\"Резервное копирование осуществляется. В папке /bitrix/backup 4 файл(a,ов)\\\";}}}s:6:\\\"QH0060\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0010\\\";a:2:{s:6:\\\"STATUS\\\";s:1:\\\"A\\\";s:8:\\\"COMMENTS\\\";a:1:{s:6:\\\"SYSTEM\\\";a:1:{s:7:\\\"PREVIEW\\\";s:56:\\\"Лицензионный ключ активирован\\\";}}}s:6:\\\"QJ0020\\\";a:2:{s:8:\\\"COMMENTS\\\";a:2:{s:6:\\\"SYSTEM\\\";a:2:{s:7:\\\"PREVIEW\\\";s:120:\\\"Проверено файлов: 8293\\nПроверено модулей: 12\\nМодифицировано файлов: 8\\\";s:6:\\\"DETAIL\\\";s:2111:\\\"<div class=\\\"checklist-dot-line\\\"></div>Модуль bitrixcloud не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль clouds не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль compression не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль fileman не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль highloadblock не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле iblock модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/.default/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news/templates/web20/bitrix/news.list/list/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/news.list/templates/official/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>В модуле main модифицированы файлы:\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/breadcrumb/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/menu/templates/horizontal_multilevel/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/.default/template.php\\n/var/www/vh292800/data/www/pitstop-cafe.ru/bitrix/components/bitrix/system.pagenavigation/templates/orange/template.php\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль perfmon не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль search не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль seo не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль socialservices не модифицировался\\n<div class=\\\"checklist-dot-line\\\"></div>Модуль translate не модифицировался\\n\\\";}s:8:\\\"PERFOMER\\\";s:173:\\\"Модифицированы только шаблоны компонентов, все модификации перенесены в текущий шаблон сайта\\\";}s:6:\\\"STATUS\\\";s:1:\\\"A\\\";}s:6:\\\"QJ0030\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}s:6:\\\"QJ0040\\\";a:1:{s:6:\\\"STATUS\\\";s:1:\\\"W\\\";}}\', `REPORT` = \'N\' WHERE ID=1'),
(101, 15, NULL, 8, 0.000217915, -1, 'main', NULL, '\n				INSERT INTO `b_user_option` (`USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`)\n				VALUES (0, \'checklist\', \'autotest_start\', \'s:1:\\\"Y\\\";\', \'Y\')\n				ON DUPLICATE KEY UPDATE `VALUE` = \'s:1:\\\"Y\\\";\', `COMMON` = \'Y\'\n			'),
(102, 15, NULL, 9, 0.00369096, 0, 'main', NULL, 'INSERT INTO b_cache_tag (SITE_ID, CACHE_SALT, RELATIVE_PATH, TAG) VALUES (\'*\', \'*\', \'/bitrix/managed_cache/MYSQL/user_option.~692991\', \'*\')'),
(103, 15, NULL, 10, 0.000276089, -1, 'main', NULL, 'SELECT A.ID, A.MODULE_ID, A.USER_ID, B.LOGIN, B.NAME as USER_NAME, B.LAST_NAME, A.SORT, A.NAME, A.ACTIVE, A.RUNNING, DATE_FORMAT(A.LAST_EXEC, \'%d.%m.%Y %H:%i:%s\') as LAST_EXEC, DATE_FORMAT(A.NEXT_EXEC, \'%d.%m.%Y %H:%i:%s\') as NEXT_EXEC, DATE_FORMAT(A.DATE_CHECK, \'%d.%m.%Y %H:%i:%s\') as DATE_CHECK, A.AGENT_INTERVAL, A.IS_PERIOD FROM b_agent A LEFT JOIN b_user B ON(A.USER_ID = B.ID) WHERE A.NAME LIKE \'\\\\\\\\Bitrix\\\\\\\\Main\\\\\\\\Data\\\\\\\\CacheEngineFiles::delayedDelete(%\' ORDER BY A.ID DESC'),
(104, 15, NULL, 11, 0.000156879, -1, 'main', NULL, '\n			SELECT ID\n			FROM b_agent\n			WHERE NAME = \'\\\\Bitrix\\\\Main\\\\Data\\\\CacheEngineFiles::delayedDelete();\'\n			AND USER_ID IS NULL'),
(105, 15, NULL, 12, 0.0000989437, -1, 'main', NULL, 'SELECT * FROM `b_agent` LIMIT 0'),
(106, 15, NULL, 13, 0.000154972, -1, 'main', NULL, 'INSERT INTO b_agent(`MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `NEXT_EXEC`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`) VALUES(\'main\', \'100\', \'\\\\Bitrix\\\\Main\\\\Data\\\\CacheEngineFiles::delayedDelete();\', \'Y\', CURRENT_DATE, \'1\', \'Y\',  NULL )'),
(107, 16, NULL, 1, 0.000137091, -1, 'main', NULL, '\n							SELECT CATEGORY, NAME, VALUE, COMMON\n							FROM b_user_option\n							WHERE (USER_ID=1 OR USER_ID=0 AND COMMON=\'Y\')\n								AND CATEGORY=\'global\'\n						'),
(108, 16, NULL, 2, 0.0020268, -1, 'main', NULL, 'SELECT * FROM b_checklist WHERE (1=1\n					AND\n					(\n						REPORT=\'N\'\n					)\n					) ORDER BY ID desc');

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_sql_backtrace`
--

CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_column_stat`
--

CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_tab_stat`
--

CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_perf_test`
--

CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_perf_test`
--

INSERT INTO `b_perf_test` (`ID`, `REFERENCE_ID`, `NAME`) VALUES
(1, 2, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(2, 3, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(3, 4, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(4, 5, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(5, 6, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(6, 7, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(7, 8, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(8, 9, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(9, 10, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(10, 11, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(11, 12, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(12, 13, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(13, 14, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(14, 15, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(15, 16, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(16, 17, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(17, 18, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(18, 19, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(19, 20, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(20, 21, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(21, 22, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(22, 23, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(23, 24, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(24, 25, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(25, 26, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(26, 27, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(27, 28, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(28, 29, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(29, 30, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(30, 31, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(31, 32, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(32, 33, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(33, 34, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(34, 35, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(35, 36, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(36, 37, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(37, 38, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(38, 39, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(39, 40, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(40, 41, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(41, 42, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(42, 43, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(43, 44, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(44, 45, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(45, 46, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(46, 47, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(47, 48, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(48, 49, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(49, 50, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(50, 51, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(51, 52, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(52, 53, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(53, 54, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(54, 55, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(55, 56, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(56, 57, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(57, 58, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(58, 59, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(59, 60, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(60, 61, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(61, 62, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(62, 63, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(63, 64, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(64, 65, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(65, 66, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(66, 67, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(67, 68, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(68, 69, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(69, 70, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(70, 71, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(71, 72, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(72, 73, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(73, 74, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(74, 75, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(75, 76, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(76, 77, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(77, 78, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(78, 79, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(79, 80, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(80, 81, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(81, 82, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(82, 83, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(83, 84, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(84, 85, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(85, 86, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(86, 87, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(87, 88, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(88, 89, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(89, 90, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(90, 91, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(91, 92, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(92, 93, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(93, 94, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(94, 95, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(95, 96, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(96, 97, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(97, 98, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(98, 99, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(99, 100, 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(100, 98, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(101, -1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(102, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(103, 1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(104, 2, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(105, 3, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(106, 4, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(107, 5, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(108, 6, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(109, 7, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(110, 8, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(111, 9, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(112, 10, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(113, 11, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(114, 12, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(115, 13, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(116, 14, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(117, 15, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(118, 16, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(119, 17, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(120, 18, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(121, 19, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(122, 20, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(123, 21, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(124, 22, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(125, 23, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(126, 24, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(127, 25, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(128, 26, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(129, 27, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(130, 28, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(131, 29, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(132, 30, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(133, 31, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(134, 32, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(135, 33, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(136, 34, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(137, 35, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(138, 36, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(139, 37, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(140, 38, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(141, 39, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(142, 40, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(143, 41, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(144, 42, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(145, 43, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(146, 44, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(147, 45, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(148, 46, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(149, 47, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(150, 48, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(151, 49, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(152, 50, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(153, 51, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(154, 52, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(155, 53, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(156, 54, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(157, 55, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(158, 56, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(159, 57, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(160, 58, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(161, 59, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(162, 60, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(163, 61, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(164, 62, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(165, 63, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(166, 64, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(167, 65, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(168, 66, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(169, 67, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(170, 68, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(171, 69, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(172, 70, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(173, 71, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(174, 72, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(175, 73, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(176, 74, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(177, 75, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(178, 76, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(179, 77, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(180, 78, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(181, 79, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(182, 80, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(183, 81, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(184, 82, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(185, 83, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(186, 84, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(187, 85, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(188, 86, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(189, 87, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(190, 88, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(191, 89, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(192, 90, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(193, 91, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(194, 92, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(195, 93, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(196, 94, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(197, 95, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(198, 96, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(199, 97, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(200, 98, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(201, -1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(202, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(203, 1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(204, 2, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(205, 3, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(206, 4, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(207, 5, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(208, 6, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(209, 7, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(210, 8, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(211, 9, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(212, 10, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(213, 11, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(214, 12, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(215, 13, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(216, 14, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(217, 15, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(218, 16, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(219, 17, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(220, 18, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(221, 19, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(222, 20, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(223, 21, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(224, 22, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(225, 23, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(226, 24, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(227, 25, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(228, 26, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(229, 27, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(230, 28, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(231, 29, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(232, 30, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(233, 31, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(234, 32, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(235, 33, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
INSERT INTO `b_perf_test` (`ID`, `REFERENCE_ID`, `NAME`) VALUES
(236, 34, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(237, 35, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(238, 36, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(239, 37, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(240, 38, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(241, 39, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(242, 40, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(243, 41, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(244, 42, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(245, 43, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(246, 44, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(247, 45, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(248, 46, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(249, 47, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(250, 48, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(251, 49, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(252, 50, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(253, 51, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(254, 52, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(255, 53, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(256, 54, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(257, 55, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(258, 56, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(259, 57, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(260, 58, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(261, 59, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(262, 60, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(263, 61, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(264, 62, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(265, 63, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(266, 64, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(267, 65, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(268, 66, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(269, 67, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(270, 68, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(271, 69, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(272, 70, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(273, 71, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(274, 72, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(275, 73, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(276, 74, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(277, 75, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(278, 76, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(279, 77, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(280, 78, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(281, 79, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(282, 80, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(283, 81, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(284, 82, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(285, 83, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(286, 84, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(287, 85, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(288, 86, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(289, 87, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(290, 88, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(291, 89, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(292, 90, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(293, 91, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(294, 92, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(295, 93, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(296, 94, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(297, 95, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(298, 96, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(299, 97, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(300, 98, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(301, -1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(302, 0, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(303, 1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(304, 2, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(305, 3, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(306, 4, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(307, 5, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(308, 6, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(309, 7, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(310, 8, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(311, 9, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(312, 10, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(313, 11, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(314, 12, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(315, 13, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(316, 14, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(317, 15, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(318, 16, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(319, 17, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(320, 18, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(321, 19, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(322, 20, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(323, 21, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(324, 22, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(325, 23, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(326, 24, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(327, 25, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(328, 26, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(329, 27, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(330, 28, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(331, 29, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(332, 30, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(333, 31, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(334, 32, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(335, 33, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(336, 34, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(337, 35, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(338, 36, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(339, 37, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(340, 38, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(341, 39, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(342, 40, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(343, 41, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(344, 42, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(345, 43, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(346, 44, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(347, 45, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(348, 46, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(349, 47, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(350, 48, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(351, 49, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(352, 50, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(353, 51, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(354, 52, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(355, 53, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(356, 54, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(357, 55, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(358, 56, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(359, 57, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(360, 58, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(361, 59, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(362, 60, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(363, 61, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(364, 62, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(365, 63, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(366, 64, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(367, 65, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(368, 66, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(369, 67, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(370, 68, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(371, 69, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(372, 70, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(373, 71, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(374, 72, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(375, 73, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(376, 74, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(377, 75, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(378, 76, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(379, 77, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(380, 78, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(381, 79, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(382, 80, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(383, 81, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(384, 82, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(385, 83, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(386, 84, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(387, 85, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(388, 86, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(389, 87, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(390, 88, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(391, 89, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(392, 90, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(393, 91, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(394, 92, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(395, 93, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(396, 94, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(397, 95, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(398, 96, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(399, 97, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(400, 98, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating`
--

CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating`
--

INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2018-01-15 02:19:40', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2018-01-15 02:19:40', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component`
--

CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_component_results`
--

CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_prepare`
--

CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_results`
--

CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule`
--

CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_rule`
--

INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2018-01-15 02:19:40', '2018-01-15 02:19:40', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2018-01-15 02:19:40', '2018-01-15 02:19:40', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2018-01-15 02:19:40', '2018-01-15 02:19:40', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2018-01-15 02:19:40', '2018-01-15 02:19:40', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1000000000000000055511151231257827021181583404541015625;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1000000000000000055511151231257827021181583404541015625;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2018-01-15 02:19:40', '2018-01-15 02:19:40', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_rule_vetting`
--

CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_user`
--

CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_user`
--

INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
(1, 2, 1, '3.0000', '30.0000', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote`
--

CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_vote_group`
--

CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_vote_group`
--

INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
(5, 1, 'A'),
(1, 1, 'R'),
(3, 1, 'R'),
(2, 3, 'R'),
(4, 3, 'R'),
(6, 4, 'A');

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting`
--

CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_voting_prepare`
--

CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_rating_weight`
--

CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_rating_weight`
--

INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
(1, '-1000000.0000', '1000000.0000', '1.0000', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content`
--

CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content`
--

INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(1, '2018-01-15 02:22:10', 'main', 's1|/services/index.php', 0, NULL, NULL, NULL, '/services/index.php', 'Услуги', '', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(2, '2018-01-15 02:22:10', 'main', 's1|/search/index.php', 0, NULL, NULL, NULL, '/search/index.php', 'Поиск', '', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(3, '2018-01-15 02:22:10', 'main', 's1|/search/map.php', 0, NULL, NULL, NULL, '/search/map.php', 'Карта сайта', '', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(4, '2018-01-15 02:22:10', 'main', 's1|/company/index.php', 0, NULL, NULL, NULL, '/company/index.php', 'О компании', 'Наша компания существует на Российском рынке с 1992 года. За это время \r&laquo;Мебельная компания&raquo;\rпрошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России. 						 \rГлавное правило - индивидуальный подход к каждому клиенту\rНа сегодняшний день нами разработано более пятисот моделей для офиса и дома. Вместе с тем мы стремимся обеспечить неповторимость своей продукции. Мы изготовим мебель для кухни, детской, гостиной, спальной или ванной комнаты, мебель для офиса особого дизайна и нестандартного размера. \rНаши дизайнеры произведут замеры помещения и вместе с вами разработают дизайн-проект мебели для вашего интерьера, подобрав с высокой точностью размеры, модели, цвета, помогут оптимально расположить мебель. \rВаш проект будет создан с учетом всех нюансов и прорисовкой мельчайших деталей. Результаты совместного творчества вы сможете посмотреть в объемном представлении. Вам наглядно продемонстрируют, как будут выглядеть в жизни выбранные элементы интерьера при разном освещении, в конкретном помещении, сделанные из определенных материалов. В ваше распоряжение будет предоставлено много различных вариантов, из которых Вы сможете выбрать наиболее подходящий именно Вам. 						 					\rЗаказ будет выполнен и доставлен точно в срок. Все работы по сборке и установке мебели осуществляют сотрудники нашей компании. Строгий контроль качества осуществляется на всех этапах работ: от момента оформления заказа до момента приема выполненных работ. \rПередовые технологии и бесценный опыт\rИспользование передовых компьютерных технологий, многолетний опыт наших специалистов позволяют произвести грамотные расчеты и снизить расход материалов и себестоимость продукции, избежать ошибок при проектировании и оптимизировать дизайн комплексных интерьеров. Гарантия на нашу продукцию составляет 18 месяцев, а на отдельную продукцию 36 месяцев. \rМы гордимся нашими сотрудниками прошедшими профессиональное обучение в лучших учебных заведениях России и зарубежья. У нас трудятся высококлассные специалисты разных возрастов. Мы ценим энтузиазм молодежи и бесценный опыт старшего поколения. Все мы разные, но нас объединяет преданность своему делу и вера в идеи нашей компании. \rВысочайшие стандарты качества - залог нашего успеха\r&laquo;Мебельная компания&raquo;\rосуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход &ndash; с другой. \rЕжегодно наша продукция проходит сертификационные испытания в специализированных лабораториях России и имеет сертификаты соответствия продукции нормам безопасности и качества. Кроме того, \r&laquo;Мебельная компания&raquo;\rодной из первых среди мебельных производителей России в 2003 году прошла аудит на соответствие требованиям системы менеджмента качества &laquo;ИСО 9000&raquo; и получила сертификат соответствия системы качества на предприятии нормам международного стандарта.', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(5, '2018-01-15 02:22:10', 'main', 's1|/company/history.php', 0, NULL, NULL, NULL, '/company/history.php', 'История', '1992г. 								\r&laquo;Мебельная компания&raquo;\rначиналась с изготовления мебели для школ и офисов. Первое 									производство мебели располагалось в арендуемой мастерской, площадью 400 м2 с одним 									деревообрабатывающим станком. В компании работало двадцать человек. Все заработанные 									средства вкладывались в развитие, что позволило молодой Компании расти быстрыми 									темпами. 								\r1993г. 								\rВведен в эксплуатацию новый цех площадью 700 м2, ставший первой собственностью 									\r&laquo;Мебельной компании&raquo;\r. Модернизация производственной базы предприятия стала хорошей 									традицией. Компания постепенно перешла к более совершенному оборудованию, что позволило 									повысить уровень качества выпускаемой продукции и значительно увеличить объемы производства. 								\r1998г. 								\rВ Воронеже открыт первый фирменный магазин-салон \r&laquo;Мебельная компания&raquo;\r. Шаг за шагом 									продукция предприятия завоевывала регионы Сибири и Урала, Москвы и Подмосковья, 									Юга и Северо-Запада России. Производственные площади компании увеличены до 5000 									м2. 								\r1999г. 								\r&laquo;Мебельная компания&raquo;\rстала дипломантом одной из самых престижных международных 									выставок \r&laquo;ЕвроЭкспоМебель-99&raquo;\r- первое официальное признание мебельной продукции 									&laquo;Мебельной компании&raquo;. В этом же году компания выходит на мировой рынок. Был заключен 									ряд контрактов на поставку мебели в страны СНГ и Ближнего Зарубежья. 								\r2000г. 								\rКоллектив компании насчитывает более 500 сотрудников. Заключаются новые контракт 									на поставку мебели в европейские страны. 								\r2002г. 								\r&laquo;Мебельная компания&raquo;\rвошла в десятку лучших производителей мебели по данным ведущих 									мебельных салонов России, а также в число лидеров организационного развития. 								\r2003г. 								\rПриступили к строительству склада материалов. В Москве открыт филиал компании. \nПроведена первая конференция партнеров, результатом которой стало укрепление взаимовыгодных 									отношений и заключение дилерских договоров. 								\r2004г. 								\rЗавершено строительство и оснащение нового производственного корпуса и склада материалов. \nРасширено представительство компании на российском рынке и за рубежом. \nОткрыто 									региональное представительство \r&laquo;Мебельной компании&raquo;\rв Екатеринбурге. 								\r2005г. 								\rКомпания приобретает новое производственное оборудование концерна - угловую линию 									раскроя материалов и линию загрузки выгрузки. \nНачинается выпуск продукции в 									натуральном шпоне. Формируется отдельный склад материалов и комплектующих. \nВ этом же году открывается Фабрика мягкой мебели \r&laquo;МебельПлюс&raquo;\r2006г. 								\rОткрыты региональные представительства \r&laquo;Мебельной компании&raquo;\rв Санкт-Петербурге 									и Нижнем Новгороде. \nРазвивается собственная розничная сеть фирменных магазинов-салонов 									на территории России. 								\r2007г. 								\rЗавершено строительство второй фабрики. Общая площадь производсвенно-складских корпусов 									Компании составляет уже более 30000 м2. \nПроведена вторая конференция партнеров 									компании \r\"Технология успешного бизнеса\"\r. 								\r2008г. 								\rОткрыто новое предприятие для производства мебели по индивидуальным проектам \r&laquo;Комфорт&raquo;\r. \n&laquo;Мебельная компания&raquo;\rпродолжает обновление оборудования. 								\r2008г. 								\rНовейшим оборудованием укомплектована вторая фабрика. Запущена вторая производственная 									линия. \nПроведена третья конференция \r&laquo;Партнерство - бизнес сегодня&raquo;\rПринято решение о строительстве третьей фабрики. Площадь производственно &mdash; складских 									корпусов составит более 70000м2. \nПо всей стране и зарубежом открыто 37 мебельных 									салонов. \nВ Компании работает более полутора тысяч сотрудников.', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(6, '2018-01-15 02:22:10', 'main', 's1|/company/management.php', 0, NULL, NULL, NULL, '/company/management.php', 'Руководство', 'Успешное развитие бизнеса &ndash; во многом результат квалифицированной работы руководства. 							\r&laquo;Мебельная компания&raquo;\rна мебельном рынке уже 18 лет. За это время Компания 							не только сохранила, но и упрочила лидирующие позиции среди ведущих игроков мебельного 							рынка. 						\r&laquo;Мебельная компания&raquo;\rиз года в год расширяет ассортимент выпускаемой продукции, 							наращивает темпы и объемы производства, увеличивает производственные и складские 							площади, развивает отношения с партнерами со всех регионов страны и налаживает связи 							с зарубежными партнерами. В большой степени это заслуга хорошо подготовленного руководящего 							состава и его грамотной политики. 						\rСобственник Компании &laquo;Мебельная компания&raquo;\rКолесников Виктор Федорович 								\rРодился 3 сентября 1964 года.\nОбразование: закончил авиационный факультет Воронежского 									государственного политехнического института. В 1994 году прошел обучение по программе 									&laquo;Подготовка малого и среднего бизнеса&raquo; в США.\nВ настоящее время Виктор Федорович 									возглавляет Управляющую компанию, которая координирует деятельность предприятий, 									входящих в Группу Компаний \r&laquo;Мебельная компания&raquo;\r. 								\rГенеральный директор &laquo;Мебельной компании&raquo;\rРатченко Александр Петрович 								\rРодился 5 июня 1962 года.\nОбразование: Воронежский политехнический институт 									по специальности инженер-технолог; программа &laquo;Эффективное развитие производства&raquo; 									(США).\nВ \r&laquo;Мебельной компании&raquo;\rСергей Фомич с 1994 года. За это время прошел 									путь от начальника цеха до генерального директора предприятия. 								\rЗаместитель генерального директора Управляющей компании\rРоговой Андрей Владимирович 								\rОбразование: факультет радиотехники Воронежского государственного технического университета.\nВ Компании с 1 июня 2000 года.', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(7, '2018-01-15 02:22:10', 'main', 's1|/company/vacancies.php', 0, NULL, NULL, NULL, '/company/vacancies.php', 'Вакансии', '', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(8, '2018-01-15 02:22:10', 'main', 's1|/company/mission.php', 0, NULL, NULL, NULL, '/company/mission.php', 'Миссия и стратегия', '&laquo;Мебельная компания&raquo;\r- динамично развивающееся производственное 							предприятие, которое имеет перед собой \nясно выраженные цели и инструменты для 							их достижени.Мы предоставляем каждому лучшую возможность обустроить свое жизненное \nи рабочее пространство.Мы работаем на долгосрочную перспективу и предлагаем оптимальные 							решения. Компания \r&laquo;Мебельная компания&raquo;\r- \nнадежный, технологичный, гибкий поставщик 							с большими мощностями. 						\rЦели и задачи\rОправдывать ожидания заказчика: &ldquo;Клиент всегда прав&rdquo;. Только Потребитель формирует 									единую систему взглядов на качество \nвыпускаемой продукции и работ.\rДобиться от работников компании понимания их личной ответственности за качество 									работ.\rПутем повышения качества продукции и работ постоянно увеличивать объемы производства 									с целью последующего реинвестирования \nприбыли в развитие компании.\rОбеспечивать строгое соответствие производимой продукции требованиям потребителей, 									нормам и правилам \nбезопасности, требованиям защиты окружающей среды.\rПолитика компании\rПостоянное совершенствование системы качества. Своевременное и эффективное принятие 									корректирующих мер .\rЗабота о работниках компании. Создание условий труда и оснащение рабочих мест, соответствующих 									всем санитарным \nи гигиеническим нормам.\rПовышение благосостояния сотрудников. Обеспечение морального и материального удовлетворения 									работников компании.\rСистематическое обучение работников всех уровней с целью постоянного повышения их 									профессионального мастерства.\rВнедрение высокопроизводительного оборудования и новейших технологий для повышения 									производительности труда, \nоптимизации затрат и, как результат, снижения цен 									на выпускаемую продукцию.\rСоздание новых рабочих мест. Привлечение на работу специалистов высокой квалификации.\rВыход на международный рынок.\rМы развиваем доверительные взаимовыгодные отношения со своими партнерами в долгосрочных 							интересах нашего бизнеса. \n&laquo;Мебельная компания&raquo;\rответственно относится 							к выполнению взятых на себя обязательств и ждет такого же \nподхода к делу от 							своих партнеров по бизнесу. Эта требовательность &ndash; залог нашей долгосрочной прибыльности. 						\rСо дня своего основания \r&laquo;Мебельная компания&raquo;\rсодействует росту благосостояния 							регионов России. Мы понимаем важность \nсоциальной ответственности нашей Компании 							и останемся примером в вопросах социальной защищенности наших сотрудников.', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(9, '2018-01-15 02:22:10', 'main', 's1|/products/index.php', 0, NULL, NULL, NULL, '/products/index.php', 'Продукция', '', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(10, '2018-05-18 13:06:47', 'main', 's1|/contacts/index.php', 0, NULL, NULL, NULL, '/contacts/index.php', 'Title', 'Контакты\nОтзывы гостей\rАрендодателям\rПоставщикам\rPit Stop Кафе\rКонтакты: \rАдрес: ООО «ПИТСТОП КАФЕ» \r117405,г. Москва, Варшавское шоссе, д. 145, к.8, каб.I-1-18\rТел: +7(495) 181-6159\re-mail: \rinfo@pitstop-cafe.ru\rСвязаться с нами\nСогласен на обработку персональных данных\rОтправить отзыв', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(11, '2018-01-15 02:22:10', 'main', 's1|/login/index.php', 0, NULL, NULL, NULL, '/login/index.php', 'Вход на сайт', 'Вы зарегистрированы и успешно авторизовались.\rВернуться на главную страницу', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(12, '2018-01-15 04:10:11', 'main', 's1|/news/index.php', 0, NULL, NULL, NULL, '/news/index.php', 'Title', 'Text here....', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(13, '2018-01-15 02:22:10', 'main', 's1|/_index.php', 0, NULL, NULL, NULL, '/_index.php', 'Мебельная компания', 'Наша компания существует на Российском рынке с 1992 года. За это время «Мебельная компания» прошла большой путь от маленькой торговой фирмы до одного из крупнейших производителей корпусной мебели в России.\n«Мебельная компания» осуществляет производство мебели на высококлассном оборудовании с применением минимальной доли ручного труда, что позволяет обеспечить высокое качество нашей продукции. Налажен производственный процесс как массового и индивидуального характера, что с одной стороны позволяет обеспечить постоянную номенклатуру изделий и индивидуальный подход – с другой.\nНаша продукция\rНаши услуги', '', '', '', '9119e71a24bf05ffa68d851941fc946e', NULL, NULL),
(50, '2018-06-28 17:05:17', 'main', 's1|/index.php', 0, NULL, NULL, NULL, '/index.php', 'Сеть кофеен PitStop', 'ВСЕ ПО \r77\rИ\rКофе\nКулинария\nВСЁ по 77 Р\nВыпечка\nДесерты\nБольшие порции\rеды и напитков\nВсегда \rсвежая выпечка\nУникальная\rрецептура\nПостоянно \rвводятся новинки\nPitStopКафе Франчайзинг\nОставить заявку\rВкусов много не бывает. Полноценные порции за 77 рублей!Не думай о цене, выбирай по вкусу!\nБыстрый сервис\r(время подачи еды - 3 минуты)\nКачественное\rобслуживание\nВкусная, свежая еда\nСледите за нашими новостями\nPitStopКафе', '', '', '', NULL, NULL, NULL),
(52, '2018-06-08 20:45:02', 'main', 's1|/cafe/index.php', 0, NULL, NULL, NULL, '/cafe/index.php', 'Кофейни', 'Адреса кафе\rБЦ «ОМЕГА ПЛАЗА»\rМосква, ул. Ленинская Слобода, 19', '', '', '', NULL, NULL, NULL),
(53, '2018-06-08 21:08:28', 'main', 's1|/menu/index.php', 0, NULL, NULL, NULL, '/menu/index.php', 'Title', '', '', '', '', NULL, NULL, NULL),
(54, '2018-06-08 21:09:34', 'main', 's1|/franchising/index.php', 0, NULL, NULL, NULL, '/franchising/index.php', 'Франчайзинг', 'Франчайзинг\rОставить заявку', '', '', '', NULL, NULL, NULL),
(55, '2016-06-15 00:00:00', 'iblock', '33', 0, NULL, NULL, NULL, '=ID=33&EXTERNAL_ID=33&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Открытие новой точки Авиамоторная', 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', '', 'news', '1', NULL, '2016-06-15 00:00:00', NULL),
(56, '2016-01-05 00:00:00', 'iblock', '34', 0, NULL, NULL, NULL, '=ID=34&EXTERNAL_ID=34&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Открытие новой точки в БЦ Город Столиц', 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!', '', 'news', '1', NULL, '2016-01-05 00:00:00', NULL),
(57, '2017-02-20 00:00:00', 'iblock', '35', 0, NULL, NULL, NULL, '=ID=35&EXTERNAL_ID=35&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Открытие новой точки в БЦ Савеловский Сити', 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!', '', 'news', '1', NULL, '2017-02-20 00:00:00', NULL),
(58, '2017-07-01 00:00:00', 'iblock', '36', 0, NULL, NULL, NULL, '=ID=36&EXTERNAL_ID=36&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Открытие новой точки в БЦ Омега Плаза', 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!', '', 'news', '1', NULL, '2017-07-01 00:00:00', NULL),
(59, '2018-01-16 00:00:00', 'iblock', '37', 0, NULL, NULL, NULL, '=ID=37&EXTERNAL_ID=37&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Запуск продажи франшиз', 'Дорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PitStop начав свое дело. Подробности в разделе \rФраншиза\r.\r\nДорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PitStop начав свое дело. Подробности в разделе Франшиза.', '', 'news', '1', NULL, '2018-01-16 00:00:00', NULL),
(60, '2017-08-14 00:00:00', 'iblock', '38', 0, NULL, NULL, NULL, '=ID=38&EXTERNAL_ID=38&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Японские блюда в меню', 'Дорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и Wok\r\nДорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и Wok', '', 'news', '1', NULL, '2017-08-14 00:00:00', NULL),
(61, '2017-09-25 00:00:00', 'iblock', '39', 0, NULL, NULL, NULL, '=ID=39&EXTERNAL_ID=39&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'BUYBRAND EXPO 2017', 'Дорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PitStop на 15-ой международной выставке франшиз BUYBRAND Expo. Приглашаем вас посетить наш стенд.\r\nДорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PitStop на 15-ой международной выставке франшиз BUYBRAND Expo. Приглашаем вас посетить наш стенд.', '', 'news', '1', NULL, '2017-09-25 00:00:00', NULL),
(62, '2018-01-15 00:00:00', 'iblock', '40', 0, NULL, NULL, NULL, '=ID=40&EXTERNAL_ID=40&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Кофе в цифрах', 'Дорогие гости, сегодня мы посчитали сколько же кофе мы приготовили и сколько гостей пришло к нам в прошлом году и сразу решили поделиться. За прошлый 2017год, нашими клиентами стали около 300.000 гостей. И специально для них мы сварили 250.000 чашек ароматного кофе.\r\nДорогие гости, сегодня мы посчитали сколько же кофе мы приготовили и сколько гостей пришло к нам в прошлом году и сразу решили поделиться. За прошлый 2017год, нашими клиентами стали около 300.000 гостей. И специально для них мы сварили 250.000 чашек ароматного кофе.', '', 'news', '1', NULL, '2018-01-15 00:00:00', NULL),
(63, '2018-01-31 00:00:00', 'iblock', '41', 0, NULL, NULL, NULL, '=ID=41&EXTERNAL_ID=41&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=1&IBLOCK_CODE=furniture_news_s1&IBLOCK_EXTERNAL_ID=furniture_news_s1&CODE=', 'Открытие новой точки на Павелецкой', 'Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!', '', 'news', '1', NULL, '2018-01-31 00:00:00', NULL),
(66, '2018-06-06 16:31:44', 'iblock', '44', 0, NULL, NULL, NULL, '=ID=44&EXTERNAL_ID=44&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=franchise&IBLOCK_ID=7&IBLOCK_CODE=pitstop_franchise_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'ВАРИАНТЫ РАБОТЫ', 'Мы предлагаем\rсвоим франчайзи \rготовую бизнес-модель\r, доказавшую свою эффективность. На выбор предлагается несколько\rформатов кафе:\rКофе поинт\rСтоимость до 800.000р включая\rпаушальный взнос\rЭкспресс кафе\rСтоимость от 800.000р включая\rпаушальный взнос\rИндивидуальный формат\rСтоимость обсуждается индивидуально\rс\rкаждым партнером', '', 'franchise', '7', NULL, NULL, NULL),
(67, '2018-06-06 15:48:09', 'iblock', '45', 0, NULL, NULL, NULL, '=ID=45&EXTERNAL_ID=45&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=franchise&IBLOCK_ID=7&IBLOCK_CODE=pitstop_franchise_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'ФРАНШИЗА PitstopКафе', 'Консультации и помощь\rКонсультации по вопросам выбора помещения/места под кафе и помощь в разработке всех разрешительных и проектных документов\rДизайн и обучение \rИндивидуальный дизайн кафе и обучение персонала.\rСистему управления и IT- инструменты \rЦентрализованную систему управления заказами и контроля поставками продукции и IT- инструменты для анализа работы кафе\rКоманду и поддержку\rСтарт-ап команду на открытие кофейни и поддержку по управлению и продвижению кафе.', '', 'franchise', '7', NULL, NULL, NULL),
(68, '2018-06-06 14:40:56', 'iblock', '46', 0, NULL, NULL, NULL, '=ID=46&EXTERNAL_ID=46&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=franchise&IBLOCK_ID=7&IBLOCK_CODE=pitstop_franchise_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'ЦИФРЫ', 'Концепция рассчитана до мелочей \rна площади до 50 кв. м\rОткрытие кофейни \rот 2 недель\rСрок окупаемости бизнеса \rот 12 месяцев\rСреднемесячный доход одной кофейни \rот 100 тыс. рублей', '', 'franchise', '7', NULL, NULL, NULL),
(69, '2018-01-25 15:52:33', 'iblock', '47', 0, NULL, NULL, NULL, '=ID=47&EXTERNAL_ID=47&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=cafe&IBLOCK_ID=8&IBLOCK_CODE=pitstop_cafe_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'БЦ «ОМЕГА ПЛАЗА»', '', '', 'cafe', '8', NULL, NULL, NULL),
(70, '2018-01-25 15:52:14', 'iblock', '48', 0, NULL, NULL, NULL, '=ID=48&EXTERNAL_ID=48&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=cafe&IBLOCK_ID=8&IBLOCK_CODE=pitstop_cafe_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'БЦ САВЁЛОВСКИЙ СИТИ', '', '', 'cafe', '8', NULL, NULL, NULL),
(71, '2018-01-25 15:51:49', 'iblock', '49', 0, NULL, NULL, NULL, '=ID=49&EXTERNAL_ID=49&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=cafe&IBLOCK_ID=8&IBLOCK_CODE=pitstop_cafe_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'МОСКВА СИТИ, БАШНИ ГОРОД СТОЛИЦ', '', '', 'cafe', '8', NULL, NULL, NULL),
(72, '2018-01-25 15:51:23', 'iblock', '50', 0, NULL, NULL, NULL, '=ID=50&EXTERNAL_ID=50&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=cafe&IBLOCK_ID=8&IBLOCK_CODE=pitstop_cafe_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'М. АВИАМОТОРНАЯ', '', '', 'cafe', '8', NULL, NULL, NULL),
(74, '2018-06-27 16:55:10', 'iblock', '52', 0, NULL, NULL, NULL, '=ID=52&EXTERNAL_ID=52&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=sendvichi-i-rolly', 'СЭНДВИЧИ И РОЛЛЫ', 'Специально для тех, кто живет в ритме мегаполиса, мы предлагаем вкусные сэндвичи и роллы, купить которые Вы можете в любой из сети наших кофеен «ПитСтоп». \rВкусные сэндвичи и роллы с собой\rКажется, что готовить цезарь-роллы сложно. Но всегда есть решение - возьмите с собой любые сэнвичи, сделав заказ у нас. Если вы запланировали поездку или решили быстро перекусить в дороге, по пути на работу, то еда должна быть такой, чтобы ее хранение можно было осуществить вне холодильника. \rПреимущества заказа сэндвичей в наших кофейнях: \rбыстрое приготовление ролла или сэндвича и подача заказа; \rтолько свежие продукты, используемые в составе блюд; \rнизкие цены на весь ассортимент меню. \rСэндвичи – это самая распространенная еда в поездках, которую берут в кафе «PitStopКафе». В наших кофейнях это блюдо является дополнением к кофе, можете купить ролл или сэндвич как с овощами, так с мясом и сырами. К тому же, если Вы следите за фигурой, то можете не бояться покупать роллы, т.к. лепешки, в которые заворачивается начинка, делаются из высоких сортов муки. \rТакже к кофе Вы всегда можете взять вкусный \rмаффин с шоколадом\r.', '', 'menu', '5', NULL, NULL, NULL),
(75, '2018-06-26 11:20:57', 'iblock', '53', 0, NULL, NULL, NULL, '=ID=53&EXTERNAL_ID=53&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=sloyka-s-povidlom', 'СЛОЙКА С ПОВИДЛОМ', 'Мы знаем, что нужно нашим гостям в течение дня. Поэтому предлагаем только ароматную и свежую выпечку, чтобы Вы могли насладиться перекусом или просто минутами отдыха в наших кофейнях. \rСлойки с повидлом в кафе\rМы убеждены в том, что качество еды всегда имеет влияние на настроение посетителя. В наших кофейнях готовится только здоровая еда, свежие продукты — все, чтобы ваше самочувствие было на высшем уровне. Также в «ПитСтоп» можно заказать закуски, которые мы упакуем в удобные, одноразовые контейнеры. Чтобы не переживать о том, из каких ингредиентов сделано ваше блюдо, мы можем Вам рассказать о составе стандартных слоек из теста с повидлом: \rмука пшеничная, масло сливочное; \rсахар, повидло, яйца; \rмолоко, дрожжи, соль; \rванилин, вода питьевая. \rПри приготовлении каких-либо блюд в сети наших кофеен не используются химикаты, искусственные добавки, ароматизаторы и красители. Мы заботимся своих гостях и предоставляем только вкусную и полезную выпечку. \rНаши закуски всегда выполнены из ингредиентов высокого качества. Сладкая и вкусная слойка - идеальное дополнение к горячему кофе. \rТакже предлагаем Вам попробовать вкусные \rтворожные сырники\rв наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(76, '2018-06-26 11:21:42', 'iblock', '54', 0, NULL, NULL, NULL, '=ID=54&EXTERNAL_ID=54&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=maffin-s-shokoladom', 'МАФФИН С ШОКОЛАДОМ', 'Маффины - это разновидность кексов, приготовленных в форме корзинки. В России эти кондитерские изделия особенно популярны, в основном, из-за пышности, воздушности и того, как они тают во рту. \rШоколадные бисквитные лакомства, которые Вы можете купить в нашей кофейне, используют в своем составе натуральные ингредиенты высокого качества. \rШоколадные маффины в кафе\rМаффины отличаются следующими вкусовыми особенностями: \rОни представляют собой сытную выпечку, с красивым внешним видом. Шоколадные изделия особенно популярны под кофе. \rИх можно взять и съесть в поездке. Также их подают в виде закуски и заказывают на любые праздники и часто на корпоративы. \rMuffin, который представляет собой воздушный мякиш, имеет отменный шоколадный вкус. В основном, они хранятся не больше дня, поэтому есть их нужно сразу. Это очень вкусно! \rВы можете заказать маффины в Москве в нашей сети кофеен pitstop-cafe.ru. Эта аппетитная выпечка берет свое начало из Англии, по сути это - бисквитные кексы. В нашей сети кофеен Вы можете купить шоколадные маффины, а также любые другие кондитерские изделия. \rЕсли Вам нравятся легкие, фруктовые десерты, Вы можете взять \rжеле\rв наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(77, '2018-06-27 17:06:15', 'iblock', '55', 0, NULL, NULL, NULL, '=ID=55&EXTERNAL_ID=55&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=zhele', 'ЖЕЛЕ', 'Такой десерт, как желе из сока и желатина, очень полезен. Кроме этого, неотъемлемой составляющей продукта является глицин, имеющий следующие преимущества: \rпомогает в случае повреждения костной ткани; \rявляется средством профилактики против артрита; \rспособствует быстрому восстановлению после травм. \rВ сети наших кофеен в Москве можно увидеть немало изысканных десертов, которые можно попробовать, а кроме того, существуют такие разновидности желе, как: \rпанна-котта; \rбланманже - французский десерт из миндального молока; \rвагаси - японское желе с живыми цветами. \rКупить вкусное желе из фруктов в дополнение к какому-либо из кофейных напитков Вы можете в любой точке наших кофеен. \rПредлагаем Вам купить вкусные \rпирожные в ассортименте\rв наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(78, '2018-06-27 17:04:13', 'iblock', '56', 0, NULL, NULL, NULL, '=ID=56&EXTERNAL_ID=56&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=fruktovaya-narezka', 'ФРУКТОВАЯ НАРЕЗКА', 'Фруктовая нарезка— это красиво, привлекательно, и вкусно. Такое блюдо в наших кофейнях подают к кофе с фруктами. Красивая нарезка выполнена с самым важным условием условие – все плоды свежие и спелые. \rНарезка из фруктов в кафе\rВсе нарезки оригинально оформлены, подаются, как отдельное блюдо или как десерт к напитку. Самые популярные варианты нарезки фруктов: \rВ полоску. \rКартина из фруктов. \rЦветы из фруктов. \rНарезка по цветовой палитре. \rВ наших кофейнях всегда строго следят за тем, чтобы ингредиенты были свежими, нарезка из фруктов была красиво подана и гости остались довольны. Такие нарезки подаются, как отдельное блюдо или как закуска к кофе. Их более часто заказывают летом, т.к. фрукты и ягоды подаются охлажденными. Также нарезку можно взять с собой. Или просто заказать любой кофейный напиток вместе с фруктовым десертом. \rВ сети кофеен «ПитСтоп» Вы можете приятно провести время с друзьями или поcле работы, а также просто прийти в любую из наших точек и сделать заказ любого, понравившегося Вам, блюда. \rТакже предлагаем Вам попробовать свежие, вкусные \rслойки с повидлом\rв наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(79, '2018-01-25 16:07:41', 'iblock', '57', 0, NULL, NULL, NULL, '=ID=57&EXTERNAL_ID=57&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=main_slider_s1&IBLOCK_ID=9&IBLOCK_CODE=main_slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Не думай о цене - выбирай по вкусу', '', '', 'main_slider_s1', '9', NULL, NULL, NULL),
(80, '2018-01-25 16:06:45', 'iblock', '58', 0, NULL, NULL, NULL, '=ID=58&EXTERNAL_ID=58&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=main_slider_s1&IBLOCK_ID=9&IBLOCK_CODE=main_slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Не думай о цене - выбирай по вкусу', '', '', 'main_slider_s1', '9', NULL, NULL, NULL),
(81, '2018-01-25 16:07:11', 'iblock', '59', 0, NULL, NULL, NULL, '=ID=59&EXTERNAL_ID=59&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=main_slider_s1&IBLOCK_ID=9&IBLOCK_CODE=main_slider&IBLOCK_EXTERNAL_ID=&CODE=', 'Не думай о цене - выбирай по вкусу', '', '', 'main_slider_s1', '9', NULL, NULL, NULL),
(82, '2018-01-18 16:12:55', 'main', 's1|/include/contacts.php', 0, NULL, NULL, NULL, '/include/contacts.php', 'Телефон компании', '+7 (495) 181 61 59', '', '', '', NULL, NULL, NULL),
(83, '2018-06-29 15:58:49', 'main', 's1|/include/social.php', 0, NULL, NULL, NULL, '/include/social.php', 'Соцсети компании', '', '', '', '', NULL, NULL, NULL),
(84, '2018-01-19 08:42:27', 'main', 's1|/include/gallery.php', 0, NULL, NULL, NULL, '/include/gallery.php', 'Текст в галерее', 'Мы ориентированы на людей, которые ценят свое время и живут в ритме большого города.\nГостям предлагается широкий выбор ароматных кофейных напитков, свежая выпечка, сэндвичи собственной рецептуры, салаты, десерты и свежевыжатые соки и фруктовая нарезка. \nВсе это сопровождается приятной музыкой, легким освещением и уютной атмосферой.', '', '', '', NULL, NULL, NULL),
(85, '2018-06-26 11:21:31', 'iblock', '60', 0, NULL, NULL, NULL, '=ID=60&EXTERNAL_ID=60&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=pirozhnye-v-assortimente', 'ПИРОЖНЫЕ В АССОРТИМЕНТЕ', 'Пирожные, насыщенные кремовые и воздушные— это маленький, вкусный праздник в миниатюре. В сети кофеен «ПитСтоп» для Вас ежедневно представлены самые аппетитные пирожные. \rВкусные десерты пирожные в Москве\rМы предлагаем Вашему вниманию самый широкий ассортимент десертов и пирожных, которые вы можете купить в виде десерта к кофе: \rПесочные – по стандарту изготовляют из теста, в которое входят яйца, сахар и разрыхлители. \rБисквитные – такие пирожные делают из муки с использованием яично-сахарной смеси. \rЗаварные – изготавливают из заваренной муки, в которую добавляют масло, соль и яйца. \rКак видите, ингредиенты для продукции, которая есть в наших кофейнях, только натуральные, а последующие изделия самые вкусные и всегда свежие. \rДля украшения таких кондитерских изделий используются ягоды, фрукты, различные крема, шоколад, специи (ваниль, корица и т.д.). \rПредлагаем Вам посетить любую из наших кофеен и насладиться свежей выпечкой. \rТакже Вы можете попробовать вкусную, легкую \rфруктовую нарезку\rв наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(88, '2018-01-24 17:50:21', 'iblock', '63', 0, NULL, NULL, NULL, '=ID=63&EXTERNAL_ID=63&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #2', '', '', 'gallery', '6', NULL, NULL, NULL),
(89, '2018-01-24 17:50:33', 'iblock', '64', 0, NULL, NULL, NULL, '=ID=64&EXTERNAL_ID=64&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #3', '', '', 'gallery', '6', NULL, NULL, NULL),
(90, '2018-01-24 17:51:05', 'iblock', '65', 0, NULL, NULL, NULL, '=ID=65&EXTERNAL_ID=65&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #4', '', '', 'gallery', '6', NULL, NULL, NULL),
(91, '2018-01-24 17:51:23', 'iblock', '66', 0, NULL, NULL, NULL, '=ID=66&EXTERNAL_ID=66&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #5', '', '', 'gallery', '6', NULL, NULL, NULL),
(92, '2018-01-24 17:51:42', 'iblock', '67', 0, NULL, NULL, NULL, '=ID=67&EXTERNAL_ID=67&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #6', '', '', 'gallery', '6', NULL, NULL, NULL),
(93, '2018-01-24 17:52:15', 'iblock', '68', 0, NULL, NULL, NULL, '=ID=68&EXTERNAL_ID=68&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #7', '', '', 'gallery', '6', NULL, NULL, NULL),
(94, '2018-06-27 16:54:31', 'iblock', '69', 0, NULL, NULL, NULL, '=ID=69&EXTERNAL_ID=69&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=salaty-v-assortimente', 'САЛАТЫ В АССОРТИМЕНТЕ', 'Салат - это дополнительное блюдо на ужин и завтрак, в которое могут входить абсолютно различные ингредиенты. Помимо того, что будет входить в салат, важную роль играет то, как он будет заправлен, ведь это позволяет раскрыть вкус еще больше. Салат является отличным вариантом перекуса, а также входит в состав основного блюда практически любого приема пищи. \rАссортимент овощных салатов в нашем кафе\rВ нашей кофейне можно ознакомиться с меню, которое располагает выбором вкусных салатов. Их сразу хочется съесть, потому что над созданием блюд работают профессиональные повара сети кофеен «PitStopКафе», которые всегда делают вкусные закуски, перекусы и кофе нашим гостям. \rДля приготовления салатов мы используем: \rсвежие овощи; \rмясные и рыбные нарезки; \rзаправки; \rспеции и другие ингредиенты. \rМы очень любим своих клиентов, поэтому делаем так, чтобы еда была не только вкусной, но и доступной. Кафе «Питстоп» – это разнообразное меню блюд, недорогой кофе, забота о гостях и широкий ассортимент салатов в Москве. \rВ нашем меню есть \rсэндвичи и роллы\rна любой вкус.', '', 'menu', '5', NULL, NULL, NULL),
(95, '2018-06-27 16:52:29', 'iblock', '70', 0, NULL, NULL, NULL, '=ID=70&EXTERNAL_ID=70&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=sendvichi-i-salaty', 'ЯПОНСКАЯ КУХНЯ', 'Мы предлагаем широкий выбор блюд для своих посетителей, которые хотят вкусно перекусить. Наши треугольные сэндвичи порадуют своим вкусом каждого гостя сети кофеен «PitStop». \rЕсть мнение, что фастфуд является вредной пищей для здоровья людей, но и она может быть здоровой. Например, начиненные овощами, сыром, салатом и мясом сендвичи панини и чиабатта, купить которые вы можете в наших кофейнях «ПитСтоп», позволят быстро утолить свой голод и насладиться вкусом приготовленной еды в нашей кофейне. Салаты также изготавливаются быстро и без использования искусственных заменителей вкуса. Мы заботимся о своих гостях и об их здоровье. \rКупить сэндвичи и салаты в кафе\rИдея «PitStopКафе»- это не только вкусный кофе, но и сэндвичи со свежими салатами, которые можно как попробовать в наших кофейнях, так и взять с собой в дорогу. Вся наша продукция приготовлена из тех ингредиентов, которые не содержат каких-либо неполезных пищевых добавок. \rПреимущества заказа сэндвичей и салатов у нас: \rабсолютная безопасность ингредиентов; \rкачественные продукты. \rНаши сэндвичи предлагаются с различными вариантами начинки, а калорийность салатов не так высока, поэтому вы можете вкусно перекусить, не беспокоясь о безопасности своего здоровья! А пока вы будете ожидать приготовление своего заказа, можете насладиться приятной музыкой и уютной атмосферой. \rПредлагаем Вам посмотреть меню \rсалатов в ассортименте\r, представленных в наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(96, '2018-06-27 16:48:27', 'iblock', '71', 0, NULL, NULL, NULL, '=ID=71&EXTERNAL_ID=71&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=kofe-amerikano', 'КОФЕ АМЕРИКАНО 300мл', 'Многие из нас уже не могут начать полноценно своё утро или рабочий день без глотка кофе. Без его мягкого, горьковатого и бодрящего вкуса. Любовь к такому напитку объяснена необычными рецептами его приготовления, о которых Вы можете узнать в нашем кафе, либо, приготовив его самостоятельно. \rКупить кофе американо в Москве\rКофе американо — один из первых видов приготовления кофе. В наших кофейнях кофе всегда свежесмолотый, причем степень его помола всегда высока, чтобы кофейная гуща не ощущалась во рту. \rПреимущества напитка американо: \rпридает бодрость; \rв него можно добавить молоко, сиропы, маршмеллоу – этот напиток, в отличии от капучино или латте, не содержит в своем составе ничего, кроме эспрессо и воды; \rпомогает расслабиться среди рабочего дня, благодаря своему аромату; \rего можно взять с собой в одной из наших кофеен, а его стоимость будет всего 77 рублей. \rКаждый из наших гостей находит в любом из видов кофе что-то свое, а мы всегда предлагаем широкий ассортимент зернового кофе и вкуснейших десертов к нему. \rЕсли вы хотите просто и вкусно перекусить, предлагаем Вам взять \rсэндвичи и салаты\rв наших кофейнях.\rКофе американо можно купить увеличенную порцию 500мл.\r* в некоторых кафе цена может отличаться.', '', 'menu', '5', NULL, NULL, NULL),
(97, '2018-06-27 16:48:52', 'iblock', '72', 0, NULL, NULL, NULL, '=ID=72&EXTERNAL_ID=72&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=kofe-kapuchino', 'КОФЕ КАПУЧИНО 300мл', 'Наша сеть заведений готовит вкусный капучино в Москве для всех гостей, в этом уверены многие гости кофеен «ПитСтоп». Кроме различного кофе, здесь есть десерты и быстрые варианты перекусов. \rВкусный кофе капучино в Москве\rКофе от «PitStopКафе» подходит тем, кто предпочитает напитки на основе крепкого кофе (эспрессо) с необычными способами варки и приготовления. У нас есть всё для знакомства с кофейной культурой: \rнаши бариста могут рассказать вам всё о различных сортах кофе; \rпока вы в процессе ожидания приготовления капучино, можете ознакомиться и с остальными его сортами. \rТакже такой напиток, как капучино, обладает следующими преимуществами: \rкофе рекомендуется пить с молоком, т.к. он вымывает из организма кальций, а такой вариант, как капучино идеально подходит для этого, сочетая в себе все необходимые ингредиенты; \rэтот напиток помогает расслабиться среди рабочего дня, немного отойти от сторонних мыслей; \rкапучино, в отличие от других сортов кофе, имеет более мягкий вкус. \rКупить с собой вкусный кофе капучино Вы можете в любой из наших кофеен. Сколько же стоит молотый кофе капучино? Всего 77р! \rТакже предлагаем Вам купить вкусный \rкофе американо\rв наших кофейнях.\rКофе капучино можно купить увеличенную порцию 500мл.\r* в некоторых кафе цена может отличаться.', '', 'menu', '5', NULL, NULL, NULL),
(98, '2018-06-27 16:48:45', 'iblock', '73', 0, NULL, NULL, NULL, '=ID=73&EXTERNAL_ID=73&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=kofe-latte', 'КОФЕ ЛАТТЕ 300мл', 'У жителей Москвы сейчас очень много требований к современным кофейням: обычного, хорошего расположения гостям заведения уже недостаточно, приходят только за напитками высокого качества. Кофейни «ПитСтоп» всегда с особым подходом относятся к выбору кофейных зерен и не экономят на используемой технике, потому что она позволяет сохранить вкус напитка. \rКупить кофе латте в Москве\rМы варим кофе латте в Москве, купить который Вы можете в одной из кофеен нашей сети. Также в наших кофейнях есть следующие преимущества: \rв любую кофейню удобно прийти с ноутбуком; \rможно почитать книгу за чашечкой свежесваренного латте. \rРодина такого напитка как кофе латте - Италия. Жители этой страны, знают толк в кофейных напитках. Кстати, он не пользуется такой большой популярностью на родине, как в России. \rВ кафе «PitStopКафе» варят не только качественный латте (latte переводится с итальянского «молоко»), но и предлагают вкусные дополнения: десерты, пирожные. Все кофейные напитки, которые Вы можете попробовать у нас или же просто купить и взять с собой в дорогу, приготовлены из свежеобжареных зерен и могут отлично дополнить сладкое. Цена на кофе латте – всего 77р! \rТакже предлагаем Вам взять вкусный \rкофе капучино\rв наших кофейнях.\rКофе латте можно купить увеличенную порцию 500мл.\r* в некоторых кафе цена может отличаться.', '', 'menu', '5', NULL, NULL, NULL),
(100, '2018-01-24 17:53:52', 'iblock', '75', 0, NULL, NULL, NULL, '=ID=75&EXTERNAL_ID=75&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #8', '', '', 'gallery', '6', NULL, NULL, NULL),
(101, '2018-01-24 17:54:11', 'iblock', '76', 0, NULL, NULL, NULL, '=ID=76&EXTERNAL_ID=76&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #9', '', '', 'gallery', '6', NULL, NULL, NULL),
(102, '2018-01-24 17:54:50', 'iblock', '77', 0, NULL, NULL, NULL, '=ID=77&EXTERNAL_ID=77&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #10', '', '', 'gallery', '6', NULL, NULL, NULL),
(103, '2018-01-24 17:56:02', 'iblock', '78', 0, NULL, NULL, NULL, '=ID=78&EXTERNAL_ID=78&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #11', '', '', 'gallery', '6', NULL, NULL, NULL),
(104, '2018-01-24 17:56:42', 'iblock', '79', 0, NULL, NULL, NULL, '=ID=79&EXTERNAL_ID=79&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #12', '', '', 'gallery', '6', NULL, NULL, NULL),
(105, '2018-01-25 15:53:33', 'iblock', '80', 0, NULL, NULL, NULL, '=ID=80&EXTERNAL_ID=80&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=cafe&IBLOCK_ID=8&IBLOCK_CODE=pitstop_cafe_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'ПАВЕЛЕЦКИЙ ВОКЗАЛ', '', '', 'cafe', '8', NULL, NULL, NULL),
(107, '2018-04-04 12:51:53', 'main', 's1|/aktsii/index.php', 0, NULL, NULL, NULL, '/aktsii/index.php', 'Акции', '', '', '', '', NULL, NULL, NULL),
(116, '2018-05-11 16:18:01', 'iblock', '86', 0, NULL, NULL, NULL, '=ID=86&EXTERNAL_ID=86&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=14&IBLOCK_CODE=actsii_s1_v2&IBLOCK_EXTERNAL_ID=&CODE=vmeste-vsu-nedelu', 'Вместе всю неделю', 'Друзья, мы очень любим делать маленькие приятности своим гостям и сегодня хотим поделиться с Вами очень радостным событием из жизни PitStopКафе. Мы объявляем неделю кoфемании - с 28.03.18 во всех кофейнях PitStop на территории Москвы cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". Все любители кофе могут ликовать, потому что при покупке 4-х любых напитков из ассортимента:\r\n\rДрузья, мы очень любим делать маленькие приятности своим гостям и сегодня хотим поделиться с Вами очень радостным событием из жизни PitStopКафе. Мы объявляем неделю кофемании - с 28.03.18 во всех кофейнях PitStop на территории Москвы cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". Все любители кофе могут ликовать, потому что при покупке 4-х любых напитков из ассортимента: \rкофе Латте \rкофе Капучино \rкофе Эспрессо \rкофе двойной Эспрессо \rкофе Американо \r5-ый Вы получаете в ПОДАРОК! Нам радостно от того, что мы можем согреть Вас чашечкой ароматного кофе в холодную погоду.', '', 'news', '14', NULL, NULL, NULL),
(117, '2018-05-11 16:16:27', 'iblock', '87', 0, NULL, NULL, NULL, '=ID=87&EXTERNAL_ID=87&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=news&IBLOCK_ID=14&IBLOCK_CODE=actsii_s1_v2&IBLOCK_EXTERNAL_ID=&CODE=', 'Кофе-гигант', 'Кофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!\r\n\rКофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!\rС сегодняшнего дня во всех кофейнях PitStop \rhttp://pitstop-cafe.ru/cafe/\rвы можете купить самый большой кофе объемом 500 мл и всего за 100 рублей ❗ Такого вы не найдете нигде!!!!\rПодумайте сами: зачем переплачивать за стандартный стаканчик капучино (250 мл) 250 рублей, если можно купить в два раза больше и заплатить за это в два раза меньше? И продлить наслаждение любимым вкусом и ароматом еще на несколько мгновений! Кофе - Гигант уже ждет своих покупателей и готов делиться своим кофейным позитивом с гостями.', '', 'news', '14', NULL, NULL, NULL),
(121, '2018-05-11 18:17:04', 'iblock', '91', 0, NULL, NULL, NULL, '=ID=91&EXTERNAL_ID=91&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=franchise&IBLOCK_ID=7&IBLOCK_CODE=pitstop_franchise_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Карта сайта', '', '', 'franchise', '7', NULL, NULL, NULL),
(124, '2018-05-16 19:08:45', 'iblock', '93', 0, NULL, NULL, NULL, '=ID=93&EXTERNAL_ID=93&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Тут всё для кофе', '', '', 'gallery', '6', NULL, NULL, NULL),
(126, '2018-05-18 12:13:45', 'iblock', '62', 0, NULL, NULL, NULL, '=ID=62&EXTERNAL_ID=62&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #1', '', '', 'gallery', '6', NULL, NULL, NULL),
(127, '2018-05-18 00:00:00', 'iblock', '94', 0, NULL, NULL, NULL, '=ID=94&EXTERNAL_ID=94&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=servo&IBLOCK_ID=15&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=ssylka-dlya-karty', 'Карта сайта', 'Кофейни\rМеню\rСырники творожные\rКофе латте\rКофе капучино\rКофе американо\rСэндвичи и салаты\rСалаты в ассортименте\rСэндвичи и роллы\rМаффины с шоколадом\rЖеле\rПирожные в ассортименте\rФруктовые нарезки\rСлойки с повидлом\rФранчайзинг\rНовости\rАкции\rКонтакты', '', 'servo', '15', NULL, '2018-05-18 00:00:00', NULL),
(129, '2018-05-18 12:16:31', 'iblock', '96', 0, NULL, NULL, NULL, '=ID=96&EXTERNAL_ID=96&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=gallery&IBLOCK_ID=6&IBLOCK_CODE=pitstop_gallery_s1&IBLOCK_EXTERNAL_ID=&CODE=', 'Слайд #14', '', '', 'gallery', '6', NULL, NULL, NULL);
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
(130, '2018-05-18 13:44:47', 'main', 's1|/site-map/index.php', 0, NULL, NULL, NULL, '/site-map/index.php', 'Карта сайта', 'Карта сайта\rКофейни\rМеню\rСырники творожные\rКофе латте\rКофе капучино\rКофе американо\rСэндвичи и салаты\rСалаты в ассортименте\rСэндвичи и роллы\rМаффины с шоколадом\rЖеле\rПирожные в ассортименте\rФруктовые нарезки\rСлойки с повидлом\rФранчайзинг\rНовости\rАкции\rКонтакты', '', '', '', NULL, NULL, NULL),
(131, '2018-06-27 16:48:04', 'iblock', '97', 0, NULL, NULL, NULL, '=ID=97&EXTERNAL_ID=97&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=avtorskiy-kofe', 'КОФЕ 500мл', 'Что мы предлагаем нашим клиентам к чашечке мягкого кофе? Мы предлагаем им свежие и вкусные творожные сырники с мягким ароматом и легким вкусом. Такие творожные десерты широко востребованы за пределами России. Наши сырники выпекаются из такого теста, в которое мы можем добавить свежие ягоды, какие-либо орехи, конечно же, творог и любые другие ингредиенты, пряные специи. Кроме традиционных, сладких вариантов, во многих странах выпекаются также и другие сырники – с зеленью, сыром, несладкие и многие другие. \rСырники из творога в кафе\rМы предлагаем Вам вкусные сырники в кафе, для приготовления которых используем те сочетания ингредиентов , которые полюбились нашими клиентами. Наши кондитерские изделия имеют высокий спрос, благодаря тому, что: \rизготавливаются из продуктов высокого качества; \rмы используем свежие ингредиенты; \rмы не придумываем сочетания вкусов. \rИх также покупают и на организацию различных мероприятий, начиная от фуршетов и детских праздников. Если вы любите эту популярную выпечку, вы можете купить творожные сырники в Москве в одной из наших кофеен! \rТакже предлагаем Вам взять вкусный \rкофе латте\rв наших кофейнях.\r* в некоторых кафе цена может отличаться.', '', 'menu', '5', NULL, NULL, NULL),
(134, '2018-06-27 17:08:50', 'iblock', '100', 0, NULL, NULL, NULL, '=ID=100&EXTERNAL_ID=100&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=kruasan', 'КРУАСАН', '', '', 'menu', '5', NULL, NULL, NULL),
(135, '2018-06-27 17:12:32', 'iblock', '101', 0, NULL, NULL, NULL, '=ID=101&EXTERNAL_ID=101&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=krekeliny', 'КРЕКЕЛИНЫ', '', '', 'menu', '5', NULL, NULL, NULL),
(136, '2018-06-27 16:35:05', 'main', 's1|/menu/index_old.php', 0, NULL, NULL, NULL, '/menu/index_old.php', 'Title', 'Меню\rВСЁ ПО\n77 Р\rВкусов много не бывает.\rПолноценные порции за 77 рублей!\rНе думай о цене, выбирай по вкусу!\nКофе (300 мл.)\rКулинария\rДесерты\rВыпечка', '', '', '', NULL, NULL, NULL),
(137, '2018-06-27 16:58:05', 'iblock', '102', 0, NULL, NULL, NULL, '=ID=102&EXTERNAL_ID=102&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=tosty-s-vetchinoy-ili-ryboy', 'Тосты с ветчиной или рыбой', '', '', 'menu', '5', NULL, NULL, NULL),
(138, '2018-06-27 17:03:28', 'iblock', '74', 0, NULL, NULL, NULL, '=ID=74&EXTERNAL_ID=74&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=menu&IBLOCK_ID=5&IBLOCK_CODE=pitsop_menu_s1&IBLOCK_EXTERNAL_ID=&CODE=syrniki-tvorozhnye', 'СЫРНИКИ ТВОРОЖНЫЕ', 'Что может дополнить чашечку мягкого кофе? Мы предлагаем нашим гостям свежие и вкусные творожные сырники с мягким ароматом и легким вкусом. Такие творожные десерты широко востребованы за пределами России. Наши сырники выпекаются из такого теста, в которое мы можем добавить свежие ягоды, какие-либо орехи, конечно же, творог и любые другие ингредиенты, пряные специи. Кроме традиционных, сладких вариантов, во многих странах выпекаются также и другие сырники – с зеленью, сыром, несладкие и многие другие. \rСырники из творога в кафе\rМы предлагаем Вам вкусные сырники в кафе, для приготовления которых используем те сочетания ингредиентов , которые полюбились нашими клиентами. Наши кондитерские изделия имеют высокий спрос, благодаря тому, что: \rизготавливаются из продуктов высокого качества; \rмы используем свежие ингредиенты; \rмы не придумываем сочетания вкусов. \rИх также покупают и на организацию различных мероприятий, начиная от фуршетов и детских праздников. Если вы любите эту популярную выпечку, вы можете купить творожные сырники в Москве в одной из наших кофеен! \rТакже предлагаем Вам взять вкусный \rкофе латте\rв наших кофейнях.', '', 'menu', '5', NULL, NULL, NULL),
(139, '2018-06-29 11:59:45', 'main', 's1|/auth/index.php', 0, NULL, NULL, NULL, '/auth/index.php', 'Авторизация', '', '', '', '', NULL, NULL, NULL),
(140, '2018-06-29 12:25:57', 'main', 's1|/baza-znaniy/index.php', 0, NULL, NULL, NULL, '/baza-znaniy/index.php', 'База знаний', 'Руководство по использованию фирменного стиля\rКоммуникационная стратегия', '', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_freq`
--

CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_param`
--

CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_right`
--

CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_right`
--

INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
(1, 'G2'),
(2, 'G2'),
(3, 'G2'),
(4, 'G2'),
(5, 'G2'),
(6, 'G2'),
(7, 'G2'),
(8, 'G2'),
(9, 'G2'),
(10, 'G2'),
(11, 'G2'),
(12, 'G2'),
(13, 'G2'),
(50, 'G2'),
(52, 'G2'),
(53, 'G2'),
(54, 'G2'),
(55, 'G1'),
(55, 'G2'),
(56, 'G1'),
(56, 'G2'),
(57, 'G1'),
(57, 'G2'),
(58, 'G1'),
(58, 'G2'),
(59, 'G1'),
(59, 'G2'),
(60, 'G1'),
(60, 'G2'),
(61, 'G1'),
(61, 'G2'),
(62, 'G1'),
(62, 'G2'),
(63, 'G1'),
(63, 'G2'),
(66, 'G1'),
(66, 'G2'),
(67, 'G1'),
(67, 'G2'),
(68, 'G1'),
(68, 'G2'),
(69, 'G1'),
(69, 'G2'),
(70, 'G1'),
(70, 'G2'),
(71, 'G1'),
(71, 'G2'),
(72, 'G1'),
(72, 'G2'),
(74, 'G1'),
(74, 'G2'),
(75, 'G1'),
(75, 'G2'),
(76, 'G1'),
(76, 'G2'),
(77, 'G1'),
(77, 'G2'),
(78, 'G1'),
(78, 'G2'),
(79, 'G1'),
(79, 'G2'),
(80, 'G1'),
(80, 'G2'),
(81, 'G1'),
(81, 'G2'),
(82, 'G2'),
(83, 'G2'),
(84, 'G2'),
(85, 'G1'),
(85, 'G2'),
(88, 'G2'),
(89, 'G2'),
(90, 'G2'),
(91, 'G2'),
(92, 'G2'),
(93, 'G2'),
(94, 'G1'),
(94, 'G2'),
(95, 'G1'),
(95, 'G2'),
(96, 'G1'),
(96, 'G2'),
(97, 'G1'),
(97, 'G2'),
(98, 'G1'),
(98, 'G2'),
(100, 'G2'),
(101, 'G2'),
(102, 'G2'),
(103, 'G2'),
(104, 'G2'),
(105, 'G1'),
(105, 'G2'),
(107, 'G2'),
(116, 'G1'),
(116, 'G2'),
(117, 'G1'),
(117, 'G2'),
(121, 'G1'),
(121, 'G2'),
(124, 'G1'),
(124, 'G2'),
(126, 'G1'),
(126, 'G2'),
(127, 'G1'),
(127, 'G2'),
(129, 'G1'),
(129, 'G2'),
(130, 'G2'),
(131, 'G1'),
(131, 'G2'),
(134, 'G1'),
(134, 'G2'),
(135, 'G1'),
(135, 'G2'),
(136, 'G2'),
(137, 'G1'),
(137, 'G2'),
(138, 'G1'),
(138, 'G2'),
(139, 'G2'),
(140, 'G2');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_site`
--

CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_site`
--

INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
(1, 's1', ''),
(2, 's1', ''),
(3, 's1', ''),
(4, 's1', ''),
(5, 's1', ''),
(6, 's1', ''),
(7, 's1', ''),
(8, 's1', ''),
(9, 's1', ''),
(10, 's1', ''),
(11, 's1', ''),
(12, 's1', ''),
(13, 's1', ''),
(50, 's1', ''),
(52, 's1', ''),
(53, 's1', ''),
(54, 's1', ''),
(55, 's1', ''),
(56, 's1', ''),
(57, 's1', ''),
(58, 's1', ''),
(59, 's1', ''),
(60, 's1', ''),
(61, 's1', ''),
(62, 's1', ''),
(63, 's1', ''),
(66, 's1', ''),
(67, 's1', ''),
(68, 's1', ''),
(69, 's1', ''),
(70, 's1', ''),
(71, 's1', ''),
(72, 's1', ''),
(74, 's1', ''),
(75, 's1', ''),
(76, 's1', ''),
(77, 's1', ''),
(78, 's1', ''),
(79, 's1', ''),
(80, 's1', ''),
(81, 's1', ''),
(82, 's1', ''),
(83, 's1', ''),
(84, 's1', ''),
(85, 's1', ''),
(88, 's1', ''),
(89, 's1', ''),
(90, 's1', ''),
(91, 's1', ''),
(92, 's1', ''),
(93, 's1', ''),
(94, 's1', ''),
(95, 's1', ''),
(96, 's1', ''),
(97, 's1', ''),
(98, 's1', ''),
(100, 's1', ''),
(101, 's1', ''),
(102, 's1', ''),
(103, 's1', ''),
(104, 's1', ''),
(105, 's1', ''),
(107, 's1', ''),
(116, 's1', ''),
(117, 's1', ''),
(121, 's1', ''),
(124, 's1', ''),
(126, 's1', ''),
(127, 's1', ''),
(129, 's1', ''),
(130, 's1', ''),
(131, 's1', ''),
(134, 's1', ''),
(135, 's1', ''),
(136, 's1', ''),
(137, 's1', ''),
(138, 's1', ''),
(139, 's1', ''),
(140, 's1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_stem`
--

CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_stem`
--

INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(1, 'ru', 1, 0.2314, 1),
(2, 'ru', 2, 0.2314, 1),
(3, 'ru', 3, 0.2314, 1),
(3, 'ru', 4, 0.2314, 2),
(4, 'ru', 5, 0.3597, 217),
(4, 'ru', 6, 0.4148, 289.4),
(4, 'ru', 7, 0.1199, 5),
(4, 'ru', 8, 0.1199, 7),
(4, 'ru', 9, 0.1199, 8),
(4, 'ru', 10, 0.1199, 10),
(4, 'ru', 11, 0.19, 248),
(4, 'ru', 12, 0.1199, 19),
(4, 'ru', 13, 0.2784, 342.25),
(4, 'ru', 14, 0.19, 254),
(4, 'ru', 15, 0.1199, 23),
(4, 'ru', 16, 0.1199, 24),
(4, 'ru', 17, 0.1199, 26),
(4, 'ru', 18, 0.1199, 27),
(4, 'ru', 19, 0.1199, 28),
(4, 'ru', 20, 0.2398, 312.333),
(4, 'ru', 21, 0.1199, 32),
(4, 'ru', 22, 0.19, 257),
(4, 'ru', 23, 0.1199, 34),
(4, 'ru', 24, 0.3597, 156.286),
(4, 'ru', 25, 0.2784, 327.5),
(4, 'ru', 26, 0.1199, 43),
(4, 'ru', 27, 0.1199, 44),
(4, 'ru', 28, 0.2398, 304),
(4, 'ru', 29, 0.19, 243.5),
(4, 'ru', 30, 0.1199, 49),
(4, 'ru', 31, 0.1199, 50),
(4, 'ru', 32, 0.1199, 52),
(4, 'ru', 33, 0.1199, 53),
(4, 'ru', 34, 0.1199, 54),
(4, 'ru', 35, 0.19, 85),
(4, 'ru', 36, 0.1199, 56),
(4, 'ru', 37, 0.1199, 57),
(4, 'ru', 38, 0.19, 92),
(4, 'ru', 39, 0.19, 77.5),
(4, 'ru', 40, 0.1199, 62),
(4, 'ru', 41, 0.19, 90),
(4, 'ru', 42, 0.1199, 70),
(4, 'ru', 43, 0.1199, 72),
(4, 'ru', 44, 0.2398, 306),
(4, 'ru', 45, 0.1199, 74),
(4, 'ru', 46, 0.3597, 330.857),
(4, 'ru', 47, 0.1199, 83),
(4, 'ru', 48, 0.1199, 86),
(4, 'ru', 49, 0.1199, 87),
(4, 'ru', 50, 0.1199, 88),
(4, 'ru', 51, 0.1199, 89),
(4, 'ru', 52, 0.1199, 91),
(4, 'ru', 53, 0.1199, 92),
(4, 'ru', 54, 0.1199, 96),
(4, 'ru', 55, 0.19, 197),
(4, 'ru', 56, 0.1199, 99),
(4, 'ru', 57, 0.19, 112.5),
(4, 'ru', 58, 0.1199, 107),
(4, 'ru', 59, 0.1199, 108),
(4, 'ru', 60, 0.1199, 109),
(4, 'ru', 61, 0.19, 147),
(4, 'ru', 62, 0.1199, 116),
(4, 'ru', 63, 0.2784, 224),
(4, 'ru', 64, 0.1199, 121),
(4, 'ru', 65, 0.19, 267.5),
(4, 'ru', 66, 0.1199, 124),
(4, 'ru', 67, 0.1199, 127),
(4, 'ru', 68, 0.1199, 128),
(4, 'ru', 69, 0.1199, 129),
(4, 'ru', 70, 0.1199, 130),
(4, 'ru', 71, 0.1199, 138),
(4, 'ru', 72, 0.2398, 184.333),
(4, 'ru', 73, 0.1199, 140),
(4, 'ru', 74, 0.1199, 142),
(4, 'ru', 75, 0.19, 196.5),
(4, 'ru', 76, 0.1199, 144),
(4, 'ru', 77, 0.19, 144),
(4, 'ru', 78, 0.1199, 146),
(4, 'ru', 79, 0.1199, 147),
(4, 'ru', 80, 0.1199, 148),
(4, 'ru', 81, 0.1199, 154),
(4, 'ru', 82, 0.1199, 155),
(4, 'ru', 83, 0.1199, 156),
(4, 'ru', 84, 0.19, 181.5),
(4, 'ru', 85, 0.1199, 159),
(4, 'ru', 86, 0.1199, 161),
(4, 'ru', 87, 0.1199, 162),
(4, 'ru', 88, 0.1199, 169),
(4, 'ru', 89, 0.1199, 170),
(4, 'ru', 90, 0.1199, 172),
(4, 'ru', 91, 0.1199, 173),
(4, 'ru', 92, 0.1199, 175),
(4, 'ru', 93, 0.19, 191),
(4, 'ru', 94, 0.1199, 177),
(4, 'ru', 95, 0.2398, 299),
(4, 'ru', 96, 0.1199, 181),
(4, 'ru', 97, 0.1199, 183),
(4, 'ru', 98, 0.1199, 185),
(4, 'ru', 99, 0.1199, 187),
(4, 'ru', 100, 0.19, 237.5),
(4, 'ru', 101, 0.19, 237.5),
(4, 'ru', 102, 0.19, 237.5),
(4, 'ru', 103, 0.1199, 196),
(4, 'ru', 104, 0.1199, 198),
(4, 'ru', 105, 0.1199, 199),
(4, 'ru', 106, 0.1199, 200),
(4, 'ru', 107, 0.1199, 201),
(4, 'ru', 108, 0.19, 201),
(4, 'ru', 109, 0.1199, 203),
(4, 'ru', 110, 0.1199, 207),
(4, 'ru', 111, 0.1199, 208),
(4, 'ru', 112, 0.1199, 209),
(4, 'ru', 113, 0.19, 236),
(4, 'ru', 114, 0.1199, 218),
(4, 'ru', 115, 0.1199, 220),
(4, 'ru', 116, 0.1199, 221),
(4, 'ru', 117, 0.1199, 223),
(4, 'ru', 118, 0.2398, 247.667),
(4, 'ru', 119, 0.1199, 232),
(4, 'ru', 120, 0.1199, 234),
(4, 'ru', 121, 0.2398, 293.667),
(4, 'ru', 122, 0.19, 281.5),
(4, 'ru', 123, 0.1199, 245),
(4, 'ru', 124, 0.1199, 246),
(4, 'ru', 125, 0.3366, 418.333),
(4, 'ru', 126, 0.1199, 251),
(4, 'ru', 127, 0.19, 256),
(4, 'ru', 128, 0.1199, 255),
(4, 'ru', 129, 0.1199, 259),
(4, 'ru', 130, 0.1199, 260),
(4, 'ru', 131, 0.19, 270),
(4, 'ru', 132, 0.19, 271.5),
(4, 'ru', 133, 0.19, 314.5),
(4, 'ru', 134, 0.2398, 302.667),
(4, 'ru', 135, 0.1199, 272),
(4, 'ru', 136, 0.1199, 274),
(4, 'ru', 137, 0.1199, 276),
(4, 'ru', 138, 0.1199, 279),
(4, 'ru', 139, 0.2398, 301.333),
(4, 'ru', 140, 0.2398, 374.333),
(4, 'ru', 141, 0.1199, 281),
(4, 'ru', 142, 0.1199, 282),
(4, 'ru', 143, 0.1199, 283),
(4, 'ru', 144, 0.1199, 285),
(4, 'ru', 145, 0.1199, 286),
(4, 'ru', 146, 0.1199, 289),
(4, 'ru', 147, 0.1199, 291),
(4, 'ru', 148, 0.1199, 292),
(4, 'ru', 149, 0.1199, 294),
(4, 'ru', 150, 0.1199, 296),
(4, 'ru', 151, 0.1199, 298),
(4, 'ru', 152, 0.1199, 299),
(4, 'ru', 153, 0.1199, 305),
(4, 'ru', 154, 0.1199, 309),
(4, 'ru', 155, 0.1199, 310),
(4, 'ru', 156, 0.19, 314),
(4, 'ru', 157, 0.2784, 314),
(4, 'ru', 158, 0.1199, 314),
(4, 'ru', 159, 0.1199, 316),
(4, 'ru', 160, 0.1199, 324),
(4, 'ru', 161, 0.1199, 327),
(4, 'ru', 162, 0.1199, 328),
(4, 'ru', 163, 0.1199, 329),
(4, 'ru', 164, 0.1199, 331),
(4, 'ru', 165, 0.1199, 332),
(4, 'ru', 166, 0.1199, 333),
(4, 'ru', 167, 0.1199, 336),
(4, 'ru', 168, 0.19, 357.5),
(4, 'ru', 169, 0.19, 376),
(4, 'ru', 170, 0.19, 373),
(4, 'ru', 171, 0.1199, 348),
(4, 'ru', 172, 0.19, 348),
(4, 'ru', 173, 0.1199, 355),
(4, 'ru', 174, 0.1199, 356),
(4, 'ru', 175, 0.1199, 357),
(4, 'ru', 176, 0.1199, 361),
(4, 'ru', 177, 0.1199, 362),
(4, 'ru', 178, 0.1199, 373),
(4, 'ru', 179, 0.1199, 374),
(4, 'ru', 180, 0.1199, 376),
(4, 'ru', 181, 0.1199, 378),
(4, 'ru', 182, 0.1199, 380),
(4, 'ru', 183, 0.1199, 388),
(4, 'ru', 184, 0.19, 447.5),
(4, 'ru', 185, 0.1199, 392),
(4, 'ru', 186, 0.1199, 394),
(4, 'ru', 187, 0.1199, 398),
(4, 'ru', 188, 0.1199, 402),
(4, 'ru', 189, 0.1199, 404),
(4, 'ru', 190, 0.1199, 405),
(4, 'ru', 191, 0.1199, 406),
(4, 'ru', 192, 0.1199, 407),
(4, 'ru', 193, 0.1199, 421),
(4, 'ru', 194, 0.1199, 422),
(4, 'ru', 195, 0.1199, 423),
(4, 'ru', 196, 0.1199, 425),
(4, 'ru', 197, 0.1199, 428),
(4, 'ru', 198, 0.1199, 432),
(4, 'ru', 199, 0.1199, 435),
(4, 'ru', 200, 0.1199, 436),
(4, 'ru', 201, 0.1199, 437),
(4, 'ru', 202, 0.1199, 442),
(4, 'ru', 203, 0.1199, 448),
(4, 'ru', 204, 0.1199, 451),
(4, 'ru', 205, 0.1199, 452),
(4, 'ru', 206, 0.1199, 453),
(4, 'ru', 207, 0.1199, 455),
(4, 'ru', 208, 0.1199, 456),
(4, 'ru', 209, 0.1199, 459),
(4, 'ru', 210, 0.19, 479),
(4, 'ru', 211, 0.2398, 483),
(4, 'ru', 212, 0.19, 483.5),
(4, 'ru', 213, 0.1199, 464),
(4, 'ru', 214, 0.1199, 472),
(4, 'ru', 215, 0.1199, 473),
(4, 'ru', 216, 0.1199, 478),
(4, 'ru', 217, 0.1199, 479),
(4, 'ru', 218, 0.1199, 484),
(4, 'ru', 219, 0.1199, 487),
(4, 'ru', 220, 0.1199, 490),
(4, 'ru', 221, 0.19, 495.5),
(4, 'ru', 222, 0.1199, 492),
(4, 'ru', 223, 0.1199, 494),
(4, 'ru', 224, 0.1199, 495),
(4, 'ru', 225, 0.1199, 497),
(4, 'ru', 226, 0.1199, 503),
(4, 'ru', 227, 0.1199, 505),
(5, 'ru', 5, 0.5249, 284.333),
(5, 'ru', 8, 0.1177, 378),
(5, 'ru', 9, 0.1177, 379),
(5, 'ru', 11, 0.1866, 333.5),
(5, 'ru', 13, 0.4356, 287.667),
(5, 'ru', 20, 0.1866, 113.5),
(5, 'ru', 22, 0.1177, 288),
(5, 'ru', 24, 0.3531, 261.143),
(5, 'ru', 25, 0.2354, 315.333),
(5, 'ru', 28, 0.1177, 548),
(5, 'ru', 36, 0.3043, 426),
(5, 'ru', 39, 0.1866, 17),
(5, 'ru', 46, 0.2733, 226),
(5, 'ru', 71, 0.1177, 549),
(5, 'ru', 81, 0.1177, 338),
(5, 'ru', 100, 0.2733, 385.5),
(5, 'ru', 101, 0.2733, 385.5),
(5, 'ru', 102, 0.2733, 385.5),
(5, 'ru', 109, 0.1177, 339),
(5, 'ru', 122, 0.2733, 448.5),
(5, 'ru', 125, 0.1177, 117),
(5, 'ru', 132, 0.1177, 527),
(5, 'ru', 154, 0.1177, 512),
(5, 'ru', 158, 0.1177, 438),
(5, 'ru', 164, 0.1177, 287),
(5, 'ru', 167, 0.1866, 432),
(5, 'ru', 187, 0.2354, 231),
(5, 'ru', 188, 0.2733, 413.75),
(5, 'ru', 194, 0.3304, 372.167),
(5, 'ru', 216, 0.3043, 156.6),
(5, 'ru', 226, 0.2354, 264.333),
(5, 'ru', 227, 0.1177, 197),
(5, 'ru', 228, 0.1177, 1),
(5, 'ru', 229, 0.1177, 2),
(5, 'ru', 230, 0.1866, 218),
(5, 'ru', 231, 0.1177, 12),
(5, 'ru', 232, 0.1177, 15),
(5, 'ru', 233, 0.1177, 17),
(5, 'ru', 234, 0.1177, 26),
(5, 'ru', 235, 0.1177, 28),
(5, 'ru', 236, 0.1177, 29),
(5, 'ru', 237, 0.3043, 280),
(5, 'ru', 238, 0.1177, 31),
(5, 'ru', 239, 0.2733, 202),
(5, 'ru', 240, 0.1177, 35),
(5, 'ru', 241, 0.1177, 36),
(5, 'ru', 242, 0.1866, 340.5),
(5, 'ru', 243, 0.1177, 45),
(5, 'ru', 244, 0.1177, 46),
(5, 'ru', 245, 0.1177, 53),
(5, 'ru', 246, 0.1177, 54),
(5, 'ru', 247, 0.1177, 55),
(5, 'ru', 248, 0.1866, 179.5),
(5, 'ru', 249, 0.1866, 86.5),
(5, 'ru', 250, 0.1177, 60),
(5, 'ru', 251, 0.1177, 62),
(5, 'ru', 252, 0.1177, 63),
(5, 'ru', 253, 0.1177, 64),
(5, 'ru', 254, 0.1177, 70),
(5, 'ru', 255, 0.1177, 76),
(5, 'ru', 256, 0.1177, 78),
(5, 'ru', 257, 0.3304, 371.167),
(5, 'ru', 258, 0.1177, 80),
(5, 'ru', 259, 0.1177, 82),
(5, 'ru', 260, 0.1177, 84),
(5, 'ru', 261, 0.1866, 282.5),
(5, 'ru', 262, 0.1177, 94),
(5, 'ru', 263, 0.1177, 96),
(5, 'ru', 264, 0.2354, 209.667),
(5, 'ru', 265, 0.1177, 99),
(5, 'ru', 266, 0.1177, 100),
(5, 'ru', 267, 0.1177, 107),
(5, 'ru', 268, 0.1177, 108),
(5, 'ru', 269, 0.1177, 111),
(5, 'ru', 270, 0.1177, 115),
(5, 'ru', 271, 0.1177, 116),
(5, 'ru', 272, 0.1177, 118),
(5, 'ru', 273, 0.1177, 121),
(5, 'ru', 274, 0.1866, 148),
(5, 'ru', 275, 0.1177, 123),
(5, 'ru', 276, 0.1177, 130),
(5, 'ru', 277, 0.1177, 137),
(5, 'ru', 278, 0.1866, 232),
(5, 'ru', 279, 0.1866, 311),
(5, 'ru', 280, 0.1177, 141),
(5, 'ru', 281, 0.1866, 150),
(5, 'ru', 282, 0.1177, 154),
(5, 'ru', 283, 0.1177, 155),
(5, 'ru', 284, 0.1177, 156),
(5, 'ru', 285, 0.1177, 158),
(5, 'ru', 286, 0.1866, 242),
(5, 'ru', 287, 0.1177, 161),
(5, 'ru', 288, 0.1177, 162),
(5, 'ru', 289, 0.1177, 164),
(5, 'ru', 290, 0.1177, 176),
(5, 'ru', 291, 0.1177, 183),
(5, 'ru', 292, 0.1177, 192),
(5, 'ru', 293, 0.1177, 196),
(5, 'ru', 294, 0.1177, 198),
(5, 'ru', 295, 0.1177, 199),
(5, 'ru', 296, 0.1177, 202),
(5, 'ru', 297, 0.1177, 203),
(5, 'ru', 298, 0.1177, 218),
(5, 'ru', 299, 0.1177, 220),
(5, 'ru', 300, 0.1177, 221),
(5, 'ru', 301, 0.1177, 228),
(5, 'ru', 302, 0.1177, 229),
(5, 'ru', 303, 0.1177, 230),
(5, 'ru', 304, 0.2354, 241.333),
(5, 'ru', 305, 0.1866, 249),
(5, 'ru', 306, 0.2354, 376),
(5, 'ru', 307, 0.1177, 236),
(5, 'ru', 308, 0.1177, 238),
(5, 'ru', 309, 0.1177, 245),
(5, 'ru', 310, 0.1177, 251),
(5, 'ru', 311, 0.1177, 253),
(5, 'ru', 312, 0.1177, 255),
(5, 'ru', 313, 0.1866, 448.5),
(5, 'ru', 314, 0.1177, 262),
(5, 'ru', 315, 0.1177, 269),
(5, 'ru', 316, 0.1177, 276),
(5, 'ru', 317, 0.1177, 284),
(5, 'ru', 318, 0.1177, 286),
(5, 'ru', 319, 0.1177, 291),
(5, 'ru', 320, 0.1177, 292),
(5, 'ru', 321, 0.1866, 461.5),
(5, 'ru', 322, 0.2733, 461.5),
(5, 'ru', 323, 0.1177, 297),
(5, 'ru', 324, 0.1177, 299),
(5, 'ru', 325, 0.1177, 300),
(5, 'ru', 326, 0.1866, 300),
(5, 'ru', 327, 0.1177, 301),
(5, 'ru', 328, 0.1177, 308),
(5, 'ru', 329, 0.1177, 314),
(5, 'ru', 330, 0.2733, 444),
(5, 'ru', 331, 0.2354, 374.333),
(5, 'ru', 332, 0.1177, 327),
(5, 'ru', 333, 0.2354, 482.333),
(5, 'ru', 334, 0.2354, 484.333),
(5, 'ru', 335, 0.1866, 431),
(5, 'ru', 336, 0.2733, 431),
(5, 'ru', 337, 0.1177, 341),
(5, 'ru', 338, 0.1177, 342),
(5, 'ru', 339, 0.1177, 343),
(5, 'ru', 340, 0.1177, 345),
(5, 'ru', 341, 0.1177, 346),
(5, 'ru', 342, 0.1177, 347),
(5, 'ru', 343, 0.1866, 347),
(5, 'ru', 344, 0.1177, 353),
(5, 'ru', 345, 0.1866, 428.5),
(5, 'ru', 346, 0.1177, 362),
(5, 'ru', 347, 0.3043, 521.8),
(5, 'ru', 348, 0.1177, 374),
(5, 'ru', 349, 0.2354, 410),
(5, 'ru', 350, 0.1177, 382),
(5, 'ru', 351, 0.2733, 504.5),
(5, 'ru', 352, 0.1866, 426.5),
(5, 'ru', 353, 0.1177, 394),
(5, 'ru', 354, 0.1177, 400),
(5, 'ru', 355, 0.1177, 407),
(5, 'ru', 356, 0.1177, 411),
(5, 'ru', 357, 0.1177, 413),
(5, 'ru', 358, 0.2354, 472.333),
(5, 'ru', 359, 0.1177, 415),
(5, 'ru', 360, 0.1177, 419),
(5, 'ru', 361, 0.1177, 420),
(5, 'ru', 362, 0.1177, 427),
(5, 'ru', 363, 0.1177, 430),
(5, 'ru', 364, 0.1177, 431),
(5, 'ru', 365, 0.1177, 437),
(5, 'ru', 366, 0.1177, 442),
(5, 'ru', 367, 0.1177, 452),
(5, 'ru', 368, 0.2733, 533.25),
(5, 'ru', 369, 0.1177, 454),
(5, 'ru', 370, 0.1177, 456),
(5, 'ru', 371, 0.1177, 457),
(5, 'ru', 372, 0.1177, 469),
(5, 'ru', 373, 0.1177, 471),
(5, 'ru', 374, 0.1177, 472),
(5, 'ru', 375, 0.1177, 478),
(5, 'ru', 376, 0.1177, 480),
(5, 'ru', 377, 0.1177, 481),
(5, 'ru', 378, 0.1177, 483),
(5, 'ru', 379, 0.1866, 483),
(5, 'ru', 380, 0.1177, 485),
(5, 'ru', 381, 0.1177, 492),
(5, 'ru', 382, 0.2733, 545.25),
(5, 'ru', 383, 0.1177, 507),
(5, 'ru', 384, 0.1177, 509),
(5, 'ru', 385, 0.1866, 561),
(5, 'ru', 386, 0.1177, 515),
(5, 'ru', 387, 0.1177, 528),
(5, 'ru', 388, 0.1866, 562.5),
(5, 'ru', 389, 0.1866, 550.5),
(5, 'ru', 390, 0.1177, 550),
(5, 'ru', 391, 0.1177, 558),
(5, 'ru', 392, 0.1177, 559),
(5, 'ru', 393, 0.1177, 574),
(5, 'ru', 394, 0.1177, 582),
(5, 'ru', 395, 0.1866, 597),
(5, 'ru', 396, 0.1177, 594),
(5, 'ru', 397, 0.1177, 597),
(5, 'ru', 398, 0.1177, 598),
(5, 'ru', 399, 0.1177, 599),
(5, 'ru', 400, 0.1177, 611),
(5, 'ru', 401, 0.1177, 613),
(5, 'ru', 402, 0.1177, 615),
(5, 'ru', 403, 0.1177, 627),
(5, 'ru', 404, 0.1177, 639),
(5, 'ru', 405, 0.1177, 640),
(6, 'ru', 5, 0.5006, 145.25),
(6, 'ru', 9, 0.2144, 32.5),
(6, 'ru', 11, 0.4058, 150.143),
(6, 'ru', 12, 0.2706, 139.667),
(6, 'ru', 13, 0.4288, 101.25),
(6, 'ru', 15, 0.1353, 91),
(6, 'ru', 16, 0.1353, 231),
(6, 'ru', 46, 0.1353, 60),
(6, 'ru', 75, 0.1353, 76),
(6, 'ru', 81, 0.1353, 7),
(6, 'ru', 105, 0.1353, 6),
(6, 'ru', 109, 0.1353, 165),
(6, 'ru', 118, 0.1353, 9),
(6, 'ru', 142, 0.1353, 101),
(6, 'ru', 155, 0.1353, 22),
(6, 'ru', 163, 0.1353, 142),
(6, 'ru', 187, 0.2144, 136),
(6, 'ru', 194, 0.1353, 67),
(6, 'ru', 217, 0.1353, 41),
(6, 'ru', 226, 0.2144, 203),
(6, 'ru', 237, 0.1353, 70),
(6, 'ru', 248, 0.2144, 104.5),
(6, 'ru', 253, 0.1353, 62),
(6, 'ru', 258, 0.1353, 234),
(6, 'ru', 265, 0.1353, 95),
(6, 'ru', 272, 0.1353, 59),
(6, 'ru', 275, 0.1353, 64),
(6, 'ru', 283, 0.2144, 77),
(6, 'ru', 306, 0.1353, 78),
(6, 'ru', 320, 0.1353, 42),
(6, 'ru', 336, 0.2144, 79),
(6, 'ru', 339, 0.1353, 72),
(6, 'ru', 375, 0.1353, 71),
(6, 'ru', 387, 0.1353, 2),
(6, 'ru', 388, 0.2144, 76.5),
(6, 'ru', 400, 0.1353, 69),
(6, 'ru', 401, 0.1353, 98),
(6, 'ru', 406, 0.2144, 5.5),
(6, 'ru', 407, 0.1353, 8),
(6, 'ru', 408, 0.1353, 23),
(6, 'ru', 409, 0.1353, 35),
(6, 'ru', 410, 0.1353, 38),
(6, 'ru', 411, 0.1353, 39),
(6, 'ru', 412, 0.1353, 40),
(6, 'ru', 413, 0.1353, 43),
(6, 'ru', 414, 0.2144, 43),
(6, 'ru', 415, 0.1353, 57),
(6, 'ru', 416, 0.1353, 58),
(6, 'ru', 417, 0.1353, 61),
(6, 'ru', 418, 0.1353, 66),
(6, 'ru', 419, 0.1353, 75),
(6, 'ru', 420, 0.1353, 77),
(6, 'ru', 421, 0.1353, 80),
(6, 'ru', 422, 0.1353, 81),
(6, 'ru', 423, 0.1353, 83),
(6, 'ru', 424, 0.1353, 92),
(6, 'ru', 425, 0.1353, 94),
(6, 'ru', 426, 0.1353, 96),
(6, 'ru', 427, 0.1353, 97),
(6, 'ru', 428, 0.1353, 102),
(6, 'ru', 429, 0.1353, 108),
(6, 'ru', 430, 0.1353, 112),
(6, 'ru', 431, 0.2144, 112),
(6, 'ru', 432, 0.2144, 136.5),
(6, 'ru', 433, 0.2144, 137.5),
(6, 'ru', 434, 0.2144, 151),
(6, 'ru', 435, 0.1353, 117),
(6, 'ru', 436, 0.1353, 118),
(6, 'ru', 437, 0.2706, 191.333),
(6, 'ru', 438, 0.1353, 126),
(6, 'ru', 439, 0.1353, 127),
(6, 'ru', 440, 0.2144, 190.5),
(6, 'ru', 441, 0.2706, 194),
(6, 'ru', 442, 0.2144, 193),
(6, 'ru', 443, 0.2144, 165),
(6, 'ru', 444, 0.2144, 166),
(6, 'ru', 445, 0.2144, 179.5),
(6, 'ru', 446, 0.2144, 185.5),
(6, 'ru', 447, 0.2144, 174),
(6, 'ru', 448, 0.1353, 145),
(6, 'ru', 449, 0.1353, 146),
(6, 'ru', 450, 0.1353, 148),
(6, 'ru', 451, 0.2144, 179.5),
(6, 'ru', 452, 0.1353, 158),
(6, 'ru', 453, 0.1353, 162),
(6, 'ru', 454, 0.2144, 205),
(6, 'ru', 455, 0.1353, 166),
(6, 'ru', 456, 0.1353, 167),
(6, 'ru', 457, 0.1353, 169),
(6, 'ru', 458, 0.1353, 171),
(6, 'ru', 459, 0.2706, 220.333),
(6, 'ru', 460, 0.2706, 221.333),
(6, 'ru', 461, 0.1353, 184),
(6, 'ru', 462, 0.1353, 185),
(6, 'ru', 463, 0.1353, 186),
(6, 'ru', 464, 0.2144, 228.5),
(6, 'ru', 465, 0.1353, 190),
(6, 'ru', 466, 0.1353, 202),
(6, 'ru', 467, 0.1353, 203),
(6, 'ru', 468, 0.1353, 205),
(6, 'ru', 469, 0.1353, 217),
(6, 'ru', 470, 0.1353, 218),
(6, 'ru', 471, 0.1353, 233),
(6, 'ru', 472, 0.1353, 244),
(6, 'ru', 473, 0.1353, 249),
(6, 'ru', 474, 0.1353, 250),
(6, 'ru', 475, 0.1353, 251),
(6, 'ru', 476, 0.1353, 254),
(6, 'ru', 477, 0.1353, 257),
(6, 'ru', 478, 0.1353, 258),
(6, 'ru', 479, 0.1353, 269),
(7, 'ru', 480, 0.2314, 1),
(8, 'ru', 5, 0.4559, 183.636),
(8, 'ru', 6, 0.2953, 359.5),
(8, 'ru', 13, 0.2953, 187.25),
(8, 'ru', 15, 0.1272, 67),
(8, 'ru', 16, 0.1272, 121),
(8, 'ru', 25, 0.1272, 370),
(8, 'ru', 27, 0.1272, 82),
(8, 'ru', 29, 0.1272, 336),
(8, 'ru', 30, 0.1272, 30),
(8, 'ru', 31, 0.1272, 80),
(8, 'ru', 46, 0.2953, 159.5),
(8, 'ru', 65, 0.1272, 288),
(8, 'ru', 69, 0.1272, 51),
(8, 'ru', 75, 0.1272, 236),
(8, 'ru', 81, 0.1272, 264),
(8, 'ru', 109, 0.1272, 11),
(8, 'ru', 118, 0.2953, 156.5),
(8, 'ru', 122, 0.2953, 303),
(8, 'ru', 123, 0.1272, 145),
(8, 'ru', 125, 0.2953, 125.25),
(8, 'ru', 130, 0.1272, 327),
(8, 'ru', 132, 0.1272, 255),
(8, 'ru', 138, 0.1272, 287),
(8, 'ru', 139, 0.2015, 287),
(8, 'ru', 162, 0.1272, 243),
(8, 'ru', 163, 0.1272, 234),
(8, 'ru', 164, 0.1272, 31),
(8, 'ru', 169, 0.2015, 228),
(8, 'ru', 173, 0.1272, 266),
(8, 'ru', 180, 0.1272, 338),
(8, 'ru', 185, 0.1272, 351),
(8, 'ru', 187, 0.1272, 130),
(8, 'ru', 188, 0.1272, 252),
(8, 'ru', 194, 0.1272, 9),
(8, 'ru', 199, 0.2543, 177.667),
(8, 'ru', 209, 0.1272, 12),
(8, 'ru', 211, 0.2015, 174),
(8, 'ru', 212, 0.2015, 179),
(8, 'ru', 213, 0.1272, 154),
(8, 'ru', 217, 0.1272, 158),
(8, 'ru', 220, 0.2015, 152),
(8, 'ru', 221, 0.1272, 168),
(8, 'ru', 226, 0.1272, 10),
(8, 'ru', 227, 0.1272, 297),
(8, 'ru', 242, 0.1272, 45),
(8, 'ru', 248, 0.1272, 137),
(8, 'ru', 257, 0.2015, 265),
(8, 'ru', 272, 0.2015, 182),
(8, 'ru', 275, 0.1272, 129),
(8, 'ru', 283, 0.2015, 369),
(8, 'ru', 298, 0.1272, 295),
(8, 'ru', 300, 0.1272, 298),
(8, 'ru', 313, 0.2015, 303),
(8, 'ru', 335, 0.1272, 341),
(8, 'ru', 336, 0.2543, 331),
(8, 'ru', 338, 0.1272, 307),
(8, 'ru', 339, 0.1272, 308),
(8, 'ru', 346, 0.1272, 199),
(8, 'ru', 365, 0.1272, 90),
(8, 'ru', 375, 0.2015, 156.5),
(8, 'ru', 388, 0.2015, 329.5),
(8, 'ru', 398, 0.1272, 178),
(8, 'ru', 399, 0.1272, 52),
(8, 'ru', 418, 0.1272, 128),
(8, 'ru', 419, 0.2015, 334.5),
(8, 'ru', 420, 0.1272, 369),
(8, 'ru', 428, 0.1272, 164),
(8, 'ru', 468, 0.1272, 177),
(8, 'ru', 481, 0.1272, 1),
(8, 'ru', 482, 0.1272, 3),
(8, 'ru', 483, 0.1272, 7),
(8, 'ru', 484, 0.1272, 13),
(8, 'ru', 485, 0.1272, 14),
(8, 'ru', 486, 0.1272, 15),
(8, 'ru', 487, 0.1272, 16),
(8, 'ru', 488, 0.2953, 115.5),
(8, 'ru', 489, 0.1272, 19),
(8, 'ru', 490, 0.1272, 22),
(8, 'ru', 491, 0.1272, 29),
(8, 'ru', 492, 0.1272, 32),
(8, 'ru', 493, 0.1272, 33),
(8, 'ru', 494, 0.1272, 35),
(8, 'ru', 495, 0.2543, 171.333),
(8, 'ru', 496, 0.1272, 38),
(8, 'ru', 497, 0.2543, 237.667),
(8, 'ru', 498, 0.1272, 48),
(8, 'ru', 499, 0.1272, 50),
(8, 'ru', 500, 0.1272, 62),
(8, 'ru', 501, 0.1272, 63),
(8, 'ru', 502, 0.1272, 64),
(8, 'ru', 503, 0.1272, 65),
(8, 'ru', 504, 0.1272, 68),
(8, 'ru', 505, 0.1272, 76),
(8, 'ru', 506, 0.1272, 77),
(8, 'ru', 507, 0.1272, 78),
(8, 'ru', 508, 0.1272, 79),
(8, 'ru', 509, 0.1272, 81),
(8, 'ru', 510, 0.2015, 119.5),
(8, 'ru', 511, 0.1272, 91),
(8, 'ru', 512, 0.1272, 92),
(8, 'ru', 513, 0.1272, 93),
(8, 'ru', 514, 0.2015, 93),
(8, 'ru', 515, 0.1272, 105),
(8, 'ru', 516, 0.2543, 189.333),
(8, 'ru', 517, 0.3815, 189.143),
(8, 'ru', 518, 0.1272, 109),
(8, 'ru', 519, 0.1272, 111),
(8, 'ru', 520, 0.2543, 272),
(8, 'ru', 521, 0.2953, 208.25),
(8, 'ru', 522, 0.1272, 133),
(8, 'ru', 523, 0.1272, 134),
(8, 'ru', 524, 0.1272, 135),
(8, 'ru', 525, 0.1272, 144),
(8, 'ru', 526, 0.1272, 147),
(8, 'ru', 527, 0.1272, 153),
(8, 'ru', 528, 0.1272, 156),
(8, 'ru', 529, 0.1272, 157),
(8, 'ru', 530, 0.1272, 167),
(8, 'ru', 531, 0.1272, 175),
(8, 'ru', 532, 0.1272, 179),
(8, 'ru', 533, 0.1272, 180),
(8, 'ru', 534, 0.1272, 186),
(8, 'ru', 535, 0.2015, 235),
(8, 'ru', 536, 0.1272, 196),
(8, 'ru', 537, 0.2015, 239.5),
(8, 'ru', 538, 0.1272, 203),
(8, 'ru', 539, 0.1272, 204),
(8, 'ru', 540, 0.1272, 206),
(8, 'ru', 541, 0.2015, 291),
(8, 'ru', 542, 0.1272, 221),
(8, 'ru', 543, 0.1272, 222),
(8, 'ru', 544, 0.1272, 224),
(8, 'ru', 545, 0.1272, 225),
(8, 'ru', 546, 0.1272, 233),
(8, 'ru', 547, 0.1272, 237),
(8, 'ru', 548, 0.1272, 244),
(8, 'ru', 549, 0.1272, 250),
(8, 'ru', 550, 0.1272, 251),
(8, 'ru', 551, 0.1272, 258),
(8, 'ru', 552, 0.1272, 260),
(8, 'ru', 553, 0.1272, 261),
(8, 'ru', 554, 0.1272, 265),
(8, 'ru', 555, 0.1272, 284),
(8, 'ru', 556, 0.1272, 289),
(8, 'ru', 557, 0.1272, 306),
(8, 'ru', 558, 0.1272, 314),
(8, 'ru', 559, 0.1272, 325),
(8, 'ru', 560, 0.1272, 328),
(8, 'ru', 561, 0.1272, 331),
(8, 'ru', 562, 0.1272, 333),
(8, 'ru', 563, 0.1272, 350),
(8, 'ru', 564, 0.1272, 354),
(8, 'ru', 565, 0.1272, 361),
(8, 'ru', 566, 0.1272, 363),
(8, 'ru', 567, 0.1272, 366),
(8, 'ru', 568, 0.1272, 367),
(8, 'ru', 569, 0.1272, 377),
(8, 'ru', 570, 0.1272, 378),
(8, 'ru', 571, 0.2015, 383.5),
(8, 'ru', 572, 0.1272, 384),
(8, 'ru', 573, 0.1272, 385),
(8, 'ru', 574, 0.1272, 387),
(8, 'ru', 575, 0.1272, 389),
(9, 'ru', 46, 0.2314, 1),
(10, 'ru', 593, 0.1879, 48),
(10, 'ru', 598, 0.1879, 51),
(10, 'ru', 1060, 0.1879, 14),
(10, 'ru', 1381, 0.1879, 1),
(10, 'ru', 1601, 0.1879, 60),
(10, 'ru', 1615, 0.1879, 63),
(10, 'ru', 1670, 0.1879, 52),
(10, 'ru', 1760, 0.2978, 6),
(10, 'ru', 1761, 0.1879, 3),
(10, 'ru', 1762, 0.1879, 4),
(10, 'ru', 1763, 0.1879, 5),
(10, 'ru', 1764, 0.1879, 6),
(10, 'ru', 1765, 0.1879, 7),
(10, 'ru', 1766, 0.1879, 8),
(10, 'ru', 1767, 0.1879, 9),
(10, 'ru', 1768, 0.1879, 11),
(10, 'ru', 1769, 0.1879, 22),
(10, 'ru', 1791, 0.1879, 59),
(10, 'ru', 1792, 0.1879, 61),
(10, 'ru', 1793, 0.1879, 62),
(10, 'ru', 1794, 0.1879, 64),
(10, 'ru', 1795, 0.1879, 65),
(10, 'ru', 1796, 0.1879, 66),
(10, 'ru', 1797, 0.1879, 67),
(10, 'ru', 1798, 0.1879, 68),
(10, 'ru', 1852, 0.1879, 32),
(10, 'ru', 1882, 0.1879, 12),
(10, 'ru', 1883, 0.1879, 13),
(10, 'ru', 1884, 0.1879, 15),
(10, 'ru', 1885, 0.1879, 16),
(10, 'ru', 1886, 0.1879, 23),
(10, 'ru', 1887, 0.1879, 24),
(10, 'ru', 1888, 0.1879, 25),
(10, 'ru', 1889, 0.1879, 31),
(10, 'ru', 1890, 0.1879, 39),
(10, 'ru', 1891, 0.1879, 45),
(10, 'ru', 1892, 0.1879, 46),
(10, 'ru', 1893, 0.1879, 49),
(10, 'ru', 1894, 0.1879, 50),
(11, 'ru', 4, 0.2314, 3),
(11, 'ru', 26, 0.2314, 16),
(11, 'ru', 387, 0.2314, 7),
(11, 'ru', 606, 0.2314, 1),
(11, 'ru', 607, 0.2314, 5),
(11, 'ru', 608, 0.2314, 8),
(11, 'ru', 609, 0.2314, 14),
(11, 'ru', 610, 0.2314, 17),
(12, 'ru', 1381, 0.2314, 1),
(12, 'ru', 1382, 0.2314, 2),
(12, 'ru', 1383, 0.2314, 3),
(13, 'ru', 1, 0.1679, 99),
(13, 'ru', 5, 0.39, 17.75),
(13, 'ru', 6, 0.39, 64.75),
(13, 'ru', 7, 0.1679, 5),
(13, 'ru', 8, 0.1679, 7),
(13, 'ru', 9, 0.1679, 8),
(13, 'ru', 10, 0.1679, 10),
(13, 'ru', 11, 0.1679, 11),
(13, 'ru', 12, 0.1679, 19),
(13, 'ru', 13, 0.3359, 21.3333),
(13, 'ru', 14, 0.1679, 22),
(13, 'ru', 15, 0.1679, 23),
(13, 'ru', 16, 0.1679, 24),
(13, 'ru', 17, 0.1679, 26),
(13, 'ru', 18, 0.1679, 27),
(13, 'ru', 19, 0.1679, 28),
(13, 'ru', 20, 0.2662, 54.5),
(13, 'ru', 21, 0.1679, 32),
(13, 'ru', 22, 0.1679, 33),
(13, 'ru', 23, 0.1679, 34),
(13, 'ru', 24, 0.2662, 41),
(13, 'ru', 25, 0.1679, 37),
(13, 'ru', 28, 0.2662, 81),
(13, 'ru', 29, 0.1679, 88),
(13, 'ru', 44, 0.2662, 70.5),
(13, 'ru', 46, 0.2662, 80),
(13, 'ru', 65, 0.1679, 60),
(13, 'ru', 121, 0.1679, 45),
(13, 'ru', 125, 0.1679, 61),
(13, 'ru', 140, 0.2662, 69.5),
(13, 'ru', 169, 0.1679, 56),
(13, 'ru', 170, 0.1679, 49),
(13, 'ru', 187, 0.1679, 46),
(13, 'ru', 188, 0.1679, 50),
(13, 'ru', 189, 0.1679, 52),
(13, 'ru', 190, 0.1679, 53),
(13, 'ru', 191, 0.1679, 54),
(13, 'ru', 192, 0.1679, 55),
(13, 'ru', 193, 0.1679, 69),
(13, 'ru', 194, 0.1679, 70),
(13, 'ru', 195, 0.1679, 71),
(13, 'ru', 196, 0.1679, 73),
(13, 'ru', 197, 0.1679, 76),
(13, 'ru', 198, 0.1679, 80),
(13, 'ru', 199, 0.1679, 83),
(13, 'ru', 200, 0.1679, 84),
(13, 'ru', 201, 0.1679, 85),
(13, 'ru', 202, 0.1679, 90),
(50, 'ru', 1266, 0.3372, 21),
(50, 'ru', 1471, 0.1686, 3),
(50, 'ru', 1535, 0.1686, 8),
(50, 'ru', 1538, 0.1686, 7),
(50, 'ru', 1540, 0.1686, 9),
(50, 'ru', 1541, 0.2672, 34),
(50, 'ru', 1542, 0.1686, 13),
(50, 'ru', 1543, 0.1686, 14),
(50, 'ru', 1544, 0.1686, 15),
(50, 'ru', 1545, 0.1686, 16),
(50, 'ru', 1546, 0.2672, 30),
(50, 'ru', 1547, 0.2672, 43),
(50, 'ru', 1548, 0.1686, 19),
(50, 'ru', 1549, 0.1686, 20),
(50, 'ru', 1550, 0.1686, 21),
(50, 'ru', 1551, 0.2672, 48.5),
(50, 'ru', 1552, 0.1686, 23),
(50, 'ru', 1553, 0.1686, 24),
(50, 'ru', 1554, 0.1686, 25),
(50, 'ru', 1555, 0.1686, 26),
(50, 'ru', 1556, 0.1686, 27),
(50, 'ru', 1557, 0.1686, 28),
(50, 'ru', 1558, 0.2672, 55),
(50, 'ru', 1559, 0.1686, 30),
(50, 'ru', 1560, 0.1686, 31),
(50, 'ru', 1561, 0.1686, 32),
(50, 'ru', 1562, 0.1686, 33),
(50, 'ru', 1563, 0.1686, 34),
(50, 'ru', 1564, 0.1686, 35),
(50, 'ru', 1565, 0.1686, 36),
(50, 'ru', 1566, 0.1686, 42),
(50, 'ru', 1567, 0.2672, 61),
(50, 'ru', 1568, 0.1686, 46),
(50, 'ru', 1569, 0.1686, 52),
(50, 'ru', 1570, 0.1686, 53),
(50, 'ru', 1571, 0.1686, 54),
(50, 'ru', 1572, 0.1686, 55),
(50, 'ru', 1573, 0.1686, 56),
(50, 'ru', 1574, 0.1686, 58),
(50, 'ru', 1575, 0.1686, 64),
(50, 'ru', 1576, 0.1686, 65),
(50, 'ru', 1577, 0.1686, 66),
(50, 'ru', 1578, 0.1686, 67),
(50, 'ru', 1579, 0.1686, 71),
(50, 'ru', 1580, 0.1686, 72),
(50, 'ru', 1581, 0.1686, 73),
(50, 'ru', 1582, 0.1686, 74),
(50, 'ru', 1583, 0.1686, 76),
(50, 'ru', 1584, 0.1686, 77),
(50, 'ru', 1585, 0.1686, 79),
(50, 'ru', 1586, 0.1686, 80),
(50, 'ru', 2025, 0.1686, 2),
(50, 'ru', 2765, 0.1686, 1),
(52, 'ru', 1384, 0.2314, 4),
(52, 'ru', 1385, 0.2314, 5),
(52, 'ru', 1386, 0.2314, 6),
(52, 'ru', 1390, 0.2314, 16),
(52, 'ru', 1769, 0.2314, 7),
(52, 'ru', 1770, 0.2314, 8),
(52, 'ru', 1784, 0.2314, 14),
(52, 'ru', 1785, 0.2314, 15),
(52, 'ru', 1871, 0.2314, 1),
(52, 'ru', 1903, 0.2314, 3),
(52, 'ru', 2766, 0.2314, 2),
(53, 'ru', 1381, 0.2314, 1),
(54, 'ru', 1559, 0.3667, 1.5),
(54, 'ru', 1560, 0.2314, 3),
(54, 'ru', 1561, 0.2314, 4),
(55, 'ru', 1509, 0.2642, 30.5),
(55, 'ru', 1510, 0.2642, 31.5),
(55, 'ru', 1520, 0.2642, 72.5),
(55, 'ru', 1521, 0.387, 53.5),
(55, 'ru', 1523, 0.2642, 34.5),
(55, 'ru', 1532, 0.2642, 71.5),
(55, 'ru', 1533, 0.2642, 73.5),
(55, 'ru', 1534, 0.2642, 75.5),
(55, 'ru', 1541, 0.2642, 47.5),
(55, 'ru', 1601, 0.2642, 64.5),
(55, 'ru', 1615, 0.2642, 60.5),
(55, 'ru', 1685, 0.2642, 33.5),
(55, 'ru', 1767, 0.2642, 57.5),
(55, 'ru', 1775, 0.2642, 40.5),
(55, 'ru', 1776, 0.3333, 32.3333),
(55, 'ru', 1852, 0.2642, 49.5),
(55, 'ru', 1896, 0.1667, 1),
(55, 'ru', 1897, 0.1667, 2),
(55, 'ru', 1898, 0.1667, 3),
(55, 'ru', 1900, 0.2642, 35.5),
(55, 'ru', 1901, 0.2642, 36.5),
(55, 'ru', 1902, 0.2642, 37.5),
(55, 'ru', 1903, 0.2642, 38.5),
(55, 'ru', 1904, 0.2642, 39.5),
(55, 'ru', 1908, 0.2642, 58.5),
(55, 'ru', 1909, 0.2642, 59.5),
(55, 'ru', 1910, 0.2642, 62.5),
(55, 'ru', 1915, 0.2642, 48.5),
(55, 'ru', 1916, 0.2642, 50.5),
(55, 'ru', 1917, 0.2642, 51.5),
(55, 'ru', 1918, 0.2642, 63.5),
(55, 'ru', 1919, 0.2642, 65.5),
(56, 'ru', 1384, 0.3274, 37.3333),
(56, 'ru', 1509, 0.2595, 33.5),
(56, 'ru', 1510, 0.2595, 34.5),
(56, 'ru', 1512, 0.3274, 35.6667),
(56, 'ru', 1520, 0.2595, 75.5),
(56, 'ru', 1521, 0.3801, 56.5),
(56, 'ru', 1523, 0.2595, 37.5),
(56, 'ru', 1532, 0.2595, 74.5),
(56, 'ru', 1533, 0.2595, 76.5),
(56, 'ru', 1534, 0.2595, 78.5),
(56, 'ru', 1615, 0.2595, 64.5),
(56, 'ru', 1685, 0.2595, 36.5),
(56, 'ru', 1767, 0.2595, 61.5),
(56, 'ru', 1775, 0.2595, 43.5),
(56, 'ru', 1896, 0.1637, 1),
(56, 'ru', 1897, 0.1637, 2),
(56, 'ru', 1898, 0.1637, 3),
(56, 'ru', 1900, 0.2595, 38.5),
(56, 'ru', 1901, 0.2595, 39.5),
(56, 'ru', 1902, 0.2595, 40.5),
(56, 'ru', 1903, 0.2595, 41.5),
(56, 'ru', 1904, 0.2595, 42.5),
(56, 'ru', 1905, 0.2595, 52.5),
(56, 'ru', 1908, 0.2595, 62.5),
(56, 'ru', 1909, 0.2595, 63.5),
(56, 'ru', 1910, 0.2595, 66.5),
(56, 'ru', 1920, 0.3274, 38.3333),
(56, 'ru', 1921, 0.3274, 39.3333),
(56, 'ru', 1922, 0.2595, 49.5),
(56, 'ru', 1923, 0.2595, 50.5),
(56, 'ru', 1924, 0.2595, 65.5),
(56, 'ru', 1925, 0.2595, 67.5),
(56, 'ru', 1926, 0.2595, 68.5),
(57, 'ru', 1384, 0.3297, 36.6667),
(57, 'ru', 1509, 0.2613, 33.5),
(57, 'ru', 1510, 0.2613, 34.5),
(57, 'ru', 1512, 0.3297, 35),
(57, 'ru', 1520, 0.2613, 75.5),
(57, 'ru', 1521, 0.3828, 56.5),
(57, 'ru', 1523, 0.2613, 37.5),
(57, 'ru', 1532, 0.2613, 74.5),
(57, 'ru', 1533, 0.2613, 76.5),
(57, 'ru', 1534, 0.2613, 78.5),
(57, 'ru', 1601, 0.2613, 67.5),
(57, 'ru', 1615, 0.2613, 63.5),
(57, 'ru', 1685, 0.2613, 36.5),
(57, 'ru', 1767, 0.2613, 60.5),
(57, 'ru', 1775, 0.2613, 43.5),
(57, 'ru', 1896, 0.1649, 1),
(57, 'ru', 1897, 0.1649, 2),
(57, 'ru', 1898, 0.1649, 3),
(57, 'ru', 1900, 0.2613, 38.5),
(57, 'ru', 1901, 0.2613, 39.5),
(57, 'ru', 1902, 0.2613, 40.5),
(57, 'ru', 1903, 0.2613, 41.5),
(57, 'ru', 1904, 0.2613, 42.5),
(57, 'ru', 1905, 0.2613, 51.5),
(57, 'ru', 1908, 0.2613, 61.5),
(57, 'ru', 1909, 0.2613, 62.5),
(57, 'ru', 1910, 0.2613, 65.5),
(57, 'ru', 1918, 0.2613, 66.5),
(57, 'ru', 1919, 0.2613, 68.5),
(57, 'ru', 2689, 0.3297, 37.6667),
(57, 'ru', 2690, 0.3297, 38.6667),
(57, 'ru', 2691, 0.2613, 49.5),
(58, 'ru', 1384, 0.3321, 36.3333),
(58, 'ru', 1509, 0.2632, 33),
(58, 'ru', 1510, 0.2632, 34),
(58, 'ru', 1512, 0.3321, 34.6667),
(58, 'ru', 1520, 0.2632, 74),
(58, 'ru', 1521, 0.3856, 55.5),
(58, 'ru', 1523, 0.2632, 37),
(58, 'ru', 1532, 0.2632, 73),
(58, 'ru', 1533, 0.2632, 75),
(58, 'ru', 1534, 0.2632, 77),
(58, 'ru', 1615, 0.2632, 63),
(58, 'ru', 1685, 0.2632, 36),
(58, 'ru', 1767, 0.2632, 60),
(58, 'ru', 1775, 0.2632, 43),
(58, 'ru', 1896, 0.166, 1),
(58, 'ru', 1897, 0.166, 2),
(58, 'ru', 1898, 0.166, 3),
(58, 'ru', 1900, 0.2632, 38),
(58, 'ru', 1901, 0.2632, 39),
(58, 'ru', 1902, 0.2632, 40),
(58, 'ru', 1903, 0.2632, 41),
(58, 'ru', 1904, 0.2632, 42),
(58, 'ru', 1905, 0.2632, 51),
(58, 'ru', 1908, 0.2632, 61),
(58, 'ru', 1909, 0.2632, 62),
(58, 'ru', 1910, 0.2632, 65),
(58, 'ru', 1930, 0.3321, 37.3333),
(58, 'ru', 1931, 0.3321, 38.3333),
(58, 'ru', 1932, 0.2632, 49),
(58, 'ru', 1933, 0.2632, 66),
(58, 'ru', 1934, 0.2632, 67),
(59, 'ru', 1471, 0.2853, 34),
(59, 'ru', 1509, 0.2853, 20),
(59, 'ru', 1510, 0.2853, 21),
(59, 'ru', 1512, 0.2853, 44),
(59, 'ru', 1521, 0.2853, 22),
(59, 'ru', 1626, 0.2853, 24),
(59, 'ru', 1652, 0.2853, 29),
(59, 'ru', 1682, 0.18, 1),
(59, 'ru', 1683, 0.18, 2),
(59, 'ru', 1684, 0.18, 3),
(59, 'ru', 1685, 0.2853, 23),
(59, 'ru', 1686, 0.2853, 25),
(59, 'ru', 1687, 0.2853, 26),
(59, 'ru', 1688, 0.2853, 27),
(59, 'ru', 1689, 0.2853, 28),
(59, 'ru', 1690, 0.2853, 30),
(59, 'ru', 1691, 0.2853, 31),
(59, 'ru', 1692, 0.2853, 32),
(59, 'ru', 1693, 0.2853, 33),
(59, 'ru', 1694, 0.2853, 35),
(59, 'ru', 1695, 0.2853, 36),
(59, 'ru', 1696, 0.2853, 37),
(59, 'ru', 1697, 0.2853, 43),
(59, 'ru', 1698, 0.2853, 45),
(59, 'ru', 1699, 0.2853, 46),
(60, 'ru', 1481, 0.2978, 31),
(60, 'ru', 1509, 0.2978, 14),
(60, 'ru', 1510, 0.2978, 15),
(60, 'ru', 1512, 0.3758, 16.3333),
(60, 'ru', 1519, 0.1879, 2),
(60, 'ru', 1529, 0.3758, 18),
(60, 'ru', 1548, 0.4363, 23.5),
(60, 'ru', 1622, 0.2978, 18),
(60, 'ru', 1686, 0.2978, 16),
(60, 'ru', 1848, 0.2978, 24),
(60, 'ru', 1850, 0.2978, 29),
(60, 'ru', 1935, 0.1879, 1),
(60, 'ru', 1936, 0.2978, 19),
(60, 'ru', 1937, 0.2978, 20),
(60, 'ru', 1938, 0.2978, 21),
(60, 'ru', 1939, 0.2978, 22),
(60, 'ru', 1940, 0.2978, 26),
(60, 'ru', 1941, 0.2978, 27),
(60, 'ru', 1942, 0.2978, 28),
(61, 'ru', 1471, 0.2742, 35),
(61, 'ru', 1482, 0.3459, 27.6667),
(61, 'ru', 1483, 0.3459, 28.6667),
(61, 'ru', 1484, 0.3459, 20.3333),
(61, 'ru', 1485, 0.2742, 25),
(61, 'ru', 1486, 0.2742, 27),
(61, 'ru', 1509, 0.2742, 22),
(61, 'ru', 1510, 0.2742, 23),
(61, 'ru', 1541, 0.2742, 26),
(61, 'ru', 1601, 0.2742, 24),
(61, 'ru', 1615, 0.2742, 36),
(61, 'ru', 1684, 0.2742, 40),
(61, 'ru', 2034, 0.2742, 32),
(61, 'ru', 2148, 0.2742, 30),
(61, 'ru', 2573, 0.2742, 50),
(61, 'ru', 2678, 0.2742, 28),
(61, 'ru', 2679, 0.2742, 31),
(61, 'ru', 2680, 0.2742, 33),
(61, 'ru', 2681, 0.2742, 34),
(61, 'ru', 2682, 0.2742, 37),
(61, 'ru', 2683, 0.2742, 38),
(61, 'ru', 2684, 0.2742, 39),
(61, 'ru', 2685, 0.2742, 48),
(61, 'ru', 2686, 0.2742, 49),
(61, 'ru', 2687, 0.2742, 51),
(61, 'ru', 2688, 0.2742, 52),
(62, 'ru', 6, 0.2604, 69.5),
(62, 'ru', 11, 0.2604, 56.5),
(62, 'ru', 14, 0.3814, 61.5),
(62, 'ru', 31, 0.2604, 70.5),
(62, 'ru', 34, 0.2604, 53.5),
(62, 'ru', 264, 0.2604, 71.5),
(62, 'ru', 397, 0.2604, 40.5),
(62, 'ru', 466, 0.2604, 87.5),
(62, 'ru', 715, 0.2604, 73.5),
(62, 'ru', 716, 0.3814, 89),
(62, 'ru', 1067, 0.2604, 58.5),
(62, 'ru', 1082, 0.2604, 89.5),
(62, 'ru', 1271, 0.4246, 59),
(62, 'ru', 1308, 0.1643, 3),
(62, 'ru', 1370, 0.4612, 56.8333),
(62, 'ru', 1371, 0.2604, 100.5),
(62, 'ru', 1454, 0.2604, 38.5),
(62, 'ru', 1491, 0.2604, 42.5),
(62, 'ru', 1492, 0.3814, 46.5),
(62, 'ru', 1493, 0.2604, 47.5),
(62, 'ru', 1494, 0.2604, 51.5),
(62, 'ru', 1495, 0.2604, 59.5),
(62, 'ru', 1496, 0.2604, 60.5),
(62, 'ru', 1497, 0.2604, 68.5),
(62, 'ru', 1498, 0.2604, 72.5),
(62, 'ru', 1499, 0.2604, 91.5),
(62, 'ru', 1500, 0.2604, 92.5),
(62, 'ru', 1501, 0.2604, 99.5),
(63, 'ru', 1509, 0.2595, 33),
(63, 'ru', 1510, 0.2595, 34),
(63, 'ru', 1512, 0.2595, 50),
(63, 'ru', 1520, 0.2595, 78),
(63, 'ru', 1521, 0.3801, 57.5),
(63, 'ru', 1523, 0.2595, 37),
(63, 'ru', 1527, 0.2595, 67),
(63, 'ru', 1532, 0.2595, 77),
(63, 'ru', 1533, 0.2595, 79),
(63, 'ru', 1534, 0.2595, 81),
(63, 'ru', 1615, 0.3274, 42.6667),
(63, 'ru', 1685, 0.2595, 36),
(63, 'ru', 1767, 0.2595, 59),
(63, 'ru', 1771, 0.2595, 49),
(63, 'ru', 1775, 0.2595, 43),
(63, 'ru', 1896, 0.1637, 1),
(63, 'ru', 1897, 0.1637, 2),
(63, 'ru', 1898, 0.1637, 3),
(63, 'ru', 1899, 0.1637, 5),
(63, 'ru', 1900, 0.2595, 38),
(63, 'ru', 1901, 0.2595, 39),
(63, 'ru', 1902, 0.2595, 40),
(63, 'ru', 1903, 0.2595, 41),
(63, 'ru', 1904, 0.3801, 53.5),
(63, 'ru', 1905, 0.2595, 51),
(63, 'ru', 1906, 0.2595, 52),
(63, 'ru', 1907, 0.2595, 53),
(63, 'ru', 1908, 0.2595, 60),
(63, 'ru', 1909, 0.2595, 61),
(63, 'ru', 1910, 0.2595, 64),
(63, 'ru', 1911, 0.2595, 66),
(63, 'ru', 1912, 0.2595, 68),
(63, 'ru', 1913, 0.2595, 70),
(63, 'ru', 1914, 0.2595, 71),
(66, 'ru', 108, 0.1843, 1),
(66, 'ru', 118, 0.1843, 2),
(66, 'ru', 1263, 0.2921, 34),
(66, 'ru', 1535, 0.1843, 23),
(66, 'ru', 1596, 0.1843, 5),
(66, 'ru', 1601, 0.1843, 56),
(66, 'ru', 1606, 0.1843, 3),
(66, 'ru', 1641, 0.1843, 40),
(66, 'ru', 1746, 0.1843, 20),
(66, 'ru', 1816, 0.1843, 4),
(66, 'ru', 1903, 0.2921, 30),
(66, 'ru', 2099, 0.1843, 18),
(66, 'ru', 2692, 0.1843, 6),
(66, 'ru', 2693, 0.1843, 7),
(66, 'ru', 2694, 0.1843, 8),
(66, 'ru', 2695, 0.1843, 9),
(66, 'ru', 2696, 0.1843, 10),
(66, 'ru', 2697, 0.1843, 11),
(66, 'ru', 2698, 0.1843, 17),
(66, 'ru', 2699, 0.1843, 19),
(66, 'ru', 2700, 0.1843, 21),
(66, 'ru', 2702, 0.1843, 24),
(66, 'ru', 2703, 0.3686, 39),
(66, 'ru', 2704, 0.1843, 26),
(66, 'ru', 2705, 0.2921, 40),
(66, 'ru', 2706, 0.2921, 41),
(66, 'ru', 2707, 0.2921, 42),
(66, 'ru', 2708, 0.2921, 43),
(66, 'ru', 2709, 0.1843, 37),
(66, 'ru', 2710, 0.1843, 51),
(66, 'ru', 2711, 0.1843, 52),
(66, 'ru', 2712, 0.1843, 54),
(66, 'ru', 2713, 0.1843, 55),
(66, 'ru', 2714, 0.1843, 57),
(66, 'ru', 2715, 0.1843, 58),
(67, 'ru', 1293, 0.1654, 1),
(67, 'ru', 1447, 0.2622, 45.5),
(67, 'ru', 1512, 0.1654, 16),
(67, 'ru', 1541, 0.2622, 37),
(67, 'ru', 1548, 0.5931, 38),
(67, 'ru', 1558, 0.1654, 2),
(67, 'ru', 1613, 0.1654, 18),
(67, 'ru', 1615, 0.1654, 62),
(67, 'ru', 1901, 0.1654, 63),
(67, 'ru', 1903, 0.3841, 42),
(67, 'ru', 1929, 0.1654, 53),
(67, 'ru', 2458, 0.1654, 12),
(67, 'ru', 2560, 0.1654, 49),
(67, 'ru', 2620, 0.1654, 55),
(67, 'ru', 2710, 0.1654, 26),
(67, 'ru', 2716, 0.2622, 4.5),
(67, 'ru', 2719, 0.1654, 8),
(67, 'ru', 2720, 0.1654, 9),
(67, 'ru', 2721, 0.1654, 10),
(67, 'ru', 2722, 0.1654, 11),
(67, 'ru', 2724, 0.1654, 17),
(67, 'ru', 2725, 0.1654, 19),
(67, 'ru', 2726, 0.1654, 21),
(67, 'ru', 2727, 0.1654, 22),
(67, 'ru', 2728, 0.1654, 23),
(67, 'ru', 2729, 0.1654, 27),
(67, 'ru', 2731, 0.1654, 31),
(67, 'ru', 2732, 0.1654, 37),
(67, 'ru', 2733, 0.2622, 41),
(67, 'ru', 2734, 0.1654, 42),
(67, 'ru', 2735, 0.1654, 43),
(67, 'ru', 2736, 0.1654, 45),
(67, 'ru', 2737, 0.1654, 47),
(67, 'ru', 2738, 0.1654, 48),
(67, 'ru', 2739, 0.2622, 46.5),
(67, 'ru', 2740, 0.1654, 54),
(67, 'ru', 2741, 0.1654, 60),
(67, 'ru', 2742, 0.1654, 61),
(67, 'ru', 2743, 0.1654, 64),
(67, 'ru', 2746, 0.2622, 62.5),
(67, 'ru', 2747, 0.1654, 68),
(67, 'ru', 2748, 0.1654, 70),
(67, 'ru', 2762, 0.2622, 10),
(67, 'ru', 2763, 0.2622, 27.5),
(67, 'ru', 2764, 0.1654, 57),
(68, 'ru', 697, 0.2058, 26),
(68, 'ru', 1308, 0.2058, 1),
(68, 'ru', 1312, 0.2058, 9),
(68, 'ru', 1315, 0.2058, 33),
(68, 'ru', 1568, 0.2058, 40),
(68, 'ru', 1615, 0.2058, 6),
(68, 'ru', 1641, 0.4117, 25.3333),
(68, 'ru', 1775, 0.2058, 16),
(68, 'ru', 1896, 0.2058, 17),
(68, 'ru', 2024, 0.2058, 30),
(68, 'ru', 2704, 0.3263, 6),
(68, 'ru', 2743, 0.3263, 24.5),
(68, 'ru', 2749, 0.2058, 2),
(68, 'ru', 2750, 0.2058, 3),
(68, 'ru', 2751, 0.2058, 5),
(68, 'ru', 2752, 0.2058, 7),
(68, 'ru', 2753, 0.2058, 10),
(68, 'ru', 2754, 0.2058, 21),
(68, 'ru', 2755, 0.2058, 22),
(68, 'ru', 2756, 0.2058, 23),
(68, 'ru', 2757, 0.2058, 24),
(68, 'ru', 2758, 0.2058, 27),
(68, 'ru', 2759, 0.2058, 28),
(68, 'ru', 2760, 0.2058, 29),
(68, 'ru', 2761, 0.2058, 34),
(69, 'ru', 1384, 0.2314, 1),
(69, 'ru', 1385, 0.2314, 2),
(69, 'ru', 1386, 0.2314, 3),
(70, 'ru', 1099, 0.2314, 3),
(70, 'ru', 1384, 0.2314, 1),
(70, 'ru', 1401, 0.2314, 2),
(71, 'ru', 286, 0.2314, 1),
(71, 'ru', 1099, 0.2314, 2),
(71, 'ru', 1369, 0.2314, 4),
(71, 'ru', 1396, 0.2314, 3),
(71, 'ru', 1397, 0.2314, 5),
(72, 'ru', 1404, 0.2314, 7),
(74, 'ru', 1372, 0.1339, 1),
(74, 'ru', 1437, 0.1339, 3),
(74, 'ru', 1512, 0.4245, 101.875),
(74, 'ru', 1520, 0.1339, 12),
(74, 'ru', 1524, 0.1339, 23),
(74, 'ru', 1526, 0.2122, 189),
(74, 'ru', 1527, 0.2122, 116.5),
(74, 'ru', 1529, 0.1339, 127),
(74, 'ru', 1533, 0.2122, 136.5),
(74, 'ru', 1538, 0.1339, 2),
(74, 'ru', 1541, 0.1339, 79),
(74, 'ru', 1548, 0.3109, 83.5),
(74, 'ru', 1558, 0.1339, 144),
(74, 'ru', 1564, 0.1339, 187),
(74, 'ru', 1567, 0.1339, 183),
(74, 'ru', 1583, 0.2122, 110.5),
(74, 'ru', 1601, 0.3462, 130.8),
(74, 'ru', 1614, 0.2122, 129),
(74, 'ru', 1615, 0.2122, 102.5),
(74, 'ru', 1626, 0.1339, 41),
(74, 'ru', 1636, 0.2678, 140.667),
(74, 'ru', 1687, 0.1339, 62),
(74, 'ru', 1716, 0.1339, 70),
(74, 'ru', 1717, 0.3109, 147.25),
(74, 'ru', 1718, 0.2122, 89),
(74, 'ru', 1732, 0.1339, 180),
(74, 'ru', 1733, 0.1339, 91),
(74, 'ru', 1738, 0.2122, 143.5),
(74, 'ru', 1815, 0.1339, 218),
(74, 'ru', 1816, 0.1339, 13),
(74, 'ru', 1817, 0.1339, 224),
(74, 'ru', 1818, 0.1339, 225),
(74, 'ru', 1820, 0.2678, 94),
(74, 'ru', 1836, 0.1339, 69),
(74, 'ru', 1840, 0.1339, 76),
(74, 'ru', 1841, 0.2122, 25),
(74, 'ru', 1847, 0.1339, 150),
(74, 'ru', 1849, 0.1339, 52),
(74, 'ru', 1850, 0.2678, 81.3333),
(74, 'ru', 1852, 0.2678, 191),
(74, 'ru', 1853, 0.1339, 226),
(74, 'ru', 1854, 0.1339, 228),
(74, 'ru', 1860, 0.1339, 14),
(74, 'ru', 1866, 0.1339, 116),
(74, 'ru', 1873, 0.1339, 133),
(74, 'ru', 1903, 0.1339, 143),
(74, 'ru', 1915, 0.1339, 80),
(74, 'ru', 1929, 0.1339, 5),
(74, 'ru', 1940, 0.1339, 167),
(74, 'ru', 1969, 0.1339, 179),
(74, 'ru', 1971, 0.1339, 58),
(74, 'ru', 1994, 0.2122, 112),
(74, 'ru', 2003, 0.1339, 178),
(74, 'ru', 2025, 0.1339, 27),
(74, 'ru', 2028, 0.1339, 154),
(74, 'ru', 2039, 0.2122, 134),
(74, 'ru', 2040, 0.1339, 164),
(74, 'ru', 2045, 0.1339, 155),
(74, 'ru', 2069, 0.1339, 121),
(74, 'ru', 2073, 0.1339, 25),
(74, 'ru', 2086, 0.1339, 88),
(74, 'ru', 2088, 0.1339, 115),
(74, 'ru', 2098, 0.1339, 126),
(74, 'ru', 2113, 0.1339, 86),
(74, 'ru', 2117, 0.1339, 166),
(74, 'ru', 2119, 0.1339, 169),
(74, 'ru', 2123, 0.1339, 28),
(74, 'ru', 2125, 0.1339, 75),
(74, 'ru', 2145, 0.2122, 48),
(74, 'ru', 2151, 0.1339, 6),
(74, 'ru', 2157, 0.1339, 101),
(74, 'ru', 2158, 0.2122, 108),
(74, 'ru', 2159, 0.1339, 103),
(74, 'ru', 2160, 0.1339, 63),
(74, 'ru', 2164, 0.1339, 117),
(74, 'ru', 2178, 0.1339, 108),
(74, 'ru', 2226, 0.1339, 87),
(74, 'ru', 2239, 0.2678, 115),
(74, 'ru', 2262, 0.1339, 7),
(74, 'ru', 2289, 0.1339, 191),
(74, 'ru', 2311, 0.1339, 211),
(74, 'ru', 2359, 0.1339, 120),
(74, 'ru', 2374, 0.1339, 4),
(74, 'ru', 2375, 0.1339, 8),
(74, 'ru', 2376, 0.1339, 10),
(74, 'ru', 2377, 0.1339, 11),
(74, 'ru', 2378, 0.1339, 34),
(74, 'ru', 2379, 0.1339, 40),
(74, 'ru', 2380, 0.1339, 42),
(74, 'ru', 2382, 0.1339, 44),
(74, 'ru', 2383, 0.1339, 50),
(74, 'ru', 2384, 0.1339, 53),
(74, 'ru', 2385, 0.1339, 55),
(74, 'ru', 2386, 0.1339, 59),
(74, 'ru', 2387, 0.1339, 60),
(74, 'ru', 2388, 0.1339, 61),
(74, 'ru', 2389, 0.1339, 71),
(74, 'ru', 2390, 0.1339, 72),
(74, 'ru', 2391, 0.1339, 74),
(74, 'ru', 2392, 0.1339, 78),
(74, 'ru', 2393, 0.1339, 82),
(74, 'ru', 2394, 0.1339, 85),
(74, 'ru', 2395, 0.1339, 89),
(74, 'ru', 2396, 0.1339, 90),
(74, 'ru', 2397, 0.1339, 92),
(74, 'ru', 2398, 0.1339, 93),
(74, 'ru', 2399, 0.1339, 94),
(74, 'ru', 2400, 0.1339, 95),
(74, 'ru', 2401, 0.1339, 107),
(74, 'ru', 2402, 0.1339, 109),
(74, 'ru', 2403, 0.1339, 111),
(74, 'ru', 2404, 0.1339, 113),
(74, 'ru', 2405, 0.1339, 118),
(74, 'ru', 2406, 0.1339, 122),
(74, 'ru', 2407, 0.1339, 123),
(74, 'ru', 2408, 0.1339, 125),
(74, 'ru', 2409, 0.1339, 135),
(74, 'ru', 2410, 0.1339, 136),
(74, 'ru', 2411, 0.1339, 139),
(74, 'ru', 2412, 0.1339, 140),
(74, 'ru', 2413, 0.1339, 141),
(74, 'ru', 2414, 0.1339, 156),
(74, 'ru', 2415, 0.1339, 161),
(74, 'ru', 2416, 0.1339, 163),
(74, 'ru', 2417, 0.1339, 171),
(74, 'ru', 2418, 0.1339, 177),
(74, 'ru', 2419, 0.1339, 182),
(74, 'ru', 2420, 0.1339, 184),
(74, 'ru', 2421, 0.1339, 188),
(74, 'ru', 2422, 0.1339, 189),
(74, 'ru', 2423, 0.1339, 203),
(74, 'ru', 2424, 0.1339, 206),
(74, 'ru', 2425, 0.1339, 207),
(74, 'ru', 2426, 0.1339, 208),
(74, 'ru', 2427, 0.1339, 210),
(74, 'ru', 2428, 0.1339, 212),
(74, 'ru', 2769, 0.1339, 43),
(75, 'ru', 1435, 0.1351, 1),
(75, 'ru', 1436, 0.1351, 3),
(75, 'ru', 1512, 0.4283, 86.25),
(75, 'ru', 1520, 0.2142, 105),
(75, 'ru', 1526, 0.1351, 205),
(75, 'ru', 1527, 0.2702, 140.333),
(75, 'ru', 1533, 0.2142, 119.5),
(75, 'ru', 1534, 0.2142, 165.5),
(75, 'ru', 1547, 0.1351, 53),
(75, 'ru', 1548, 0.3493, 145),
(75, 'ru', 1564, 0.2142, 130),
(75, 'ru', 1571, 0.2142, 114),
(75, 'ru', 1583, 0.1351, 71),
(75, 'ru', 1597, 0.1351, 9),
(75, 'ru', 1601, 0.2142, 84.5),
(75, 'ru', 1606, 0.2702, 72.6667),
(75, 'ru', 1614, 0.2702, 107.667),
(75, 'ru', 1615, 0.2142, 68),
(75, 'ru', 1626, 0.2142, 28.5),
(75, 'ru', 1636, 0.1351, 26),
(75, 'ru', 1643, 0.1351, 117),
(75, 'ru', 1656, 0.1351, 169),
(75, 'ru', 1706, 0.1351, 2),
(75, 'ru', 1715, 0.1351, 12),
(75, 'ru', 1733, 0.1351, 90),
(75, 'ru', 1813, 0.1351, 216),
(75, 'ru', 1814, 0.1351, 217),
(75, 'ru', 1815, 0.2142, 149),
(75, 'ru', 1816, 0.2142, 115.5),
(75, 'ru', 1820, 0.3137, 118),
(75, 'ru', 1827, 0.1351, 214),
(75, 'ru', 1838, 0.1351, 31),
(75, 'ru', 1847, 0.1351, 65),
(75, 'ru', 1852, 0.1351, 203),
(75, 'ru', 1860, 0.1351, 215),
(75, 'ru', 1862, 0.1351, 174),
(75, 'ru', 1866, 0.1351, 72),
(75, 'ru', 1868, 0.2142, 85.5),
(75, 'ru', 1880, 0.1351, 42),
(75, 'ru', 1903, 0.1351, 46),
(75, 'ru', 1947, 0.1351, 8),
(75, 'ru', 1959, 0.1351, 183),
(75, 'ru', 1962, 0.1351, 125),
(75, 'ru', 1993, 0.2142, 150),
(75, 'ru', 1994, 0.1351, 93),
(75, 'ru', 2006, 0.1351, 189),
(75, 'ru', 2007, 0.1351, 190),
(75, 'ru', 2022, 0.2142, 100.5),
(75, 'ru', 2025, 0.1351, 153),
(75, 'ru', 2028, 0.1351, 115),
(75, 'ru', 2069, 0.1351, 149),
(75, 'ru', 2073, 0.1351, 151),
(75, 'ru', 2075, 0.2142, 138),
(75, 'ru', 2086, 0.2142, 50),
(75, 'ru', 2088, 0.2702, 87.3333),
(75, 'ru', 2123, 0.1351, 89),
(75, 'ru', 2129, 0.1351, 28),
(75, 'ru', 2136, 0.1351, 168),
(75, 'ru', 2153, 0.1351, 148),
(75, 'ru', 2164, 0.1351, 73),
(75, 'ru', 2234, 0.1351, 135),
(75, 'ru', 2239, 0.1351, 30),
(75, 'ru', 2275, 0.1351, 119),
(75, 'ru', 2298, 0.1351, 74),
(75, 'ru', 2312, 0.1351, 55),
(75, 'ru', 2336, 0.2142, 79.5),
(75, 'ru', 2359, 0.1351, 121),
(75, 'ru', 2397, 0.1351, 78),
(75, 'ru', 2473, 0.1351, 7),
(75, 'ru', 2475, 0.1351, 91),
(75, 'ru', 2524, 0.1351, 202),
(75, 'ru', 2545, 0.1351, 134),
(75, 'ru', 2546, 0.1351, 132),
(75, 'ru', 2556, 0.1351, 130),
(75, 'ru', 2557, 0.1351, 137),
(75, 'ru', 2567, 0.1351, 155),
(75, 'ru', 2625, 0.1351, 5),
(75, 'ru', 2626, 0.1351, 11),
(75, 'ru', 2627, 0.1351, 18),
(75, 'ru', 2628, 0.1351, 21),
(75, 'ru', 2629, 0.1351, 23),
(75, 'ru', 2630, 0.1351, 27),
(75, 'ru', 2631, 0.1351, 29),
(75, 'ru', 2632, 0.1351, 32),
(75, 'ru', 2633, 0.1351, 33),
(75, 'ru', 2634, 0.1351, 48),
(75, 'ru', 2635, 0.1351, 52),
(75, 'ru', 2636, 0.1351, 56),
(75, 'ru', 2637, 0.1351, 58),
(75, 'ru', 2638, 0.1351, 59),
(75, 'ru', 2639, 0.1351, 68),
(75, 'ru', 2640, 0.1351, 70),
(75, 'ru', 2641, 0.2142, 95),
(75, 'ru', 2642, 0.1351, 77),
(75, 'ru', 2643, 0.1351, 80),
(75, 'ru', 2644, 0.1351, 81),
(75, 'ru', 2645, 0.1351, 95),
(75, 'ru', 2646, 0.1351, 97),
(75, 'ru', 2647, 0.1351, 98),
(75, 'ru', 2648, 0.1351, 99),
(75, 'ru', 2649, 0.1351, 105),
(75, 'ru', 2650, 0.1351, 107),
(75, 'ru', 2651, 0.1351, 111),
(75, 'ru', 2652, 0.1351, 113),
(75, 'ru', 2653, 0.1351, 122),
(75, 'ru', 2654, 0.1351, 123),
(75, 'ru', 2655, 0.1351, 128),
(75, 'ru', 2656, 0.1351, 129),
(75, 'ru', 2657, 0.1351, 131),
(75, 'ru', 2658, 0.1351, 133),
(75, 'ru', 2659, 0.1351, 136),
(75, 'ru', 2660, 0.1351, 138),
(75, 'ru', 2661, 0.1351, 139),
(75, 'ru', 2662, 0.1351, 140),
(75, 'ru', 2663, 0.1351, 146),
(75, 'ru', 2664, 0.1351, 147),
(75, 'ru', 2665, 0.1351, 156),
(75, 'ru', 2666, 0.1351, 157),
(75, 'ru', 2667, 0.1351, 158),
(75, 'ru', 2668, 0.1351, 159),
(75, 'ru', 2669, 0.1351, 161),
(75, 'ru', 2670, 0.1351, 172),
(75, 'ru', 2671, 0.1351, 176),
(75, 'ru', 2672, 0.1351, 186),
(75, 'ru', 2673, 0.1351, 196),
(75, 'ru', 2674, 0.1351, 198),
(75, 'ru', 2675, 0.1351, 199),
(75, 'ru', 2676, 0.1351, 201),
(75, 'ru', 2677, 0.1351, 204),
(75, 'ru', 2767, 0.1351, 170),
(76, 'ru', 1433, 0.1348, 1),
(76, 'ru', 1434, 0.1348, 3),
(76, 'ru', 1512, 0.4664, 101.6),
(76, 'ru', 1526, 0.1348, 93),
(76, 'ru', 1527, 0.1348, 199),
(76, 'ru', 1534, 0.1348, 233),
(76, 'ru', 1541, 0.1348, 201),
(76, 'ru', 1548, 0.313, 92.75),
(76, 'ru', 1552, 0.1348, 195),
(76, 'ru', 1564, 0.1348, 150),
(76, 'ru', 1591, 0.1348, 164),
(76, 'ru', 1601, 0.1348, 79),
(76, 'ru', 1612, 0.1348, 35),
(76, 'ru', 1614, 0.1348, 244),
(76, 'ru', 1615, 0.2137, 121.5),
(76, 'ru', 1636, 0.313, 167.75),
(76, 'ru', 1642, 0.1348, 31),
(76, 'ru', 1670, 0.1348, 181),
(76, 'ru', 1695, 0.1348, 197),
(76, 'ru', 1706, 0.1348, 2),
(76, 'ru', 1715, 0.1348, 152),
(76, 'ru', 1717, 0.313, 168.75),
(76, 'ru', 1718, 0.2137, 133),
(76, 'ru', 1733, 0.1348, 100),
(76, 'ru', 1736, 0.1348, 151),
(76, 'ru', 1738, 0.2137, 104.5),
(76, 'ru', 1815, 0.1348, 111),
(76, 'ru', 1817, 0.2137, 170.5),
(76, 'ru', 1820, 0.1348, 243),
(76, 'ru', 1836, 0.1348, 232),
(76, 'ru', 1839, 0.1348, 165),
(76, 'ru', 1847, 0.2696, 125.333),
(76, 'ru', 1849, 0.1348, 154),
(76, 'ru', 1851, 0.1348, 140),
(76, 'ru', 1855, 0.1348, 234),
(76, 'ru', 1856, 0.1348, 235),
(76, 'ru', 1857, 0.1348, 236),
(76, 'ru', 1858, 0.1348, 237),
(76, 'ru', 1859, 0.1348, 241),
(76, 'ru', 1875, 0.2137, 36.5),
(76, 'ru', 1903, 0.1348, 68),
(76, 'ru', 1958, 0.1348, 19),
(76, 'ru', 1971, 0.2137, 171.5),
(76, 'ru', 1972, 0.1348, 224),
(76, 'ru', 1973, 0.1348, 57),
(76, 'ru', 1982, 0.1348, 222),
(76, 'ru', 1994, 0.1348, 45),
(76, 'ru', 1997, 0.2137, 123),
(76, 'ru', 1998, 0.2696, 112.333),
(76, 'ru', 2006, 0.1348, 58),
(76, 'ru', 2007, 0.1348, 59),
(76, 'ru', 2010, 0.1348, 99),
(76, 'ru', 2022, 0.1348, 78),
(76, 'ru', 2023, 0.1348, 176),
(76, 'ru', 2025, 0.2137, 197.5),
(76, 'ru', 2040, 0.1348, 32),
(76, 'ru', 2049, 0.1348, 221),
(76, 'ru', 2058, 0.2696, 147),
(76, 'ru', 2059, 0.1348, 51),
(76, 'ru', 2064, 0.1348, 157),
(76, 'ru', 2066, 0.1348, 103),
(76, 'ru', 2073, 0.2137, 196.5),
(76, 'ru', 2075, 0.1348, 116),
(76, 'ru', 2084, 0.1348, 153),
(76, 'ru', 2138, 0.2137, 133.5),
(76, 'ru', 2145, 0.2137, 105),
(76, 'ru', 2207, 0.1348, 132),
(76, 'ru', 2284, 0.1348, 71),
(76, 'ru', 2312, 0.1348, 137),
(76, 'ru', 2350, 0.1348, 36),
(76, 'ru', 2358, 0.1348, 54),
(76, 'ru', 2359, 0.1348, 55),
(76, 'ru', 2429, 0.1348, 7),
(76, 'ru', 2430, 0.1348, 8),
(76, 'ru', 2431, 0.1348, 9),
(76, 'ru', 2432, 0.1348, 11),
(76, 'ru', 2433, 0.1348, 12),
(76, 'ru', 2434, 0.1348, 20),
(76, 'ru', 2435, 0.2137, 56.5),
(76, 'ru', 2436, 0.2137, 57.5),
(76, 'ru', 2437, 0.2137, 86.5),
(76, 'ru', 2438, 0.1348, 27),
(76, 'ru', 2439, 0.1348, 28),
(76, 'ru', 2440, 0.1348, 29),
(76, 'ru', 2441, 0.2137, 90.5),
(76, 'ru', 2442, 0.1348, 34),
(76, 'ru', 2443, 0.2696, 65),
(76, 'ru', 2444, 0.2137, 124),
(76, 'ru', 2445, 0.1348, 44),
(76, 'ru', 2446, 0.1348, 52),
(76, 'ru', 2447, 0.1348, 56),
(76, 'ru', 2448, 0.2696, 153.333),
(76, 'ru', 2449, 0.1348, 70),
(76, 'ru', 2450, 0.1348, 72),
(76, 'ru', 2451, 0.1348, 73),
(76, 'ru', 2452, 0.1348, 74),
(76, 'ru', 2453, 0.1348, 75),
(76, 'ru', 2454, 0.1348, 77),
(76, 'ru', 2455, 0.1348, 80),
(76, 'ru', 2456, 0.1348, 81),
(76, 'ru', 2457, 0.1348, 82),
(76, 'ru', 2458, 0.1348, 92),
(76, 'ru', 2459, 0.1348, 105),
(76, 'ru', 2460, 0.1348, 113),
(76, 'ru', 2461, 0.1348, 115),
(76, 'ru', 2462, 0.1348, 118),
(76, 'ru', 2463, 0.1348, 121),
(76, 'ru', 2464, 0.1348, 123),
(76, 'ru', 2465, 0.1348, 125),
(76, 'ru', 2466, 0.1348, 131),
(76, 'ru', 2467, 0.1348, 133),
(76, 'ru', 2468, 0.1348, 135),
(76, 'ru', 2469, 0.1348, 136),
(76, 'ru', 2470, 0.1348, 138),
(76, 'ru', 2472, 0.1348, 149),
(76, 'ru', 2473, 0.1348, 156),
(76, 'ru', 2474, 0.1348, 163),
(76, 'ru', 2475, 0.1348, 173),
(76, 'ru', 2476, 0.1348, 193),
(76, 'ru', 2477, 0.1348, 194),
(76, 'ru', 2478, 0.1348, 196),
(76, 'ru', 2479, 0.1348, 198),
(76, 'ru', 2480, 0.1348, 200),
(76, 'ru', 2481, 0.1348, 202),
(76, 'ru', 2482, 0.1348, 206),
(76, 'ru', 2483, 0.1348, 219),
(76, 'ru', 2770, 0.1348, 139),
(77, 'ru', 1432, 0.1502, 1),
(77, 'ru', 1512, 0.4216, 86.5),
(77, 'ru', 1524, 0.1502, 105),
(77, 'ru', 1527, 0.3487, 68.25),
(77, 'ru', 1534, 0.1502, 115),
(77, 'ru', 1548, 0.1502, 8),
(77, 'ru', 1549, 0.1502, 101),
(77, 'ru', 1591, 0.1502, 10),
(77, 'ru', 1601, 0.1502, 82),
(77, 'ru', 1614, 0.1502, 123),
(77, 'ru', 1636, 0.1502, 102),
(77, 'ru', 1642, 0.1502, 64),
(77, 'ru', 1717, 0.1502, 103),
(77, 'ru', 1718, 0.1502, 116),
(77, 'ru', 1733, 0.238, 57),
(77, 'ru', 1820, 0.3004, 93),
(77, 'ru', 1826, 0.1502, 114),
(77, 'ru', 1827, 0.1502, 61),
(77, 'ru', 1845, 0.1502, 120),
(77, 'ru', 1847, 0.1502, 48),
(77, 'ru', 1852, 0.1502, 97),
(77, 'ru', 1859, 0.3487, 61.5),
(77, 'ru', 1860, 0.1502, 117),
(77, 'ru', 1861, 0.1502, 118),
(77, 'ru', 1976, 0.1502, 17),
(77, 'ru', 1994, 0.1502, 59),
(77, 'ru', 2023, 0.1502, 53),
(77, 'ru', 2025, 0.238, 79.5),
(77, 'ru', 2040, 0.238, 36.5),
(77, 'ru', 2045, 0.238, 27.5),
(77, 'ru', 2049, 0.1502, 62),
(77, 'ru', 2073, 0.1502, 49),
(77, 'ru', 2140, 0.1502, 90),
(77, 'ru', 2199, 0.1502, 100),
(77, 'ru', 2208, 0.1502, 25),
(77, 'ru', 2209, 0.1502, 26),
(77, 'ru', 2295, 0.1502, 18),
(77, 'ru', 2301, 0.1502, 27),
(77, 'ru', 2361, 0.1502, 63),
(77, 'ru', 2372, 0.1502, 58),
(77, 'ru', 2484, 0.1502, 2),
(77, 'ru', 2485, 0.238, 38.5),
(77, 'ru', 2486, 0.1502, 7),
(77, 'ru', 2487, 0.1502, 9),
(77, 'ru', 2488, 0.1502, 11),
(77, 'ru', 2489, 0.1502, 19),
(77, 'ru', 2490, 0.1502, 20),
(77, 'ru', 2491, 0.1502, 21),
(77, 'ru', 2492, 0.1502, 23),
(77, 'ru', 2493, 0.1502, 24),
(77, 'ru', 2494, 0.1502, 29),
(77, 'ru', 2495, 0.1502, 30),
(77, 'ru', 2496, 0.1502, 31),
(77, 'ru', 2497, 0.1502, 32),
(77, 'ru', 2498, 0.1502, 34),
(77, 'ru', 2499, 0.1502, 35),
(77, 'ru', 2500, 0.1502, 36),
(77, 'ru', 2501, 0.1502, 37),
(77, 'ru', 2502, 0.1502, 38),
(77, 'ru', 2503, 0.1502, 39),
(77, 'ru', 2504, 0.1502, 40),
(77, 'ru', 2505, 0.1502, 41),
(77, 'ru', 2506, 0.1502, 42),
(77, 'ru', 2507, 0.1502, 55),
(77, 'ru', 2508, 0.1502, 56),
(77, 'ru', 2509, 0.1502, 57),
(77, 'ru', 2510, 0.1502, 65),
(77, 'ru', 2511, 0.1502, 66),
(77, 'ru', 2512, 0.1502, 67),
(77, 'ru', 2513, 0.1502, 70),
(77, 'ru', 2514, 0.1502, 71),
(77, 'ru', 2515, 0.1502, 73),
(77, 'ru', 2516, 0.1502, 76),
(77, 'ru', 2517, 0.1502, 77),
(77, 'ru', 2518, 0.1502, 78),
(77, 'ru', 2519, 0.1502, 80),
(77, 'ru', 2520, 0.1502, 83),
(77, 'ru', 2521, 0.1502, 84),
(77, 'ru', 2522, 0.1502, 91),
(77, 'ru', 2523, 0.1502, 94),
(77, 'ru', 2524, 0.1502, 96),
(77, 'ru', 2525, 0.1502, 98),
(77, 'ru', 2526, 0.1502, 106),
(78, 'ru', 1376, 0.135, 1),
(78, 'ru', 1377, 0.135, 2),
(78, 'ru', 1510, 0.135, 127),
(78, 'ru', 1512, 0.3134, 134.5),
(78, 'ru', 1518, 0.135, 230),
(78, 'ru', 1519, 0.135, 233),
(78, 'ru', 1524, 0.135, 192),
(78, 'ru', 1526, 0.2139, 83.5),
(78, 'ru', 1527, 0.3489, 114),
(78, 'ru', 1533, 0.135, 111),
(78, 'ru', 1534, 0.2139, 236.5),
(78, 'ru', 1541, 0.135, 100),
(78, 'ru', 1548, 0.3489, 114.2),
(78, 'ru', 1567, 0.135, 114),
(78, 'ru', 1577, 0.135, 212),
(78, 'ru', 1601, 0.3789, 148.833),
(78, 'ru', 1614, 0.2699, 126.333),
(78, 'ru', 1621, 0.135, 53),
(78, 'ru', 1636, 0.135, 208),
(78, 'ru', 1701, 0.135, 195),
(78, 'ru', 1717, 0.135, 209),
(78, 'ru', 1733, 0.135, 180),
(78, 'ru', 1738, 0.135, 5),
(78, 'ru', 1815, 0.2139, 208.5),
(78, 'ru', 1816, 0.135, 240),
(78, 'ru', 1817, 0.135, 181),
(78, 'ru', 1820, 0.3134, 150.25),
(78, 'ru', 1827, 0.135, 242),
(78, 'ru', 1838, 0.2139, 205),
(78, 'ru', 1839, 0.135, 9),
(78, 'ru', 1847, 0.2699, 129.333),
(78, 'ru', 1852, 0.3134, 97.75),
(78, 'ru', 1860, 0.135, 244),
(78, 'ru', 1865, 0.135, 179),
(78, 'ru', 1866, 0.2139, 141.5),
(78, 'ru', 1867, 0.135, 245),
(78, 'ru', 1868, 0.135, 247),
(78, 'ru', 1879, 0.2699, 88),
(78, 'ru', 1903, 0.135, 52),
(78, 'ru', 1954, 0.135, 135),
(78, 'ru', 1965, 0.135, 170),
(78, 'ru', 1973, 0.135, 117),
(78, 'ru', 1982, 0.135, 219),
(78, 'ru', 2010, 0.135, 151),
(78, 'ru', 2025, 0.135, 206),
(78, 'ru', 2028, 0.2699, 72),
(78, 'ru', 2040, 0.3134, 100),
(78, 'ru', 2049, 0.135, 218),
(78, 'ru', 2073, 0.135, 205),
(78, 'ru', 2086, 0.135, 116),
(78, 'ru', 2087, 0.135, 123),
(78, 'ru', 2123, 0.135, 207),
(78, 'ru', 2143, 0.135, 119),
(78, 'ru', 2145, 0.135, 183),
(78, 'ru', 2210, 0.135, 223),
(78, 'ru', 2211, 0.135, 221),
(78, 'ru', 2239, 0.2699, 139),
(78, 'ru', 2257, 0.135, 73),
(78, 'ru', 2261, 0.135, 115),
(78, 'ru', 2282, 0.135, 194),
(78, 'ru', 2289, 0.135, 156),
(78, 'ru', 2298, 0.135, 38);
INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
(78, 'ru', 2313, 0.135, 152),
(78, 'ru', 2332, 0.135, 65),
(78, 'ru', 2388, 0.135, 229),
(78, 'ru', 2460, 0.135, 20),
(78, 'ru', 2462, 0.135, 154),
(78, 'ru', 2464, 0.135, 153),
(78, 'ru', 2475, 0.135, 191),
(78, 'ru', 2485, 0.135, 63),
(78, 'ru', 2523, 0.3489, 85),
(78, 'ru', 2568, 0.135, 168),
(78, 'ru', 2576, 0.135, 3),
(78, 'ru', 2577, 0.2699, 51.6667),
(78, 'ru', 2578, 0.2139, 65),
(78, 'ru', 2579, 0.135, 7),
(78, 'ru', 2580, 0.135, 15),
(78, 'ru', 2581, 0.135, 24),
(78, 'ru', 2582, 0.135, 30),
(78, 'ru', 2583, 0.135, 32),
(78, 'ru', 2584, 0.135, 34),
(78, 'ru', 2585, 0.135, 35),
(78, 'ru', 2586, 0.135, 36),
(78, 'ru', 2587, 0.135, 37),
(78, 'ru', 2588, 0.135, 39),
(78, 'ru', 2589, 0.135, 42),
(78, 'ru', 2590, 0.2139, 73.5),
(78, 'ru', 2591, 0.135, 55),
(78, 'ru', 2592, 0.135, 56),
(78, 'ru', 2593, 0.2699, 121.667),
(78, 'ru', 2594, 0.2139, 99),
(78, 'ru', 2595, 0.135, 71),
(78, 'ru', 2596, 0.135, 72),
(78, 'ru', 2597, 0.135, 77),
(78, 'ru', 2598, 0.135, 83),
(78, 'ru', 2599, 0.135, 91),
(78, 'ru', 2600, 0.135, 101),
(78, 'ru', 2601, 0.135, 102),
(78, 'ru', 2602, 0.135, 112),
(78, 'ru', 2603, 0.135, 113),
(78, 'ru', 2604, 0.135, 118),
(78, 'ru', 2605, 0.135, 125),
(78, 'ru', 2607, 0.135, 128),
(78, 'ru', 2608, 0.135, 129),
(78, 'ru', 2609, 0.135, 143),
(78, 'ru', 2610, 0.135, 155),
(78, 'ru', 2611, 0.135, 172),
(78, 'ru', 2612, 0.135, 189),
(78, 'ru', 2613, 0.135, 193),
(78, 'ru', 2614, 0.135, 197),
(78, 'ru', 2615, 0.135, 198),
(78, 'ru', 2616, 0.135, 210),
(78, 'ru', 2617, 0.135, 211),
(78, 'ru', 2618, 0.135, 214),
(78, 'ru', 2620, 0.135, 217),
(78, 'ru', 2621, 0.135, 226),
(78, 'ru', 2622, 0.135, 228),
(78, 'ru', 2623, 0.135, 231),
(78, 'ru', 2624, 0.135, 216),
(79, 'ru', 173, 0.2314, 4),
(79, 'ru', 1267, 0.2314, 2),
(79, 'ru', 1268, 0.2314, 6),
(79, 'ru', 1269, 0.2314, 8),
(80, 'ru', 173, 0.2314, 4),
(80, 'ru', 1267, 0.2314, 2),
(80, 'ru', 1268, 0.2314, 6),
(80, 'ru', 1269, 0.2314, 8),
(81, 'ru', 173, 0.2314, 4),
(81, 'ru', 1267, 0.2314, 2),
(81, 'ru', 1268, 0.2314, 6),
(81, 'ru', 1269, 0.2314, 8),
(82, 'ru', 5, 0.2314, 2),
(82, 'ru', 584, 0.2314, 1),
(82, 'ru', 593, 0.2314, 4),
(82, 'ru', 1425, 0.2314, 5),
(82, 'ru', 1426, 0.2314, 6),
(82, 'ru', 1427, 0.2314, 7),
(83, 'ru', 1587, 0.2314, 1),
(83, 'ru', 1588, 0.2314, 2),
(84, 'ru', 12, 0.1906, 11),
(84, 'ru', 15, 0.1906, 16),
(84, 'ru', 96, 0.1906, 54),
(84, 'ru', 109, 0.1906, 8),
(84, 'ru', 173, 0.1906, 9),
(84, 'ru', 261, 0.1906, 33),
(84, 'ru', 499, 0.1906, 24),
(84, 'ru', 860, 0.1906, 57),
(84, 'ru', 915, 0.1906, 30),
(84, 'ru', 931, 0.1906, 26),
(84, 'ru', 1044, 0.1906, 56),
(84, 'ru', 1094, 0.1906, 53),
(84, 'ru', 1152, 0.1906, 25),
(84, 'ru', 1274, 0.1906, 31),
(84, 'ru', 1275, 0.1906, 36),
(84, 'ru', 1278, 0.1906, 29),
(84, 'ru', 1279, 0.302, 29),
(84, 'ru', 1280, 0.1906, 34),
(84, 'ru', 1296, 0.1906, 28),
(84, 'ru', 1365, 0.1906, 5),
(84, 'ru', 1366, 0.1906, 7),
(84, 'ru', 1367, 0.1906, 13),
(84, 'ru', 1368, 0.1906, 15),
(84, 'ru', 1369, 0.1906, 17),
(84, 'ru', 1370, 0.1906, 23),
(84, 'ru', 1371, 0.1906, 27),
(84, 'ru', 1372, 0.1906, 32),
(84, 'ru', 1373, 0.1906, 35),
(84, 'ru', 1374, 0.1906, 38),
(84, 'ru', 1375, 0.1906, 39),
(84, 'ru', 1376, 0.1906, 41),
(84, 'ru', 1377, 0.1906, 42),
(84, 'ru', 1378, 0.1906, 50),
(84, 'ru', 1379, 0.1906, 51),
(84, 'ru', 1380, 0.1906, 52),
(84, 'ru', 1429, 0.1906, 1),
(84, 'ru', 1430, 0.1906, 3),
(85, 'ru', 416, 0.1397, 3),
(85, 'ru', 1411, 0.1397, 1),
(85, 'ru', 1512, 0.419, 82.7143),
(85, 'ru', 1526, 0.1397, 59),
(85, 'ru', 1527, 0.3243, 103),
(85, 'ru', 1533, 0.1397, 128),
(85, 'ru', 1534, 0.1397, 168),
(85, 'ru', 1541, 0.1397, 61),
(85, 'ru', 1548, 0.419, 97.1429),
(85, 'ru', 1601, 0.1397, 84),
(85, 'ru', 1606, 0.1397, 41),
(85, 'ru', 1614, 0.2214, 156),
(85, 'ru', 1636, 0.1397, 184),
(85, 'ru', 1645, 0.1397, 25),
(85, 'ru', 1716, 0.1397, 52),
(85, 'ru', 1717, 0.2214, 119),
(85, 'ru', 1718, 0.1397, 54),
(85, 'ru', 1719, 0.1397, 45),
(85, 'ru', 1738, 0.1397, 9),
(85, 'ru', 1815, 0.1397, 183),
(85, 'ru', 1816, 0.1397, 42),
(85, 'ru', 1818, 0.1397, 11),
(85, 'ru', 1820, 0.2793, 160.667),
(85, 'ru', 1826, 0.1397, 167),
(85, 'ru', 1827, 0.1397, 186),
(85, 'ru', 1847, 0.2214, 11),
(85, 'ru', 1849, 0.1397, 116),
(85, 'ru', 1852, 0.1397, 58),
(85, 'ru', 1858, 0.1397, 37),
(85, 'ru', 1860, 0.1397, 126),
(85, 'ru', 1861, 0.2793, 49.3333),
(85, 'ru', 1862, 0.1397, 187),
(85, 'ru', 1863, 0.1397, 188),
(85, 'ru', 1864, 0.1397, 189),
(85, 'ru', 1865, 0.1397, 190),
(85, 'ru', 1866, 0.1397, 129),
(85, 'ru', 1877, 0.1397, 4),
(85, 'ru', 1888, 0.1397, 156),
(85, 'ru', 1929, 0.2214, 68.5),
(85, 'ru', 1962, 0.1397, 65),
(85, 'ru', 1963, 0.1397, 67),
(85, 'ru', 1965, 0.1397, 141),
(85, 'ru', 1973, 0.1397, 112),
(85, 'ru', 1975, 0.1397, 146),
(85, 'ru', 1994, 0.1397, 51),
(85, 'ru', 1998, 0.1397, 124),
(85, 'ru', 2023, 0.1397, 40),
(85, 'ru', 2025, 0.2214, 97.5),
(85, 'ru', 2032, 0.1397, 143),
(85, 'ru', 2049, 0.1397, 122),
(85, 'ru', 2073, 0.1397, 21),
(85, 'ru', 2074, 0.1397, 81),
(85, 'ru', 2078, 0.1397, 135),
(85, 'ru', 2088, 0.1397, 120),
(85, 'ru', 2097, 0.1397, 46),
(85, 'ru', 2098, 0.1397, 47),
(85, 'ru', 2123, 0.1397, 23),
(85, 'ru', 2129, 0.1397, 175),
(85, 'ru', 2210, 0.1397, 170),
(85, 'ru', 2289, 0.1397, 150),
(85, 'ru', 2372, 0.1397, 48),
(85, 'ru', 2378, 0.1397, 36),
(85, 'ru', 2412, 0.1397, 99),
(85, 'ru', 2428, 0.2214, 90),
(85, 'ru', 2447, 0.1397, 121),
(85, 'ru', 2461, 0.1397, 56),
(85, 'ru', 2511, 0.1397, 79),
(85, 'ru', 2527, 0.1397, 5),
(85, 'ru', 2528, 0.1397, 6),
(85, 'ru', 2529, 0.1397, 8),
(85, 'ru', 2530, 0.1397, 10),
(85, 'ru', 2531, 0.1397, 12),
(85, 'ru', 2532, 0.1397, 14),
(85, 'ru', 2533, 0.1397, 26),
(85, 'ru', 2534, 0.1397, 27),
(85, 'ru', 2535, 0.2214, 76.5),
(85, 'ru', 2536, 0.1397, 29),
(85, 'ru', 2537, 0.1397, 43),
(85, 'ru', 2538, 0.1397, 44),
(85, 'ru', 2539, 0.1397, 50),
(85, 'ru', 2540, 0.1397, 57),
(85, 'ru', 2541, 0.1397, 60),
(85, 'ru', 2542, 0.1397, 62),
(85, 'ru', 2543, 0.1397, 63),
(85, 'ru', 2544, 0.1397, 68),
(85, 'ru', 2545, 0.2214, 86.5),
(85, 'ru', 2546, 0.1397, 70),
(85, 'ru', 2547, 0.1397, 72),
(85, 'ru', 2548, 0.1397, 78),
(85, 'ru', 2549, 0.1397, 85),
(85, 'ru', 2550, 0.1397, 86),
(85, 'ru', 2551, 0.1397, 87),
(85, 'ru', 2552, 0.1397, 93),
(85, 'ru', 2553, 0.1397, 94),
(85, 'ru', 2554, 0.1397, 96),
(85, 'ru', 2555, 0.1397, 100),
(85, 'ru', 2556, 0.1397, 101),
(85, 'ru', 2557, 0.1397, 102),
(85, 'ru', 2558, 0.1397, 110),
(85, 'ru', 2559, 0.1397, 111),
(85, 'ru', 2560, 0.1397, 114),
(85, 'ru', 2561, 0.1397, 115),
(85, 'ru', 2562, 0.1397, 123),
(85, 'ru', 2564, 0.1397, 137),
(85, 'ru', 2565, 0.1397, 138),
(85, 'ru', 2566, 0.1397, 139),
(85, 'ru', 2567, 0.1397, 140),
(85, 'ru', 2568, 0.1397, 142),
(85, 'ru', 2569, 0.1397, 144),
(85, 'ru', 2570, 0.1397, 145),
(85, 'ru', 2571, 0.1397, 147),
(85, 'ru', 2572, 0.1397, 148),
(85, 'ru', 2573, 0.1397, 169),
(85, 'ru', 2574, 0.1397, 176),
(85, 'ru', 2575, 0.1397, 177),
(85, 'ru', 2771, 0.1397, 136),
(88, 'ru', 1431, 0.2314, 1),
(89, 'ru', 1431, 0.2314, 1),
(90, 'ru', 1431, 0.2314, 1),
(91, 'ru', 1431, 0.2314, 1),
(92, 'ru', 1431, 0.2314, 1),
(93, 'ru', 1431, 0.2314, 1),
(94, 'ru', 416, 0.1367, 3),
(94, 'ru', 1373, 0.1367, 1),
(94, 'ru', 1512, 0.3535, 72.6),
(94, 'ru', 1518, 0.1367, 65),
(94, 'ru', 1519, 0.1367, 63),
(94, 'ru', 1520, 0.1367, 129),
(94, 'ru', 1524, 0.1367, 199),
(94, 'ru', 1526, 0.2167, 147),
(94, 'ru', 1529, 0.2735, 150.333),
(94, 'ru', 1530, 0.1367, 17),
(94, 'ru', 1533, 0.1367, 112),
(94, 'ru', 1548, 0.4102, 134.143),
(94, 'ru', 1558, 0.1367, 110),
(94, 'ru', 1564, 0.1367, 158),
(94, 'ru', 1571, 0.1367, 178),
(94, 'ru', 1583, 0.1367, 156),
(94, 'ru', 1591, 0.1367, 148),
(94, 'ru', 1592, 0.1367, 149),
(94, 'ru', 1597, 0.1367, 120),
(94, 'ru', 1601, 0.1367, 84),
(94, 'ru', 1606, 0.1367, 147),
(94, 'ru', 1615, 0.2167, 103.5),
(94, 'ru', 1623, 0.1367, 15),
(94, 'ru', 1625, 0.1367, 100),
(94, 'ru', 1626, 0.2167, 64),
(94, 'ru', 1642, 0.1367, 26),
(94, 'ru', 1656, 0.1367, 150),
(94, 'ru', 1659, 0.1367, 40),
(94, 'ru', 1733, 0.1367, 82),
(94, 'ru', 1736, 0.1367, 46),
(94, 'ru', 1738, 0.2735, 72.6667),
(94, 'ru', 1745, 0.1367, 45),
(94, 'ru', 1767, 0.1367, 169),
(94, 'ru', 1841, 0.1367, 195),
(94, 'ru', 1844, 0.3175, 119),
(94, 'ru', 1847, 0.2735, 90.6667),
(94, 'ru', 1848, 0.2167, 134.5),
(94, 'ru', 1849, 0.1367, 194),
(94, 'ru', 1850, 0.1367, 197),
(94, 'ru', 1851, 0.2167, 122),
(94, 'ru', 1860, 0.1367, 114),
(94, 'ru', 1866, 0.1367, 131),
(94, 'ru', 1879, 0.1367, 136),
(94, 'ru', 1903, 0.1367, 78),
(94, 'ru', 1940, 0.1367, 154),
(94, 'ru', 1947, 0.1367, 119),
(94, 'ru', 1963, 0.2167, 50),
(94, 'ru', 1972, 0.1367, 140),
(94, 'ru', 1973, 0.2167, 80),
(94, 'ru', 1975, 0.1367, 138),
(94, 'ru', 1982, 0.1367, 58),
(94, 'ru', 1988, 0.1367, 127),
(94, 'ru', 1990, 0.1367, 130),
(94, 'ru', 1994, 0.1367, 111),
(94, 'ru', 2010, 0.1367, 96),
(94, 'ru', 2023, 0.1367, 185),
(94, 'ru', 2025, 0.1367, 109),
(94, 'ru', 2026, 0.2167, 28),
(94, 'ru', 2027, 0.1367, 7),
(94, 'ru', 2028, 0.1367, 8),
(94, 'ru', 2029, 0.1367, 10),
(94, 'ru', 2030, 0.1367, 12),
(94, 'ru', 2031, 0.2167, 22.5),
(94, 'ru', 2032, 0.1367, 18),
(94, 'ru', 2033, 0.1367, 25),
(94, 'ru', 2034, 0.2167, 33),
(94, 'ru', 2035, 0.1367, 31),
(94, 'ru', 2036, 0.1367, 32),
(94, 'ru', 2037, 0.1367, 33),
(94, 'ru', 2038, 0.1367, 34),
(94, 'ru', 2039, 0.1367, 35),
(94, 'ru', 2040, 0.1367, 36),
(94, 'ru', 2041, 0.1367, 37),
(94, 'ru', 2042, 0.1367, 39),
(94, 'ru', 2043, 0.1367, 42),
(94, 'ru', 2044, 0.1367, 43),
(94, 'ru', 2045, 0.1367, 53),
(94, 'ru', 2046, 0.1367, 54),
(94, 'ru', 2047, 0.1367, 55),
(94, 'ru', 2048, 0.1367, 56),
(94, 'ru', 2049, 0.1367, 57),
(94, 'ru', 2050, 0.1367, 59),
(94, 'ru', 2051, 0.1367, 61),
(94, 'ru', 2052, 0.1367, 62),
(94, 'ru', 2053, 0.1367, 64),
(94, 'ru', 2054, 0.1367, 66),
(94, 'ru', 2055, 0.1367, 67),
(94, 'ru', 2056, 0.1367, 73),
(94, 'ru', 2057, 0.1367, 74),
(94, 'ru', 2058, 0.1367, 80),
(94, 'ru', 2059, 0.1367, 81),
(94, 'ru', 2060, 0.1367, 83),
(94, 'ru', 2061, 0.1367, 87),
(94, 'ru', 2062, 0.1367, 88),
(94, 'ru', 2063, 0.1367, 89),
(94, 'ru', 2064, 0.1367, 97),
(94, 'ru', 2065, 0.1367, 98),
(94, 'ru', 2066, 0.1367, 99),
(94, 'ru', 2067, 0.1367, 102),
(94, 'ru', 2068, 0.1367, 103),
(94, 'ru', 2069, 0.2167, 139),
(94, 'ru', 2070, 0.1367, 105),
(94, 'ru', 2071, 0.1367, 106),
(94, 'ru', 2072, 0.1367, 107),
(94, 'ru', 2073, 0.1367, 108),
(94, 'ru', 2074, 0.1367, 113),
(94, 'ru', 2075, 0.1367, 115),
(94, 'ru', 2076, 0.1367, 116),
(94, 'ru', 2078, 0.1367, 126),
(94, 'ru', 2079, 0.1367, 132),
(94, 'ru', 2080, 0.1367, 133),
(94, 'ru', 2081, 0.1367, 135),
(94, 'ru', 2082, 0.1367, 137),
(94, 'ru', 2083, 0.1367, 151),
(94, 'ru', 2084, 0.1367, 152),
(94, 'ru', 2085, 0.1367, 153),
(94, 'ru', 2086, 0.1367, 155),
(94, 'ru', 2087, 0.1367, 157),
(94, 'ru', 2088, 0.1367, 159),
(94, 'ru', 2089, 0.1367, 160),
(94, 'ru', 2090, 0.1367, 161),
(94, 'ru', 2091, 0.1367, 163),
(94, 'ru', 2092, 0.1367, 170),
(94, 'ru', 2093, 0.1367, 172),
(94, 'ru', 2094, 0.1367, 175),
(94, 'ru', 2095, 0.1367, 177),
(94, 'ru', 2097, 0.1367, 181),
(94, 'ru', 2098, 0.1367, 182),
(94, 'ru', 2767, 0.1367, 179),
(95, 'ru', 48, 0.1307, 2),
(95, 'ru', 1471, 0.1307, 30),
(95, 'ru', 1475, 0.1307, 1),
(95, 'ru', 1512, 0.3921, 156.286),
(95, 'ru', 1526, 0.1307, 136),
(95, 'ru', 1527, 0.1307, 166),
(95, 'ru', 1529, 0.1307, 250),
(95, 'ru', 1534, 0.1307, 248),
(95, 'ru', 1547, 0.1307, 85),
(95, 'ru', 1548, 0.4686, 118.636),
(95, 'ru', 1558, 0.1307, 130),
(95, 'ru', 1564, 0.3035, 181.75),
(95, 'ru', 1571, 0.2072, 164.5),
(95, 'ru', 1596, 0.1307, 24),
(95, 'ru', 1601, 0.2072, 177),
(95, 'ru', 1606, 0.2072, 56),
(95, 'ru', 1614, 0.2614, 160),
(95, 'ru', 1626, 0.1307, 38),
(95, 'ru', 1656, 0.2072, 60.5),
(95, 'ru', 1666, 0.1307, 45),
(95, 'ru', 1687, 0.1307, 186),
(95, 'ru', 1688, 0.1307, 26),
(95, 'ru', 1716, 0.2614, 170.333),
(95, 'ru', 1717, 0.2614, 173),
(95, 'ru', 1718, 0.1307, 68),
(95, 'ru', 1733, 0.1307, 144),
(95, 'ru', 1738, 0.1307, 132),
(95, 'ru', 1743, 0.2072, 54),
(95, 'ru', 1816, 0.1307, 4),
(95, 'ru', 1817, 0.1307, 152),
(95, 'ru', 1818, 0.1307, 135),
(95, 'ru', 1820, 0.2614, 159),
(95, 'ru', 1826, 0.1307, 247),
(95, 'ru', 1827, 0.1307, 146),
(95, 'ru', 1839, 0.2072, 113.5),
(95, 'ru', 1840, 0.2072, 114.5),
(95, 'ru', 1841, 0.3035, 121),
(95, 'ru', 1842, 0.1307, 126),
(95, 'ru', 1843, 0.1307, 249),
(95, 'ru', 1844, 0.2614, 214.333),
(95, 'ru', 1845, 0.1307, 253),
(95, 'ru', 1846, 0.1307, 254),
(95, 'ru', 1874, 0.1307, 94),
(95, 'ru', 1900, 0.1307, 115),
(95, 'ru', 1903, 0.1307, 128),
(95, 'ru', 1929, 0.2072, 25.5),
(95, 'ru', 1940, 0.2072, 179.5),
(95, 'ru', 1959, 0.2072, 109),
(95, 'ru', 1982, 0.1307, 95),
(95, 'ru', 1984, 0.1307, 60),
(95, 'ru', 1993, 0.2072, 179),
(95, 'ru', 1994, 0.3035, 98),
(95, 'ru', 2004, 0.1307, 96),
(95, 'ru', 2025, 0.1307, 29),
(95, 'ru', 2040, 0.1307, 145),
(95, 'ru', 2045, 0.1307, 40),
(95, 'ru', 2049, 0.1307, 205),
(95, 'ru', 2058, 0.1307, 87),
(95, 'ru', 2059, 0.1307, 88),
(95, 'ru', 2069, 0.1307, 7),
(95, 'ru', 2073, 0.1307, 28),
(95, 'ru', 2084, 0.1307, 211),
(95, 'ru', 2088, 0.1307, 134),
(95, 'ru', 2090, 0.2072, 91.5),
(95, 'ru', 2097, 0.1307, 5),
(95, 'ru', 2099, 0.1307, 6),
(95, 'ru', 2100, 0.1307, 10),
(95, 'ru', 2101, 0.1307, 12),
(95, 'ru', 2102, 0.1307, 21),
(95, 'ru', 2103, 0.1307, 23),
(95, 'ru', 2105, 0.1307, 36),
(95, 'ru', 2106, 0.1307, 37),
(95, 'ru', 2107, 0.1307, 39),
(95, 'ru', 2108, 0.1307, 41),
(95, 'ru', 2109, 0.1307, 42),
(95, 'ru', 2110, 0.2072, 132.5),
(95, 'ru', 2111, 0.1307, 48),
(95, 'ru', 2112, 0.1307, 49),
(95, 'ru', 2113, 0.1307, 50),
(95, 'ru', 2114, 0.1307, 51),
(95, 'ru', 2115, 0.1307, 57),
(95, 'ru', 2116, 0.1307, 58),
(95, 'ru', 2117, 0.1307, 59),
(95, 'ru', 2118, 0.1307, 61),
(95, 'ru', 2119, 0.1307, 63),
(95, 'ru', 2120, 0.1307, 64),
(95, 'ru', 2121, 0.1307, 65),
(95, 'ru', 2122, 0.1307, 67),
(95, 'ru', 2123, 0.1307, 75),
(95, 'ru', 2124, 0.1307, 76),
(95, 'ru', 2125, 0.2072, 87),
(95, 'ru', 2126, 0.1307, 78),
(95, 'ru', 2127, 0.1307, 79),
(95, 'ru', 2128, 0.1307, 80),
(95, 'ru', 2129, 0.2072, 159),
(95, 'ru', 2130, 0.1307, 84),
(95, 'ru', 2131, 0.1307, 99),
(95, 'ru', 2132, 0.1307, 100),
(95, 'ru', 2133, 0.1307, 101),
(95, 'ru', 2134, 0.1307, 102),
(95, 'ru', 2135, 0.1307, 103),
(95, 'ru', 2136, 0.1307, 110),
(95, 'ru', 2138, 0.1307, 116),
(95, 'ru', 2139, 0.1307, 117),
(95, 'ru', 2140, 0.1307, 123),
(95, 'ru', 2141, 0.1307, 129),
(95, 'ru', 2142, 0.1307, 140),
(95, 'ru', 2143, 0.1307, 141),
(95, 'ru', 2144, 0.1307, 142),
(95, 'ru', 2145, 0.1307, 154),
(95, 'ru', 2146, 0.1307, 156),
(95, 'ru', 2147, 0.1307, 162),
(95, 'ru', 2148, 0.1307, 163),
(95, 'ru', 2149, 0.1307, 164),
(95, 'ru', 2150, 0.1307, 165),
(95, 'ru', 2151, 0.1307, 167),
(95, 'ru', 2152, 0.1307, 171),
(95, 'ru', 2153, 0.1307, 172),
(95, 'ru', 2154, 0.1307, 173),
(95, 'ru', 2155, 0.1307, 174),
(95, 'ru', 2156, 0.1307, 175),
(95, 'ru', 2157, 0.1307, 181),
(95, 'ru', 2158, 0.2072, 208),
(95, 'ru', 2159, 0.1307, 183),
(95, 'ru', 2160, 0.1307, 187),
(95, 'ru', 2161, 0.1307, 188),
(95, 'ru', 2162, 0.1307, 189),
(95, 'ru', 2163, 0.1307, 191),
(95, 'ru', 2164, 0.1307, 192),
(95, 'ru', 2165, 0.1307, 200),
(95, 'ru', 2166, 0.1307, 202),
(95, 'ru', 2167, 0.1307, 203),
(95, 'ru', 2168, 0.1307, 204),
(95, 'ru', 2169, 0.1307, 206),
(95, 'ru', 2170, 0.1307, 210),
(95, 'ru', 2171, 0.1307, 217),
(95, 'ru', 2172, 0.1307, 219),
(95, 'ru', 2173, 0.2072, 226.5),
(95, 'ru', 2174, 0.1307, 227),
(95, 'ru', 2175, 0.1307, 228),
(95, 'ru', 2176, 0.1307, 230),
(95, 'ru', 2177, 0.1307, 231),
(95, 'ru', 2178, 0.1307, 232),
(95, 'ru', 2179, 0.1307, 237),
(95, 'ru', 2180, 0.1307, 238),
(95, 'ru', 2181, 0.1307, 240),
(95, 'ru', 2182, 0.1307, 241),
(95, 'ru', 2767, 0.1307, 113),
(95, 'ru', 2768, 0.1307, 27),
(96, 'ru', 1266, 0.1324, 158),
(96, 'ru', 1271, 0.1324, 1),
(96, 'ru', 1438, 0.1324, 2),
(96, 'ru', 1512, 0.4397, 136.333),
(96, 'ru', 1520, 0.1324, 178),
(96, 'ru', 1526, 0.3716, 100),
(96, 'ru', 1527, 0.3422, 112.8),
(96, 'ru', 1533, 0.2647, 118.333),
(96, 'ru', 1534, 0.1324, 203),
(96, 'ru', 1535, 0.2098, 142),
(96, 'ru', 1548, 0.3422, 150.4),
(96, 'ru', 1564, 0.2647, 76.3333),
(96, 'ru', 1568, 0.1324, 159),
(96, 'ru', 1571, 0.1324, 46),
(96, 'ru', 1601, 0.1324, 146),
(96, 'ru', 1612, 0.1324, 98),
(96, 'ru', 1614, 0.2098, 146.5),
(96, 'ru', 1623, 0.1324, 9),
(96, 'ru', 1636, 0.1324, 48),
(96, 'ru', 1641, 0.1324, 121),
(96, 'ru', 1695, 0.1324, 176),
(96, 'ru', 1715, 0.1324, 139),
(96, 'ru', 1716, 0.1324, 196),
(96, 'ru', 1717, 0.1324, 49),
(96, 'ru', 1718, 0.1324, 219),
(96, 'ru', 1721, 0.1324, 157),
(96, 'ru', 1731, 0.1324, 122),
(96, 'ru', 1733, 0.2647, 158),
(96, 'ru', 1749, 0.1324, 7),
(96, 'ru', 1762, 0.1324, 168),
(96, 'ru', 1816, 0.2098, 191),
(96, 'ru', 1817, 0.2098, 174.5),
(96, 'ru', 1819, 0.1324, 124),
(96, 'ru', 1820, 0.3074, 152.25),
(96, 'ru', 1835, 0.3074, 114.5),
(96, 'ru', 1836, 0.1324, 195),
(96, 'ru', 1837, 0.1324, 197),
(96, 'ru', 1838, 0.1324, 198),
(96, 'ru', 1839, 0.1324, 200),
(96, 'ru', 1840, 0.1324, 201),
(96, 'ru', 1841, 0.1324, 205),
(96, 'ru', 1842, 0.1324, 207),
(96, 'ru', 1847, 0.1324, 81),
(96, 'ru', 1848, 0.1324, 52),
(96, 'ru', 1852, 0.2098, 113),
(96, 'ru', 1903, 0.2098, 141.5),
(96, 'ru', 1950, 0.1324, 27),
(96, 'ru', 1964, 0.1324, 113),
(96, 'ru', 1988, 0.2098, 59.5),
(96, 'ru', 1989, 0.1324, 47),
(96, 'ru', 2002, 0.1324, 140),
(96, 'ru', 2023, 0.1324, 67),
(96, 'ru', 2024, 0.1324, 149),
(96, 'ru', 2025, 0.1324, 152),
(96, 'ru', 2034, 0.1324, 156),
(96, 'ru', 2049, 0.2098, 165),
(96, 'ru', 2086, 0.1324, 93),
(96, 'ru', 2097, 0.1324, 181),
(96, 'ru', 2098, 0.1324, 182),
(96, 'ru', 2112, 0.1324, 232),
(96, 'ru', 2131, 0.1324, 17),
(96, 'ru', 2135, 0.1324, 31),
(96, 'ru', 2140, 0.1324, 63),
(96, 'ru', 2145, 0.1324, 147),
(96, 'ru', 2157, 0.1324, 105),
(96, 'ru', 2160, 0.1324, 6),
(96, 'ru', 2170, 0.1324, 92),
(96, 'ru', 2205, 0.1324, 106),
(96, 'ru', 2234, 0.1324, 114),
(96, 'ru', 2239, 0.2098, 68.5),
(96, 'ru', 2266, 0.1324, 132),
(96, 'ru', 2267, 0.1324, 42),
(96, 'ru', 2280, 0.3716, 85.3333),
(96, 'ru', 2282, 0.1324, 118),
(96, 'ru', 2300, 0.1324, 117),
(96, 'ru', 2301, 0.1324, 135),
(96, 'ru', 2302, 0.1324, 136),
(96, 'ru', 2303, 0.1324, 137),
(96, 'ru', 2304, 0.1324, 138),
(96, 'ru', 2319, 0.1324, 4),
(96, 'ru', 2320, 0.1324, 10),
(96, 'ru', 2321, 0.1324, 11),
(96, 'ru', 2322, 0.1324, 12),
(96, 'ru', 2323, 0.1324, 13),
(96, 'ru', 2324, 0.1324, 15),
(96, 'ru', 2325, 0.1324, 16),
(96, 'ru', 2326, 0.1324, 18),
(96, 'ru', 2327, 0.1324, 25),
(96, 'ru', 2328, 0.1324, 28),
(96, 'ru', 2329, 0.1324, 30),
(96, 'ru', 2330, 0.1324, 37),
(96, 'ru', 2331, 0.1324, 39),
(96, 'ru', 2332, 0.1324, 40),
(96, 'ru', 2333, 0.1324, 41),
(96, 'ru', 2334, 0.1324, 43),
(96, 'ru', 2335, 0.1324, 50),
(96, 'ru', 2337, 0.1324, 54),
(96, 'ru', 2338, 0.1324, 55),
(96, 'ru', 2339, 0.1324, 57),
(96, 'ru', 2340, 0.1324, 70),
(96, 'ru', 2341, 0.1324, 72),
(96, 'ru', 2342, 0.2098, 123),
(96, 'ru', 2343, 0.1324, 86),
(96, 'ru', 2344, 0.1324, 87),
(96, 'ru', 2345, 0.1324, 88),
(96, 'ru', 2346, 0.1324, 90),
(96, 'ru', 2347, 0.1324, 94),
(96, 'ru', 2348, 0.1324, 95),
(96, 'ru', 2349, 0.1324, 97),
(96, 'ru', 2350, 0.1324, 99),
(96, 'ru', 2351, 0.1324, 108),
(96, 'ru', 2352, 0.1324, 109),
(96, 'ru', 2353, 0.1324, 111),
(96, 'ru', 2354, 0.1324, 115),
(96, 'ru', 2355, 0.1324, 116),
(96, 'ru', 2356, 0.1324, 120),
(96, 'ru', 2357, 0.1324, 126),
(96, 'ru', 2358, 0.1324, 128),
(96, 'ru', 2359, 0.1324, 129),
(96, 'ru', 2360, 0.1324, 130),
(96, 'ru', 2361, 0.1324, 131),
(96, 'ru', 2362, 0.1324, 134),
(96, 'ru', 2363, 0.1324, 141),
(96, 'ru', 2364, 0.1324, 142),
(96, 'ru', 2365, 0.1324, 155),
(96, 'ru', 2366, 0.1324, 165),
(96, 'ru', 2367, 0.1324, 169),
(96, 'ru', 2368, 0.1324, 171),
(96, 'ru', 2369, 0.1324, 175),
(96, 'ru', 2370, 0.1324, 183),
(96, 'ru', 2371, 0.1324, 186),
(96, 'ru', 2372, 0.1324, 187),
(96, 'ru', 2373, 0.1324, 189),
(96, 'ru', 2778, 0.1324, 220),
(96, 'ru', 2779, 0.1324, 221),
(96, 'ru', 2780, 0.1324, 222),
(96, 'ru', 2781, 0.1324, 229),
(96, 'ru', 2782, 0.1324, 231),
(96, 'ru', 2783, 0.1324, 233),
(96, 'ru', 2784, 0.1324, 3),
(97, 'ru', 1271, 0.1321, 1),
(97, 'ru', 1439, 0.1321, 2),
(97, 'ru', 1510, 0.1321, 19),
(97, 'ru', 1512, 0.4388, 126.444),
(97, 'ru', 1523, 0.1321, 84),
(97, 'ru', 1524, 0.1321, 191),
(97, 'ru', 1526, 0.4388, 124.556),
(97, 'ru', 1527, 0.2094, 164),
(97, 'ru', 1534, 0.1321, 220),
(97, 'ru', 1535, 0.2094, 140),
(97, 'ru', 1548, 0.2642, 65.3333),
(97, 'ru', 1558, 0.1321, 49),
(97, 'ru', 1571, 0.1321, 86),
(97, 'ru', 1601, 0.3415, 108),
(97, 'ru', 1613, 0.1321, 13),
(97, 'ru', 1614, 0.1321, 227),
(97, 'ru', 1615, 0.1321, 55),
(97, 'ru', 1623, 0.1321, 82),
(97, 'ru', 1636, 0.1321, 188),
(97, 'ru', 1641, 0.2642, 126.667),
(97, 'ru', 1715, 0.1321, 160),
(97, 'ru', 1716, 0.1321, 91),
(97, 'ru', 1717, 0.2094, 143),
(97, 'ru', 1718, 0.2094, 228.5),
(97, 'ru', 1731, 0.4388, 133),
(97, 'ru', 1733, 0.1321, 235),
(97, 'ru', 1762, 0.1321, 14),
(97, 'ru', 1815, 0.2094, 163.5),
(97, 'ru', 1816, 0.1321, 219),
(97, 'ru', 1818, 0.2642, 138.333),
(97, 'ru', 1820, 0.2094, 209.5),
(97, 'ru', 1835, 0.1321, 224),
(97, 'ru', 1849, 0.2094, 52),
(97, 'ru', 1851, 0.1321, 176),
(97, 'ru', 1852, 0.1321, 128),
(97, 'ru', 1858, 0.1321, 32),
(97, 'ru', 1903, 0.1321, 247),
(97, 'ru', 1928, 0.2094, 79.5),
(97, 'ru', 1929, 0.2642, 77.6667),
(97, 'ru', 1969, 0.1321, 201),
(97, 'ru', 1973, 0.1321, 153),
(97, 'ru', 1976, 0.1321, 27),
(97, 'ru', 1986, 0.1321, 18),
(97, 'ru', 1988, 0.2094, 80),
(97, 'ru', 2013, 0.1321, 87),
(97, 'ru', 2023, 0.2094, 28.5),
(97, 'ru', 2025, 0.2094, 107),
(97, 'ru', 2040, 0.2094, 127),
(97, 'ru', 2041, 0.1321, 134),
(97, 'ru', 2049, 0.1321, 139),
(97, 'ru', 2060, 0.1321, 98),
(97, 'ru', 2112, 0.1321, 249),
(97, 'ru', 2123, 0.1321, 21),
(97, 'ru', 2140, 0.1321, 182),
(97, 'ru', 2145, 0.1321, 184),
(97, 'ru', 2160, 0.1321, 72),
(97, 'ru', 2175, 0.1321, 90),
(97, 'ru', 2183, 0.1321, 71),
(97, 'ru', 2226, 0.2094, 125),
(97, 'ru', 2238, 0.1321, 54),
(97, 'ru', 2246, 0.1321, 212),
(97, 'ru', 2247, 0.1321, 4),
(97, 'ru', 2248, 0.1321, 5),
(97, 'ru', 2249, 0.1321, 6),
(97, 'ru', 2250, 0.1321, 7),
(97, 'ru', 2251, 0.1321, 16),
(97, 'ru', 2252, 0.1321, 17),
(97, 'ru', 2254, 0.1321, 28),
(97, 'ru', 2255, 0.1321, 30),
(97, 'ru', 2256, 0.1321, 34),
(97, 'ru', 2257, 0.1321, 35),
(97, 'ru', 2258, 0.1321, 36),
(97, 'ru', 2259, 0.1321, 42),
(97, 'ru', 2260, 0.2094, 97.5),
(97, 'ru', 2261, 0.1321, 51),
(97, 'ru', 2262, 0.1321, 52),
(97, 'ru', 2263, 0.1321, 53),
(97, 'ru', 2264, 0.1321, 56),
(97, 'ru', 2265, 0.1321, 57),
(97, 'ru', 2266, 0.1321, 59),
(97, 'ru', 2267, 0.1321, 61),
(97, 'ru', 2268, 0.1321, 62),
(97, 'ru', 2269, 0.1321, 63),
(97, 'ru', 2270, 0.1321, 76),
(97, 'ru', 2271, 0.1321, 78),
(97, 'ru', 2272, 0.1321, 79),
(97, 'ru', 2273, 0.1321, 80),
(97, 'ru', 2274, 0.1321, 81),
(97, 'ru', 2275, 0.1321, 83),
(97, 'ru', 2276, 0.1321, 88),
(97, 'ru', 2277, 0.1321, 93),
(97, 'ru', 2278, 0.1321, 94),
(97, 'ru', 2279, 0.1321, 101),
(97, 'ru', 2280, 0.1321, 102),
(97, 'ru', 2281, 0.1321, 103),
(97, 'ru', 2282, 0.2094, 133),
(97, 'ru', 2283, 0.1321, 114),
(97, 'ru', 2284, 0.1321, 115),
(97, 'ru', 2285, 0.1321, 116),
(97, 'ru', 2286, 0.1321, 118),
(97, 'ru', 2287, 0.1321, 119),
(97, 'ru', 2288, 0.1321, 121),
(97, 'ru', 2289, 0.1321, 122),
(97, 'ru', 2290, 0.1321, 135),
(97, 'ru', 2291, 0.1321, 137),
(97, 'ru', 2292, 0.1321, 138),
(97, 'ru', 2293, 0.1321, 141),
(97, 'ru', 2294, 0.1321, 144),
(97, 'ru', 2295, 0.1321, 147),
(97, 'ru', 2296, 0.1321, 148),
(97, 'ru', 2297, 0.1321, 150),
(97, 'ru', 2298, 0.1321, 151),
(97, 'ru', 2299, 0.1321, 152),
(97, 'ru', 2300, 0.1321, 154),
(97, 'ru', 2301, 0.1321, 156),
(97, 'ru', 2302, 0.1321, 157),
(97, 'ru', 2303, 0.1321, 158),
(97, 'ru', 2304, 0.1321, 159),
(97, 'ru', 2305, 0.1321, 161),
(97, 'ru', 2306, 0.1321, 162),
(97, 'ru', 2307, 0.1321, 164),
(97, 'ru', 2308, 0.1321, 165),
(97, 'ru', 2309, 0.1321, 168),
(97, 'ru', 2310, 0.1321, 170),
(97, 'ru', 2311, 0.1321, 171),
(97, 'ru', 2312, 0.1321, 173),
(97, 'ru', 2313, 0.1321, 174),
(97, 'ru', 2314, 0.1321, 175),
(97, 'ru', 2315, 0.1321, 200),
(97, 'ru', 2316, 0.1321, 202),
(97, 'ru', 2317, 0.1321, 203),
(97, 'ru', 2318, 0.1321, 211),
(97, 'ru', 2778, 0.1321, 237),
(97, 'ru', 2779, 0.1321, 238),
(97, 'ru', 2780, 0.1321, 239),
(97, 'ru', 2781, 0.1321, 246),
(97, 'ru', 2782, 0.1321, 248),
(97, 'ru', 2783, 0.1321, 250),
(97, 'ru', 2784, 0.1321, 3),
(98, 'ru', 1271, 0.1313, 1),
(98, 'ru', 1440, 0.1313, 2),
(98, 'ru', 1512, 0.4543, 135.4),
(98, 'ru', 1526, 0.3395, 138.6),
(98, 'ru', 1527, 0.2081, 139.5),
(98, 'ru', 1533, 0.1313, 34),
(98, 'ru', 1534, 0.1313, 227),
(98, 'ru', 1535, 0.1313, 240),
(98, 'ru', 1548, 0.3049, 152.75),
(98, 'ru', 1558, 0.1313, 158),
(98, 'ru', 1563, 0.1313, 9),
(98, 'ru', 1564, 0.2626, 115),
(98, 'ru', 1567, 0.2081, 63.5),
(98, 'ru', 1591, 0.1313, 8),
(98, 'ru', 1597, 0.1313, 17),
(98, 'ru', 1601, 0.3049, 124),
(98, 'ru', 1606, 0.1313, 66),
(98, 'ru', 1614, 0.2081, 162),
(98, 'ru', 1615, 0.2626, 135.667),
(98, 'ru', 1617, 0.1313, 6),
(98, 'ru', 1621, 0.1313, 181),
(98, 'ru', 1623, 0.1313, 205),
(98, 'ru', 1625, 0.1313, 49),
(98, 'ru', 1626, 0.1313, 50),
(98, 'ru', 1636, 0.2081, 129.5),
(98, 'ru', 1646, 0.1313, 105),
(98, 'ru', 1669, 0.1313, 96),
(98, 'ru', 1676, 0.1313, 24),
(98, 'ru', 1687, 0.1313, 188),
(98, 'ru', 1692, 0.1313, 144),
(98, 'ru', 1717, 0.2081, 130.5),
(98, 'ru', 1718, 0.2626, 169.333),
(98, 'ru', 1721, 0.1313, 218),
(98, 'ru', 1731, 0.1313, 231),
(98, 'ru', 1733, 0.2081, 171.5),
(98, 'ru', 1749, 0.1313, 19),
(98, 'ru', 1815, 0.2081, 156),
(98, 'ru', 1816, 0.1313, 226),
(98, 'ru', 1817, 0.2081, 211.5),
(98, 'ru', 1818, 0.1313, 229),
(98, 'ru', 1819, 0.394, 139.714),
(98, 'ru', 1820, 0.2081, 161),
(98, 'ru', 1827, 0.1313, 187),
(98, 'ru', 1838, 0.1313, 192),
(98, 'ru', 1847, 0.1313, 156),
(98, 'ru', 1849, 0.1313, 91),
(98, 'ru', 1851, 0.1313, 54),
(98, 'ru', 1852, 0.2081, 25),
(98, 'ru', 1858, 0.1313, 174),
(98, 'ru', 1860, 0.1313, 172),
(98, 'ru', 1861, 0.1313, 175),
(98, 'ru', 1871, 0.1313, 32),
(98, 'ru', 1903, 0.2081, 205.5),
(98, 'ru', 1908, 0.1313, 97),
(98, 'ru', 1958, 0.1313, 150),
(98, 'ru', 1961, 0.1313, 114),
(98, 'ru', 1969, 0.1313, 191),
(98, 'ru', 1994, 0.1313, 184),
(98, 'ru', 2006, 0.1313, 25),
(98, 'ru', 2007, 0.1313, 26),
(98, 'ru', 2023, 0.2081, 68),
(98, 'ru', 2024, 0.1313, 77),
(98, 'ru', 2025, 0.1313, 79),
(98, 'ru', 2040, 0.2081, 132),
(98, 'ru', 2041, 0.1313, 140),
(98, 'ru', 2043, 0.1313, 52),
(98, 'ru', 2058, 0.1313, 80),
(98, 'ru', 2073, 0.1313, 81),
(98, 'ru', 2088, 0.2081, 91.5),
(98, 'ru', 2090, 0.1313, 169),
(98, 'ru', 2111, 0.1313, 51),
(98, 'ru', 2112, 0.1313, 256),
(98, 'ru', 2123, 0.1313, 33),
(98, 'ru', 2140, 0.1313, 61),
(98, 'ru', 2145, 0.1313, 197),
(98, 'ru', 2146, 0.1313, 199),
(98, 'ru', 2160, 0.1313, 189),
(98, 'ru', 2183, 0.1313, 4),
(98, 'ru', 2184, 0.1313, 5),
(98, 'ru', 2185, 0.1313, 7),
(98, 'ru', 2186, 0.1313, 10),
(98, 'ru', 2187, 0.1313, 12),
(98, 'ru', 2188, 0.1313, 13),
(98, 'ru', 2189, 0.1313, 14),
(98, 'ru', 2190, 0.1313, 15),
(98, 'ru', 2191, 0.1313, 16),
(98, 'ru', 2192, 0.1313, 18),
(98, 'ru', 2193, 0.1313, 20),
(98, 'ru', 2194, 0.1313, 21),
(98, 'ru', 2195, 0.1313, 36),
(98, 'ru', 2196, 0.1313, 37),
(98, 'ru', 2197, 0.1313, 38),
(98, 'ru', 2198, 0.1313, 40),
(98, 'ru', 2199, 0.2081, 86.5),
(98, 'ru', 2200, 0.2081, 122.5),
(98, 'ru', 2201, 0.1313, 45),
(98, 'ru', 2202, 0.1313, 47),
(98, 'ru', 2203, 0.1313, 48),
(98, 'ru', 2204, 0.1313, 53),
(98, 'ru', 2205, 0.2081, 85),
(98, 'ru', 2206, 0.1313, 67),
(98, 'ru', 2207, 0.1313, 73),
(98, 'ru', 2208, 0.1313, 92),
(98, 'ru', 2209, 0.1313, 93),
(98, 'ru', 2210, 0.1313, 95),
(98, 'ru', 2211, 0.1313, 98),
(98, 'ru', 2212, 0.1313, 100),
(98, 'ru', 2213, 0.1313, 102),
(98, 'ru', 2214, 0.1313, 103),
(98, 'ru', 2215, 0.1313, 106),
(98, 'ru', 2216, 0.1313, 113),
(98, 'ru', 2217, 0.1313, 120),
(98, 'ru', 2218, 0.1313, 126),
(98, 'ru', 2219, 0.1313, 127),
(98, 'ru', 2220, 0.1313, 128),
(98, 'ru', 2221, 0.1313, 129),
(98, 'ru', 2222, 0.1313, 130),
(98, 'ru', 2223, 0.1313, 133),
(98, 'ru', 2224, 0.1313, 139),
(98, 'ru', 2225, 0.1313, 142),
(98, 'ru', 2226, 0.1313, 143),
(98, 'ru', 2227, 0.1313, 145),
(98, 'ru', 2228, 0.1313, 147),
(98, 'ru', 2229, 0.1313, 159),
(98, 'ru', 2230, 0.1313, 162),
(98, 'ru', 2231, 0.1313, 164),
(98, 'ru', 2232, 0.1313, 165),
(98, 'ru', 2233, 0.1313, 167),
(98, 'ru', 2234, 0.1313, 168),
(98, 'ru', 2235, 0.1313, 171),
(98, 'ru', 2236, 0.1313, 173),
(98, 'ru', 2237, 0.1313, 182),
(98, 'ru', 2238, 0.1313, 183),
(98, 'ru', 2239, 0.1313, 190),
(98, 'ru', 2240, 0.1313, 200),
(98, 'ru', 2241, 0.1313, 202),
(98, 'ru', 2242, 0.1313, 206),
(98, 'ru', 2243, 0.1313, 207),
(98, 'ru', 2244, 0.1313, 208),
(98, 'ru', 2245, 0.1313, 214),
(98, 'ru', 2246, 0.1313, 219),
(98, 'ru', 2778, 0.1313, 244),
(98, 'ru', 2779, 0.1313, 245),
(98, 'ru', 2780, 0.1313, 246),
(98, 'ru', 2781, 0.1313, 253),
(98, 'ru', 2782, 0.1313, 255),
(98, 'ru', 2783, 0.1313, 257),
(98, 'ru', 2784, 0.1313, 3),
(100, 'ru', 1431, 0.2314, 1),
(101, 'ru', 1431, 0.2314, 1),
(102, 'ru', 782, 0.2314, 2),
(102, 'ru', 1431, 0.2314, 1),
(103, 'ru', 1431, 0.2314, 1),
(103, 'ru', 1443, 0.2314, 2),
(104, 'ru', 697, 0.2314, 2),
(104, 'ru', 1431, 0.2314, 1),
(105, 'ru', 1451, 0.2314, 1),
(105, 'ru', 1452, 0.2314, 2),
(107, 'ru', 1589, 0.2314, 1),
(116, 'ru', 41, 0.2211, 96),
(116, 'ru', 155, 0.2211, 86),
(116, 'ru', 1258, 0.2211, 98),
(116, 'ru', 1471, 0.2211, 90),
(116, 'ru', 1512, 0.2211, 179.5),
(116, 'ru', 1516, 0.2211, 111),
(116, 'ru', 1517, 0.2211, 112),
(116, 'ru', 1520, 0.2789, 89.3333),
(116, 'ru', 1526, 0.4421, 150.125),
(116, 'ru', 1527, 0.3238, 88),
(116, 'ru', 1548, 0.2211, 51),
(116, 'ru', 1549, 0.2211, 115),
(116, 'ru', 1558, 0.2211, 62),
(116, 'ru', 1590, 0.2211, 42),
(116, 'ru', 1591, 0.3238, 50.5),
(116, 'ru', 1592, 0.2211, 45),
(116, 'ru', 1593, 0.2211, 46),
(116, 'ru', 1594, 0.2211, 47),
(116, 'ru', 1595, 0.2211, 48),
(116, 'ru', 1596, 0.2211, 49),
(116, 'ru', 1597, 0.2211, 50),
(116, 'ru', 1598, 0.2211, 52),
(116, 'ru', 1599, 0.2211, 53),
(116, 'ru', 1600, 0.2211, 54),
(116, 'ru', 1601, 0.3238, 64),
(116, 'ru', 1602, 0.2211, 56),
(116, 'ru', 1603, 0.2211, 58),
(116, 'ru', 1604, 0.2211, 59),
(116, 'ru', 1605, 0.2211, 61),
(116, 'ru', 1606, 0.2211, 68),
(116, 'ru', 1607, 0.2211, 69),
(116, 'ru', 1608, 0.2789, 47.6667),
(116, 'ru', 1609, 0.1395, 109),
(116, 'ru', 1610, 0.2211, 74),
(116, 'ru', 1611, 0.2211, 80),
(116, 'ru', 1612, 0.2211, 87),
(116, 'ru', 1613, 0.2211, 88),
(116, 'ru', 1614, 0.2211, 89),
(116, 'ru', 1615, 0.2211, 91),
(116, 'ru', 1616, 0.2211, 92),
(116, 'ru', 1617, 0.2211, 93),
(116, 'ru', 1618, 0.2211, 94),
(116, 'ru', 1619, 0.2211, 95),
(116, 'ru', 1620, 0.2211, 97),
(116, 'ru', 1621, 0.2211, 104),
(116, 'ru', 1622, 0.2211, 105),
(116, 'ru', 1623, 0.2211, 107),
(116, 'ru', 1624, 0.2211, 108),
(116, 'ru', 1625, 0.2211, 109),
(116, 'ru', 1626, 0.2789, 133.667),
(116, 'ru', 1627, 0.2211, 113),
(116, 'ru', 1628, 0.2211, 114),
(116, 'ru', 1629, 0.2211, 117),
(116, 'ru', 1630, 0.1395, 157),
(116, 'ru', 1631, 0.1395, 159),
(116, 'ru', 1632, 0.2211, 162.5),
(116, 'ru', 1633, 0.1395, 163),
(116, 'ru', 1634, 0.1395, 166),
(116, 'ru', 1635, 0.1395, 167),
(116, 'ru', 1636, 0.1395, 168),
(116, 'ru', 1637, 0.1395, 169),
(116, 'ru', 1638, 0.1395, 171),
(116, 'ru', 1639, 0.1395, 177),
(116, 'ru', 1640, 0.1395, 178),
(116, 'ru', 1641, 0.1395, 179),
(116, 'ru', 1642, 0.1395, 180),
(116, 'ru', 1643, 0.1395, 183),
(116, 'ru', 1644, 0.1395, 184),
(116, 'ru', 1645, 0.1395, 185),
(116, 'ru', 1646, 0.1395, 186),
(116, 'ru', 1647, 0.1395, 187),
(116, 'ru', 1648, 0.1395, 190),
(116, 'ru', 1649, 0.1395, 191),
(116, 'ru', 1680, 0.1395, 1),
(116, 'ru', 1681, 0.1395, 2),
(116, 'ru', 1811, 0.1395, 33),
(117, 'ru', 155, 0.2333, 40.5),
(117, 'ru', 312, 0.1472, 95),
(117, 'ru', 1315, 0.1472, 100),
(117, 'ru', 1471, 0.1472, 78),
(117, 'ru', 1500, 0.2333, 121),
(117, 'ru', 1512, 0.2333, 131),
(117, 'ru', 1520, 0.2333, 41.5),
(117, 'ru', 1526, 0.1472, 93),
(117, 'ru', 1535, 0.1472, 160),
(117, 'ru', 1538, 0.1472, 144),
(117, 'ru', 1539, 0.2333, 108.5),
(117, 'ru', 1548, 0.3417, 136),
(117, 'ru', 1564, 0.1472, 104),
(117, 'ru', 1567, 0.2944, 116),
(117, 'ru', 1568, 0.2333, 112),
(117, 'ru', 1596, 0.1472, 170),
(117, 'ru', 1601, 0.1472, 173),
(117, 'ru', 1611, 0.2333, 28.5),
(117, 'ru', 1612, 0.1472, 75),
(117, 'ru', 1613, 0.1472, 76),
(117, 'ru', 1614, 0.1472, 77),
(117, 'ru', 1615, 0.1472, 152),
(117, 'ru', 1641, 0.2333, 45.5),
(117, 'ru', 1656, 0.1472, 165),
(117, 'ru', 1670, 0.1472, 80),
(117, 'ru', 1671, 0.1472, 87),
(117, 'ru', 1692, 0.1472, 92),
(117, 'ru', 1702, 0.1472, 1),
(117, 'ru', 1703, 0.2333, 19.5),
(117, 'ru', 1704, 0.2333, 20.5),
(117, 'ru', 1705, 0.2333, 21.5),
(117, 'ru', 1706, 0.2944, 42.3333),
(117, 'ru', 1707, 0.2333, 34.5),
(117, 'ru', 1708, 0.2333, 42.5),
(117, 'ru', 1709, 0.2333, 43.5),
(117, 'ru', 1710, 0.2333, 44.5),
(117, 'ru', 1711, 0.2333, 46.5),
(117, 'ru', 1712, 0.2333, 47.5),
(117, 'ru', 1713, 0.2333, 48.5),
(117, 'ru', 1714, 0.1472, 73),
(117, 'ru', 1715, 0.1472, 74),
(117, 'ru', 1716, 0.2333, 95.5),
(117, 'ru', 1717, 0.1472, 89),
(117, 'ru', 1718, 0.2333, 108),
(117, 'ru', 1719, 0.1472, 91),
(117, 'ru', 1720, 0.1472, 94),
(117, 'ru', 1721, 0.1472, 98),
(117, 'ru', 1722, 0.1472, 102),
(117, 'ru', 1723, 0.1472, 105),
(117, 'ru', 1724, 0.1472, 106),
(117, 'ru', 1725, 0.1472, 112),
(117, 'ru', 1726, 0.1472, 113),
(117, 'ru', 1727, 0.1472, 114),
(117, 'ru', 1728, 0.1472, 115),
(117, 'ru', 1729, 0.1472, 117),
(117, 'ru', 1730, 0.1472, 118),
(117, 'ru', 1731, 0.1472, 119),
(117, 'ru', 1732, 0.1472, 124),
(117, 'ru', 1733, 0.1472, 125),
(117, 'ru', 1734, 0.2333, 132),
(117, 'ru', 1735, 0.2333, 133),
(117, 'ru', 1736, 0.1472, 130),
(117, 'ru', 1737, 0.1472, 132),
(117, 'ru', 1738, 0.1472, 134),
(117, 'ru', 1739, 0.1472, 138),
(117, 'ru', 1740, 0.1472, 145),
(117, 'ru', 1741, 0.1472, 146),
(117, 'ru', 1742, 0.1472, 147),
(117, 'ru', 1743, 0.1472, 148),
(117, 'ru', 1744, 0.1472, 150),
(117, 'ru', 1745, 0.1472, 151),
(117, 'ru', 1746, 0.1472, 153),
(117, 'ru', 1747, 0.1472, 154),
(117, 'ru', 1748, 0.1472, 162),
(117, 'ru', 1749, 0.1472, 163),
(117, 'ru', 1750, 0.1472, 164),
(117, 'ru', 1751, 0.1472, 166),
(117, 'ru', 1752, 0.1472, 168),
(117, 'ru', 1753, 0.1472, 169),
(117, 'ru', 1754, 0.1472, 171),
(117, 'ru', 1755, 0.1472, 172),
(117, 'ru', 1756, 0.1472, 174),
(121, 'ru', 1869, 0.2314, 1),
(121, 'ru', 1870, 0.2314, 2),
(124, 'ru', 1526, 0.2314, 4),
(124, 'ru', 1927, 0.2314, 1),
(124, 'ru', 1928, 0.2314, 2),
(124, 'ru', 1929, 0.2314, 3),
(126, 'ru', 1895, 0.2314, 1),
(127, 'ru', 1512, 0.3042, 22),
(127, 'ru', 1535, 0.3839, 9),
(127, 'ru', 1548, 0.3042, 17),
(127, 'ru', 1559, 0.192, 34),
(127, 'ru', 1589, 0.192, 36),
(127, 'ru', 1601, 0.3042, 27.5),
(127, 'ru', 1731, 0.192, 10),
(127, 'ru', 1760, 0.192, 37),
(127, 'ru', 1812, 0.192, 4),
(127, 'ru', 1813, 0.192, 6),
(127, 'ru', 1819, 0.192, 8),
(127, 'ru', 1835, 0.192, 12),
(127, 'ru', 1842, 0.192, 15),
(127, 'ru', 1845, 0.3042, 23),
(127, 'ru', 1850, 0.192, 21),
(127, 'ru', 1854, 0.192, 24),
(127, 'ru', 1868, 0.192, 33),
(127, 'ru', 1869, 0.192, 1),
(127, 'ru', 1870, 0.192, 2),
(127, 'ru', 1871, 0.192, 3),
(127, 'ru', 1872, 0.192, 5),
(127, 'ru', 1873, 0.3042, 16),
(127, 'ru', 1874, 0.192, 16),
(127, 'ru', 1875, 0.192, 22),
(127, 'ru', 1876, 0.192, 25),
(127, 'ru', 1877, 0.192, 26),
(127, 'ru', 1878, 0.192, 29),
(127, 'ru', 1879, 0.192, 30),
(127, 'ru', 1880, 0.192, 31),
(127, 'ru', 1881, 0.192, 35),
(129, 'ru', 1895, 0.2314, 1),
(129, 'ru', 1945, 0.2314, 2),
(130, 'ru', 1512, 0.2999, 24),
(130, 'ru', 1535, 0.3784, 11),
(130, 'ru', 1548, 0.2999, 19),
(130, 'ru', 1559, 0.1892, 36),
(130, 'ru', 1589, 0.1892, 38),
(130, 'ru', 1601, 0.2999, 29.5),
(130, 'ru', 1731, 0.1892, 12),
(130, 'ru', 1760, 0.1892, 39),
(130, 'ru', 1812, 0.1892, 6),
(130, 'ru', 1813, 0.1892, 8),
(130, 'ru', 1819, 0.1892, 10),
(130, 'ru', 1835, 0.1892, 14),
(130, 'ru', 1842, 0.1892, 17),
(130, 'ru', 1845, 0.2999, 25),
(130, 'ru', 1850, 0.1892, 23),
(130, 'ru', 1854, 0.1892, 26),
(130, 'ru', 1868, 0.1892, 35),
(130, 'ru', 1869, 0.2999, 2),
(130, 'ru', 1870, 0.2999, 3),
(130, 'ru', 1871, 0.1892, 5),
(130, 'ru', 1872, 0.1892, 7),
(130, 'ru', 1873, 0.2999, 18),
(130, 'ru', 1874, 0.1892, 18),
(130, 'ru', 1875, 0.1892, 24),
(130, 'ru', 1876, 0.1892, 27),
(130, 'ru', 1877, 0.1892, 28),
(130, 'ru', 1878, 0.1892, 31),
(130, 'ru', 1879, 0.1892, 32),
(130, 'ru', 1880, 0.1892, 33),
(130, 'ru', 1881, 0.1892, 37),
(131, 'ru', 1271, 0.135, 1),
(131, 'ru', 1512, 0.4049, 153.143),
(131, 'ru', 1520, 0.3134, 88.25),
(131, 'ru', 1526, 0.2139, 108),
(131, 'ru', 1527, 0.3134, 121.75),
(131, 'ru', 1534, 0.2139, 155.5),
(131, 'ru', 1548, 0.4049, 89.5714),
(131, 'ru', 1564, 0.135, 149),
(131, 'ru', 1567, 0.135, 41),
(131, 'ru', 1585, 0.135, 123),
(131, 'ru', 1601, 0.2139, 57.5),
(131, 'ru', 1606, 0.2139, 62),
(131, 'ru', 1612, 0.135, 82),
(131, 'ru', 1614, 0.135, 209),
(131, 'ru', 1615, 0.135, 162),
(131, 'ru', 1626, 0.135, 138),
(131, 'ru', 1641, 0.135, 167),
(131, 'ru', 1643, 0.135, 58),
(131, 'ru', 1716, 0.2139, 180.5),
(131, 'ru', 1717, 0.135, 184),
(131, 'ru', 1718, 0.135, 185),
(131, 'ru', 1743, 0.135, 30),
(131, 'ru', 1744, 0.135, 27),
(131, 'ru', 1813, 0.2699, 82),
(131, 'ru', 1814, 0.3489, 92.2),
(131, 'ru', 1815, 0.135, 200),
(131, 'ru', 1816, 0.3134, 83),
(131, 'ru', 1817, 0.135, 203),
(131, 'ru', 1818, 0.135, 204),
(131, 'ru', 1819, 0.135, 206),
(131, 'ru', 1820, 0.2139, 200.5),
(131, 'ru', 1836, 0.135, 177),
(131, 'ru', 1852, 0.135, 8),
(131, 'ru', 1858, 0.135, 38),
(131, 'ru', 1860, 0.2139, 66),
(131, 'ru', 1866, 0.2699, 75.3333),
(131, 'ru', 1872, 0.135, 102),
(131, 'ru', 1903, 0.2699, 145.333),
(131, 'ru', 1929, 0.135, 114),
(131, 'ru', 1946, 0.135, 3),
(131, 'ru', 1947, 0.135, 6),
(131, 'ru', 1948, 0.135, 7),
(131, 'ru', 1949, 0.135, 9),
(131, 'ru', 1950, 0.135, 10),
(131, 'ru', 1951, 0.135, 19),
(131, 'ru', 1952, 0.135, 26),
(131, 'ru', 1953, 0.135, 29),
(131, 'ru', 1954, 0.135, 36),
(131, 'ru', 1955, 0.135, 39),
(131, 'ru', 1956, 0.135, 40),
(131, 'ru', 1957, 0.135, 42),
(131, 'ru', 1958, 0.135, 43),
(131, 'ru', 1959, 0.2139, 89.5),
(131, 'ru', 1960, 0.2139, 68),
(131, 'ru', 1961, 0.135, 53),
(131, 'ru', 1962, 0.135, 54),
(131, 'ru', 1963, 0.135, 56),
(131, 'ru', 1964, 0.135, 59),
(131, 'ru', 1965, 0.135, 61),
(131, 'ru', 1966, 0.135, 62),
(131, 'ru', 1967, 0.135, 63),
(131, 'ru', 1968, 0.135, 64),
(131, 'ru', 1969, 0.135, 65),
(131, 'ru', 1970, 0.135, 66),
(131, 'ru', 1971, 0.135, 68),
(131, 'ru', 1972, 0.2699, 84.3333),
(131, 'ru', 1973, 0.2139, 108.5),
(131, 'ru', 1974, 0.135, 71),
(131, 'ru', 1975, 0.135, 72),
(131, 'ru', 1976, 0.135, 78),
(131, 'ru', 1977, 0.135, 79),
(131, 'ru', 1978, 0.135, 80),
(131, 'ru', 1979, 0.135, 81),
(131, 'ru', 1980, 0.135, 83),
(131, 'ru', 1981, 0.135, 84),
(131, 'ru', 1982, 0.2139, 122.5),
(131, 'ru', 1983, 0.135, 91),
(131, 'ru', 1984, 0.135, 92),
(131, 'ru', 1985, 0.135, 93),
(131, 'ru', 1986, 0.135, 95),
(131, 'ru', 1987, 0.135, 104),
(131, 'ru', 1988, 0.135, 115),
(131, 'ru', 1989, 0.135, 116),
(131, 'ru', 1990, 0.2139, 131),
(131, 'ru', 1991, 0.135, 118),
(131, 'ru', 1992, 0.2139, 135),
(131, 'ru', 1993, 0.135, 120),
(131, 'ru', 1994, 0.135, 121),
(131, 'ru', 1995, 0.135, 122),
(131, 'ru', 1996, 0.135, 124),
(131, 'ru', 1997, 0.135, 131),
(131, 'ru', 1998, 0.135, 132),
(131, 'ru', 1999, 0.135, 133),
(131, 'ru', 2000, 0.135, 134),
(131, 'ru', 2001, 0.135, 135),
(131, 'ru', 2002, 0.135, 136),
(131, 'ru', 2003, 0.135, 137),
(131, 'ru', 2004, 0.135, 139),
(131, 'ru', 2005, 0.135, 141),
(131, 'ru', 2006, 0.135, 142),
(131, 'ru', 2007, 0.135, 143),
(131, 'ru', 2008, 0.135, 150),
(131, 'ru', 2009, 0.135, 152),
(131, 'ru', 2010, 0.135, 158),
(131, 'ru', 2011, 0.135, 160),
(131, 'ru', 2012, 0.135, 163),
(131, 'ru', 2013, 0.135, 164),
(131, 'ru', 2014, 0.135, 165),
(131, 'ru', 2015, 0.135, 166),
(131, 'ru', 2016, 0.135, 168),
(131, 'ru', 2017, 0.135, 170),
(131, 'ru', 2018, 0.135, 171),
(131, 'ru', 2019, 0.135, 179),
(131, 'ru', 2020, 0.135, 180),
(131, 'ru', 2021, 0.135, 181),
(131, 'ru', 2022, 0.135, 182),
(131, 'ru', 2023, 0.135, 189),
(131, 'ru', 2024, 0.135, 191),
(131, 'ru', 2025, 0.135, 194),
(131, 'ru', 2112, 0.135, 219),
(131, 'ru', 2780, 0.135, 2),
(131, 'ru', 2781, 0.135, 216),
(131, 'ru', 2782, 0.135, 218),
(131, 'ru', 2783, 0.135, 220),
(134, 'ru', 2775, 0.2314, 1),
(135, 'ru', 2776, 0.2314, 1),
(136, 'ru', 715, 0.2127, 39),
(136, 'ru', 1266, 0.3372, 12),
(136, 'ru', 1381, 0.2127, 1),
(136, 'ru', 1535, 0.2127, 38),
(136, 'ru', 1539, 0.2127, 40),
(136, 'ru', 1540, 0.2127, 46),
(136, 'ru', 1541, 0.2127, 31),
(136, 'ru', 1542, 0.2127, 6),
(136, 'ru', 1543, 0.2127, 48),
(136, 'ru', 1544, 0.2127, 47),
(136, 'ru', 1546, 0.2127, 17),
(136, 'ru', 1562, 0.2127, 7),
(136, 'ru', 1563, 0.2127, 8),
(136, 'ru', 1564, 0.2127, 9),
(136, 'ru', 1565, 0.2127, 10),
(136, 'ru', 1566, 0.2127, 16),
(136, 'ru', 1567, 0.2127, 18),
(136, 'ru', 1568, 0.2127, 20),
(136, 'ru', 1569, 0.2127, 26),
(136, 'ru', 1570, 0.2127, 27),
(136, 'ru', 1571, 0.2127, 28),
(136, 'ru', 1572, 0.2127, 29),
(136, 'ru', 1573, 0.2127, 30),
(136, 'ru', 1574, 0.2127, 32),
(136, 'ru', 1812, 0.2127, 2),
(137, 'ru', 1601, 0.2314, 2),
(137, 'ru', 2239, 0.2314, 4),
(137, 'ru', 2785, 0.2314, 1),
(137, 'ru', 2786, 0.2314, 3),
(137, 'ru', 2787, 0.2314, 5),
(138, 'ru', 1441, 0.1362, 1),
(138, 'ru', 1442, 0.1362, 2),
(138, 'ru', 1512, 0.3825, 140.833),
(138, 'ru', 1520, 0.2725, 114.333),
(138, 'ru', 1526, 0.2159, 105.5),
(138, 'ru', 1527, 0.3163, 119.75),
(138, 'ru', 1534, 0.2159, 153.5),
(138, 'ru', 1548, 0.4087, 87.5714),
(138, 'ru', 1564, 0.1362, 147),
(138, 'ru', 1567, 0.1362, 39),
(138, 'ru', 1585, 0.1362, 121),
(138, 'ru', 1597, 0.1362, 17),
(138, 'ru', 1601, 0.2159, 55.5),
(138, 'ru', 1606, 0.2159, 59.5),
(138, 'ru', 1612, 0.1362, 80),
(138, 'ru', 1614, 0.1362, 207),
(138, 'ru', 1615, 0.1362, 160),
(138, 'ru', 1626, 0.1362, 136),
(138, 'ru', 1641, 0.1362, 165),
(138, 'ru', 1643, 0.1362, 56),
(138, 'ru', 1716, 0.2159, 178.5),
(138, 'ru', 1717, 0.1362, 182),
(138, 'ru', 1718, 0.1362, 183),
(138, 'ru', 1743, 0.1362, 28),
(138, 'ru', 1744, 0.1362, 25),
(138, 'ru', 1813, 0.2725, 80),
(138, 'ru', 1814, 0.3522, 90.2),
(138, 'ru', 1815, 0.1362, 198),
(138, 'ru', 1816, 0.2725, 106.667),
(138, 'ru', 1817, 0.1362, 201),
(138, 'ru', 1818, 0.1362, 202),
(138, 'ru', 1819, 0.1362, 204),
(138, 'ru', 1820, 0.2159, 198.5),
(138, 'ru', 1836, 0.1362, 175),
(138, 'ru', 1858, 0.1362, 36),
(138, 'ru', 1860, 0.2159, 64),
(138, 'ru', 1866, 0.2725, 73.3333),
(138, 'ru', 1872, 0.1362, 100),
(138, 'ru', 1903, 0.2159, 107.5),
(138, 'ru', 1929, 0.1362, 112),
(138, 'ru', 1946, 0.1362, 3),
(138, 'ru', 1947, 0.1362, 16),
(138, 'ru', 1950, 0.1362, 7),
(138, 'ru', 1952, 0.1362, 24),
(138, 'ru', 1953, 0.1362, 27),
(138, 'ru', 1954, 0.1362, 34),
(138, 'ru', 1955, 0.1362, 37),
(138, 'ru', 1956, 0.1362, 38),
(138, 'ru', 1957, 0.1362, 40),
(138, 'ru', 1958, 0.1362, 41),
(138, 'ru', 1959, 0.2159, 87.5),
(138, 'ru', 1960, 0.2159, 66),
(138, 'ru', 1961, 0.1362, 51),
(138, 'ru', 1962, 0.1362, 52),
(138, 'ru', 1963, 0.1362, 54),
(138, 'ru', 1964, 0.1362, 57),
(138, 'ru', 1965, 0.1362, 59),
(138, 'ru', 1966, 0.1362, 60),
(138, 'ru', 1967, 0.1362, 61),
(138, 'ru', 1968, 0.1362, 62),
(138, 'ru', 1969, 0.1362, 63),
(138, 'ru', 1970, 0.1362, 64),
(138, 'ru', 1971, 0.1362, 66),
(138, 'ru', 1972, 0.2725, 82.3333),
(138, 'ru', 1973, 0.2159, 106.5),
(138, 'ru', 1974, 0.1362, 69),
(138, 'ru', 1975, 0.1362, 70),
(138, 'ru', 1976, 0.1362, 76),
(138, 'ru', 1977, 0.1362, 77),
(138, 'ru', 1978, 0.1362, 78),
(138, 'ru', 1979, 0.1362, 79),
(138, 'ru', 1980, 0.1362, 81),
(138, 'ru', 1981, 0.1362, 82),
(138, 'ru', 1982, 0.2159, 120.5),
(138, 'ru', 1983, 0.1362, 89),
(138, 'ru', 1984, 0.1362, 90),
(138, 'ru', 1985, 0.1362, 91),
(138, 'ru', 1986, 0.1362, 93),
(138, 'ru', 1987, 0.1362, 102),
(138, 'ru', 1988, 0.1362, 113),
(138, 'ru', 1989, 0.1362, 114),
(138, 'ru', 1990, 0.2159, 129),
(138, 'ru', 1991, 0.1362, 116),
(138, 'ru', 1992, 0.2159, 133),
(138, 'ru', 1993, 0.1362, 118),
(138, 'ru', 1994, 0.1362, 119),
(138, 'ru', 1995, 0.1362, 120),
(138, 'ru', 1996, 0.1362, 122),
(138, 'ru', 1997, 0.1362, 129),
(138, 'ru', 1998, 0.1362, 130),
(138, 'ru', 1999, 0.1362, 131),
(138, 'ru', 2000, 0.1362, 132),
(138, 'ru', 2001, 0.1362, 133),
(138, 'ru', 2002, 0.1362, 134),
(138, 'ru', 2003, 0.1362, 135),
(138, 'ru', 2004, 0.1362, 137),
(138, 'ru', 2005, 0.1362, 139),
(138, 'ru', 2006, 0.1362, 140),
(138, 'ru', 2007, 0.1362, 141),
(138, 'ru', 2008, 0.1362, 148),
(138, 'ru', 2009, 0.1362, 150),
(138, 'ru', 2010, 0.1362, 156),
(138, 'ru', 2011, 0.1362, 158),
(138, 'ru', 2012, 0.1362, 161),
(138, 'ru', 2013, 0.1362, 162),
(138, 'ru', 2014, 0.1362, 163),
(138, 'ru', 2015, 0.1362, 164),
(138, 'ru', 2016, 0.1362, 166),
(138, 'ru', 2017, 0.1362, 168),
(138, 'ru', 2018, 0.1362, 169),
(138, 'ru', 2019, 0.1362, 177),
(138, 'ru', 2020, 0.1362, 178),
(138, 'ru', 2021, 0.1362, 179),
(138, 'ru', 2022, 0.1362, 180),
(138, 'ru', 2023, 0.1362, 187),
(138, 'ru', 2024, 0.1362, 189),
(138, 'ru', 2025, 0.1362, 192),
(138, 'ru', 2112, 0.1362, 4),
(138, 'ru', 2243, 0.1362, 5),
(138, 'ru', 2772, 0.1362, 6),
(139, 'ru', 2790, 0.2314, 1),
(140, 'ru', 1541, 0.2314, 4),
(140, 'ru', 2791, 0.2314, 1),
(140, 'ru', 2792, 0.2314, 2),
(140, 'ru', 2793, 0.2314, 3),
(140, 'ru', 2794, 0.2314, 5),
(140, 'ru', 2795, 0.2314, 6),
(140, 'ru', 2796, 0.2314, 7),
(140, 'ru', 2797, 0.2314, 8),
(140, 'ru', 2798, 0.2314, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_text`
--

CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_content_text`
--

INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
(1, '3140fa939e82d14de3829b731863cd80', 'УСЛУГИ\r\n\r\n'),
(2, 'f58e028735b5d07233c4a161c9231405', 'ПОИСК\r\n\r\n'),
(3, 'be3fe2336ca014ea48484837a6379cf7', 'КАРТА САЙТА\r\n\r\n'),
(4, 'b535d9cb75c64e695d6ebad33b22d99c', 'О КОМПАНИИ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ. 						 \rГЛАВНОЕ ПРАВИЛО - ИНДИВИДУАЛЬНЫЙ ПОДХОД К КАЖДОМУ КЛИЕНТУ\rНА СЕГОДНЯШНИЙ ДЕНЬ НАМИ РАЗРАБОТАНО БОЛЕЕ ПЯТИСОТ МОДЕЛЕЙ ДЛЯ ОФИСА И ДОМА. ВМЕСТЕ С ТЕМ МЫ СТРЕМИМСЯ ОБЕСПЕЧИТЬ НЕПОВТОРИМОСТЬ СВОЕЙ ПРОДУКЦИИ. МЫ ИЗГОТОВИМ МЕБЕЛЬ ДЛЯ КУХНИ, ДЕТСКОЙ, ГОСТИНОЙ, СПАЛЬНОЙ ИЛИ ВАННОЙ КОМНАТЫ, МЕБЕЛЬ ДЛЯ ОФИСА ОСОБОГО ДИЗАЙНА И НЕСТАНДАРТНОГО РАЗМЕРА. \rНАШИ ДИЗАЙНЕРЫ ПРОИЗВЕДУТ ЗАМЕРЫ ПОМЕЩЕНИЯ И ВМЕСТЕ С ВАМИ РАЗРАБОТАЮТ ДИЗАЙН-ПРОЕКТ МЕБЕЛИ ДЛЯ ВАШЕГО ИНТЕРЬЕРА, ПОДОБРАВ С ВЫСОКОЙ ТОЧНОСТЬЮ РАЗМЕРЫ, МОДЕЛИ, ЦВЕТА, ПОМОГУТ ОПТИМАЛЬНО РАСПОЛОЖИТЬ МЕБЕЛЬ. \rВАШ ПРОЕКТ БУДЕТ СОЗДАН С УЧЕТОМ ВСЕХ НЮАНСОВ И ПРОРИСОВКОЙ МЕЛЬЧАЙШИХ ДЕТАЛЕЙ. РЕЗУЛЬТАТЫ СОВМЕСТНОГО ТВОРЧЕСТВА ВЫ СМОЖЕТЕ ПОСМОТРЕТЬ В ОБЪЕМНОМ ПРЕДСТАВЛЕНИИ. ВАМ НАГЛЯДНО ПРОДЕМОНСТРИРУЮТ, КАК БУДУТ ВЫГЛЯДЕТЬ В ЖИЗНИ ВЫБРАННЫЕ ЭЛЕМЕНТЫ ИНТЕРЬЕРА ПРИ РАЗНОМ ОСВЕЩЕНИИ, В КОНКРЕТНОМ ПОМЕЩЕНИИ, СДЕЛАННЫЕ ИЗ ОПРЕДЕЛЕННЫХ МАТЕРИАЛОВ. В ВАШЕ РАСПОРЯЖЕНИЕ БУДЕТ ПРЕДОСТАВЛЕНО МНОГО РАЗЛИЧНЫХ ВАРИАНТОВ, ИЗ КОТОРЫХ ВЫ СМОЖЕТЕ ВЫБРАТЬ НАИБОЛЕЕ ПОДХОДЯЩИЙ ИМЕННО ВАМ. 						 					\rЗАКАЗ БУДЕТ ВЫПОЛНЕН И ДОСТАВЛЕН ТОЧНО В СРОК. ВСЕ РАБОТЫ ПО СБОРКЕ И УСТАНОВКЕ МЕБЕЛИ ОСУЩЕСТВЛЯЮТ СОТРУДНИКИ НАШЕЙ КОМПАНИИ. СТРОГИЙ КОНТРОЛЬ КАЧЕСТВА ОСУЩЕСТВЛЯЕТСЯ НА ВСЕХ ЭТАПАХ РАБОТ: ОТ МОМЕНТА ОФОРМЛЕНИЯ ЗАКАЗА ДО МОМЕНТА ПРИЕМА ВЫПОЛНЕННЫХ РАБОТ. \rПЕРЕДОВЫЕ ТЕХНОЛОГИИ И БЕСЦЕННЫЙ ОПЫТ\rИСПОЛЬЗОВАНИЕ ПЕРЕДОВЫХ КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ, МНОГОЛЕТНИЙ ОПЫТ НАШИХ СПЕЦИАЛИСТОВ ПОЗВОЛЯЮТ ПРОИЗВЕСТИ ГРАМОТНЫЕ РАСЧЕТЫ И СНИЗИТЬ РАСХОД МАТЕРИАЛОВ И СЕБЕСТОИМОСТЬ ПРОДУКЦИИ, ИЗБЕЖАТЬ ОШИБОК ПРИ ПРОЕКТИРОВАНИИ И ОПТИМИЗИРОВАТЬ ДИЗАЙН КОМПЛЕКСНЫХ ИНТЕРЬЕРОВ. ГАРАНТИЯ НА НАШУ ПРОДУКЦИЮ СОСТАВЛЯЕТ 18 МЕСЯЦЕВ, А НА ОТДЕЛЬНУЮ ПРОДУКЦИЮ 36 МЕСЯЦЕВ. \rМЫ ГОРДИМСЯ НАШИМИ СОТРУДНИКАМИ ПРОШЕДШИМИ ПРОФЕССИОНАЛЬНОЕ ОБУЧЕНИЕ В ЛУЧШИХ УЧЕБНЫХ ЗАВЕДЕНИЯХ РОССИИ И ЗАРУБЕЖЬЯ. У НАС ТРУДЯТСЯ ВЫСОКОКЛАССНЫЕ СПЕЦИАЛИСТЫ РАЗНЫХ ВОЗРАСТОВ. МЫ ЦЕНИМ ЭНТУЗИАЗМ МОЛОДЕЖИ И БЕСЦЕННЫЙ ОПЫТ СТАРШЕГО ПОКОЛЕНИЯ. ВСЕ МЫ РАЗНЫЕ, НО НАС ОБЪЕДИНЯЕТ ПРЕДАННОСТЬ СВОЕМУ ДЕЛУ И ВЕРА В ИДЕИ НАШЕЙ КОМПАНИИ. \rВЫСОЧАЙШИЕ СТАНДАРТЫ КАЧЕСТВА - ЗАЛОГ НАШЕГО УСПЕХА\rМЕБЕЛЬНАЯ КОМПАНИЯ\rОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД  С ДРУГОЙ. \rЕЖЕГОДНО НАША ПРОДУКЦИЯ ПРОХОДИТ СЕРТИФИКАЦИОННЫЕ ИСПЫТАНИЯ В СПЕЦИАЛИЗИРОВАННЫХ ЛАБОРАТОРИЯХ РОССИИ И ИМЕЕТ СЕРТИФИКАТЫ СООТВЕТСТВИЯ ПРОДУКЦИИ НОРМАМ БЕЗОПАСНОСТИ И КАЧЕСТВА. КРОМЕ ТОГО, \rМЕБЕЛЬНАЯ КОМПАНИЯ\rОДНОЙ ИЗ ПЕРВЫХ СРЕДИ МЕБЕЛЬНЫХ ПРОИЗВОДИТЕЛЕЙ РОССИИ В 2003 ГОДУ ПРОШЛА АУДИТ НА СООТВЕТСТВИЕ ТРЕБОВАНИЯМ СИСТЕМЫ МЕНЕДЖМЕНТА КАЧЕСТВА ИСО 9000 И ПОЛУЧИЛА СЕРТИФИКАТ СООТВЕТСТВИЯ СИСТЕМЫ КАЧЕСТВА НА ПРЕДПРИЯТИИ НОРМАМ МЕЖДУНАРОДНОГО СТАНДАРТА.\r\n'),
(5, '55171aa121806afa21b564e0af9ed46f', 'ИСТОРИЯ\r\n1992Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНАЧИНАЛАСЬ С ИЗГОТОВЛЕНИЯ МЕБЕЛИ ДЛЯ ШКОЛ И ОФИСОВ. ПЕРВОЕ 									ПРОИЗВОДСТВО МЕБЕЛИ РАСПОЛАГАЛОСЬ В АРЕНДУЕМОЙ МАСТЕРСКОЙ, ПЛОЩАДЬЮ 400 М2 С ОДНИМ 									ДЕРЕВООБРАБАТЫВАЮЩИМ СТАНКОМ. В КОМПАНИИ РАБОТАЛО ДВАДЦАТЬ ЧЕЛОВЕК. ВСЕ ЗАРАБОТАННЫЕ 									СРЕДСТВА ВКЛАДЫВАЛИСЬ В РАЗВИТИЕ, ЧТО ПОЗВОЛИЛО МОЛОДОЙ КОМПАНИИ РАСТИ БЫСТРЫМИ 									ТЕМПАМИ. 								\r1993Г. 								\rВВЕДЕН В ЭКСПЛУАТАЦИЮ НОВЫЙ ЦЕХ ПЛОЩАДЬЮ 700 М2, СТАВШИЙ ПЕРВОЙ СОБСТВЕННОСТЬЮ 									\rМЕБЕЛЬНОЙ КОМПАНИИ\r. МОДЕРНИЗАЦИЯ ПРОИЗВОДСТВЕННОЙ БАЗЫ ПРЕДПРИЯТИЯ СТАЛА ХОРОШЕЙ 									ТРАДИЦИЕЙ. КОМПАНИЯ ПОСТЕПЕННО ПЕРЕШЛА К БОЛЕЕ СОВЕРШЕННОМУ ОБОРУДОВАНИЮ, ЧТО ПОЗВОЛИЛО 									ПОВЫСИТЬ УРОВЕНЬ КАЧЕСТВА ВЫПУСКАЕМОЙ ПРОДУКЦИИ И ЗНАЧИТЕЛЬНО УВЕЛИЧИТЬ ОБЪЕМЫ ПРОИЗВОДСТВА. 								\r1998Г. 								\rВ ВОРОНЕЖЕ ОТКРЫТ ПЕРВЫЙ ФИРМЕННЫЙ МАГАЗИН-САЛОН \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. ШАГ ЗА ШАГОМ 									ПРОДУКЦИЯ ПРЕДПРИЯТИЯ ЗАВОЕВЫВАЛА РЕГИОНЫ СИБИРИ И УРАЛА, МОСКВЫ И ПОДМОСКОВЬЯ, 									ЮГА И СЕВЕРО-ЗАПАДА РОССИИ. ПРОИЗВОДСТВЕННЫЕ ПЛОЩАДИ КОМПАНИИ УВЕЛИЧЕНЫ ДО 5000 									М2. 								\r1999Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rСТАЛА ДИПЛОМАНТОМ ОДНОЙ ИЗ САМЫХ ПРЕСТИЖНЫХ МЕЖДУНАРОДНЫХ 									ВЫСТАВОК \rЕВРОЭКСПОМЕБЕЛЬ-99\r- ПЕРВОЕ ОФИЦИАЛЬНОЕ ПРИЗНАНИЕ МЕБЕЛЬНОЙ ПРОДУКЦИИ 									МЕБЕЛЬНОЙ КОМПАНИИ. В ЭТОМ ЖЕ ГОДУ КОМПАНИЯ ВЫХОДИТ НА МИРОВОЙ РЫНОК. БЫЛ ЗАКЛЮЧЕН 									РЯД КОНТРАКТОВ НА ПОСТАВКУ МЕБЕЛИ В СТРАНЫ СНГ И БЛИЖНЕГО ЗАРУБЕЖЬЯ. 								\r2000Г. 								\rКОЛЛЕКТИВ КОМПАНИИ НАСЧИТЫВАЕТ БОЛЕЕ 500 СОТРУДНИКОВ. ЗАКЛЮЧАЮТСЯ НОВЫЕ КОНТРАКТ 									НА ПОСТАВКУ МЕБЕЛИ В ЕВРОПЕЙСКИЕ СТРАНЫ. 								\r2002Г. 								\rМЕБЕЛЬНАЯ КОМПАНИЯ\rВОШЛА В ДЕСЯТКУ ЛУЧШИХ ПРОИЗВОДИТЕЛЕЙ МЕБЕЛИ ПО ДАННЫМ ВЕДУЩИХ 									МЕБЕЛЬНЫХ САЛОНОВ РОССИИ, А ТАКЖЕ В ЧИСЛО ЛИДЕРОВ ОРГАНИЗАЦИОННОГО РАЗВИТИЯ. 								\r2003Г. 								\rПРИСТУПИЛИ К СТРОИТЕЛЬСТВУ СКЛАДА МАТЕРИАЛОВ. В МОСКВЕ ОТКРЫТ ФИЛИАЛ КОМПАНИИ. \nПРОВЕДЕНА ПЕРВАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ, РЕЗУЛЬТАТОМ КОТОРОЙ СТАЛО УКРЕПЛЕНИЕ ВЗАИМОВЫГОДНЫХ 									ОТНОШЕНИЙ И ЗАКЛЮЧЕНИЕ ДИЛЕРСКИХ ДОГОВОРОВ. 								\r2004Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО И ОСНАЩЕНИЕ НОВОГО ПРОИЗВОДСТВЕННОГО КОРПУСА И СКЛАДА МАТЕРИАЛОВ. \nРАСШИРЕНО ПРЕДСТАВИТЕЛЬСТВО КОМПАНИИ НА РОССИЙСКОМ РЫНКЕ И ЗА РУБЕЖОМ. \nОТКРЫТО 									РЕГИОНАЛЬНОЕ ПРЕДСТАВИТЕЛЬСТВО \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ ЕКАТЕРИНБУРГЕ. 								\r2005Г. 								\rКОМПАНИЯ ПРИОБРЕТАЕТ НОВОЕ ПРОИЗВОДСТВЕННОЕ ОБОРУДОВАНИЕ КОНЦЕРНА - УГЛОВУЮ ЛИНИЮ 									РАСКРОЯ МАТЕРИАЛОВ И ЛИНИЮ ЗАГРУЗКИ ВЫГРУЗКИ. \nНАЧИНАЕТСЯ ВЫПУСК ПРОДУКЦИИ В 									НАТУРАЛЬНОМ ШПОНЕ. ФОРМИРУЕТСЯ ОТДЕЛЬНЫЙ СКЛАД МАТЕРИАЛОВ И КОМПЛЕКТУЮЩИХ. \nВ ЭТОМ ЖЕ ГОДУ ОТКРЫВАЕТСЯ ФАБРИКА МЯГКОЙ МЕБЕЛИ \rМЕБЕЛЬПЛЮС\r2006Г. 								\rОТКРЫТЫ РЕГИОНАЛЬНЫЕ ПРЕДСТАВИТЕЛЬСТВА \rМЕБЕЛЬНОЙ КОМПАНИИ\rВ САНКТ-ПЕТЕРБУРГЕ 									И НИЖНЕМ НОВГОРОДЕ. \nРАЗВИВАЕТСЯ СОБСТВЕННАЯ РОЗНИЧНАЯ СЕТЬ ФИРМЕННЫХ МАГАЗИНОВ-САЛОНОВ 									НА ТЕРРИТОРИИ РОССИИ. 								\r2007Г. 								\rЗАВЕРШЕНО СТРОИТЕЛЬСТВО ВТОРОЙ ФАБРИКИ. ОБЩАЯ ПЛОЩАДЬ ПРОИЗВОДСВЕННО-СКЛАДСКИХ КОРПУСОВ 									КОМПАНИИ СОСТАВЛЯЕТ УЖЕ БОЛЕЕ 30000 М2. \nПРОВЕДЕНА ВТОРАЯ КОНФЕРЕНЦИЯ ПАРТНЕРОВ 									КОМПАНИИ \r\"ТЕХНОЛОГИЯ УСПЕШНОГО БИЗНЕСА\"\r. 								\r2008Г. 								\rОТКРЫТО НОВОЕ ПРЕДПРИЯТИЕ ДЛЯ ПРОИЗВОДСТВА МЕБЕЛИ ПО ИНДИВИДУАЛЬНЫМ ПРОЕКТАМ \rКОМФОРТ\r. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rПРОДОЛЖАЕТ ОБНОВЛЕНИЕ ОБОРУДОВАНИЯ. 								\r2008Г. 								\rНОВЕЙШИМ ОБОРУДОВАНИЕМ УКОМПЛЕКТОВАНА ВТОРАЯ ФАБРИКА. ЗАПУЩЕНА ВТОРАЯ ПРОИЗВОДСТВЕННАЯ 									ЛИНИЯ. \nПРОВЕДЕНА ТРЕТЬЯ КОНФЕРЕНЦИЯ \rПАРТНЕРСТВО - БИЗНЕС СЕГОДНЯ\rПРИНЯТО РЕШЕНИЕ О СТРОИТЕЛЬСТВЕ ТРЕТЬЕЙ ФАБРИКИ. ПЛОЩАДЬ ПРОИЗВОДСТВЕННО  СКЛАДСКИХ 									КОРПУСОВ СОСТАВИТ БОЛЕЕ 70000М2. \nПО ВСЕЙ СТРАНЕ И ЗАРУБЕЖОМ ОТКРЫТО 37 МЕБЕЛЬНЫХ 									САЛОНОВ. \nВ КОМПАНИИ РАБОТАЕТ БОЛЕЕ ПОЛУТОРА ТЫСЯЧ СОТРУДНИКОВ.\r\n'),
(6, 'c501a4fb29fd5bc92bc4babebf160ed9', 'РУКОВОДСТВО\r\nУСПЕШНОЕ РАЗВИТИЕ БИЗНЕСА  ВО МНОГОМ РЕЗУЛЬТАТ КВАЛИФИЦИРОВАННОЙ РАБОТЫ РУКОВОДСТВА. 							\rМЕБЕЛЬНАЯ КОМПАНИЯ\rНА МЕБЕЛЬНОМ РЫНКЕ УЖЕ 18 ЛЕТ. ЗА ЭТО ВРЕМЯ КОМПАНИЯ 							НЕ ТОЛЬКО СОХРАНИЛА, НО И УПРОЧИЛА ЛИДИРУЮЩИЕ ПОЗИЦИИ СРЕДИ ВЕДУЩИХ ИГРОКОВ МЕБЕЛЬНОГО 							РЫНКА. 						\rМЕБЕЛЬНАЯ КОМПАНИЯ\rИЗ ГОДА В ГОД РАСШИРЯЕТ АССОРТИМЕНТ ВЫПУСКАЕМОЙ ПРОДУКЦИИ, 							НАРАЩИВАЕТ ТЕМПЫ И ОБЪЕМЫ ПРОИЗВОДСТВА, УВЕЛИЧИВАЕТ ПРОИЗВОДСТВЕННЫЕ И СКЛАДСКИЕ 							ПЛОЩАДИ, РАЗВИВАЕТ ОТНОШЕНИЯ С ПАРТНЕРАМИ СО ВСЕХ РЕГИОНОВ СТРАНЫ И НАЛАЖИВАЕТ СВЯЗИ 							С ЗАРУБЕЖНЫМИ ПАРТНЕРАМИ. В БОЛЬШОЙ СТЕПЕНИ ЭТО ЗАСЛУГА ХОРОШО ПОДГОТОВЛЕННОГО РУКОВОДЯЩЕГО 							СОСТАВА И ЕГО ГРАМОТНОЙ ПОЛИТИКИ. 						\rСОБСТВЕННИК КОМПАНИИ МЕБЕЛЬНАЯ КОМПАНИЯ\rКОЛЕСНИКОВ ВИКТОР ФЕДОРОВИЧ 								\rРОДИЛСЯ 3 СЕНТЯБРЯ 1964 ГОДА.\nОБРАЗОВАНИЕ: ЗАКОНЧИЛ АВИАЦИОННЫЙ ФАКУЛЬТЕТ ВОРОНЕЖСКОГО 									ГОСУДАРСТВЕННОГО ПОЛИТЕХНИЧЕСКОГО ИНСТИТУТА. В 1994 ГОДУ ПРОШЕЛ ОБУЧЕНИЕ ПО ПРОГРАММЕ 									ПОДГОТОВКА МАЛОГО И СРЕДНЕГО БИЗНЕСА В США.\nВ НАСТОЯЩЕЕ ВРЕМЯ ВИКТОР ФЕДОРОВИЧ 									ВОЗГЛАВЛЯЕТ УПРАВЛЯЮЩУЮ КОМПАНИЮ, КОТОРАЯ КООРДИНИРУЕТ ДЕЯТЕЛЬНОСТЬ ПРЕДПРИЯТИЙ, 									ВХОДЯЩИХ В ГРУППУ КОМПАНИЙ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r. 								\rГЕНЕРАЛЬНЫЙ ДИРЕКТОР МЕБЕЛЬНОЙ КОМПАНИИ\rРАТЧЕНКО АЛЕКСАНДР ПЕТРОВИЧ 								\rРОДИЛСЯ 5 ИЮНЯ 1962 ГОДА.\nОБРАЗОВАНИЕ: ВОРОНЕЖСКИЙ ПОЛИТЕХНИЧЕСКИЙ ИНСТИТУТ 									ПО СПЕЦИАЛЬНОСТИ ИНЖЕНЕР-ТЕХНОЛОГ; ПРОГРАММА ЭФФЕКТИВНОЕ РАЗВИТИЕ ПРОИЗВОДСТВА 									(США).\nВ \rМЕБЕЛЬНОЙ КОМПАНИИ\rСЕРГЕЙ ФОМИЧ С 1994 ГОДА. ЗА ЭТО ВРЕМЯ ПРОШЕЛ 									ПУТЬ ОТ НАЧАЛЬНИКА ЦЕХА ДО ГЕНЕРАЛЬНОГО ДИРЕКТОРА ПРЕДПРИЯТИЯ. 								\rЗАМЕСТИТЕЛЬ ГЕНЕРАЛЬНОГО ДИРЕКТОРА УПРАВЛЯЮЩЕЙ КОМПАНИИ\rРОГОВОЙ АНДРЕЙ ВЛАДИМИРОВИЧ 								\rОБРАЗОВАНИЕ: ФАКУЛЬТЕТ РАДИОТЕХНИКИ ВОРОНЕЖСКОГО ГОСУДАРСТВЕННОГО ТЕХНИЧЕСКОГО УНИВЕРСИТЕТА.\nВ КОМПАНИИ С 1 ИЮНЯ 2000 ГОДА.\r\n'),
(7, 'd6ae18283686e0f65091531174c8b418', 'ВАКАНСИИ\r\n\r\n'),
(8, '17e08217818f62561b1d2f0f3a016a1f', 'МИССИЯ И СТРАТЕГИЯ\r\nМЕБЕЛЬНАЯ КОМПАНИЯ\r- ДИНАМИЧНО РАЗВИВАЮЩЕЕСЯ ПРОИЗВОДСТВЕННОЕ 							ПРЕДПРИЯТИЕ, КОТОРОЕ ИМЕЕТ ПЕРЕД СОБОЙ \nЯСНО ВЫРАЖЕННЫЕ ЦЕЛИ И ИНСТРУМЕНТЫ ДЛЯ 							ИХ ДОСТИЖЕНИ.МЫ ПРЕДОСТАВЛЯЕМ КАЖДОМУ ЛУЧШУЮ ВОЗМОЖНОСТЬ ОБУСТРОИТЬ СВОЕ ЖИЗНЕННОЕ \nИ РАБОЧЕЕ ПРОСТРАНСТВО.МЫ РАБОТАЕМ НА ДОЛГОСРОЧНУЮ ПЕРСПЕКТИВУ И ПРЕДЛАГАЕМ ОПТИМАЛЬНЫЕ 							РЕШЕНИЯ. КОМПАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\r- \nНАДЕЖНЫЙ, ТЕХНОЛОГИЧНЫЙ, ГИБКИЙ ПОСТАВЩИК 							С БОЛЬШИМИ МОЩНОСТЯМИ. 						\rЦЕЛИ И ЗАДАЧИ\rОПРАВДЫВАТЬ ОЖИДАНИЯ ЗАКАЗЧИКА: КЛИЕНТ ВСЕГДА ПРАВ. ТОЛЬКО ПОТРЕБИТЕЛЬ ФОРМИРУЕТ 									ЕДИНУЮ СИСТЕМУ ВЗГЛЯДОВ НА КАЧЕСТВО \nВЫПУСКАЕМОЙ ПРОДУКЦИИ И РАБОТ.\rДОБИТЬСЯ ОТ РАБОТНИКОВ КОМПАНИИ ПОНИМАНИЯ ИХ ЛИЧНОЙ ОТВЕТСТВЕННОСТИ ЗА КАЧЕСТВО 									РАБОТ.\rПУТЕМ ПОВЫШЕНИЯ КАЧЕСТВА ПРОДУКЦИИ И РАБОТ ПОСТОЯННО УВЕЛИЧИВАТЬ ОБЪЕМЫ ПРОИЗВОДСТВА 									С ЦЕЛЬЮ ПОСЛЕДУЮЩЕГО РЕИНВЕСТИРОВАНИЯ \nПРИБЫЛИ В РАЗВИТИЕ КОМПАНИИ.\rОБЕСПЕЧИВАТЬ СТРОГОЕ СООТВЕТСТВИЕ ПРОИЗВОДИМОЙ ПРОДУКЦИИ ТРЕБОВАНИЯМ ПОТРЕБИТЕЛЕЙ, 									НОРМАМ И ПРАВИЛАМ \nБЕЗОПАСНОСТИ, ТРЕБОВАНИЯМ ЗАЩИТЫ ОКРУЖАЮЩЕЙ СРЕДЫ.\rПОЛИТИКА КОМПАНИИ\rПОСТОЯННОЕ СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ КАЧЕСТВА. СВОЕВРЕМЕННОЕ И ЭФФЕКТИВНОЕ ПРИНЯТИЕ 									КОРРЕКТИРУЮЩИХ МЕР .\rЗАБОТА О РАБОТНИКАХ КОМПАНИИ. СОЗДАНИЕ УСЛОВИЙ ТРУДА И ОСНАЩЕНИЕ РАБОЧИХ МЕСТ, СООТВЕТСТВУЮЩИХ 									ВСЕМ САНИТАРНЫМ \nИ ГИГИЕНИЧЕСКИМ НОРМАМ.\rПОВЫШЕНИЕ БЛАГОСОСТОЯНИЯ СОТРУДНИКОВ. ОБЕСПЕЧЕНИЕ МОРАЛЬНОГО И МАТЕРИАЛЬНОГО УДОВЛЕТВОРЕНИЯ 									РАБОТНИКОВ КОМПАНИИ.\rСИСТЕМАТИЧЕСКОЕ ОБУЧЕНИЕ РАБОТНИКОВ ВСЕХ УРОВНЕЙ С ЦЕЛЬЮ ПОСТОЯННОГО ПОВЫШЕНИЯ ИХ 									ПРОФЕССИОНАЛЬНОГО МАСТЕРСТВА.\rВНЕДРЕНИЕ ВЫСОКОПРОИЗВОДИТЕЛЬНОГО ОБОРУДОВАНИЯ И НОВЕЙШИХ ТЕХНОЛОГИЙ ДЛЯ ПОВЫШЕНИЯ 									ПРОИЗВОДИТЕЛЬНОСТИ ТРУДА, \nОПТИМИЗАЦИИ ЗАТРАТ И, КАК РЕЗУЛЬТАТ, СНИЖЕНИЯ ЦЕН 									НА ВЫПУСКАЕМУЮ ПРОДУКЦИЮ.\rСОЗДАНИЕ НОВЫХ РАБОЧИХ МЕСТ. ПРИВЛЕЧЕНИЕ НА РАБОТУ СПЕЦИАЛИСТОВ ВЫСОКОЙ КВАЛИФИКАЦИИ.\rВЫХОД НА МЕЖДУНАРОДНЫЙ РЫНОК.\rМЫ РАЗВИВАЕМ ДОВЕРИТЕЛЬНЫЕ ВЗАИМОВЫГОДНЫЕ ОТНОШЕНИЯ СО СВОИМИ ПАРТНЕРАМИ В ДОЛГОСРОЧНЫХ 							ИНТЕРЕСАХ НАШЕГО БИЗНЕСА. \nМЕБЕЛЬНАЯ КОМПАНИЯ\rОТВЕТСТВЕННО ОТНОСИТСЯ 							К ВЫПОЛНЕНИЮ ВЗЯТЫХ НА СЕБЯ ОБЯЗАТЕЛЬСТВ И ЖДЕТ ТАКОГО ЖЕ \nПОДХОДА К ДЕЛУ ОТ 							СВОИХ ПАРТНЕРОВ ПО БИЗНЕСУ. ЭТА ТРЕБОВАТЕЛЬНОСТЬ  ЗАЛОГ НАШЕЙ ДОЛГОСРОЧНОЙ ПРИБЫЛЬНОСТИ. 						\rСО ДНЯ СВОЕГО ОСНОВАНИЯ \rМЕБЕЛЬНАЯ КОМПАНИЯ\rСОДЕЙСТВУЕТ РОСТУ БЛАГОСОСТОЯНИЯ 							РЕГИОНОВ РОССИИ. МЫ ПОНИМАЕМ ВАЖНОСТЬ \nСОЦИАЛЬНОЙ ОТВЕТСТВЕННОСТИ НАШЕЙ КОМПАНИИ 							И ОСТАНЕМСЯ ПРИМЕРОМ В ВОПРОСАХ СОЦИАЛЬНОЙ ЗАЩИЩЕННОСТИ НАШИХ СОТРУДНИКОВ.\r\n'),
(9, '43974ce3161b1536a23aab70dfdf083c', 'ПРОДУКЦИЯ\r\n\r\n'),
(10, '0f98a99a3d5b3b558798799f38ff044c', 'TITLE\r\nКонтакты\nОтзывы гостей\rАрендодателям\rПоставщикам\rPIT STOP Кафе\rКонтакты: \rАдрес: ООО «ПИТСТОП КАФЕ» \r117405,г. Москва, Варшавское шоссе, д. 145, к.8, каб.I-1-18\rТел: +7(495) 181-6159\rE-MAIL: \rINFO@PITSTOP-CAFE.RU\rСвязаться с нами\nСогласен на обработку персональных данных\rОтправить отзыв\r\n'),
(11, '7c285f6a61d238a340b43f0ef846a536', 'ВХОД НА САЙТ\r\nВЫ ЗАРЕГИСТРИРОВАНЫ И УСПЕШНО АВТОРИЗОВАЛИСЬ.\rВЕРНУТЬСЯ НА ГЛАВНУЮ СТРАНИЦУ\r\n'),
(12, '9ed747910bcc6af2d6a02221bb1cabc7', 'TITLE\r\nTEXT HERE....\r\n'),
(13, '9dc81310e5f6940cd74425623ed50b52', 'МЕБЕЛЬНАЯ КОМПАНИЯ\r\nНАША КОМПАНИЯ СУЩЕСТВУЕТ НА РОССИЙСКОМ РЫНКЕ С 1992 ГОДА. ЗА ЭТО ВРЕМЯ «МЕБЕЛЬНАЯ КОМПАНИЯ» ПРОШЛА БОЛЬШОЙ ПУТЬ ОТ МАЛЕНЬКОЙ ТОРГОВОЙ ФИРМЫ ДО ОДНОГО ИЗ КРУПНЕЙШИХ ПРОИЗВОДИТЕЛЕЙ КОРПУСНОЙ МЕБЕЛИ В РОССИИ.\n«МЕБЕЛЬНАЯ КОМПАНИЯ» ОСУЩЕСТВЛЯЕТ ПРОИЗВОДСТВО МЕБЕЛИ НА ВЫСОКОКЛАССНОМ ОБОРУДОВАНИИ С ПРИМЕНЕНИЕМ МИНИМАЛЬНОЙ ДОЛИ РУЧНОГО ТРУДА, ЧТО ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ВЫСОКОЕ КАЧЕСТВО НАШЕЙ ПРОДУКЦИИ. НАЛАЖЕН ПРОИЗВОДСТВЕННЫЙ ПРОЦЕСС КАК МАССОВОГО И ИНДИВИДУАЛЬНОГО ХАРАКТЕРА, ЧТО С ОДНОЙ СТОРОНЫ ПОЗВОЛЯЕТ ОБЕСПЕЧИТЬ ПОСТОЯННУЮ НОМЕНКЛАТУРУ ИЗДЕЛИЙ И ИНДИВИДУАЛЬНЫЙ ПОДХОД – С ДРУГОЙ.\nНАША ПРОДУКЦИЯ\rНАШИ УСЛУГИ\r\n'),
(50, '0f9b56ddb911ec9812b3e943c9b3b3f2', 'Сеть кофеен PITSTOP\r\nВСЕ ПО \r77\rИ\rКофе\nКулинария\nВСЁ по 77 Р\nВыпечка\nДесерты\nБольшие порции\rеды и напитков\nВсегда \rсвежая выпечка\nУникальная\rрецептура\nПостоянно \rвводятся новинки\nPITSTOPКафе Франчайзинг\nОставить заявку\rВкусов много не бывает. Полноценные порции за 77 рублей!Не думай о цене, выбирай по вкусу!\nБыстрый сервис\r(время подачи еды - 3 минуты)\nКачественное\rобслуживание\nВкусная, свежая еда\nСледите за нашими новостями\nPITSTOPКафе\r\n'),
(52, '8d392d3430136d5e94df370d622a9937', 'Кофейни\r\nАдреса кафе\rБЦ «ОМЕГА ПЛАЗА»\rМосква, ул. Ленинская Слобода, 19\r\n'),
(53, 'af61b8917dd8969a1174e127f1398a0d', 'TITLE\r\n\r\n'),
(54, '7fb990e9e7d25bf1b2f869f0b9c3fd5d', 'Франчайзинг\r\nФранчайзинг\rОставить заявку\r\n'),
(55, '9f72e57cee6f3dd3a2772d5349c89bbf', 'Открытие новой точки Авиамоторная\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Авиамоторная, по пути к платформе Новая.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\n'),
(56, '0cd22233e82870d3c1c071f3a7dcc7cf', 'Открытие новой точки в БЦ Город Столиц\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\r\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!\r\n'),
(57, '1d2665455ba7dc9ce442123551136d33', 'Открытие новой точки в БЦ Савеловский Сити\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Дмитровская в здании БЦ Савеловский Сити.\r\nКафе удобно расположено на 1 этаже, вход с улицы. Приходите, мы всегда рады Вам!!!\r\n'),
(58, '1ace65c31509e70ab389dfcabe334c54', 'Открытие новой точки в БЦ Омега Плаза\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Автозаводская в здании БЦ Омега Плаза.\r\nКафе удобно расположено на 1 этаже основной аллеи. Приходите, мы всегда рады Вам!!!\r\n'),
(59, '96c907fc34d09309de01692a8ad44173', 'Запуск продажи франшиз\r\nДорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PITSTOP начав свое дело. Подробности в разделе \rФраншиза\r.\r\nДорогие гости, рады сообщить что теперь у каждого появилась возможность стать частью большой команды PITSTOP начав свое дело. Подробности в разделе Франшиза.\r\n'),
(60, 'ddb7a194634e99e92c462b6133cb9fb8', 'Японские блюда в меню\r\nДорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и WOK\r\nДорогие гости, теперь и любители азиатской кухни смогут найти в нашем меню так любимые многими роллы и WOK\r\n'),
(61, 'ccf8db9d571cc646ace04759d0ae10f8', 'BUYBRAND EXPO 2017\r\nДорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PITSTOP на 15-ой международной выставке франшиз BUYBRAND EXPO. Приглашаем вас посетить наш стенд.\r\nДорогие гости,  с 27 по 29 сентября 2017 наша команда будет представлять бренд PITSTOP на 15-ой международной выставке франшиз BUYBRAND EXPO. Приглашаем вас посетить наш стенд.\r\n'),
(62, '45570b42fabe31b40b48b609832c20fd', 'КОФЕ В ЦИФРАХ\r\nДОРОГИЕ ГОСТИ, СЕГОДНЯ МЫ ПОСЧИТАЛИ СКОЛЬКО ЖЕ КОФЕ МЫ ПРИГОТОВИЛИ И СКОЛЬКО ГОСТЕЙ ПРИШЛО К НАМ В ПРОШЛОМ ГОДУ И СРАЗУ РЕШИЛИ ПОДЕЛИТЬСЯ. ЗА ПРОШЛЫЙ 2017ГОД, НАШИМИ КЛИЕНТАМИ СТАЛИ ОКОЛО 300.000 ГОСТЕЙ. И СПЕЦИАЛЬНО ДЛЯ НИХ МЫ СВАРИЛИ 250.000 ЧАШЕК АРОМАТНОГО КОФЕ.\r\nДОРОГИЕ ГОСТИ, СЕГОДНЯ МЫ ПОСЧИТАЛИ СКОЛЬКО ЖЕ КОФЕ МЫ ПРИГОТОВИЛИ И СКОЛЬКО ГОСТЕЙ ПРИШЛО К НАМ В ПРОШЛОМ ГОДУ И СРАЗУ РЕШИЛИ ПОДЕЛИТЬСЯ. ЗА ПРОШЛЫЙ 2017ГОД, НАШИМИ КЛИЕНТАМИ СТАЛИ ОКОЛО 300.000 ГОСТЕЙ. И СПЕЦИАЛЬНО ДЛЯ НИХ МЫ СВАРИЛИ 250.000 ЧАШЕК АРОМАТНОГО КОФЕ.\r\n'),
(63, '87f884884c5c2ba753244b3273d1a78d', 'Открытие новой точки на Павелецкой\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!\r\nДорогие гости, рады сообщить вам об открытие нового кафе возле м.Павелецкая в здании Павелецкого Вокзала.\r\nКафе удобно расположено на 1 этаже возле выхода из метро (3 подъезд вокзала). Приходите, мы всегда рады Вам!!!\r\n'),
(66, '23226a7d96e8d335de330128577c8e7d', 'ВАРИАНТЫ РАБОТЫ\r\nМы предлагаем\rсвоим франчайзи \rготовую бизнес-модель\r, доказавшую свою эффективность. На выбор предлагается несколько\rформатов кафе:\rКофе поинт\rСтоимость до 800.000р включая\rпаушальный взнос\rЭкспресс кафе\rСтоимость от 800.000р включая\rпаушальный взнос\rИндивидуальный формат\rСтоимость обсуждается индивидуально\rс\rкаждым партнером\r\n'),
(67, 'e50b47d9179b406ddd751cbf838955aa', 'ФРАНШИЗА PITSTOPКафе\r\nКонсультации и помощь\rКонсультации по вопросам выбора помещения/места под кафе и помощь в разработке всех разрешительных и проектных документов\rДизайн и обучение \rИндивидуальный дизайн кафе и обучение персонала.\rСистему управления и IT- инструменты \rЦентрализованную систему управления заказами и контроля поставками продукции и IT- инструменты для анализа работы кафе\rКоманду и поддержку\rСтарт-ап команду на открытие кофейни и поддержку по управлению и продвижению кафе.\r\n'),
(68, '863455096f65e2bf760a2aa4fe59ed8a', 'ЦИФРЫ\r\nКонцепция рассчитана до мелочей \rна площади до 50 кв. м\rОткрытие кофейни \rот 2 недель\rСрок окупаемости бизнеса \rот 12 месяцев\rСреднемесячный доход одной кофейни \rот 100 тыс. рублей\r\n'),
(69, '68e5cae8c0f61001c1b9f77efc3f5611', 'БЦ «ОМЕГА ПЛАЗА»\r\n\r\n'),
(70, 'cf00dad44e36b9a88991d4b5469cf765', 'БЦ САВЁЛОВСКИЙ СИТИ\r\n\r\n'),
(71, 'edfa1a9f1ab45370ed56898c005c808e', 'МОСКВА СИТИ, БАШНИ ГОРОД СТОЛИЦ\r\n\r\n'),
(72, '7623ec7439bb243960bd02713946ff68', 'М. АВИАМОТОРНАЯ\r\n\r\n'),
(74, '6d571b741b5b0ef67e45496e73061224', 'СЭНДВИЧИ И РОЛЛЫ\r\nСпециально для тех, кто живет в ритме мегаполиса, мы предлагаем вкусные сэндвичи и роллы, купить которые Вы можете в любой из сети наших кофеен «ПитСтоп». \rВкусные сэндвичи и роллы с собой\rКажется, что готовить цезарь-роллы сложно. Но всегда есть решение - возьмите с собой любые сэнвичи, сделав заказ у нас. Если вы запланировали поездку или решили быстро перекусить в дороге, по пути на работу, то еда должна быть такой, чтобы ее хранение можно было осуществить вне холодильника. \rПреимущества заказа сэндвичей в наших кофейнях: \rбыстрое приготовление ролла или сэндвича и подача заказа; \rтолько свежие продукты, используемые в составе блюд; \rнизкие цены на весь ассортимент меню. \rСэндвичи – это самая распространенная еда в поездках, которую берут в кафе «PITSTOPКафе». В наших кофейнях это блюдо является дополнением к кофе, можете купить ролл или сэндвич как с овощами, так с мясом и сырами. К тому же, если Вы следите за фигурой, то можете не бояться покупать роллы, т.к. лепешки, в которые заворачивается начинка, делаются из высоких сортов муки. \rТакже к кофе Вы всегда можете взять вкусный \rмаффин с шоколадом\r.\r\n'),
(75, '34a35a0834d3d6213af9b49f1472540b', 'СЛОЙКА С ПОВИДЛОМ\r\nМы знаем, что нужно нашим гостям в течение дня. Поэтому предлагаем только ароматную и свежую выпечку, чтобы Вы могли насладиться перекусом или просто минутами отдыха в наших кофейнях. \rСлойки с повидлом в кафе\rМы убеждены в том, что качество еды всегда имеет влияние на настроение посетителя. В наших кофейнях готовится только здоровая еда, свежие продукты — все, чтобы ваше самочувствие было на высшем уровне. Также в «ПитСтоп» можно заказать закуски, которые мы упакуем в удобные, одноразовые контейнеры. Чтобы не переживать о том, из каких ингредиентов сделано ваше блюдо, мы можем Вам рассказать о составе стандартных слоек из теста с повидлом: \rмука пшеничная, масло сливочное; \rсахар, повидло, яйца; \rмолоко, дрожжи, соль; \rванилин, вода питьевая. \rПри приготовлении каких-либо блюд в сети наших кофеен не используются химикаты, искусственные добавки, ароматизаторы и красители. Мы заботимся своих гостях и предоставляем только вкусную и полезную выпечку. \rНаши закуски всегда выполнены из ингредиентов высокого качества. Сладкая и вкусная слойка - идеальное дополнение к горячему кофе. \rТакже предлагаем Вам попробовать вкусные \rтворожные сырники\rв наших кофейнях.\r\n'),
(76, '76c8fb06c10253b59101f04fb859521f', 'МАФФИН С ШОКОЛАДОМ\r\nМаффины - это разновидность кексов, приготовленных в форме корзинки. В России эти кондитерские изделия особенно популярны, в основном, из-за пышности, воздушности и того, как они тают во рту. \rШоколадные бисквитные лакомства, которые Вы можете купить в нашей кофейне, используют в своем составе натуральные ингредиенты высокого качества. \rШоколадные маффины в кафе\rМаффины отличаются следующими вкусовыми особенностями: \rОни представляют собой сытную выпечку, с красивым внешним видом. Шоколадные изделия особенно популярны под кофе. \rИх можно взять и съесть в поездке. Также их подают в виде закуски и заказывают на любые праздники и часто на корпоративы. \rMUFFIN, который представляет собой воздушный мякиш, имеет отменный шоколадный вкус. В основном, они хранятся не больше дня, поэтому есть их нужно сразу. Это очень вкусно! \rВы можете заказать маффины в Москве в нашей сети кофеен PITSTOP-CAFE.RU. Эта аппетитная выпечка берет свое начало из Англии, по сути это - бисквитные кексы. В нашей сети кофеен Вы можете купить шоколадные маффины, а также любые другие кондитерские изделия. \rЕсли Вам нравятся легкие, фруктовые десерты, Вы можете взять \rжеле\rв наших кофейнях.\r\n'),
(77, '854dcf739ddef6ecde819539e6d83298', 'ЖЕЛЕ\r\nТакой десерт, как желе из сока и желатина, очень полезен. Кроме этого, неотъемлемой составляющей продукта является глицин, имеющий следующие преимущества: \rпомогает в случае повреждения костной ткани; \rявляется средством профилактики против артрита; \rспособствует быстрому восстановлению после травм. \rВ сети наших кофеен в Москве можно увидеть немало изысканных десертов, которые можно попробовать, а кроме того, существуют такие разновидности желе, как: \rпанна-котта; \rбланманже - французский десерт из миндального молока; \rвагаси - японское желе с живыми цветами. \rКупить вкусное желе из фруктов в дополнение к какому-либо из кофейных напитков Вы можете в любой точке наших кофеен. \rПредлагаем Вам купить вкусные \rпирожные в ассортименте\rв наших кофейнях.\r\n'),
(78, '065faa89a7ccb7073d9f0919066eabe6', 'ФРУКТОВАЯ НАРЕЗКА\r\nФруктовая нарезка— это красиво, привлекательно, и вкусно. Такое блюдо в наших кофейнях подают к кофе с фруктами. Красивая нарезка выполнена с самым важным условием условие – все плоды свежие и спелые. \rНарезка из фруктов в кафе\rВсе нарезки оригинально оформлены, подаются, как отдельное блюдо или как десерт к напитку. Самые популярные варианты нарезки фруктов: \rВ полоску. \rКартина из фруктов. \rЦветы из фруктов. \rНарезка по цветовой палитре. \rВ наших кофейнях всегда строго следят за тем, чтобы ингредиенты были свежими, нарезка из фруктов была красиво подана и гости остались довольны. Такие нарезки подаются, как отдельное блюдо или как закуска к кофе. Их более часто заказывают летом, т.к. фрукты и ягоды подаются охлажденными. Также нарезку можно взять с собой. Или просто заказать любой кофейный напиток вместе с фруктовым десертом. \rВ сети кофеен «ПитСтоп» Вы можете приятно провести время с друзьями или поCле работы, а также просто прийти в любую из наших точек и сделать заказ любого, понравившегося Вам, блюда. \rТакже предлагаем Вам попробовать свежие, вкусные \rслойки с повидлом\rв наших кофейнях.\r\n'),
(79, 'a3acbd91fba3b4fee6cdf1f905e90ca4', 'НЕ ДУМАЙ О ЦЕНЕ - ВЫБИРАЙ ПО ВКУСУ\r\n\r\n'),
(80, 'a3acbd91fba3b4fee6cdf1f905e90ca4', 'НЕ ДУМАЙ О ЦЕНЕ - ВЫБИРАЙ ПО ВКУСУ\r\n\r\n'),
(81, 'a3acbd91fba3b4fee6cdf1f905e90ca4', 'НЕ ДУМАЙ О ЦЕНЕ - ВЫБИРАЙ ПО ВКУСУ\r\n\r\n'),
(82, '0f87c93016f3641e1ac6fd6d3adc654f', 'ТЕЛЕФОН КОМПАНИИ\r\n+7 (495) 181 61 59\r\n'),
(83, '2158cafe06e4d506f43af5b189d9d1e3', 'Соцсети компании\r\n\r\n'),
(84, '312a5a4da481f432fad2a6ae1d2892eb', 'ТЕКСТ В ГАЛЕРЕЕ\r\nМЫ ОРИЕНТИРОВАНЫ НА ЛЮДЕЙ, КОТОРЫЕ ЦЕНЯТ СВОЕ ВРЕМЯ И ЖИВУТ В РИТМЕ БОЛЬШОГО ГОРОДА.\nГОСТЯМ ПРЕДЛАГАЕТСЯ ШИРОКИЙ ВЫБОР АРОМАТНЫХ КОФЕЙНЫХ НАПИТКОВ, СВЕЖАЯ ВЫПЕЧКА, СЭНДВИЧИ СОБСТВЕННОЙ РЕЦЕПТУРЫ, САЛАТЫ, ДЕСЕРТЫ И СВЕЖЕВЫЖАТЫЕ СОКИ И ФРУКТОВАЯ НАРЕЗКА. \nВСЕ ЭТО СОПРОВОЖДАЕТСЯ ПРИЯТНОЙ МУЗЫКОЙ, ЛЕГКИМ ОСВЕЩЕНИЕМ И УЮТНОЙ АТМОСФЕРОЙ.\r\n'),
(85, 'c60b106c6d93bc0a1c82cf445b5b4810', 'ПИРОЖНЫЕ В АССОРТИМЕНТЕ\r\nПирожные, насыщенные кремовые и воздушные— это маленький, вкусный праздник в миниатюре. В сети кофеен «ПитСтоп» для Вас ежедневно представлены самые аппетитные пирожные. \rВкусные десерты пирожные в Москве\rМы предлагаем Вашему вниманию самый широкий ассортимент десертов и пирожных, которые вы можете купить в виде десерта к кофе: \rПесочные – по стандарту изготовляют из теста, в которое входят яйца, сахар и разрыхлители. \rБисквитные – такие пирожные делают из муки с использованием яично-сахарной смеси. \rЗаварные – изготавливают из заваренной муки, в которую добавляют масло, соль и яйца. \rКак видите, ингредиенты для продукции, которая есть в наших кофейнях, только натуральные, а последующие изделия самые вкусные и всегда свежие. \rДля украшения таких кондитерских изделий используются ягоды, фрукты, различные крема, шоколад, специи (ваниль, корица и т.д.). \rПредлагаем Вам посетить любую из наших кофеен и насладиться свежей выпечкой. \rТакже Вы можете попробовать вкусную, легкую \rфруктовую нарезку\rв наших кофейнях.\r\n'),
(88, 'e794ac633d87afbe57c4c7ced1f7332e', 'СЛАЙД #2\r\n\r\n'),
(89, 'c19dea5ddc5d92de1c56746ff4408425', 'СЛАЙД #3\r\n\r\n'),
(90, '5681a58d77d55eb5b6e7620b507262eb', 'СЛАЙД #4\r\n\r\n'),
(91, '1cd6a9722bb11c78312483af55c70cf5', 'СЛАЙД #5\r\n\r\n'),
(92, '9f69c3834a7524776b0d4dd710e095be', 'СЛАЙД #6\r\n\r\n'),
(93, '9ff0f183a65b4e10300ecdc8d5284b97', 'СЛАЙД #7\r\n\r\n'),
(94, '4b65c533dc08e0324834fec6f425f073', 'САЛАТЫ В АССОРТИМЕНТЕ\r\nСалат - это дополнительное блюдо на ужин и завтрак, в которое могут входить абсолютно различные ингредиенты. Помимо того, что будет входить в салат, важную роль играет то, как он будет заправлен, ведь это позволяет раскрыть вкус еще больше. Салат является отличным вариантом перекуса, а также входит в состав основного блюда практически любого приема пищи. \rАссортимент овощных салатов в нашем кафе\rВ нашей кофейне можно ознакомиться с меню, которое располагает выбором вкусных салатов. Их сразу хочется съесть, потому что над созданием блюд работают профессиональные повара сети кофеен «PITSTOPКафе», которые всегда делают вкусные закуски, перекусы и кофе нашим гостям. \rДля приготовления салатов мы используем: \rсвежие овощи; \rмясные и рыбные нарезки; \rзаправки; \rспеции и другие ингредиенты. \rМы очень любим своих клиентов, поэтому делаем так, чтобы еда была не только вкусной, но и доступной. Кафе «Питстоп» – это разнообразное меню блюд, недорогой кофе, забота о гостях и широкий ассортимент салатов в Москве. \rВ нашем меню есть \rсэндвичи и роллы\rна любой вкус.\r\n'),
(95, '36f89caac0e20b9cbad7fb31ff977bb7', 'ЯПОНСКАЯ КУХНЯ\r\nМы предлагаем широкий выбор блюд для своих посетителей, которые хотят вкусно перекусить. Наши треугольные сэндвичи порадуют своим вкусом каждого гостя сети кофеен «PITSTOP». \rЕсть мнение, что фастфуд является вредной пищей для здоровья людей, но и она может быть здоровой. Например, начиненные овощами, сыром, салатом и мясом сендвичи панини и чиабатта, купить которые вы можете в наших кофейнях «ПитСтоп», позволят быстро утолить свой голод и насладиться вкусом приготовленной еды в нашей кофейне. Салаты также изготавливаются быстро и без использования искусственных заменителей вкуса. Мы заботимся о своих гостях и об их здоровье. \rКупить сэндвичи и салаты в кафе\rИдея «PITSTOPКафе»- это не только вкусный кофе, но и сэндвичи со свежими салатами, которые можно как попробовать в наших кофейнях, так и взять с собой в дорогу. Вся наша продукция приготовлена из тех ингредиентов, которые не содержат каких-либо неполезных пищевых добавок. \rПреимущества заказа сэндвичей и салатов у нас: \rабсолютная безопасность ингредиентов; \rкачественные продукты. \rНаши сэндвичи предлагаются с различными вариантами начинки, а калорийность салатов не так высока, поэтому вы можете вкусно перекусить, не беспокоясь о безопасности своего здоровья! А пока вы будете ожидать приготовление своего заказа, можете насладиться приятной музыкой и уютной атмосферой. \rПредлагаем Вам посмотреть меню \rсалатов в ассортименте\r, представленных в наших кофейнях.\r\n'),
(96, 'd46e2db3a6f7e99b759aab08f4e4eeb1', 'КОФЕ АМЕРИКАНО 300мл\r\nМногие из нас уже не могут начать полноценно своё утро или рабочий день без глотка кофе. Без его мягкого, горьковатого и бодрящего вкуса. Любовь к такому напитку объяснена необычными рецептами его приготовления, о которых Вы можете узнать в нашем кафе, либо, приготовив его самостоятельно. \rКупить кофе американо в Москве\rКофе американо — один из первых видов приготовления кофе. В наших кофейнях кофе всегда свежесмолотый, причем степень его помола всегда высока, чтобы кофейная гуща не ощущалась во рту. \rПреимущества напитка американо: \rпридает бодрость; \rв него можно добавить молоко, сиропы, маршмеллоу – этот напиток, в отличии от капучино или латте, не содержит в своем составе ничего, кроме эспрессо и воды; \rпомогает расслабиться среди рабочего дня, благодаря своему аромату; \rего можно взять с собой в одной из наших кофеен, а его стоимость будет всего 77 рублей. \rКаждый из наших гостей находит в любом из видов кофе что-то свое, а мы всегда предлагаем широкий ассортимент зернового кофе и вкуснейших десертов к нему. \rЕсли вы хотите просто и вкусно перекусить, предлагаем Вам взять \rсэндвичи и салаты\rв наших кофейнях.\rКофе американо можно купить увеличенную порцию 500мл.\r* в некоторых кафе цена может отличаться.\r\n'),
(97, '99aa7b0acfcc2c17ac1bcddf38619ee8', 'КОФЕ КАПУЧИНО 300мл\r\nНаша сеть заведений готовит вкусный капучино в Москве для всех гостей, в этом уверены многие гости кофеен «ПитСтоп». Кроме различного кофе, здесь есть десерты и быстрые варианты перекусов. \rВкусный кофе капучино в Москве\rКофе от «PITSTOPКафе» подходит тем, кто предпочитает напитки на основе крепкого кофе (эспрессо) с необычными способами варки и приготовления. У нас есть всё для знакомства с кофейной культурой: \rнаши бариста могут рассказать вам всё о различных сортах кофе; \rпока вы в процессе ожидания приготовления капучино, можете ознакомиться и с остальными его сортами. \rТакже такой напиток, как капучино, обладает следующими преимуществами: \rкофе рекомендуется пить с молоком, т.к. он вымывает из организма кальций, а такой вариант, как капучино идеально подходит для этого, сочетая в себе все необходимые ингредиенты; \rэтот напиток помогает расслабиться среди рабочего дня, немного отойти от сторонних мыслей; \rкапучино, в отличие от других сортов кофе, имеет более мягкий вкус. \rКупить с собой вкусный кофе капучино Вы можете в любой из наших кофеен. Сколько же стоит молотый кофе капучино? Всего 77р! \rТакже предлагаем Вам купить вкусный \rкофе американо\rв наших кофейнях.\rКофе капучино можно купить увеличенную порцию 500мл.\r* в некоторых кафе цена может отличаться.\r\n'),
(98, 'a90902bfb5f897cd85b92d075ef4f686', 'КОФЕ ЛАТТЕ 300мл\r\nУ жителей Москвы сейчас очень много требований к современным кофейням: обычного, хорошего расположения гостям заведения уже недостаточно, приходят только за напитками высокого качества. Кофейни «ПитСтоп» всегда с особым подходом относятся к выбору кофейных зерен и не экономят на используемой технике, потому что она позволяет сохранить вкус напитка. \rКупить кофе латте в Москве\rМы варим кофе латте в Москве, купить который Вы можете в одной из кофеен нашей сети. Также в наших кофейнях есть следующие преимущества: \rв любую кофейню удобно прийти с ноутбуком; \rможно почитать книгу за чашечкой свежесваренного латте. \rРодина такого напитка как кофе латте - Италия. Жители этой страны, знают толк в кофейных напитках. Кстати, он не пользуется такой большой популярностью на родине, как в России. \rВ кафе «PITSTOPКафе» варят не только качественный латте (LATTE переводится с итальянского «молоко»), но и предлагают вкусные дополнения: десерты, пирожные. Все кофейные напитки, которые Вы можете попробовать у нас или же просто купить и взять с собой в дорогу, приготовлены из свежеобжареных зерен и могут отлично дополнить сладкое. Цена на кофе латте – всего 77р! \rТакже предлагаем Вам взять вкусный \rкофе капучино\rв наших кофейнях.\rКофе латте можно купить увеличенную порцию 500мл.\r* в некоторых кафе цена может отличаться.\r\n'),
(100, 'fd6168eeeeea753cb4cff0be26b07626', 'СЛАЙД #8\r\n\r\n'),
(101, 'b12832eac7e3457c47ebd0561e55a08f', 'СЛАЙД #9\r\n\r\n'),
(102, '9c19bcde44f22071f3f9bdf993cd38e4', 'СЛАЙД #10\r\n\r\n'),
(103, '0cf05575a0ad17874156ffd54488dad6', 'СЛАЙД #11\r\n\r\n'),
(104, '5890c73721ea791a345aa646dcc844eb', 'СЛАЙД #12\r\n\r\n'),
(105, 'be75b9aa66691b7e5ceec93e7c3b1c30', 'ПАВЕЛЕЦКИЙ ВОКЗАЛ\r\n\r\n'),
(107, 'd0686ff68f64efa111caa196e514c77e', 'Акции\r\n\r\n'),
(116, '414d0ce3a59fbf5cc365fef5c95c65e5', 'Вместе всю неделю\r\nДрузья, мы очень любим делать маленькие приятности своим гостям и сегодня хотим поделиться с Вами очень радостным событием из жизни PITSTOPКафе. Мы объявляем неделю кOфемании - с 28.03.18 во всех кофейнях PITSTOP на территории Москвы Cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". Все любители кофе могут ликовать, потому что при покупке 4-х любых напитков из ассортимента:\r\n\rДрузья, мы очень любим делать маленькие приятности своим гостям и сегодня хотим поделиться с Вами очень радостным событием из жизни PITSTOPКафе. Мы объявляем неделю кофемании - с 28.03.18 во всех кофейнях PITSTOP на территории Москвы Cтартует акция \"ВМЕСТЕ ВСЮ НЕДЕЛЮ\". Все любители кофе могут ликовать, потому что при покупке 4-х любых напитков из ассортимента: \rкофе Латте \rкофе Капучино \rкофе Эспрессо \rкофе двойной Эспрессо \rкофе Американо \r5-ый Вы получаете в ПОДАРОК! Нам радостно от того, что мы можем согреть Вас чашечкой ароматного кофе в холодную погоду.\r\n'),
(117, '10a01dd6f833f7611840f1ba21902a42', 'Кофе-гигант\r\nКофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!\r\n\rКофеманы да возрадуются!!!!! С 03.04.18 мы запускаем УЛЕТНОЕ предложение, от которого невозможно отказаться!\rС сегодняшнего дня во всех кофейнях PITSTOP \rHTTP://PITSTOP-CAFE.RU/CAFE/\rвы можете купить самый большой кофе объемом 500 мл и всего за 100 рублей ❗ Такого вы не найдете нигде!!!!\rПодумайте сами: зачем переплачивать за стандартный стаканчик капучино (250 мл) 250 рублей, если можно купить в два раза больше и заплатить за это в два раза меньше? И продлить наслаждение любимым вкусом и ароматом еще на несколько мгновений! Кофе - Гигант уже ждет своих покупателей и готов делиться своим кофейным позитивом с гостями.\r\n'),
(121, '2a877521aa6d825d1f5470b88f17e812', 'Карта сайта\r\n\r\n'),
(124, '6c86f82c53e1dccbc25a2222927481a8', 'Тут всё для кофе\r\n\r\n'),
(126, 'b193af2211bb464a3e1881eb47420a42', 'Слайд #1\r\n\r\n'),
(127, 'c332dafc09ccda746e39d648304f0b75', 'Карта сайта\r\nКофейни\rМеню\rСырники творожные\rКофе латте\rКофе капучино\rКофе американо\rСэндвичи и салаты\rСалаты в ассортименте\rСэндвичи и роллы\rМаффины с шоколадом\rЖеле\rПирожные в ассортименте\rФруктовые нарезки\rСлойки с повидлом\rФранчайзинг\rНовости\rАкции\rКонтакты\r\n'),
(129, 'd0ebb141778717dfd35f5f791ef9cb5a', 'Слайд #14\r\n\r\n'),
(130, 'b9a8090f7ebe38853761e4ed6048f944', 'Карта сайта\r\nКарта сайта\rКофейни\rМеню\rСырники творожные\rКофе латте\rКофе капучино\rКофе американо\rСэндвичи и салаты\rСалаты в ассортименте\rСэндвичи и роллы\rМаффины с шоколадом\rЖеле\rПирожные в ассортименте\rФруктовые нарезки\rСлойки с повидлом\rФранчайзинг\rНовости\rАкции\rКонтакты\r\n'),
(131, '134e41cdc6446dabd7a95cdb5edd8ecb', 'КОФЕ 500мл\r\nЧто мы предлагаем нашим клиентам к чашечке мягкого кофе? Мы предлагаем им свежие и вкусные творожные сырники с мягким ароматом и легким вкусом. Такие творожные десерты широко востребованы за пределами России. Наши сырники выпекаются из такого теста, в которое мы можем добавить свежие ягоды, какие-либо орехи, конечно же, творог и любые другие ингредиенты, пряные специи. Кроме традиционных, сладких вариантов, во многих странах выпекаются также и другие сырники – с зеленью, сыром, несладкие и многие другие. \rСырники из творога в кафе\rМы предлагаем Вам вкусные сырники в кафе, для приготовления которых используем те сочетания ингредиентов , которые полюбились нашими клиентами. Наши кондитерские изделия имеют высокий спрос, благодаря тому, что: \rизготавливаются из продуктов высокого качества; \rмы используем свежие ингредиенты; \rмы не придумываем сочетания вкусов. \rИх также покупают и на организацию различных мероприятий, начиная от фуршетов и детских праздников. Если вы любите эту популярную выпечку, вы можете купить творожные сырники в Москве в одной из наших кофеен! \rТакже предлагаем Вам взять вкусный \rкофе латте\rв наших кофейнях.\r* в некоторых кафе цена может отличаться.\r\n'),
(134, '131a161638d06266e9f8004921449c58', 'КРУАСАН\r\n\r\n'),
(135, 'ba8dcb94e8ebad7649a2854a1a93858f', 'КРЕКЕЛИНЫ\r\n\r\n'),
(136, '4c8053b84a96b95fc0359e167b44b7e4', 'TITLE\r\nМеню\rВСЁ ПО\n77 Р\rВкусов много не бывает.\rПолноценные порции за 77 рублей!\rНе думай о цене, выбирай по вкусу!\nКофе (300 мл.)\rКулинария\rДесерты\rВыпечка\r\n'),
(137, '640c256c9fb556cba995d989a1e2a02c', 'Тосты с ветчиной или рыбой\r\n\r\n'),
(138, '8e37f37eaf98406a4572dc3776236163', 'СЫРНИКИ ТВОРОЖНЫЕ\r\nЧто может дополнить чашечку мягкого кофе? Мы предлагаем нашим гостям свежие и вкусные творожные сырники с мягким ароматом и легким вкусом. Такие творожные десерты широко востребованы за пределами России. Наши сырники выпекаются из такого теста, в которое мы можем добавить свежие ягоды, какие-либо орехи, конечно же, творог и любые другие ингредиенты, пряные специи. Кроме традиционных, сладких вариантов, во многих странах выпекаются также и другие сырники – с зеленью, сыром, несладкие и многие другие. \rСырники из творога в кафе\rМы предлагаем Вам вкусные сырники в кафе, для приготовления которых используем те сочетания ингредиентов , которые полюбились нашими клиентами. Наши кондитерские изделия имеют высокий спрос, благодаря тому, что: \rизготавливаются из продуктов высокого качества; \rмы используем свежие ингредиенты; \rмы не придумываем сочетания вкусов. \rИх также покупают и на организацию различных мероприятий, начиная от фуршетов и детских праздников. Если вы любите эту популярную выпечку, вы можете купить творожные сырники в Москве в одной из наших кофеен! \rТакже предлагаем Вам взять вкусный \rкофе латте\rв наших кофейнях.\r\n'),
(139, 'dacf2f8a5a3e4cf159b581db51cea2eb', 'Авторизация\r\n\r\n'),
(140, '1824b76fe5e68d2bac2d6de77a8a24dc', 'База знаний\r\nРуководство по использованию фирменного стиля\rКоммуникационная стратегия\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_content_title`
--

CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

--
-- Дамп данных таблицы `b_search_content_title`
--

INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
(1, 's1', 0, 'УСЛУГИ'),
(2, 's1', 0, 'ПОИСК'),
(3, 's1', 0, 'КАРТА'),
(3, 's1', 6, 'САЙТА'),
(4, 's1', 2, 'КОМПАНИИ'),
(4, 's1', 0, 'О'),
(5, 's1', 0, 'ИСТОРИЯ'),
(6, 's1', 0, 'РУКОВОДСТВО'),
(7, 's1', 0, 'ВАКАНСИИ'),
(8, 's1', 1, 'И'),
(8, 's1', 0, 'МИССИЯ'),
(8, 's1', 9, 'СТРАТЕГИЯ'),
(9, 's1', 0, 'ПРОДУКЦИЯ'),
(10, 's1', 0, 'TITLE'),
(11, 's1', 0, 'ВХОД'),
(11, 's1', 5, 'НА'),
(11, 's1', 8, 'САЙТ'),
(12, 's1', 0, 'TITLE'),
(13, 's1', 10, 'КОМПАНИЯ'),
(13, 's1', 0, 'МЕБЕЛЬНАЯ'),
(50, 's1', 22, 'PITSTOP'),
(50, 's1', 9, 'кофеен'),
(50, 's1', 0, 'Сеть'),
(52, 's1', 0, 'Кофейни'),
(53, 's1', 0, 'TITLE'),
(54, 's1', 0, 'Франчайзинг'),
(55, 's1', 39, 'Авиамоторная'),
(55, 's1', 17, 'новой'),
(55, 's1', 0, 'Открытие'),
(55, 's1', 28, 'точки'),
(56, 's1', 42, 'БЦ'),
(56, 's1', 21, 'в'),
(56, 's1', 47, 'Город'),
(56, 's1', 17, 'новой'),
(56, 's1', 0, 'Открытие'),
(56, 's1', 58, 'Столиц'),
(56, 's1', 28, 'точки'),
(57, 's1', 42, 'БЦ'),
(57, 's1', 21, 'в'),
(57, 's1', 17, 'новой'),
(57, 's1', 0, 'Открытие'),
(57, 's1', 47, 'Савеловский'),
(57, 's1', 70, 'Сити'),
(57, 's1', 28, 'точки'),
(58, 's1', 42, 'БЦ'),
(58, 's1', 21, 'в'),
(58, 's1', 17, 'новой'),
(58, 's1', 47, 'Омега'),
(58, 's1', 0, 'Открытие'),
(58, 's1', 58, 'Плаза'),
(58, 's1', 28, 'точки'),
(59, 's1', 0, 'Запуск'),
(59, 's1', 13, 'продажи'),
(59, 's1', 28, 'франшиз'),
(60, 's1', 17, 'блюда'),
(60, 's1', 28, 'в'),
(60, 's1', 31, 'меню'),
(60, 's1', 0, 'Японские'),
(61, 's1', 14, '2017'),
(61, 's1', 0, 'BUYBRAND'),
(61, 's1', 9, 'EXPO'),
(62, 's1', 5, 'В'),
(62, 's1', 0, 'КОФЕ'),
(62, 's1', 7, 'ЦИФРАХ'),
(63, 's1', 39, 'на'),
(63, 's1', 17, 'новой'),
(63, 's1', 0, 'Открытие'),
(63, 's1', 44, 'Павелецкой'),
(63, 's1', 28, 'точки'),
(66, 's1', 0, 'ВАРИАНТЫ'),
(66, 's1', 17, 'РАБОТЫ'),
(67, 's1', 17, 'PITSTOPКафе'),
(67, 's1', 0, 'ФРАНШИЗА'),
(68, 's1', 0, 'ЦИФРЫ'),
(69, 's1', 0, 'БЦ'),
(69, 's1', 4, 'ОМЕГА'),
(69, 's1', 10, 'ПЛАЗА'),
(70, 's1', 0, 'БЦ'),
(70, 's1', 3, 'САВЁЛОВСКИЙ'),
(70, 's1', 15, 'СИТИ'),
(71, 's1', 13, 'БАШНИ'),
(71, 's1', 19, 'ГОРОД'),
(71, 's1', 0, 'МОСКВА'),
(71, 's1', 7, 'СИТИ'),
(71, 's1', 25, 'СТОЛИЦ'),
(72, 's1', 3, 'АВИАМОТОРНАЯ'),
(72, 's1', 0, 'М'),
(74, 's1', 10, 'И'),
(74, 's1', 20, 'РОЛЛЫ'),
(74, 's1', 0, 'СЭНДВИЧИ'),
(75, 's1', 16, 'ПОВИДЛОМ'),
(75, 's1', 0, 'С'),
(75, 's1', 0, 'СЛОЙКА'),
(76, 's1', 0, 'МАФФИН'),
(76, 's1', 13, 'С'),
(76, 's1', 16, 'ШОКОЛАДОМ'),
(77, 's1', 0, 'ЖЕЛЕ'),
(78, 's1', 19, 'НАРЕЗКА'),
(78, 's1', 0, 'ФРУКТОВАЯ'),
(79, 's1', 16, '-'),
(79, 's1', 29, 'ВКУСУ'),
(79, 's1', 18, 'ВЫБИРАЙ'),
(79, 's1', 3, 'ДУМАЙ'),
(79, 's1', 0, 'НЕ'),
(79, 's1', 9, 'О'),
(79, 's1', 26, 'ПО'),
(79, 's1', 11, 'ЦЕНЕ'),
(80, 's1', 16, '-'),
(80, 's1', 29, 'ВКУСУ'),
(80, 's1', 18, 'ВЫБИРАЙ'),
(80, 's1', 3, 'ДУМАЙ'),
(80, 's1', 0, 'НЕ'),
(80, 's1', 9, 'О'),
(80, 's1', 26, 'ПО'),
(80, 's1', 11, 'ЦЕНЕ'),
(81, 's1', 16, '-'),
(81, 's1', 29, 'ВКУСУ'),
(81, 's1', 18, 'ВЫБИРАЙ'),
(81, 's1', 3, 'ДУМАЙ'),
(81, 's1', 0, 'НЕ'),
(81, 's1', 9, 'О'),
(81, 's1', 26, 'ПО'),
(81, 's1', 11, 'ЦЕНЕ'),
(82, 's1', 8, 'КОМПАНИИ'),
(82, 's1', 0, 'ТЕЛЕФОН'),
(83, 's1', 15, 'компании'),
(83, 's1', 0, 'Соцсети'),
(84, 's1', 6, 'В'),
(84, 's1', 8, 'ГАЛЕРЕЕ'),
(84, 's1', 0, 'ТЕКСТ'),
(85, 's1', 20, 'АССОРТИМЕНТЕ'),
(85, 's1', 17, 'В'),
(85, 's1', 0, 'ПИРОЖНЫЕ'),
(88, 's1', 7, '2'),
(88, 's1', 0, 'СЛАЙД'),
(89, 's1', 7, '3'),
(89, 's1', 0, 'СЛАЙД'),
(90, 's1', 7, '4'),
(90, 's1', 0, 'СЛАЙД'),
(91, 's1', 7, '5'),
(91, 's1', 0, 'СЛАЙД'),
(92, 's1', 7, '6'),
(92, 's1', 0, 'СЛАЙД'),
(93, 's1', 7, '7'),
(93, 's1', 0, 'СЛАЙД'),
(94, 's1', 16, 'АССОРТИМЕНТЕ'),
(94, 's1', 13, 'В'),
(94, 's1', 0, 'САЛАТЫ'),
(95, 's1', 17, 'КУХНЯ'),
(95, 's1', 0, 'ЯПОНСКАЯ'),
(96, 's1', 28, '300мл'),
(96, 's1', 9, 'АМЕРИКАНО'),
(96, 's1', 0, 'КОФЕ'),
(97, 's1', 26, '300мл'),
(97, 's1', 9, 'КАПУЧИНО'),
(97, 's1', 0, 'КОФЕ'),
(98, 's1', 20, '300мл'),
(98, 's1', 0, 'КОФЕ'),
(98, 's1', 9, 'ЛАТТЕ'),
(100, 's1', 7, '8'),
(100, 's1', 0, 'СЛАЙД'),
(101, 's1', 7, '9'),
(101, 's1', 0, 'СЛАЙД'),
(102, 's1', 7, '10'),
(102, 's1', 0, 'СЛАЙД'),
(103, 's1', 7, '11'),
(103, 's1', 0, 'СЛАЙД'),
(104, 's1', 7, '12'),
(104, 's1', 0, 'СЛАЙД'),
(105, 's1', 11, 'ВОКЗАЛ'),
(105, 's1', 0, 'ПАВЕЛЕЦКИЙ'),
(107, 's1', 0, 'Акции'),
(116, 's1', 0, 'Вместе'),
(116, 's1', 13, 'всю'),
(116, 's1', 20, 'неделю'),
(117, 's1', 0, 'Кофе-гигант'),
(121, 's1', 0, 'Карта'),
(121, 's1', 11, 'сайта'),
(124, 's1', 7, 'всё'),
(124, 's1', 14, 'для'),
(124, 's1', 21, 'кофе'),
(124, 's1', 0, 'Тут'),
(126, 's1', 12, '1'),
(126, 's1', 0, 'Слайд'),
(127, 's1', 0, 'Карта'),
(127, 's1', 11, 'сайта'),
(129, 's1', 12, '14'),
(129, 's1', 0, 'Слайд'),
(130, 's1', 0, 'Карта'),
(130, 's1', 11, 'сайта'),
(131, 's1', 9, '500мл'),
(131, 's1', 0, 'КОФЕ'),
(134, 's1', 0, 'КРУАСАН'),
(135, 's1', 0, 'КРЕКЕЛИНЫ'),
(136, 's1', 0, 'TITLE'),
(137, 's1', 14, 'ветчиной'),
(137, 's1', 31, 'или'),
(137, 's1', 38, 'рыбой'),
(137, 's1', 4, 'с'),
(137, 's1', 0, 'Тосты'),
(138, 's1', 0, 'СЫРНИКИ'),
(138, 's1', 15, 'ТВОРОЖНЫЕ'),
(139, 's1', 0, 'Авторизация'),
(140, 's1', 0, 'База'),
(140, 's1', 9, 'знаний');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_custom_rank`
--

CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_phrase`
--

CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_stem`
--

CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_search_stem`
--

INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
(783, '-НЫ'),
(796, '0-15'),
(716, '000'),
(2705, '000р'),
(1611, '03'),
(1707, '04'),
(782, '10'),
(723, '10-Й'),
(1315, '100'),
(1443, '11'),
(1884, '117405'),
(697, '12'),
(1677, '12345'),
(795, '13'),
(1203, '13500'),
(1945, '14'),
(1889, '145'),
(718, '149'),
(1488, '15-О'),
(2682, '15-ой'),
(626, '160'),
(1232, '168'),
(155, '18'),
(1425, '181'),
(1893, '181-6159'),
(1390, '19'),
(465, '1962'),
(436, '1964'),
(10, '1992'),
(229, '1992Г'),
(254, '1993Г'),
(445, '1994'),
(276, '1998Г'),
(291, '1999Г'),
(1773, '1А'),
(2777, '1Не'),
(614, '20'),
(479, '2000'),
(1209, '20000'),
(309, '2000Г'),
(316, '2002Г'),
(218, '2003'),
(328, '2003Г'),
(344, '2004Г'),
(354, '2005Г'),
(371, '2006Г'),
(381, '2007Г'),
(389, '2008Г'),
(617, '2010'),
(1484, '2017'),
(1497, '2017ГОД'),
(594, '212-85-06'),
(595, '212-85-07'),
(596, '212-85-08'),
(1240, '22-45'),
(615, '23'),
(1408, '24'),
(1500, '250'),
(781, '2542'),
(1485, '27'),
(1610, '28'),
(1235, '28000'),
(1486, '29'),
(1825, '2PX'),
(1147, '30'),
(715, '300'),
(386, '30000'),
(2784, '300мл'),
(1237, '35000'),
(159, '36'),
(403, '37'),
(1165, '3D-МОДЕЛ'),
(793, '4-20'),
(1627, '4-х'),
(1264, '40'),
(238, '400'),
(1409, '43'),
(1093, '45'),
(593, '495'),
(792, '5-79'),
(1635, '5-ый'),
(1312, '50'),
(312, '500'),
(290, '5000'),
(2780, '500мл'),
(1427, '59'),
(794, '6-2'),
(1426, '61'),
(791, '64'),
(259, '700'),
(402, '70000М2'),
(1266, '77'),
(2246, '77р'),
(1263, '800'),
(719, '871'),
(1400, '8С1'),
(1781, '8с1'),
(224, '9000'),
(1333, 'ADIPISCING'),
(1335, 'AENEAN'),
(1331, 'AMET'),
(1482, 'BUYBRAND'),
(1671, 'CAFE'),
(1822, 'COLOR'),
(1336, 'COMMODO'),
(1332, 'CONSECTETUER'),
(1363, 'CONSEQUAT'),
(1340, 'CUM'),
(1618, 'Cтартует'),
(699, 'DEL'),
(1679, 'DEWFWEFWEFWEF'),
(1346, 'DIS'),
(1329, 'DOLOR'),
(1352, 'DONEC'),
(1894, 'E-MAIL'),
(1338, 'EGET'),
(1334, 'ELIT'),
(597, 'EMAIL'),
(1364, 'ENIM'),
(1344, 'ET'),
(1358, 'EU'),
(599, 'EXAMPLE'),
(1483, 'EXPO'),
(1354, 'FELIS'),
(1823, 'FF0000'),
(1383, 'HERE'),
(1828, 'HREF'),
(1891, 'I-1-18'),
(598, 'INFO'),
(1328, 'IPSUM'),
(1447, 'IT-'),
(1789, 'KAFEPITSTOP'),
(1830, 'KOFE-KAPUCHINO'),
(2231, 'LATTE'),
(1337, 'LIGULA'),
(1327, 'LOREM'),
(1345, 'MAGNIS'),
(602, 'MARKETING'),
(1339, 'MASSA'),
(1829, 'MENU'),
(700, 'MOBILE'),
(1348, 'MONTES'),
(2466, 'MUFFIN'),
(1351, 'MUS'),
(765, 'N-ВИНИЛКАПРОЛАКТАМ'),
(1349, 'NASCETUR'),
(1342, 'NATOQUE'),
(1356, 'NEC'),
(1362, 'NULLA'),
(1824, 'PADDING'),
(1347, 'PARTURIENT'),
(1357, 'PELLENTESQUE'),
(1343, 'PENATIBUS'),
(1765, 'PIT'),
(1471, 'PITSTOP'),
(1670, 'PITSTOP-CAFE'),
(1282, 'PITSTOPКАФ'),
(1558, 'PITSTOPКафе'),
(605, 'PR'),
(1359, 'PRETIUM'),
(1353, 'QUAM'),
(1360, 'QUIS'),
(1350, 'RIDICULUS'),
(755, 'RU2277566'),
(600, 'SALES'),
(698, 'SALON'),
(1361, 'SEM'),
(1330, 'SIT'),
(1341, 'SOCIIS'),
(1766, 'STOP'),
(1821, 'STYLE'),
(1382, 'TEXT'),
(1381, 'TITLE'),
(1355, 'ULTRICIES'),
(705, 'VIP-КАБИНЕТ'),
(704, 'VIP-КАБИНЕТОВ'),
(1481, 'WOK'),
(1790, 'YANDEX'),
(2174, 'А'),
(995, 'АБСОЛЮТН'),
(1404, 'АВИАМОТОРН'),
(439, 'АВИАЦИОН'),
(627, 'АВСТР'),
(1465, 'АВТОЗАВОДСК'),
(744, 'АВТОР'),
(608, 'АВТОРИЗОВА'),
(1183, 'АВТОРСК'),
(647, 'АДМИНИСТРАТИВН'),
(1259, 'АДРЕС'),
(1478, 'АЗИАТСК'),
(769, 'АКРИЛОВ'),
(764, 'АКРИЛОНИТР'),
(656, 'АКСЕССУАР'),
(655, 'АКСЕССУАРОВ'),
(1225, 'АКТИВН'),
(863, 'АЛАДДИН'),
(462, 'АЛЕКСАНДР'),
(1466, 'АЛЛ'),
(1438, 'АМЕРИКА'),
(768, 'АММОН'),
(751, 'АН'),
(1448, 'АНАЛИЗ'),
(752, 'АНАТОЛЬЕВН'),
(858, 'АНГЛИЙСК'),
(474, 'АНДР'),
(616, 'АПРЕЛ'),
(1420, 'АРЕНДОДАТЕЛ'),
(235, 'АРЕНДУЕМ'),
(1371, 'АРОМАТН'),
(416, 'АССОРТИМЕНТ'),
(860, 'АТМОСФЕР'),
(219, 'АУД'),
(1300, 'АУДИТОР'),
(1105, 'АУДИТОРН'),
(1776, 'Авиамоторная'),
(1932, 'Автозаводская'),
(2790, 'Авторизация'),
(1768, 'Адрес'),
(2766, 'Адреса'),
(1589, 'Акции'),
(1759, 'Акция'),
(1634, 'Американо'),
(2480, 'Англии'),
(1802, 'Анонс'),
(1763, 'Арендодателям'),
(2056, 'Ассортимент'),
(263, 'БАЗ'),
(1243, 'БАЗОВ'),
(1098, 'БАР'),
(1097, 'БАРОВ'),
(1396, 'БАШН'),
(213, 'БЕЗОПАСН'),
(613, 'БЕЛАРУС'),
(1503, 'БЕСПЛАТН'),
(133, 'БЕСЦЕН'),
(1113, 'БИБЛИОТЕК'),
(388, 'БИЗНЕС'),
(1285, 'БИЗНЕС-МОДЕЛ'),
(924, 'БИЗНЕСМ'),
(923, 'БИЗНЕСМЕН'),
(922, 'БИЗНЕСМЕНОВ'),
(541, 'БЛАГОСОСТОЯН'),
(1392, 'БЛИЖАЙШ'),
(308, 'БЛИЖН'),
(1003, 'БЛОК'),
(1476, 'БЛЮД'),
(813, 'БОГАТ'),
(816, 'БОГАТСТВ'),
(36, 'БОЛ'),
(15, 'БОЛЬШ'),
(1261, 'БОТИНСК'),
(1298, 'БРЕНД'),
(588, 'БУД'),
(72, 'БУДЕТ'),
(90, 'БУДУТ'),
(1051, 'БУК'),
(1238, 'БУХГАЛТЕР'),
(1242, 'БУХГАЛТЕРСК'),
(1384, 'БЦ'),
(1319, 'БЫВА'),
(252, 'БЫСТР'),
(2791, 'База'),
(2327, 'Без'),
(1506, 'Бесплатный'),
(2548, 'Бисквитные'),
(1545, 'Большие'),
(1575, 'Быстрый'),
(1847, 'В'),
(619, 'ВАЖН'),
(570, 'ВАЖНОСТ'),
(480, 'ВАКАНС'),
(1066, 'ВАЛЕНС'),
(52, 'ВАН'),
(108, 'ВАРИАНТ'),
(107, 'ВАРИАНТОВ'),
(1122, 'ВАС'),
(255, 'ВВЕД'),
(1281, 'ВВОД'),
(1017, 'ВЕД'),
(1250, 'ВЕДЕН'),
(320, 'ВЕДУЩ'),
(992, 'ВЕЛИКОЛЕПН'),
(181, 'ВЕР'),
(609, 'ВЕРНУТ'),
(338, 'ВЗАИМОВЫГОДН'),
(514, 'ВЗГЛЯД'),
(513, 'ВЗГЛЯДОВ'),
(560, 'ВЗЯТ'),
(842, 'ВИД'),
(432, 'ВИКТОР'),
(247, 'ВКЛАДЫВА'),
(706, 'ВКЛЮЧ'),
(773, 'ВКЛЮЧА'),
(1269, 'ВКУС'),
(1326, 'ВКУСН'),
(1318, 'ВКУСОВ'),
(475, 'ВЛАДИМИРОВИЧ'),
(41, 'ВМЕСТ'),
(1008, 'ВМЕСТИТЕЛЬН'),
(549, 'ВНЕДРЕН'),
(1043, 'ВНЕСУТ'),
(841, 'ВНЕШН'),
(1069, 'ВНИМАН'),
(1145, 'ВНОС'),
(726, 'ВОДОСТОЙК'),
(453, 'ВОЗГЛАВЛЯ'),
(1456, 'ВОЗЛ'),
(492, 'ВОЗМОЖН'),
(963, 'ВОЗНИКА'),
(172, 'ВОЗРАСТ'),
(171, 'ВОЗРАСТОВ'),
(971, 'ВОЙДЕТ'),
(2788, 'ВОЙТ'),
(1452, 'ВОКЗА'),
(909, 'ВОПЛОЩ'),
(574, 'ВОПРОС'),
(977, 'ВОПРОСОВ'),
(277, 'ВОРОНЕЖ'),
(441, 'ВОРОНЕЖСК'),
(970, 'ВОТ-ВОТ'),
(317, 'ВОШЛ'),
(688, 'ВПЕРВ'),
(926, 'ВПЕРЕД'),
(830, 'ВПЕЧАТЛЯЮЩ'),
(1103, 'ВПИСЫВА'),
(12, 'ВРЕМ'),
(929, 'ВРЕМЕН'),
(1028, 'ВРУЧН'),
(710, 'ВСЕГ'),
(509, 'ВСЕГД'),
(538, 'ВСЕМ'),
(75, 'ВСЕХ'),
(587, 'ВСТРЕЧ'),
(1109, 'ВСТРОЕН'),
(1620, 'ВСЮ'),
(382, 'ВТОР'),
(606, 'ВХОД'),
(457, 'ВХОДЯ'),
(1268, 'ВЫБИРА'),
(931, 'ВЫБОР'),
(93, 'ВЫБРА'),
(831, 'ВЫГЛЯД'),
(91, 'ВЫГЛЯДЕТ'),
(361, 'ВЫГРУЗК'),
(1274, 'ВЫПЕЧК'),
(114, 'ВЫПОЛН'),
(130, 'ВЫПОЛНЕН'),
(938, 'ВЫПОЛНЯ'),
(362, 'ВЫПУСК'),
(272, 'ВЫПУСКА'),
(818, 'ВЫРАЖ'),
(487, 'ВЫРАЖЕН'),
(65, 'ВЫСОК'),
(170, 'ВЫСОКОКЛАССН'),
(972, 'ВЫСОКОПОСТАВЛЕН'),
(550, 'ВЫСОКОПРОИЗВОДИТЕЛЬН'),
(183, 'ВЫСОЧАЙШ'),
(664, 'ВЫСТАВК'),
(294, 'ВЫСТАВОК'),
(1461, 'ВЫСТАВОЧН'),
(1216, 'ВЫСШ'),
(1027, 'ВЫТОЧ'),
(298, 'ВЫХОД'),
(1534, 'Вам'),
(1602, 'Вами'),
(1886, 'Варшавское'),
(1645, 'Вас'),
(2537, 'Вашему'),
(1582, 'Вкусная'),
(2378, 'Вкусные'),
(2259, 'Вкусный'),
(1562, 'Вкусов'),
(1680, 'Вместе'),
(1907, 'Вокзала'),
(1621, 'Все'),
(1550, 'Всегда'),
(2318, 'Всего'),
(1700, 'Всю'),
(2147, 'Вся'),
(1636, 'Вы'),
(1667, 'Выбирайте'),
(1543, 'Выпечка'),
(1922, 'Выставочная'),
(1430, 'ГАЛЕР'),
(153, 'ГАРАНТ'),
(1111, 'ГАРДЕРОБН'),
(459, 'ГЕНЕРАЛЬН'),
(806, 'ГЕРЦОГ'),
(502, 'ГИБК'),
(540, 'ГИГИЕНИЧЕСК'),
(1011, 'ГЛАВ'),
(26, 'ГЛАВН'),
(976, 'ГЛОБАЛЬН'),
(11, 'ГОД'),
(160, 'ГОРД'),
(1369, 'ГОРОД'),
(740, 'ГОРЯЧ'),
(1370, 'ГОСТ'),
(877, 'ГОСТЕВ'),
(50, 'ГОСТИН'),
(442, 'ГОСУДАРСТВЕН'),
(642, 'ГОТОВ'),
(142, 'ГРАМОТН'),
(721, 'ГРАНДИОЗН'),
(1230, 'ГРАФИК'),
(458, 'ГРУПП'),
(1748, 'Гигант'),
(1536, 'Главная'),
(1920, 'Город'),
(1289, 'ДАЛЬН'),
(319, 'ДАН'),
(1086, 'ДАЧ'),
(243, 'ДВАДЦА'),
(990, 'ДВП'),
(638, 'ДВУХ'),
(892, 'ДВУХМЕСТН'),
(814, 'ДЕКОР'),
(1179, 'ДЕКОРИРОВАН'),
(180, 'ДЕЛ'),
(1071, 'ДЕЛА'),
(662, 'ДЕЛОВ'),
(649, 'ДЕМОНСТРИРОВА'),
(33, 'ДЕН'),
(885, 'ДЕР'),
(884, 'ДЕРЕВ'),
(240, 'ДЕРЕВООБРАБАТЫВА'),
(856, 'ДЕРЕВЯ'),
(1275, 'ДЕСЕРТ'),
(318, 'ДЕСЯТК'),
(644, 'ДЕТ'),
(80, 'ДЕТАЛ'),
(49, 'ДЕТСК'),
(986, 'ДЕШЕВ'),
(456, 'ДЕЯТЕЛЬН'),
(879, 'ДЖОКОНД'),
(1154, 'ДИАГНОСТИК'),
(797, 'ДИВА'),
(55, 'ДИЗАЙН'),
(62, 'ДИЗАЙН-ПРОЕКТ'),
(58, 'ДИЗАЙНЕР'),
(907, 'ДИЗАЙНЕРСК'),
(341, 'ДИЛЕРСК'),
(483, 'ДИНАМИЧН'),
(292, 'ДИПЛОМАНТ'),
(460, 'ДИРЕКТОР'),
(1464, 'ДМИТРОВСК'),
(1257, 'ДНЕ'),
(565, 'ДНЯ'),
(515, 'ДОБ'),
(1062, 'ДОБАВ'),
(557, 'ДОВЕРИТЕЛЬН'),
(343, 'ДОГОВОР'),
(342, 'ДОГОВОРОВ'),
(1286, 'ДОКАЗА'),
(1248, 'ДОКУМЕНТ'),
(1446, 'ДОКУМЕНТОВ'),
(191, 'ДОЛ'),
(1104, 'ДОЛГОВЕЧН'),
(497, 'ДОЛГОСРОЧН'),
(945, 'ДОЛЖНОСТН'),
(40, 'ДОМ'),
(1061, 'ДОМАШН'),
(635, 'ДОМОТЕХ'),
(776, 'ДОПОЛНИТЕЛЬН'),
(1454, 'ДОРОГ'),
(582, 'ДОСТАВК'),
(115, 'ДОСТАВЛ'),
(772, 'ДОСТИГА'),
(843, 'ДОСТИГНУТ'),
(490, 'ДОСТИЖЕН'),
(1010, 'ДОСТОИНСТВ'),
(1208, 'ДОХОД'),
(1048, 'ДРЕВЕСН'),
(202, 'ДРУГ'),
(989, 'ДСП'),
(1267, 'ДУМА'),
(1544, 'Десерты'),
(2728, 'Дизайн'),
(2078, 'Для'),
(2691, 'Дмитровская'),
(1509, 'Дорогие'),
(1590, 'Друзья'),
(315, 'ЕВРОПЕЙСК'),
(295, 'ЕВРОЭКСПОМЕБЕЛЬ-99'),
(747, 'ЕГОР'),
(1277, 'ЕД'),
(511, 'ЕДИН'),
(203, 'ЕЖЕГОДН'),
(876, 'ЕЖЕДНЕВН'),
(353, 'ЕКАТЕРИНБУРГ'),
(997, 'ЕМ'),
(1836, 'Если'),
(2105, 'Есть'),
(562, 'ЖДЕТ'),
(1432, 'ЖЕЛ'),
(821, 'ЖЕЛАН'),
(1083, 'ЖЕЛЕЗ'),
(1239, 'ЖЕН'),
(852, 'ЖЕСТК'),
(1367, 'ЖИВУТ'),
(92, 'ЖИЗН'),
(494, 'ЖИЗНЕН'),
(1252, 'ЖУРНАЛОВ-ОРДЕР'),
(1251, 'ЖУРНАЛОВ-ОРДЕРОВ'),
(1876, 'Желе'),
(2218, 'Жители'),
(534, 'ЗАБОТ'),
(166, 'ЗАВЕДЕН'),
(345, 'ЗАВЕРШ'),
(282, 'ЗАВОЕВЫВА'),
(360, 'ЗАГРУЗК'),
(581, 'ЗАДАН'),
(505, 'ЗАДАЧ'),
(113, 'ЗАКАЗ'),
(1149, 'ЗАКАЗА'),
(1201, 'ЗАКАЗОВ'),
(508, 'ЗАКАЗЧИК'),
(301, 'ЗАКЛЮЧ'),
(314, 'ЗАКЛЮЧА'),
(340, 'ЗАКЛЮЧЕН'),
(1223, 'ЗАКОНОДАТЕЛЬСТВ'),
(438, 'ЗАКОНЧ'),
(185, 'ЗАЛОГ'),
(60, 'ЗАМЕР'),
(472, 'ЗАМЕСТИТЕЛ'),
(1108, 'ЗАНИМА'),
(1297, 'ЗАПОМИНА'),
(1181, 'ЗАПРОС'),
(1467, 'ЗАПУСК'),
(394, 'ЗАПУЩ'),
(245, 'ЗАРАБОТА'),
(607, 'ЗАРЕГИСТРИРОВА'),
(1202, 'ЗАРПЛАТ'),
(167, 'ЗАРУБЕЖ'),
(423, 'ЗАРУБЕЖН'),
(425, 'ЗАСЛУГ'),
(553, 'ЗАТРАТ'),
(961, 'ЗАХОД'),
(528, 'ЗАЩИТ'),
(575, 'ЗАЩИЩЕН'),
(708, 'ЗАЯВК'),
(696, 'ЗАЯВОК'),
(648, 'ЗДАН'),
(1038, 'ЗДОРОВ'),
(1080, 'ЗИМ'),
(1218, 'ЗНАН'),
(936, 'ЗНАЧ'),
(273, 'ЗНАЧИТЕЛЬН'),
(820, 'ЗОЛОТ'),
(943, 'ЗОН'),
(2552, 'Заварные'),
(1682, 'Запуск'),
(1538, 'И'),
(414, 'ИГРОК'),
(413, 'ИГРОКОВ'),
(182, 'ИД'),
(1118, 'ИДЕАЛЬН'),
(1163, 'ИДЕИ-ОБРАЗ'),
(861, 'ИЗАБЕЛЛ'),
(147, 'ИЗБЕЖА'),
(47, 'ИЗГОТОВ'),
(231, 'ИЗГОТОВЛЕН'),
(201, 'ИЗДЕЛ'),
(1166, 'ИЗОБРАЖЕН'),
(729, 'ИЗОБРЕТЕН'),
(1100, 'ИЗОПЛАСТ'),
(817, 'ИЗЫСК'),
(979, 'ИЗЫСКА'),
(807, 'ИЗЯЩН'),
(209, 'ИМЕЕТ'),
(112, 'ИМЕН'),
(28, 'ИНДИВИДУАЛЬН'),
(467, 'ИНЖЕНЕР-ТЕХНОЛОГ'),
(1224, 'ИНИЦИАТИВН'),
(444, 'ИНСТИТУТ'),
(489, 'ИНСТРУМЕНТ'),
(558, 'ИНТЕРЕС'),
(701, 'ИНТЕРЕСН'),
(63, 'ИНТЕРЬЕР'),
(958, 'ИНТЕРЬЕРН'),
(152, 'ИНТЕРЬЕРОВ'),
(223, 'ИС'),
(1052, 'ИСКЛЮЧЕН'),
(888, 'ИСПОЛНЕН'),
(953, 'ИСПОЛЬЗОВА'),
(135, 'ИСПОЛЬЗОВАН'),
(735, 'ИСПОЛЬЗУЕМ'),
(206, 'ИСПЫТАН'),
(228, 'ИСТОР'),
(464, 'ИЮН'),
(2141, 'Идея'),
(2612, 'Или'),
(2710, 'Индивидуальный'),
(2217, 'Италия'),
(2010, 'Их'),
(2418, 'К'),
(966, 'КАБИНЕТ'),
(30, 'КАЖД'),
(1439, 'КАПУЧИН'),
(1416, 'КАРАМЕЛЬН'),
(780, 'КАРБАМИДОМЕЛАМИНОФОРМАЛЬДЕГИДН'),
(761, 'КАРБАМИДОФОРМАЛЬДЕГИДН'),
(808, 'КАРКАС'),
(3, 'КАРТ'),
(1418, 'КАРТОШК'),
(947, 'КАТЕГОР'),
(1060, 'КАФ'),
(125, 'КАЧЕСТВ'),
(1324, 'КАЧЕСТВЕН'),
(720, 'КВ'),
(556, 'КВАЛИФИКАЦ'),
(407, 'КВАЛИФИЦИРОВА'),
(770, 'КИСЛОТ'),
(857, 'КЛАССИЧЕСК'),
(759, 'КЛЕ'),
(728, 'КЛЕЕВ'),
(732, 'КЛЕЯ'),
(31, 'КЛИЕНТ'),
(1197, 'КЛИЕНТОВ'),
(862, 'КОЖ'),
(431, 'КОЛЕСНИК'),
(430, 'КОЛЕСНИКОВ'),
(937, 'КОЛЛЕГ'),
(310, 'КОЛЛЕКТ'),
(1184, 'КОЛЛЕКЦ'),
(1158, 'КОЛОРИСТК'),
(882, 'КОЛОРИТН'),
(1307, 'КОМАНД'),
(898, 'КОМБИНАЦ'),
(1245, 'КОММУНИКАБЕЛЬН'),
(53, 'КОМНАТ'),
(1115, 'КОМОД'),
(1090, 'КОМПАКТН'),
(5, 'КОМПАН'),
(151, 'КОМПЛЕКСН'),
(366, 'КОМПЛЕКТ'),
(738, 'КОМПОЗИЦ'),
(789, 'КОМПОНЕНТ'),
(788, 'КОМПОНЕНТОВ'),
(911, 'КОМПОНОВК'),
(1041, 'КОМПЬЮТЕР'),
(136, 'КОМПЬЮТЕРН'),
(390, 'КОМФОРТ'),
(864, 'КОМФОРТН'),
(97, 'КОНКРЕТН'),
(928, 'КОНКУРЕНТ'),
(686, 'КОНКУРЕНТН'),
(927, 'КОНКУРЕНТОВ'),
(672, 'КОНКУРС'),
(1192, 'КОНСТРУКТОР'),
(1117, 'КОНСТРУКЦ'),
(578, 'КОНСУЛЬТАЦ'),
(1196, 'КОНСУЛЬТИРОВАН'),
(576, 'КОНТАКТ'),
(304, 'КОНТРАКТ'),
(303, 'КОНТРАКТОВ'),
(124, 'КОНТРОЛ'),
(896, 'КОНУСН'),
(334, 'КОНФЕРЕНЦ'),
(1106, 'КОНФЕРЕНЦ-КРЕСЕЛ'),
(1309, 'КОНЦЕПЦ'),
(356, 'КОНЦЕРН'),
(455, 'КООРДИНИР'),
(1403, 'КОРП'),
(347, 'КОРПУС'),
(23, 'КОРПУСН'),
(385, 'КОРПУСОВ'),
(532, 'КОРРЕКТИР'),
(109, 'КОТОР'),
(1271, 'КОФ'),
(1296, 'КОФЕЙН'),
(980, 'КРАСОТ'),
(2776, 'КРЕКЕЛИН'),
(1414, 'КРЕМ'),
(1033, 'КРЕСЕЛ'),
(798, 'КРЕСЛ'),
(846, 'КРЕСТОВИН'),
(805, 'КРОВАТ'),
(214, 'КРОМ'),
(2775, 'КРУАСА'),
(1012, 'КРУГЛ'),
(1391, 'КРУГЛОСУТОЧН'),
(21, 'КРУПН'),
(1273, 'КУЛИНАР'),
(1110, 'КУП'),
(48, 'КУХН'),
(646, 'КУХОН'),
(2366, 'Каждый'),
(2379, 'Кажется'),
(2558, 'Как'),
(1631, 'Капучино'),
(1869, 'Карта'),
(2598, 'Картина'),
(1767, 'Кафе'),
(1580, 'Качественное'),
(2764, 'Команду'),
(2797, 'Коммуникационная'),
(2716, 'Консультации'),
(1760, 'Контакты'),
(2749, 'Концепция'),
(1507, 'КофR'),
(1535, 'Кофе'),
(1702, 'Кофе-гигант'),
(1871, 'Кофейни'),
(1703, 'Кофеманы'),
(2582, 'Красивая'),
(1976, 'Кроме'),
(2224, 'Кстати'),
(1540, 'Кулинария'),
(2140, 'Купить'),
(208, 'ЛАБОРАТОР'),
(628, 'ЛАТВ'),
(1440, 'ЛАТТ'),
(891, 'ЛАУР'),
(1015, 'ЛЕГЕНДАРН'),
(1094, 'ЛЕГК'),
(1388, 'ЛЕНИНСК'),
(408, 'ЛЕТ'),
(855, 'ЛИВЕРПУЛ'),
(326, 'ЛИДЕР'),
(325, 'ЛИДЕРОВ'),
(411, 'ЛИДИР'),
(358, 'ЛИН'),
(629, 'ЛИТВ'),
(519, 'ЛИЧН'),
(1053, 'ЛИШ'),
(1295, 'ЛОКАЦ'),
(164, 'ЛУЧШ'),
(1021, 'ЛЮБ'),
(1480, 'ЛЮБИМ'),
(1477, 'ЛЮБИТЕЛ'),
(1366, 'ЛЮД'),
(1630, 'Латте'),
(1784, 'Ленинская'),
(1650, 'Любители'),
(2330, 'Любовь'),
(2717, 'Любые'),
(239, 'М2'),
(1215, 'МАГАЗИН'),
(280, 'МАГАЗИН-САЛОН'),
(379, 'МАГАЗИНОВ-САЛОН'),
(378, 'МАГАЗИНОВ-САЛОНОВ'),
(1119, 'МАКСИМАЛЬН'),
(449, 'МАЛ'),
(17, 'МАЛЕНЬК'),
(603, 'МАРКЕТИНГ'),
(692, 'МАРКЕТИНГОВ'),
(790, 'МАС'),
(941, 'МАСС'),
(1050, 'МАССИВ'),
(865, 'МАССИВН'),
(196, 'МАССОВ'),
(666, 'МАСТЕР-КЛАСС'),
(236, 'МАСТЕРСК'),
(548, 'МАСТЕРСТВ'),
(668, 'МАСШТАБН'),
(102, 'МАТЕРИА'),
(101, 'МАТЕРИАЛ'),
(100, 'МАТЕРИАЛОВ'),
(544, 'МАТЕРИАЛЬН'),
(1433, 'МАФФИН'),
(24, 'МЕБЕЛ'),
(13, 'МЕБЕЛЬН'),
(370, 'МЕБЕЛЬПЛЮС'),
(227, 'МЕЖДУНАРОДН'),
(1311, 'МЕЛОЧ'),
(79, 'МЕЛЬЧАЙШ'),
(1303, 'МЕНЕДЖЕР'),
(222, 'МЕНЕДЖМЕНТ'),
(1270, 'МЕНЮ'),
(533, 'МЕР'),
(604, 'МЕРОПРИЯТ'),
(1234, 'МЕС'),
(537, 'МЕСТ'),
(157, 'МЕСЯЦ'),
(156, 'МЕСЯЦЕВ'),
(1088, 'МЕТАЛЛИЧЕСК'),
(1220, 'МЕТОД'),
(1219, 'МЕТОДОВ'),
(1394, 'МЕТР'),
(874, 'МЕХАНИЗМ'),
(750, 'МЕЩЕРЯК'),
(749, 'МЕЩЕРЯКОВ'),
(190, 'МИНИМАЛЬН'),
(969, 'МИНИМУМ'),
(825, 'МИНИСТР'),
(633, 'МИНСК'),
(1323, 'МИНУТ'),
(711, 'МИР'),
(299, 'МИРОВ'),
(481, 'МИСС'),
(748, 'МИХАЙЛОВИЧ'),
(1272, 'МЛ'),
(1292, 'МЛН'),
(105, 'МНОГ'),
(742, 'МНОГОКОМПОНЕНТН'),
(137, 'МНОГОЛЕТН'),
(680, 'МОД'),
(38, 'МОДЕЛ'),
(1133, 'МОДЕЛИРОВАН'),
(902, 'МОДЕРН'),
(262, 'МОДЕРНИЗАЦ'),
(778, 'МОДИФИКАТОР'),
(583, 'МОЖЕТ'),
(833, 'МОЖН'),
(250, 'МОЛОД'),
(175, 'МОЛОДЕЖ'),
(127, 'МОМЕНТ'),
(815, 'МОНАЛИЗ'),
(1129, 'МОНТАЖ'),
(543, 'МОРАЛЬН'),
(286, 'МОСКВ'),
(1462, 'МОСКВАСИТ'),
(504, 'МОЩНОСТ'),
(1249, 'МПЗ'),
(1380, 'МУЗЫК'),
(908, 'МЫСЛ'),
(369, 'МЯГК'),
(1875, 'Маффины'),
(1812, 'Меню'),
(2319, 'Многие'),
(1769, 'Москва'),
(1923, 'МоскваСити'),
(2023, 'Москве'),
(1617, 'Москвы'),
(1606, 'Мы'),
(1399, 'НАБ'),
(913, 'НАБОР'),
(1189, 'НАВЫК'),
(88, 'НАГЛЯДН'),
(500, 'НАДЕЖН'),
(1395, 'НАЗВАН'),
(110, 'НАИБОЛ'),
(921, 'НАИЛУЧШ'),
(940, 'НАЙТ'),
(1140, 'НАКАНУН'),
(883, 'НАКЛАДК'),
(193, 'НАЛАЖ'),
(421, 'НАЛАЖИВА'),
(34, 'НАМ'),
(1279, 'НАПИТК'),
(1278, 'НАПИТКОВ'),
(1654, 'НАПИТОК'),
(417, 'НАРАЩИВА'),
(1377, 'НАРЕЗК'),
(673, 'НАРОДН'),
(168, 'НАС'),
(452, 'НАСТОЯ'),
(311, 'НАСЧИТЫВА'),
(1172, 'НАТУРАЛИСТИЧН'),
(363, 'НАТУРАЛЬН'),
(889, 'НАХОД'),
(1472, 'НАЧА'),
(471, 'НАЧАЛЬНИК'),
(230, 'НАЧИНА'),
(974, 'НАЧНЕТ'),
(6, 'НАШ'),
(1258, 'НЕДЕЛ'),
(1039, 'НЕЗАМЕНИМ'),
(1139, 'НЕКОТОР'),
(835, 'НЕМ'),
(914, 'НЕОБХОДИМ'),
(869, 'НЕОБЫКНОВЕН'),
(1072, 'НЕОБЫЧАЙН'),
(847, 'НЕОБЫЧН'),
(45, 'НЕПОВТОРИМ'),
(1136, 'НЕПОСРЕДСТВЕН'),
(1287, 'НЕСКОЛЬК'),
(827, 'НЕСМОТР'),
(56, 'НЕСТАНДАРТН'),
(373, 'НИЖН'),
(828, 'НИЗК'),
(1082, 'НИХ'),
(257, 'НОВ'),
(374, 'НОВГОРОД'),
(906, 'НОВИЗН'),
(650, 'НОВИНК'),
(1402, 'НОВОДМИТРОВСК'),
(611, 'НОВОСТ'),
(1004, 'НОГ'),
(999, 'НОЖК'),
(200, 'НОМЕНКЛАТУР'),
(212, 'НОРМ'),
(1417, 'НЬЮ-ЙОРК'),
(77, 'НЮАНС'),
(76, 'НЮАНСОВ'),
(2698, 'На'),
(1639, 'Нам'),
(2115, 'Например'),
(2590, 'Нарезка'),
(2247, 'Наша'),
(1959, 'Наши'),
(1569, 'Не'),
(2383, 'Но'),
(1917, 'Новая'),
(1782, 'Новодмитровская'),
(1881, 'Новости'),
(1045, 'ОБАЯН'),
(44, 'ОБЕСПЕЧ'),
(542, 'ОБЕСПЕЧЕН'),
(525, 'ОБЕСПЕЧИВА'),
(669, 'ОБЕЩА'),
(811, 'ОБИВК'),
(652, 'ОБИВОЧН'),
(730, 'ОБЛАСТ'),
(910, 'ОБЛИК'),
(392, 'ОБНОВЛЕН'),
(1236, 'ОБОРОТ'),
(188, 'ОБОРУДОВАН'),
(1138, 'ОБРАБОТК'),
(1180, 'ОБРАЗ'),
(437, 'ОБРАЗОВАН'),
(677, 'ОБРАЗЦ'),
(676, 'ОБРАЗЦОВ'),
(577, 'ОБРАТ'),
(1325, 'ОБСЛУЖИВАН'),
(1014, 'ОБСТАНОВК'),
(975, 'ОБСУЖДЕН'),
(493, 'ОБУСТРО'),
(942, 'ОБУСТРОЙСТВ'),
(1246, 'ОБУЧАЕМ'),
(163, 'ОБУЧЕН'),
(383, 'ОБЩ'),
(1195, 'ОБЩЕН'),
(178, 'ОБЪЕДИНЯ'),
(275, 'ОБЪЕМ'),
(86, 'ОБЪЕМН'),
(946, 'ОБЯЗАН'),
(561, 'ОБЯЗАТЕЛЬСТВ'),
(1128, 'ОГОВАРИВА'),
(1144, 'ОГОВОР'),
(1031, 'ОГРАНИЧЕН'),
(20, 'ОДН'),
(507, 'ОЖИДАН'),
(1026, 'ОКАНТОВК'),
(1204, 'ОКЛАД'),
(1498, 'ОКОЛ'),
(529, 'ОКРУЖА'),
(1313, 'ОКУПАЕМ'),
(1385, 'ОМЕГ'),
(1882, 'ОО'),
(134, 'ОП'),
(998, 'ОПИРА'),
(756, 'ОПИСАН'),
(1151, 'ОПЛАЧИВА'),
(506, 'ОПРАВДЫВА'),
(99, 'ОПРЕДЕЛЕН'),
(933, 'ОПРЕДЕЛЯ'),
(983, 'ОПРОВЕРГА'),
(694, 'ОПРОС'),
(930, 'ОПТИМ'),
(69, 'ОПТИМАЛЬН'),
(552, 'ОПТИМИЗАЦ'),
(150, 'ОПТИМИЗИРОВА'),
(1131, 'ОПЫТН'),
(916, 'ОРГАНИЗАЦ'),
(327, 'ОРГАНИЗАЦИОН'),
(935, 'ОРГАНИЗОВА'),
(1064, 'ОРГАНИЧН'),
(1174, 'ОРИГИНАЛ'),
(840, 'ОРИГИНАЛЬН'),
(1365, 'ОРИЕНТИРОВА'),
(96, 'ОСВЕЩЕН'),
(1000, 'ОСВОБОЖД'),
(895, 'ОСН'),
(346, 'ОСНАЩЕН'),
(894, 'ОСНОВ'),
(566, 'ОСНОВАН'),
(903, 'ОСНОВН'),
(54, 'ОСОБ'),
(1036, 'ОСОБЕН'),
(1317, 'ОСТАВ'),
(1198, 'ОСТАВЛЕН'),
(1150, 'ОСТАЛЬН'),
(572, 'ОСТАН'),
(121, 'ОСУЩЕСТВЛЯ'),
(743, 'ОТВЕРДИТЕЛ'),
(591, 'ОТВЕТ'),
(520, 'ОТВЕТСТВЕН'),
(1141, 'ОТДЕЛ'),
(1157, 'ОТДЕЛК'),
(158, 'ОТДЕЛЬН'),
(1424, 'ОТЗ'),
(1419, 'ОТЗЫВ'),
(278, 'ОТКР'),
(367, 'ОТКРЫВА'),
(351, 'ОТКРЫТ'),
(1095, 'ОТЛИЧН'),
(559, 'ОТНОС'),
(339, 'ОТНОШЕН'),
(1120, 'ОТОБРАЖА'),
(1423, 'ОТПРАВ'),
(620, 'ОТРАСЛ'),
(693, 'ОТЧЕТ'),
(1227, 'ОТЧЕТН'),
(1254, 'ОТЧЕТОВ'),
(39, 'ОФИС'),
(634, 'ОФИСКОМФОРТ'),
(800, 'ОФИСН'),
(233, 'ОФИСОВ'),
(296, 'ОФИЦИАЛЬН'),
(128, 'ОФОРМЛЕН'),
(148, 'ОШИБОК'),
(965, 'ОЩУЩЕН'),
(2730, 'Обучение'),
(1930, 'Омега'),
(2452, 'Они'),
(1560, 'Оставить'),
(1761, 'Отзывы'),
(1896, 'Открытие'),
(1797, 'Отправить'),
(1451, 'ПАВЕЛЕЦК'),
(1212, 'ПАКЕТ'),
(1288, 'ПАКЕТОВ'),
(1057, 'ПАЛЕРМ'),
(1056, 'ПАЛИТР'),
(1042, 'ПАРМ'),
(1032, 'ПАРТ'),
(336, 'ПАРТНЕР'),
(335, 'ПАРТНЕРОВ'),
(396, 'ПАРТНЕРСТВ'),
(753, 'ПАТЕНТ'),
(216, 'ПЕРВ'),
(1247, 'ПЕРВИЧН'),
(682, 'ПЕРЕГОВОР'),
(962, 'ПЕРЕГОВОРОВ'),
(949, 'ПЕРЕГОРОДК'),
(484, 'ПЕРЕД'),
(1130, 'ПЕРЕДА'),
(131, 'ПЕРЕДОВ'),
(1161, 'ПЕРЕКЛЮЧЕН'),
(1156, 'ПЕРЕПЛАНИРОВК'),
(1159, 'ПЕРЕСТАНОВК'),
(268, 'ПЕРЕШЛ'),
(932, 'ПЕРСОНА'),
(1302, 'ПЕРСОНАЛЬН'),
(498, 'ПЕРСПЕКТИВ'),
(463, 'ПЕТРОВИЧ'),
(2773, 'ПИРОГ'),
(1411, 'ПИРОЖН'),
(1883, 'ПИТСТОП'),
(1188, 'ПК'),
(1009, 'ПЛАВН'),
(1386, 'ПЛАЗ'),
(1228, 'ПЛАН'),
(1084, 'ПЛАСТИК'),
(1102, 'ПЛАСТИКОВ'),
(1457, 'ПЛАТФОРМ'),
(1114, 'ПЛАТЯН'),
(899, 'ПЛОТН'),
(237, 'ПЛОЩАД'),
(1034, 'ПЛУТОН'),
(1436, 'ПОВИДЛ'),
(270, 'ПОВЫС'),
(521, 'ПОВЫШЕН'),
(709, 'ПОДА'),
(1638, 'ПОДАРОК'),
(1322, 'ПОДАЧ'),
(1294, 'ПОДБЕРЕТ'),
(1170, 'ПОДБИРА'),
(1177, 'ПОДБОР'),
(660, 'ПОДГОТОВ'),
(448, 'ПОДГОТОВК'),
(691, 'ПОДГОТОВЛ'),
(426, 'ПОДГОТОВЛЕН'),
(853, 'ПОДДЕРЖИВА'),
(1449, 'ПОДДЕРЖК'),
(1496, 'ПОДЕЛ'),
(824, 'ПОДЛОКОТНИК'),
(848, 'ПОДЛОКОТНИКОВ'),
(287, 'ПОДМОСКОВ'),
(64, 'ПОДОБРА'),
(1096, 'ПОДОЙДЕТ'),
(1073, 'ПОДОЙДУТ'),
(1255, 'ПОДРАЗДЕЛЕН'),
(1473, 'ПОДРОБН'),
(29, 'ПОДХОД'),
(111, 'ПОДХОДЯ'),
(1502, 'ПОДЪЕЗД'),
(1125, 'ПОЖЕЛАН'),
(249, 'ПОЗВОЛ'),
(140, 'ПОЗВОЛЯ'),
(854, 'ПОЗВОНОЧНИК'),
(412, 'ПОЗИЦ'),
(678, 'ПОЗНАКОМ'),
(2, 'ПОИСК'),
(667, 'ПОИСТИН'),
(177, 'ПОКОЛЕН'),
(579, 'ПОКУПК'),
(1001, 'ПОЛЕЗН'),
(443, 'ПОЛИТЕХНИЧЕСК'),
(428, 'ПОЛИТИК'),
(803, 'ПОЛК'),
(957, 'ПОЛН'),
(1320, 'ПОЛНОЦЕН'),
(404, 'ПОЛУТОР'),
(225, 'ПОЛУЧ'),
(1301, 'ПОЛУЧА'),
(731, 'ПОЛУЧЕН'),
(1187, 'ПОЛЬЗОВАТЕЛ'),
(630, 'ПОЛЬШ'),
(61, 'ПОМЕЩЕН'),
(657, 'ПОМИМ'),
(68, 'ПОМОГУТ'),
(1013, 'ПОМОЖЕТ'),
(590, 'ПОМОЧ'),
(832, 'ПОМОЩ'),
(569, 'ПОНИМА'),
(518, 'ПОНИМАН'),
(1023, 'ПОНЯТ'),
(1101, 'ПОПУЛЯРН'),
(901, 'ПОРОЛОН'),
(900, 'ПОРОЛОНОВ'),
(1276, 'ПОРЦ'),
(714, 'ПОСЕТ'),
(695, 'ПОСЕТИТЕЛ'),
(1127, 'ПОСЛ'),
(522, 'ПОСЛЕД'),
(85, 'ПОСМОТРЕТ'),
(305, 'ПОСТАВК'),
(503, 'ПОСТАВЩИК'),
(267, 'ПОСТЕПЕН'),
(199, 'ПОСТОЯ'),
(1135, 'ПОСТУПА'),
(1491, 'ПОСЧИТА'),
(1029, 'ПОТ'),
(510, 'ПОТРЕБИТЕЛ'),
(956, 'ПОТРЕБН'),
(849, 'ПОТРЯСА'),
(586, 'ПОЧТ'),
(1469, 'ПОЯВ'),
(1262, 'ПР-Д'),
(27, 'ПРАВ'),
(527, 'ПРАВИЛ'),
(934, 'ПРАВИЛЬН'),
(683, 'ПРАКТИЧЕСК'),
(179, 'ПРЕДАН'),
(1164, 'ПРЕДВАРИТЕЛЬН'),
(1168, 'ПРЕДЛАГ'),
(499, 'ПРЕДЛАГА'),
(1505, 'ПРЕДЛОЖ'),
(684, 'ПРЕДЛОЖЕН'),
(645, 'ПРЕДМЕТ'),
(739, 'ПРЕДНАЗНАЧ'),
(1146, 'ПРЕДОПЛАТ'),
(104, 'ПРЕДОСТАВЛ'),
(491, 'ПРЕДОСТАВЛЯ'),
(712, 'ПРЕДПОЛАГА'),
(226, 'ПРЕДПРИЯТ'),
(1175, 'ПРЕДСТАВ'),
(349, 'ПРЕДСТАВИТЕЛЬСТВ'),
(643, 'ПРЕДСТАВЛ'),
(87, 'ПРЕДСТАВЛЕН'),
(1487, 'ПРЕДСТАВЛЯ'),
(967, 'ПРЕЗИДЕНТ'),
(687, 'ПРЕИМУЩЕСТВ'),
(1085, 'ПРЕКРАСН'),
(1206, 'ПРЕМ'),
(968, 'ПРЕМЬЕР-МИНИСТР'),
(1155, 'ПРЕОБРАЗОВАН'),
(1398, 'ПРЕСНЕНСК'),
(741, 'ПРЕССОВАН'),
(886, 'ПРЕСТИЖ'),
(293, 'ПРЕСТИЖН'),
(524, 'ПРИБ'),
(564, 'ПРИБЫЛЬН'),
(1241, 'ПРИВЕТСВ'),
(1068, 'ПРИВЛЕКА'),
(982, 'ПРИВЛЕКАТЕЛЬН'),
(555, 'ПРИВЛЕЧЕН'),
(1299, 'ПРИВЛЕЧЕТ'),
(925, 'ПРИВЫКЛ'),
(1489, 'ПРИГЛАША'),
(1493, 'ПРИГОТОВ'),
(868, 'ПРИДА'),
(1121, 'ПРИЕЗЖА'),
(129, 'ПРИЕМ'),
(297, 'ПРИЗНАН'),
(189, 'ПРИМЕНЕН'),
(766, 'ПРИМЕНЯ'),
(573, 'ПРИМЕР'),
(839, 'ПРИМЕЧАТЕЛЬН'),
(623, 'ПРИНИМА'),
(637, 'ПРИНЦИП'),
(398, 'ПРИНЯТ'),
(355, 'ПРИОБРЕТА'),
(601, 'ПРИОБРЕТЕН'),
(1077, 'ПРИРОДН'),
(944, 'ПРИСПОСОБ'),
(955, 'ПРИСПОСОБЛЕН'),
(329, 'ПРИСТУП'),
(1460, 'ПРИХОД'),
(1112, 'ПРИХОЖ'),
(779, 'ПРИЧ'),
(1494, 'ПРИШЛ'),
(1379, 'ПРИЯТН'),
(333, 'ПРОВЕД'),
(713, 'ПРОВЕДЕН'),
(681, 'ПРОВЕСТ'),
(722, 'ПРОВОД'),
(447, 'ПРОГРАММ'),
(1185, 'ПРОДАВЕЦ-ДИЗАЙНЕР'),
(1205, 'ПРОДАЖ'),
(1450, 'ПРОДВИЖЕН'),
(89, 'ПРОДЕМОНСТРИР'),
(391, 'ПРОДОЛЖА'),
(46, 'ПРОДУКЦ'),
(71, 'ПРОЕКТ'),
(149, 'ПРОЕКТИРОВАН'),
(1445, 'ПРОЕКТН'),
(1200, 'ПРОЕКТОВ'),
(1123, 'ПРОИЗВЕДЕТ'),
(59, 'ПРОИЗВЕДУТ'),
(141, 'ПРОИЗВЕСТ'),
(1030, 'ПРОИЗВОД'),
(526, 'ПРОИЗВОДИМ'),
(22, 'ПРОИЗВОДИТЕЛ'),
(551, 'ПРОИЗВОДИТЕЛЬН'),
(384, 'ПРОИЗВОДСВЕННО-СКЛАДСК'),
(187, 'ПРОИЗВОДСТВ'),
(194, 'ПРОИЗВОДСТВЕН'),
(988, 'ПРОИСХОД'),
(737, 'ПРОМЫШЛЕН'),
(78, 'ПРОРИСОВК'),
(1018, 'ПРОСТ'),
(822, 'ПРОСТЕЖК'),
(496, 'ПРОСТРАНСТВ'),
(757, 'ПРОТОТИП'),
(162, 'ПРОФЕССИОНАЛЬН'),
(204, 'ПРОХОД'),
(195, 'ПРОЦЕСС'),
(799, 'ПРОЧ'),
(725, 'ПРОЧН'),
(161, 'ПРОШЕДШ'),
(446, 'ПРОШЕЛ'),
(14, 'ПРОШЛ'),
(897, 'ПРУЖИН'),
(16, 'ПУТ'),
(632, 'ПЯТ'),
(37, 'ПЯТИСОТ'),
(1771, 'Павелецкая'),
(1906, 'Павелецкого'),
(1899, 'Павелецкой'),
(2701, 'Пакет'),
(2541, 'Песочные'),
(1877, 'Пирожные'),
(2123, 'ПитСтоп'),
(2092, 'Питстоп'),
(1931, 'Плаза'),
(2744, 'Поддержку'),
(1809, 'Подробное'),
(1697, 'Подробности'),
(1803, 'Подробный'),
(1725, 'Подумайте'),
(1566, 'Полноценные'),
(2745, 'Полную'),
(1833, 'Поля'),
(2033, 'Помимо'),
(2723, 'Помощь'),
(1764, 'Поставщикам'),
(1555, 'Постоянно'),
(2627, 'Поэтому'),
(1826, 'Предлагаем'),
(2157, 'Преимущества'),
(1779, 'Пресненская'),
(2663, 'При'),
(1655, 'Приводите'),
(2685, 'Приглашаем'),
(1532, 'Приходите'),
(1542, 'Р'),
(118, 'РАБОТ'),
(242, 'РАБОТА'),
(517, 'РАБОТНИК'),
(516, 'РАБОТНИКОВ'),
(1037, 'РАБОТОСПОСОБН'),
(495, 'РАБОЧ'),
(589, 'РАД'),
(476, 'РАДИОТЕХНИК'),
(724, 'РАЗ'),
(375, 'РАЗВИВА'),
(248, 'РАЗВИТ'),
(1474, 'РАЗДЕЛ'),
(746, 'РАЗИНЬК'),
(745, 'РАЗИНЬКОВ'),
(106, 'РАЗЛИЧН'),
(57, 'РАЗМЕР'),
(717, 'РАЗМЕСТ'),
(95, 'РАЗН'),
(661, 'РАЗНООБРАЗН'),
(35, 'РАЗРАБОТА'),
(580, 'РАЗРАБОТК'),
(1444, 'РАЗРЕШИТЕЛЬН'),
(663, 'РАМК'),
(878, 'РАСКЛАДУШК'),
(1137, 'РАСКР'),
(359, 'РАСКРО'),
(819, 'РАСПИСЫВА'),
(234, 'РАСПОЛАГА'),
(70, 'РАСПОЛОЖ'),
(103, 'РАСПОРЯЖЕН'),
(1176, 'РАССМОТРЕТ'),
(1178, 'РАССТАНОВК'),
(1310, 'РАССЧИТА'),
(251, 'РАСТ'),
(784, 'РАСТВОР'),
(145, 'РАСХОД'),
(143, 'РАСЧЕТ'),
(1134, 'РАСЧЕТОВ'),
(348, 'РАСШИР'),
(658, 'РАСШИРЕН'),
(415, 'РАСШИРЯ'),
(461, 'РАТЧЕНК'),
(952, 'РАЦИОНАЛЬН'),
(283, 'РЕГИОН'),
(352, 'РЕГИОНАЛЬН'),
(420, 'РЕГИОНОВ'),
(1162, 'РЕЖИМ'),
(81, 'РЕЗУЛЬТАТ'),
(523, 'РЕИНВЕСТИРОВАН'),
(671, 'РЕСПУБЛИКАНСК'),
(1280, 'РЕЦЕПТУР'),
(1495, 'РЕШ'),
(771, 'РЕША'),
(399, 'РЕШЕН'),
(1368, 'РИТМ'),
(473, 'РОГОВ'),
(434, 'РОД'),
(1217, 'РОЗНИЦ'),
(376, 'РОЗНИЧН'),
(1437, 'РОЛЛ'),
(872, 'РОСКОШ'),
(810, 'РОСКОШН'),
(809, 'РОСПИС'),
(25, 'РОСС'),
(8, 'РОССИЙСК'),
(568, 'РОСТ'),
(1210, 'РУБ'),
(350, 'РУБЕЖ'),
(1291, 'РУБЛ'),
(1191, 'РУК'),
(826, 'РУКОВОДИТЕЛ'),
(406, 'РУКОВОДСТВ'),
(427, 'РУКОВОДЯ'),
(192, 'РУЧН'),
(1214, 'РФ'),
(9, 'РЫНК'),
(300, 'РЫНОК'),
(302, 'РЯД'),
(2216, 'Родина'),
(1958, 'России'),
(2793, 'Руководство'),
(1706, 'С'),
(1401, 'САВЕЛОВСК'),
(707, 'САД'),
(4, 'САЙТ'),
(1373, 'САЛАТ'),
(322, 'САЛОН'),
(321, 'САЛОНОВ'),
(1244, 'САМОСТОЯТЕЛЬН'),
(539, 'САНИТАРН'),
(372, 'САНКТ-ПЕТЕРБУРГ'),
(119, 'СБОРК'),
(1499, 'СВАР'),
(915, 'СВЕЖ'),
(1374, 'СВЕЖЕВЫЖАТ'),
(531, 'СВОЕВРЕМЕН'),
(625, 'СВЫШ'),
(1143, 'СВЯЖУТ'),
(422, 'СВЯЗ'),
(1421, 'СВЯЗА'),
(98, 'СДЕЛА'),
(146, 'СЕБЕСТОИМ'),
(289, 'СЕВЕРО-ЗАПАД'),
(397, 'СЕГОДН'),
(32, 'СЕГОДНЯШН'),
(641, 'СЕКТОР'),
(640, 'СЕКТОРОВ'),
(665, 'СЕМИНАР'),
(435, 'СЕНТЯБР'),
(905, 'СЕР'),
(1321, 'СЕРВИС'),
(469, 'СЕРГ'),
(210, 'СЕРТИФИКАТ'),
(205, 'СЕРТИФИКАЦИОН'),
(377, 'СЕТ'),
(284, 'СИБИР'),
(1054, 'СИДЕН'),
(1081, 'СИДЕТ'),
(996, 'СИММЕТРИЧ'),
(774, 'СИНТЕТИЧЕСК'),
(512, 'СИСТ'),
(221, 'СИСТЕМ'),
(546, 'СИСТЕМАТИЧЕСК'),
(1002, 'СИСТЕМН'),
(1099, 'СИТ'),
(331, 'СКЛАД'),
(1075, 'СКЛАДН'),
(400, 'СКЛАДСК'),
(1492, 'СКОЛЬК'),
(1431, 'СЛАЙД'),
(890, 'СЛЕВ'),
(786, 'СЛЕД'),
(1389, 'СЛОБОД'),
(1091, 'СЛОЖ'),
(1116, 'СЛОЖН'),
(1435, 'СЛОЙК'),
(1006, 'СЛУЖ'),
(1413, 'СМЕТА'),
(1479, 'СМОГУТ'),
(84, 'СМОЖЕТ'),
(762, 'СМОЛ'),
(675, 'СМОТР'),
(307, 'СНГ'),
(554, 'СНИЖЕН'),
(144, 'СНИЗ'),
(419, 'СО'),
(485, 'СОБ'),
(960, 'СОБРАН'),
(261, 'СОБСТВЕН'),
(429, 'СОБСТВЕННИК'),
(269, 'СОВЕРШЕН'),
(530, 'СОВЕРШЕНСТВОВАН'),
(1025, 'СОВЕСТ'),
(1016, 'СОВЕЩАТЕЛЬН'),
(82, 'СОВМЕСТН'),
(1207, 'СОВОКУПН'),
(959, 'СОВРЕМЕН'),
(1422, 'СОГЛАС'),
(775, 'СОГЛАСН'),
(1022, 'СОГЛАСУ'),
(567, 'СОДЕЙСТВ'),
(777, 'СОДЕРЖ'),
(727, 'СОЕДИНЕН'),
(73, 'СОЗДА'),
(535, 'СОЗДАН'),
(920, 'СОЗДАСТ'),
(1375, 'СОК'),
(1065, 'СОЛЬЮТ'),
(1455, 'СООБЩ'),
(211, 'СООТВЕТСТВ'),
(787, 'СООТНОШЕН'),
(763, 'СОПОЛИМЕР'),
(1378, 'СОПРОВОЖДА'),
(1304, 'СОПРОВОЖДЕН'),
(734, 'СОСТА'),
(401, 'СОСТАВ'),
(154, 'СОСТАВЛЯ'),
(733, 'СОСТАВОВ'),
(618, 'СОСТО'),
(760, 'СОСТОЯ'),
(122, 'СОТРУДНИК'),
(313, 'СОТРУДНИКОВ'),
(1290, 'СОТРУДНИЧЕСТВ'),
(893, 'СОФ'),
(409, 'СОХРАН'),
(991, 'СОХРАНЯ'),
(1211, 'СОЦ'),
(571, 'СОЦИАЛЬН'),
(1428, 'СОЦСЕТ'),
(912, 'СОЧЕТА'),
(917, 'СОЧЕТАН'),
(703, 'СПАЛ'),
(51, 'СПАЛЬН'),
(1153, 'СПЕКТР'),
(207, 'СПЕЦИАЛИЗИРОВА'),
(139, 'СПЕЦИАЛИСТ'),
(138, 'СПЕЦИАЛИСТОВ'),
(466, 'СПЕЦИАЛЬН'),
(823, 'СПИНК'),
(1005, 'СПРАВ'),
(1067, 'СРАЗ'),
(217, 'СРЕД'),
(450, 'СРЕДН'),
(1314, 'СРЕДНЕМЕСЯЧН'),
(246, 'СРЕДСТВ'),
(117, 'СРОК'),
(260, 'СТАВШ'),
(264, 'СТАЛ'),
(184, 'СТАНДАРТ'),
(241, 'СТАНК'),
(674, 'СТАНОВ'),
(1393, 'СТАНЦ'),
(1306, 'СТАРТ-АП'),
(176, 'СТАРШ'),
(670, 'СТАТ'),
(1490, 'СТЕНД'),
(424, 'СТЕПЕН'),
(859, 'СТИЛ'),
(994, 'СТИЛЬН'),
(829, 'СТОИМОСТ'),
(964, 'СТОЙК'),
(801, 'СТОЛ'),
(1397, 'СТОЛИЦ'),
(981, 'СТОЛОВ'),
(198, 'СТОРОН'),
(306, 'СТРАН'),
(610, 'СТРАНИЦ'),
(482, 'СТРАТЕГ'),
(43, 'СТРЕМ'),
(636, 'СТРО'),
(123, 'СТРОГ'),
(736, 'СТРОИТЕЛЬН'),
(330, 'СТРОИТЕЛЬСТВ'),
(867, 'СТРОЧК'),
(802, 'СТУЛ'),
(1059, 'СТУЛЬЕВ'),
(1148, 'СУММ'),
(7, 'СУЩЕСТВ'),
(1193, 'СФЕР'),
(1173, 'СХОЖЕСТ'),
(844, 'СЧЕТ'),
(1078, 'СЧИТА'),
(451, 'США'),
(1441, 'СЫРНИК'),
(2774, 'СЫТН'),
(1372, 'СЭНДВИЧ'),
(2689, 'Савеловский'),
(2026, 'Салат'),
(1874, 'Салаты'),
(2595, 'Самые'),
(1926, 'Санкт-Петербург'),
(1791, 'Связаться'),
(1511, 'Сегодня'),
(2765, 'Сеть'),
(2732, 'Систему'),
(2690, 'Сити'),
(2315, 'Сколько'),
(2673, 'Сладкая'),
(1895, 'Слайд'),
(1584, 'Следите'),
(1785, 'Слобода'),
(1880, 'Слойки'),
(1793, 'Согласен'),
(1587, 'Соцсети'),
(2374, 'Специально'),
(2759, 'Среднемесячный'),
(2755, 'Срок'),
(1943, 'Ссылка'),
(2741, 'Старт-ап'),
(2703, 'Стоимость'),
(1921, 'Столиц'),
(1872, 'Сырники'),
(1873, 'Сэндвичи'),
(1265, 'ТАЙТЛ'),
(323, 'ТАКЖ'),
(887, 'ТАХТ'),
(851, 'ТВЕРД'),
(1442, 'ТВОРОЖН'),
(83, 'ТВОРЧЕСТВ'),
(1429, 'ТЕКСТ'),
(621, 'ТЕКУЩ'),
(584, 'ТЕЛЕФОН'),
(42, 'ТЕМ'),
(639, 'ТЕМАТИЧЕСК'),
(253, 'ТЕМП'),
(679, 'ТЕНДЕНЦ'),
(1468, 'ТЕПЕР'),
(1079, 'ТЕПЛ'),
(380, 'ТЕРРИТОР'),
(1410, 'ТЕСТОВ'),
(1040, 'ТЕХ'),
(477, 'ТЕХНИЧЕСК'),
(132, 'ТЕХНОЛОГ'),
(501, 'ТЕХНОЛОГИЧН'),
(702, 'ТИП'),
(1213, 'ТК'),
(653, 'ТКАН'),
(215, 'ТОГ'),
(834, 'ТОМ'),
(1055, 'ТОНИРОВК'),
(18, 'ТОРГОВ'),
(1504, 'ТОРЖЕСТВЕН'),
(1453, 'ТОЧК'),
(116, 'ТОЧН'),
(66, 'ТОЧНОСТ'),
(266, 'ТРАДИЦ'),
(1142, 'ТРАНСПОРТН'),
(875, 'ТРАНСФОРМАЦ'),
(220, 'ТРЕБОВАН'),
(563, 'ТРЕБОВАТЕЛЬН'),
(395, 'ТРЕТ'),
(1132, 'ТРЕХМЕРН'),
(1019, 'ТРОН'),
(169, 'ТРУД'),
(1222, 'ТРУДОВ'),
(1229, 'ТРУДОУСТРОЙСТВ'),
(951, 'ТУМБ'),
(1316, 'ТЫС'),
(405, 'ТЫСЯЧ'),
(1815, 'Также'),
(1954, 'Такие'),
(1722, 'Такого'),
(2580, 'Такое'),
(2484, 'Такой'),
(1799, 'Текст'),
(1892, 'Тел'),
(1786, 'Телефон'),
(1805, 'Тестовая'),
(2785, 'Тосты'),
(1927, 'Тут'),
(2183, 'У'),
(274, 'УВЕЛИЧ'),
(418, 'УВЕЛИЧИВА'),
(1186, 'УВЕРЕН'),
(685, 'УВИДЕТ'),
(357, 'УГЛОВ'),
(918, 'УДАЧН'),
(978, 'УДИВИТЕЛЬН'),
(1089, 'УДОБ'),
(1007, 'УДОБН'),
(545, 'УДОВЛЕТВОРЕН'),
(1256, 'УКАЗАН'),
(393, 'УКОМПЛЕКТОВА'),
(631, 'УКРАИН'),
(881, 'УКРАШЕН'),
(337, 'УКРЕПЛЕН'),
(1387, 'УЛ'),
(1709, 'УЛЕТН'),
(1459, 'УЛИЦ'),
(987, 'УМЕНЬШЕН'),
(1058, 'УНИВЕРСАЛЬН'),
(478, 'УНИВЕРСИТЕТ'),
(954, 'УНИКАЛЬН'),
(1221, 'УПРАВЛЕН'),
(1020, 'УПРАВЛЕНЦ'),
(454, 'УПРАВЛЯ'),
(410, 'УПРОЧ'),
(285, 'УРА'),
(271, 'УРОВЕН'),
(547, 'УРОВН'),
(536, 'УСЛОВ'),
(1, 'УСЛУГ'),
(186, 'УСПЕХ'),
(387, 'УСПЕШН'),
(837, 'УСТАЛ'),
(873, 'УСТАНОВ'),
(120, 'УСТАНОВК'),
(984, 'УСТОЯ'),
(985, 'УТВЕРЖДЕН'),
(624, 'УЧАСТ'),
(690, 'УЧАСТНИК'),
(689, 'УЧАСТНИКОВ'),
(165, 'УЧЕБН'),
(74, 'УЧЕТ'),
(1124, 'УЧИТЫВ'),
(1063, 'УЮТ'),
(1044, 'УЮТН'),
(1553, 'Уникальная'),
(368, 'ФАБРИК'),
(1074, 'ФАЗЕНД'),
(592, 'ФАКС'),
(1167, 'ФАКТУР'),
(440, 'ФАКУЛЬТЕТ'),
(754, 'ФЕДЕРАЦ'),
(433, 'ФЕДОРОВИЧ'),
(1035, 'ФИЗИОЛОГИЧЕСК'),
(332, 'ФИЛИА'),
(1226, 'ФИНАНСОВО-ХОЗЯЙСТВЕН'),
(19, 'ФИРМ'),
(279, 'ФИРМЕН'),
(880, 'ФЛОР'),
(470, 'ФОМИЧ'),
(1070, 'ФОРМ'),
(365, 'ФОРМИР'),
(1253, 'ФОРМИРОВАН'),
(612, 'ФОРУМ'),
(1284, 'ФРАНЧАЙЗ'),
(1283, 'ФРАНЧАЙЗИНГ'),
(1293, 'ФРАНШИЗ'),
(1376, 'ФРУКТОВ'),
(939, 'ФУНКЦ'),
(1160, 'ФУНКЦИОНАЛЬН'),
(651, 'ФУРНИТУР'),
(1559, 'Франчайзинг'),
(1699, 'Франшиза'),
(2576, 'Фруктовая'),
(1878, 'Фруктовые'),
(197, 'ХАРАКТЕР'),
(904, 'ХАРАКТЕРИСТИК'),
(1076, 'ХЛОПК'),
(767, 'ХЛОРИСТ'),
(265, 'ХОРОШ'),
(1107, 'ХРАН'),
(1092, 'ХРАНЕН'),
(838, 'ХРОМ'),
(845, 'ХРОМИРОВА'),
(1199, 'ХУДОЖЕСТВЕННО-КОНСТРУКТОРСК'),
(67, 'ЦВЕТ'),
(1171, 'ЦВЕТН'),
(919, 'ЦВЕТОВ'),
(488, 'ЦЕЛ'),
(1049, 'ЦЕЛИК'),
(173, 'ЦЕН'),
(1305, 'ЦЕНТРАЛИЗОВА'),
(258, 'ЦЕХ'),
(1308, 'ЦИФР'),
(1463, 'ЦОКОЛЬН'),
(1831, 'Цвет'),
(2599, 'Цветы'),
(2245, 'Цена'),
(2734, 'Централизованную'),
(1233, 'ЧАС'),
(1470, 'ЧАСТ'),
(1501, 'ЧАШЕК'),
(244, 'ЧЕЛОВЕК'),
(1231, 'ЧЕР'),
(1190, 'ЧЕРЧЕН'),
(1024, 'ЧЕСТ'),
(1415, 'ЧИЗКЕЙК'),
(973, 'ЧИНОВНИК'),
(324, 'ЧИСЛ'),
(1047, 'ЧИСТ'),
(836, 'ЧУВСТВУ'),
(1946, 'Что'),
(2649, 'Чтобы'),
(281, 'ШАГ'),
(870, 'ШАРМ'),
(1260, 'ШАТУР'),
(1152, 'ШИРОК'),
(950, 'ШКАФ'),
(232, 'ШКОЛ'),
(1434, 'ШОКОЛАД'),
(1405, 'ШОСС'),
(364, 'ШПОН'),
(2443, 'Шоколадные'),
(1777, 'Шоссе'),
(785, 'ЩАВЕЛЕВ'),
(1412, 'ЭКЛЕР'),
(1046, 'ЭКОЛОГИЧЕСК'),
(1182, 'ЭКСКЛЮЗИВН'),
(1169, 'ЭКСПЕРИМЕНТИРОВА'),
(256, 'ЭКСПЛУАТАЦ'),
(993, 'ЭКСПЛУАТАЦИОН'),
(622, 'ЭКСПОЗИЦ'),
(659, 'ЭКСПОФОРУМ'),
(871, 'ЭЛЕГАНТН'),
(585, 'ЭЛЕКТРОН'),
(94, 'ЭЛЕМЕНТ'),
(654, 'ЭЛЕМЕНТОВ'),
(866, 'ЭЛИТН'),
(174, 'ЭНТУЗИАЗМ'),
(1407, 'ЭНТУЗИАСТ'),
(1406, 'ЭНТУЗИАСТОВ'),
(1087, 'ЭР'),
(850, 'ЭРГОНОМИК'),
(948, 'ЭРГОНОМИЧН'),
(1126, 'ЭСКИЗН'),
(1458, 'ЭТАЖ'),
(126, 'ЭТАП'),
(1194, 'ЭТИК'),
(468, 'ЭФФЕКТИВН'),
(2709, 'Экспресс'),
(1787, 'Электронная'),
(1778, 'Энтузиастов'),
(1632, 'Эспрессо'),
(2476, 'Эта'),
(2474, 'Это'),
(288, 'ЮГ'),
(758, 'ЯВЛЯ'),
(1475, 'ЯПОНСК'),
(812, 'ЯРК'),
(486, 'ЯСН'),
(804, 'ЯЩИК'),
(1935, 'Японские'),
(2049, 'а'),
(2161, 'абсолютная'),
(1530, 'абсолютно'),
(1936, 'азиатской'),
(1800, 'акции'),
(1619, 'акция'),
(1934, 'аллеи'),
(1835, 'американо'),
(2740, 'анализа'),
(1801, 'анонса'),
(2477, 'аппетитная'),
(2536, 'аппетитные'),
(2668, 'ароматизаторы'),
(1647, 'ароматного'),
(2628, 'ароматную'),
(1525, 'ароматный'),
(1675, 'ароматными'),
(1744, 'ароматом'),
(2364, 'аромату'),
(2501, 'артрита'),
(2098, 'ассортимент'),
(1629, 'ассортимента'),
(1845, 'ассортименте'),
(2182, 'атмосферой'),
(2274, 'бариста'),
(1925, 'башни'),
(2131, 'без'),
(2172, 'безопасности'),
(2162, 'безопасность'),
(2478, 'берет'),
(2413, 'берут'),
(1531, 'бесплатно'),
(2171, 'беспокоясь'),
(2694, 'бизнес-модель'),
(2757, 'бизнеса'),
(2444, 'бисквитные'),
(2002, 'благодаря'),
(2514, 'бланманже'),
(1668, 'ближайшую'),
(1658, 'близких'),
(2069, 'блюд'),
(1519, 'блюда'),
(2028, 'блюдо'),
(2352, 'бодрость'),
(2329, 'бодрящего'),
(2313, 'более'),
(1736, 'больше'),
(1692, 'большой'),
(2421, 'бояться'),
(2681, 'бренд'),
(2034, 'будет'),
(2176, 'будете'),
(1565, 'бывает'),
(2087, 'была'),
(2604, 'были'),
(2397, 'было'),
(2125, 'быстро'),
(2401, 'быстрое'),
(2503, 'быстрому'),
(2256, 'быстрые'),
(2113, 'быть'),
(1512, 'в'),
(2518, 'вагаси'),
(2036, 'важную'),
(2585, 'важным'),
(1523, 'вам'),
(2660, 'ванилин'),
(2571, 'ваниль'),
(2293, 'вариант'),
(2167, 'вариантами'),
(1979, 'вариантов'),
(2047, 'вариантом'),
(2257, 'варианты'),
(2206, 'варим'),
(2269, 'варки'),
(2229, 'варят'),
(2686, 'вас'),
(2641, 'ваше'),
(1556, 'вводятся'),
(1659, 'ведь'),
(2408, 'весь'),
(2786, 'ветчиной'),
(1664, 'вечера'),
(2708, 'взнос'),
(1817, 'взять'),
(2461, 'виде'),
(2559, 'видите'),
(2342, 'видов'),
(2457, 'видом'),
(2706, 'включая'),
(1851, 'вкус'),
(2135, 'вкуса'),
(2674, 'вкусная'),
(2371, 'вкуснейших'),
(1839, 'вкусно'),
(2522, 'вкусное'),
(2089, 'вкусной'),
(1862, 'вкусную'),
(1860, 'вкусные'),
(1818, 'вкусный'),
(2063, 'вкусных'),
(2009, 'вкусов'),
(2450, 'вкусовыми'),
(1743, 'вкусом'),
(1574, 'вкусу'),
(2636, 'влияние'),
(1701, 'вместе'),
(2399, 'вне'),
(2456, 'внешним'),
(2538, 'вниманию'),
(1612, 'во'),
(2661, 'вода'),
(2362, 'воды'),
(2440, 'воздушности'),
(2529, 'воздушные'),
(2468, 'воздушный'),
(1904, 'возле'),
(1652, 'возможность'),
(1705, 'возрадуются'),
(2385, 'возьмите'),
(2789, 'войти'),
(1914, 'вокзала'),
(1834, 'вокруг'),
(2719, 'вопросам'),
(2504, 'восстановлению'),
(1956, 'востребованы'),
(2108, 'вредной'),
(1577, 'время'),
(2298, 'все'),
(1533, 'всегда'),
(1721, 'всего'),
(1613, 'всех'),
(1681, 'всю'),
(1928, 'всё'),
(1918, 'вход'),
(2050, 'входит'),
(2031, 'входить'),
(2544, 'входят'),
(1716, 'вы'),
(1573, 'выбирай'),
(2099, 'выбор'),
(2720, 'выбора'),
(2062, 'выбором'),
(2198, 'выбору'),
(2290, 'вымывает'),
(1960, 'выпекаются'),
(1552, 'выпечка'),
(2575, 'выпечкой'),
(2022, 'выпечку'),
(2583, 'выполнена'),
(2672, 'выполнены'),
(2170, 'высока'),
(2000, 'высокий'),
(2427, 'высоких'),
(2006, 'высокого'),
(2684, 'выставке'),
(2643, 'высшем'),
(1911, 'выхода'),
(1885, 'г'),
(1758, 'гигант'),
(1757, 'гигинт'),
(2492, 'глицин'),
(2326, 'глотка'),
(2128, 'голод'),
(1660, 'гораздо'),
(2328, 'горьковатого'),
(2677, 'горячему'),
(1762, 'гостей'),
(1510, 'гости'),
(2768, 'гостя'),
(1597, 'гостям'),
(1756, 'гостями'),
(2767, 'гостях'),
(1752, 'готов'),
(2250, 'готовит'),
(2639, 'готовится'),
(2380, 'готовить'),
(2693, 'готовую'),
(2348, 'гуща'),
(1888, 'д'),
(1704, 'да'),
(1796, 'данных'),
(1734, 'два'),
(1633, 'двойной'),
(2085, 'делаем'),
(1593, 'делать'),
(2074, 'делают'),
(2426, 'делаются'),
(1753, 'делиться'),
(1696, 'дело'),
(2325, 'день'),
(2485, 'десерт'),
(2540, 'десерта'),
(2372, 'десертов'),
(2615, 'десертом'),
(1858, 'десерты'),
(2017, 'детских'),
(2729, 'дизайн'),
(1929, 'для'),
(1715, 'дня'),
(2704, 'до'),
(1964, 'добавить'),
(2667, 'добавки'),
(2555, 'добавляют'),
(2156, 'добавок'),
(2608, 'довольны'),
(2695, 'доказавшую'),
(2727, 'документов'),
(2394, 'должна'),
(2524, 'дополнение'),
(2414, 'дополнением'),
(2236, 'дополнения'),
(2027, 'дополнительное'),
(2243, 'дополнить'),
(2392, 'дороге'),
(1665, 'дорогих'),
(2146, 'дорогу'),
(2091, 'доступной'),
(2760, 'доход'),
(2659, 'дрожжи'),
(1972, 'другие'),
(2310, 'других'),
(2618, 'друзьями'),
(1570, 'думай'),
(2280, 'его'),
(1583, 'еда'),
(1547, 'еды'),
(2395, 'ее'),
(2533, 'ежедневно'),
(1732, 'если'),
(1849, 'есть'),
(1745, 'еще'),
(1750, 'ждет'),
(1969, 'же'),
(2487, 'желатина'),
(1859, 'желе'),
(2375, 'живет'),
(2520, 'живыми'),
(1605, 'жизни'),
(2184, 'жителей'),
(1567, 'за'),
(2095, 'забота'),
(2136, 'заботимся'),
(2554, 'заваренной'),
(2249, 'заведений'),
(2192, 'заведения'),
(2424, 'заворачивается'),
(2030, 'завтрак'),
(2388, 'заказ'),
(2158, 'заказа'),
(2736, 'заказами'),
(2475, 'заказать'),
(2462, 'заказывают'),
(2609, 'закуска'),
(2075, 'закуски'),
(2134, 'заменителей'),
(2389, 'запланировали'),
(1737, 'заплатить'),
(2082, 'заправки'),
(2042, 'заправлен'),
(1708, 'запускаем'),
(1727, 'зачем'),
(1561, 'заявку'),
(1905, 'здании'),
(2255, 'здесь'),
(2640, 'здоровая'),
(2114, 'здоровой'),
(2139, 'здоровье'),
(2110, 'здоровья'),
(1983, 'зеленью'),
(2200, 'зерен'),
(2370, 'зернового'),
(2625, 'знаем'),
(2270, 'знакомства'),
(2792, 'знаний'),
(2221, 'знают'),
(1548, 'и'),
(2038, 'играет'),
(2294, 'идеально'),
(2676, 'идеальное'),
(1527, 'из'),
(2438, 'из-за'),
(2553, 'изготавливают'),
(2004, 'изготавливаются'),
(2543, 'изготовляют'),
(2566, 'изделий'),
(1998, 'изделия'),
(2509, 'изысканных'),
(2239, 'или'),
(1951, 'им'),
(2312, 'имеет'),
(1999, 'имеют'),
(2493, 'имеющий'),
(1993, 'ингредиентов'),
(1973, 'ингредиенты'),
(2713, 'индивидуально'),
(2739, 'инструменты'),
(2666, 'искусственные'),
(2133, 'искусственных'),
(2549, 'использованием'),
(2794, 'использованию'),
(2132, 'использования'),
(1990, 'используем'),
(2202, 'используемой'),
(2405, 'используемые'),
(2446, 'используют'),
(2567, 'используются'),
(2233, 'итальянского'),
(2138, 'их'),
(1852, 'к'),
(1811, 'кOфемании'),
(1890, 'каб'),
(1688, 'каждого'),
(1508, 'каждому'),
(2714, 'каждым'),
(2040, 'как'),
(1966, 'какие-либо'),
(2651, 'каких'),
(2153, 'каких-либо'),
(2525, 'какому-либо'),
(2169, 'калорийность'),
(2292, 'кальций'),
(1731, 'капучино'),
(1944, 'карты'),
(1903, 'кафе'),
(2007, 'качества'),
(2163, 'качественные'),
(2230, 'качественный'),
(2635, 'качество'),
(2753, 'кв'),
(2430, 'кексов'),
(2482, 'кексы'),
(2104, 'клиента'),
(1948, 'клиентам'),
(1996, 'клиентами'),
(2137, 'клиентах'),
(2083, 'клиентов'),
(2253, 'клиенты'),
(2214, 'книгу'),
(2679, 'команда'),
(2742, 'команду'),
(1693, 'команды'),
(1588, 'компании'),
(1997, 'кондитерские'),
(2565, 'кондитерских'),
(1968, 'конечно'),
(2718, 'консультации'),
(2648, 'контейнеры'),
(2737, 'контроля'),
(2433, 'корзинки'),
(2572, 'корица'),
(1662, 'коротать'),
(1783, 'корп'),
(2465, 'корпоративы'),
(2496, 'костной'),
(2561, 'которая'),
(1711, 'которого'),
(1963, 'которое'),
(2412, 'которую'),
(1994, 'которые'),
(2207, 'который'),
(1989, 'которых'),
(1526, 'кофе'),
(2025, 'кофеен'),
(2347, 'кофейная'),
(2059, 'кофейне'),
(2743, 'кофейни'),
(2271, 'кофейной'),
(2237, 'кофейные'),
(2613, 'кофейный'),
(1754, 'кофейным'),
(2199, 'кофейных'),
(1669, 'кофейню'),
(2188, 'кофейням'),
(1614, 'кофейнях'),
(1609, 'кофемании'),
(2578, 'красиво'),
(2455, 'красивым'),
(2669, 'красители'),
(2563, 'крашения'),
(2569, 'крема'),
(2528, 'кремовые'),
(2265, 'крепкого'),
(2361, 'кроме'),
(2262, 'кто'),
(2272, 'культурой'),
(1718, 'купить'),
(1937, 'кухни'),
(2445, 'лакомства'),
(1819, 'латте'),
(1856, 'легкие'),
(1953, 'легким'),
(1863, 'легкую'),
(2423, 'лепешки'),
(2610, 'летом'),
(2337, 'либо'),
(1624, 'ликовать'),
(1592, 'любим'),
(1941, 'любимые'),
(1742, 'любимым'),
(2019, 'любите'),
(1622, 'любители'),
(1518, 'любого'),
(1524, 'любой'),
(2368, 'любом'),
(2210, 'любую'),
(1971, 'любые'),
(1628, 'любых'),
(1666, 'людей'),
(1775, 'м'),
(1594, 'маленькие'),
(2530, 'маленький'),
(2355, 'маршмеллоу'),
(2556, 'масло'),
(1853, 'маффин'),
(2448, 'маффины'),
(1747, 'мгновений'),
(2377, 'мегаполиса'),
(2683, 'международной'),
(2751, 'мелочей'),
(1739, 'меньше'),
(1529, 'меню'),
(2014, 'мероприятий'),
(2722, 'места'),
(2758, 'месяцев'),
(1912, 'метро'),
(2516, 'миндального'),
(2532, 'миниатюре'),
(2632, 'минутами'),
(1579, 'минуты'),
(1539, 'мл'),
(2106, 'мнение'),
(1986, 'многие'),
(1942, 'многими'),
(1980, 'многих'),
(1563, 'много'),
(2630, 'могли'),
(1623, 'могут'),
(1643, 'можем'),
(2112, 'может'),
(1717, 'можете'),
(1733, 'можно'),
(2517, 'молока'),
(2234, 'молоко'),
(2288, 'молоком'),
(2317, 'молотый'),
(2180, 'музыкой'),
(2655, 'мука'),
(2428, 'муки'),
(1520, 'мы'),
(2308, 'мыслей'),
(2314, 'мягкий'),
(1952, 'мягким'),
(1950, 'мягкого'),
(2469, 'мякиш'),
(2080, 'мясные'),
(2119, 'мясом'),
(1678, 'н6н66'),
(1615, 'на'),
(1780, 'наб'),
(2067, 'над'),
(1723, 'найдете'),
(1939, 'найти'),
(1792, 'нами'),
(2205, 'напитка'),
(1676, 'напитками'),
(2223, 'напитках'),
(2238, 'напитки'),
(1549, 'напитков'),
(2332, 'напитку'),
(2282, 'напиток'),
(2577, 'нарезка'),
(1879, 'нарезки'),
(1865, 'нарезку'),
(2160, 'нас'),
(2129, 'насладиться'),
(1741, 'наслаждение'),
(2637, 'настроение'),
(2527, 'насыщенные'),
(2447, 'натуральные'),
(2367, 'находит'),
(1694, 'начав'),
(2479, 'начало'),
(2320, 'начать'),
(2015, 'начиная'),
(2116, 'начиненные'),
(2425, 'начинка'),
(2168, 'начинки'),
(2687, 'наш'),
(2148, 'наша'),
(1528, 'нашего'),
(2058, 'нашей'),
(1848, 'нашем'),
(2273, 'наши'),
(1947, 'нашим'),
(1585, 'нашими'),
(1820, 'наших'),
(1564, 'не'),
(1712, 'невозможно'),
(2353, 'него'),
(2754, 'недель'),
(1608, 'неделю'),
(2094, 'недорогой'),
(2193, 'недостаточно'),
(2781, 'некоторых'),
(2508, 'немало'),
(2305, 'немного'),
(2373, 'нему'),
(2299, 'необходимые'),
(2267, 'необычными'),
(2489, 'неотъемлемой'),
(2154, 'неполезных'),
(1746, 'несколько'),
(1985, 'несладкие'),
(1724, 'нигде'),
(2406, 'низкие'),
(2360, 'ничего'),
(2090, 'но'),
(1557, 'новинки'),
(1902, 'нового'),
(1897, 'новой'),
(1586, 'новостями'),
(2212, 'ноутбуком'),
(1855, 'нравятся'),
(2473, 'нужно'),
(1571, 'о'),
(1900, 'об'),
(2283, 'обладает'),
(1794, 'обработку'),
(1581, 'обслуживание'),
(2712, 'обсуждается'),
(2763, 'обучение'),
(1720, 'объемом'),
(1607, 'объявляем'),
(2333, 'объяснена'),
(2189, 'обычного'),
(2117, 'овощами'),
(2079, 'овощи'),
(2057, 'овощных'),
(2340, 'один'),
(2024, 'одной'),
(2647, 'одноразовые'),
(2278, 'ожидания'),
(2177, 'ожидать'),
(2060, 'ознакомиться'),
(2756, 'окупаемости'),
(2041, 'он'),
(2111, 'она'),
(2441, 'они'),
(1810, 'описание'),
(1807, 'описания'),
(2012, 'организацию'),
(2291, 'организма'),
(1967, 'орехи'),
(2591, 'оригинально'),
(2264, 'основе'),
(2052, 'основного'),
(1933, 'основной'),
(2437, 'основном'),
(2435, 'особенно'),
(2451, 'особенностями'),
(2195, 'особым'),
(2607, 'остались'),
(2279, 'остальными'),
(2398, 'осуществить'),
(1641, 'от'),
(2594, 'отдельное'),
(2633, 'отдыха'),
(1798, 'отзыв'),
(1713, 'отказаться'),
(1901, 'открытие'),
(1515, 'открытия'),
(2783, 'отличаться'),
(2449, 'отличаются'),
(2309, 'отличие'),
(2356, 'отличии'),
(2242, 'отлично'),
(2046, 'отличным'),
(2470, 'отменный'),
(2197, 'относятся'),
(2306, 'отойти'),
(1672, 'отправляйтесь'),
(2592, 'оформлены'),
(2611, 'охлажденными'),
(1591, 'очень'),
(2349, 'ощущалась'),
(2601, 'палитре'),
(2121, 'панини'),
(2513, 'панна-котта'),
(2715, 'партнером'),
(2707, 'паушальный'),
(2341, 'первых'),
(2232, 'переводится'),
(2650, 'переживать'),
(2048, 'перекуса'),
(1840, 'перекусить'),
(2258, 'перекусов'),
(2631, 'перекусом'),
(2076, 'перекусы'),
(1728, 'переплачивать'),
(2731, 'персонала'),
(1795, 'персональных'),
(1861, 'пирожные'),
(2539, 'пирожных'),
(2287, 'пить'),
(2662, 'питьевая'),
(2155, 'пищевых'),
(2109, 'пищей'),
(2055, 'пищи'),
(1916, 'платформе'),
(2588, 'плоды'),
(2752, 'площади'),
(1772, 'площадь'),
(1541, 'по'),
(2624, 'поCле'),
(2072, 'повара'),
(2658, 'повидло'),
(1868, 'повидлом'),
(2495, 'повреждения'),
(1649, 'погоду'),
(2458, 'под'),
(2605, 'подана'),
(2404, 'подача'),
(1578, 'подачи'),
(2460, 'подают'),
(2593, 'подаются'),
(2746, 'поддержку'),
(1600, 'поделиться'),
(1806, 'подробного'),
(2260, 'подходит'),
(2196, 'подходом'),
(1913, 'подъезд'),
(2411, 'поездках'),
(2459, 'поездке'),
(2390, 'поездку'),
(2043, 'позволяет'),
(2124, 'позволят'),
(1673, 'позитивными'),
(1755, 'позитивом'),
(2702, 'поинт'),
(2175, 'пока'),
(1751, 'покупателей'),
(2422, 'покупать'),
(2011, 'покупают'),
(1517, 'покупке'),
(2619, 'поле'),
(2488, 'полезен'),
(2671, 'полезную'),
(2321, 'полноценно'),
(2597, 'полоску'),
(1637, 'получаете'),
(1653, 'получить'),
(2225, 'пользуется'),
(1995, 'полюбились'),
(2721, 'помещения'),
(2301, 'помогает'),
(2346, 'помола'),
(2762, 'помощь'),
(2623, 'понравившегося'),
(1827, 'попробовать'),
(2227, 'популярностью'),
(2021, 'популярную'),
(2436, 'популярны'),
(2596, 'популярные'),
(2103, 'порадуют'),
(1546, 'порции'),
(2779, 'порцию'),
(2100, 'посетителей'),
(2606, 'посетители'),
(2638, 'посетителя'),
(2077, 'посетителям'),
(2096, 'посетителях'),
(2573, 'посетить'),
(2505, 'после'),
(2562, 'последующие'),
(1843, 'посмотреть'),
(2738, 'поставками'),
(1625, 'потому'),
(2213, 'почитать'),
(1788, 'почта'),
(2084, 'поэтому'),
(1689, 'появилась'),
(2531, 'праздник'),
(2463, 'праздники'),
(2018, 'праздников'),
(2053, 'практически'),
(1957, 'пределами'),
(1816, 'предлагаем'),
(2699, 'предлагается'),
(2235, 'предлагают'),
(2165, 'предлагаются'),
(1710, 'предложение'),
(1522, 'предложить'),
(2670, 'предоставляем'),
(2263, 'предпочитает'),
(1846, 'представленных'),
(2534, 'представлены'),
(2467, 'представляет'),
(2680, 'представлять'),
(2453, 'представляют'),
(2209, 'преимущества'),
(2285, 'преимуществами'),
(1516, 'при'),
(2579, 'привлекательно'),
(2338, 'приготовив'),
(2150, 'приготовлена'),
(2178, 'приготовление'),
(2664, 'приготовлении'),
(1988, 'приготовления'),
(2130, 'приготовленной'),
(2431, 'приготовленных'),
(2240, 'приготовлены'),
(2351, 'придает'),
(2008, 'придумываем'),
(2054, 'приема'),
(2211, 'прийти'),
(2194, 'приходят'),
(2344, 'причем'),
(1661, 'приятнее'),
(2616, 'приятно'),
(2179, 'приятной'),
(1595, 'приятности'),
(2617, 'провести'),
(1683, 'продажи'),
(2748, 'продвижению'),
(1740, 'продлить'),
(2491, 'продукта'),
(2005, 'продуктов'),
(2164, 'продукты'),
(2560, 'продукции'),
(2149, 'продукция'),
(2726, 'проектных'),
(1838, 'просто'),
(2500, 'против'),
(2071, 'профессиональные'),
(2499, 'профилактики'),
(2277, 'процессе'),
(1974, 'пряные'),
(1915, 'пути'),
(2656, 'пшеничная'),
(2439, 'пышности'),
(2070, 'работают'),
(2393, 'работу'),
(2620, 'работы'),
(2304, 'рабочего'),
(2324, 'рабочий'),
(1640, 'радостно'),
(1603, 'радостным'),
(1521, 'рады'),
(1735, 'раза'),
(1698, 'разделе'),
(2254, 'различного'),
(2032, 'различные'),
(2166, 'различными'),
(2013, 'различных'),
(2512, 'разновидности'),
(2429, 'разновидность'),
(2093, 'разнообразное'),
(2724, 'разработке'),
(2725, 'разрешительных'),
(2547, 'разрыхлители'),
(1513, 'рамках'),
(2044, 'раскрыть'),
(2061, 'располагает'),
(2191, 'расположения'),
(1909, 'расположено'),
(2410, 'распространенная'),
(2275, 'рассказать'),
(2302, 'расслабиться'),
(2750, 'рассчитана'),
(2286, 'рекомендуется'),
(2334, 'рецептами'),
(1554, 'рецептура'),
(2384, 'решение'),
(2391, 'решили'),
(2376, 'ритме'),
(2228, 'родине'),
(1657, 'родных'),
(2415, 'ролл'),
(2402, 'ролла'),
(1850, 'роллы'),
(2037, 'роль'),
(2350, 'рту'),
(1568, 'рублей'),
(2081, 'рыбные'),
(2787, 'рыбой'),
(1601, 'с'),
(1870, 'сайта'),
(2035, 'салат'),
(2144, 'салатами'),
(1844, 'салатов'),
(2118, 'салатом'),
(1842, 'салаты'),
(2409, 'самая'),
(1726, 'сами'),
(2339, 'самостоятельно'),
(2642, 'самочувствие'),
(2535, 'самые'),
(1719, 'самый'),
(2584, 'самым'),
(2546, 'сахар'),
(1551, 'свежая'),
(2574, 'свежей'),
(2241, 'свежеобжареных'),
(2215, 'свежесваренного'),
(2343, 'свежесмолотый'),
(1866, 'свежие'),
(2143, 'свежими'),
(2629, 'свежую'),
(1695, 'свое'),
(2173, 'своего'),
(2358, 'своем'),
(2363, 'своему'),
(1596, 'своим'),
(1656, 'своих'),
(2127, 'свой'),
(2696, 'свою'),
(2322, 'своё'),
(2387, 'сделав'),
(2652, 'сделано'),
(2622, 'сделать'),
(2297, 'себе'),
(1598, 'сегодня'),
(1714, 'сегодняшнего'),
(2185, 'сейчас'),
(2120, 'сендвичи'),
(2678, 'сентября'),
(1576, 'сервис'),
(2073, 'сети'),
(2248, 'сеть'),
(2354, 'сиропы'),
(2735, 'систему'),
(1978, 'сладких'),
(2244, 'сладкое'),
(2419, 'следите'),
(2208, 'следующие'),
(2284, 'следующими'),
(2603, 'следят'),
(2657, 'сливочное'),
(2654, 'слоек'),
(2382, 'сложно'),
(2675, 'слойка'),
(1867, 'слойки'),
(2494, 'случае'),
(2551, 'смеси'),
(1938, 'смогут'),
(2142, 'со'),
(2145, 'собой'),
(1604, 'событием'),
(2187, 'современным'),
(1644, 'согреть'),
(2152, 'содержат'),
(2357, 'содержит'),
(2068, 'созданием'),
(2486, 'сока'),
(2557, 'соль'),
(1685, 'сообщить'),
(2281, 'сортами'),
(2276, 'сортах'),
(2311, 'сортов'),
(2051, 'состав'),
(2359, 'составе'),
(2490, 'составляющей'),
(2204, 'сохранить'),
(1992, 'сочетания'),
(2296, 'сочетая'),
(2589, 'спелые'),
(1975, 'специи'),
(2268, 'способами'),
(2502, 'способствует'),
(2381, 'спринг-роллы'),
(2001, 'спрос'),
(2064, 'сразу'),
(2303, 'среди'),
(2498, 'средством'),
(1730, 'стаканчик'),
(1729, 'стандартный'),
(2653, 'стандартных'),
(2542, 'стандарту'),
(1690, 'стать'),
(2688, 'стенд'),
(2345, 'степень'),
(2796, 'стиля'),
(2365, 'стоимость'),
(2316, 'стоит'),
(2307, 'сторонних'),
(1774, 'стр'),
(1981, 'странах'),
(1537, 'страница'),
(2220, 'страны'),
(2798, 'стратегия'),
(2602, 'строго'),
(2481, 'сути'),
(2510, 'существуют'),
(2066, 'съесть'),
(2417, 'сырами'),
(1814, 'сырники'),
(1984, 'сыром'),
(2454, 'сытную'),
(2386, 'сэнвичи'),
(2416, 'сэндвич'),
(2403, 'сэндвича'),
(2159, 'сэндвичей'),
(1841, 'сэндвичи'),
(2289, 'т'),
(1940, 'так'),
(1982, 'также'),
(2511, 'такие'),
(2564, 'таких'),
(1961, 'такого'),
(2226, 'такой'),
(2331, 'такому'),
(2442, 'тают'),
(1970, 'творог'),
(1987, 'творога'),
(1813, 'творожные'),
(1991, 'те'),
(1804, 'текст'),
(1832, 'текста'),
(2261, 'тем'),
(1686, 'теперь'),
(1616, 'территории'),
(1962, 'теста'),
(1808, 'тестовая'),
(2151, 'тех'),
(2203, 'технике'),
(2626, 'течение'),
(2497, 'ткани'),
(2039, 'то'),
(1642, 'того'),
(2222, 'толк'),
(2088, 'только'),
(2336, 'том'),
(2003, 'тому'),
(1514, 'торжественного'),
(2621, 'точек'),
(2526, 'точке'),
(1898, 'точки'),
(2506, 'травм'),
(1977, 'традиционных'),
(2186, 'требований'),
(2102, 'треугольные'),
(2761, 'тыс'),
(1687, 'у'),
(2634, 'убеждены'),
(2778, 'увеличенную'),
(2252, 'уверены'),
(2507, 'увидеть'),
(1908, 'удобно'),
(2646, 'удобные'),
(1749, 'уже'),
(2029, 'ужин'),
(2335, 'узнать'),
(2771, 'украшения'),
(1770, 'ул'),
(1919, 'улицы'),
(2645, 'упакуем'),
(2747, 'управлению'),
(2733, 'управления'),
(1651, 'упустите'),
(2644, 'уровне'),
(2587, 'условие'),
(2586, 'условием'),
(2126, 'утолить'),
(2323, 'утро'),
(2181, 'уютной'),
(2107, 'фастфуд'),
(2420, 'фигурой'),
(2795, 'фирменного'),
(2711, 'формат'),
(2700, 'форматов'),
(2432, 'форме'),
(2515, 'французский'),
(2692, 'франчайзи'),
(1684, 'франшиз'),
(2581, 'фруктами'),
(2523, 'фруктов'),
(1864, 'фруктовую'),
(1857, 'фруктовые'),
(2614, 'фруктовым'),
(2568, 'фрукты'),
(2016, 'фуршетов'),
(2665, 'химикаты'),
(2400, 'холодильника'),
(1648, 'холодную'),
(1663, 'холодные'),
(2190, 'хорошего'),
(1599, 'хотим'),
(1837, 'хотите'),
(2101, 'хотят'),
(2065, 'хочется'),
(2396, 'хранение'),
(2472, 'хранятся'),
(2521, 'цветами'),
(2600, 'цветовой'),
(2769, 'цезарь-роллы'),
(2782, 'цена'),
(1572, 'цене'),
(2407, 'цены'),
(1924, 'цокольном'),
(2464, 'часто'),
(1691, 'частью'),
(1949, 'чашечке'),
(1646, 'чашечкой'),
(2772, 'чашечку'),
(2122, 'чиабатта'),
(1626, 'что'),
(2369, 'что-то'),
(2086, 'чтобы'),
(2097, 'широкий'),
(1955, 'широко'),
(2570, 'шоколад'),
(2483, 'шоколадные'),
(2770, 'шоколадный'),
(1854, 'шоколадом'),
(2471, 'шоколадый'),
(1887, 'шоссе'),
(2201, 'экономят'),
(1674, 'эмоциями'),
(2266, 'эспрессо'),
(1910, 'этаже'),
(2434, 'эти'),
(1738, 'это'),
(2295, 'этого'),
(2219, 'этой'),
(2251, 'этом'),
(2300, 'этот'),
(2020, 'эту'),
(2697, 'эффективность'),
(2045, 'является'),
(1965, 'ягоды'),
(2550, 'яично-сахарной'),
(2545, 'яйца'),
(2519, 'японское');

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_suggest`
--

CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_tags`
--

CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- --------------------------------------------------------

--
-- Структура таблицы `b_search_user_right`
--

CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_autolog`
--

CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_banner`
--

CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_campaign`
--

CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_group`
--

CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_link`
--

CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_log`
--

CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_order`
--

CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_adv_region`
--

CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_keywords`
--

CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_seo_keywords`
--

INSERT INTO `b_seo_keywords` (`ID`, `SITE_ID`, `URL`, `KEYWORDS`) VALUES
(1, 's1', '/', ''),
(2, 's1', '/menu/', ''),
(3, 's1', '/menu/syrniki-tvorozhnye/', ''),
(4, 's1', '/menu/kofe-latte/', ''),
(5, 's1', '/cafe/', ''),
(6, 's1', '/menu/kofe-kapuchino/', ''),
(7, 's1', '/menu/kofe-amerikano/', ''),
(8, 's1', '/menu/sendvichi-i-salaty/', ''),
(9, 's1', '/menu/salaty-v-assortimente/', ''),
(10, 's1', '/menu/zhele/', ''),
(11, 's1', '/menu/sendvichi-i-rolly/', ''),
(12, 's1', '/menu/pirozhnye-v-assortimente/', ''),
(13, 's1', '/menu/fruktovaya-narezka/', ''),
(14, 's1', '/menu/maffin-s-shokoladom/', ''),
(15, 's1', '/menu/sloyka-s-povidlom/', ''),
(16, 's1', '/franchising/', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_search_engine`
--

CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_seo_search_engine`
--

INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', 'a:2:{s:4:\"AUTH\";a:3:{s:12:\"access_token\";s:131:\"ya29.GlzpBfxymM0a4QB5WckMKrkJJzP1GqCDQ7DDjq6kVx15PTHQRJ-qmOSJv3SUW8rzF76b0E5l2F6sMVLoD0HFUWE1vcq_kGBVNmMcX_JKDDDLAR14cWgP-nGHv_9cMw\";s:13:\"refresh_token\";s:45:\"1/Wa1GnY_Zb6Vj8Ht7c4BAM2BAOTd6EfBfFFyDcMfRKBg\";s:10:\"expires_in\";i:1530318155;}s:9:\"AUTH_USER\";a:6:{s:3:\"sub\";s:21:\"113310428242218846827\";s:4:\"name\";s:61:\"ООО ПитСтоп Кафе ООО ПитСтоп Кафе\";s:10:\"given_name\";s:30:\"ООО ПитСтоп Кафе\";s:11:\"family_name\";s:30:\"ООО ПитСтоп Кафе\";s:7:\"picture\";s:92:\"https://lh6.googleusercontent.com/-kj8Erg4FYE8/AAAAAAAAAAI/AAAAAAAAAAA/TTOl8u7W_Yo/photo.jpg\";s:6:\"locale\";s:2:\"ru\";}}'),
(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', 'a:3:{s:4:\"AUTH\";a:3:{s:12:\"access_token\";s:39:\"AQAAAAAjwtQmAABqh8wOhNK71EvRh92ZzOGs8L8\";s:13:\"refresh_token\";s:94:\"1:zBf-KTUm5zC7pKRL:5gIqqmzVTzNaWn0wCXCghHLGI4ehltDffsnCkMtI3F3umj54UTS1:SyvTxvRVpI-zBMHezlFvNg\";s:10:\"expires_in\";i:1534677738;}s:9:\"AUTH_USER\";a:7:{s:10:\"first_name\";s:30:\"ООО Питстоп кафе\";s:9:\"last_name\";s:30:\"ООО Питстоп кафе\";s:12:\"display_name\";s:12:\"Pitstop-kafe\";s:9:\"real_name\";s:61:\"ООО Питстоп кафе ООО Питстоп кафе\";s:5:\"login\";s:12:\"Pitstop-kafe\";s:3:\"sex\";N;s:2:\"id\";s:9:\"599970854\";}s:5:\"SITES\";a:1:{s:15:\"pitstop-cafe.ru\";s:23:\"http:pitstop-cafe.ru:80\";}}'),
(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_log`
--

CREATE TABLE `b_seo_service_log` (
  `ID` int(11) NOT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_rtg_queue`
--

CREATE TABLE `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ACCOUNT_ID` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_service_webhook`
--

CREATE TABLE `b_seo_service_webhook` (
  `ID` int(11) NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap`
--

CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_entity`
--

CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_iblock`
--

CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_sitemap_runtime`
--

CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_seo_yandex_direct_stat`
--

CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_short_uri`
--

CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_site_template`
--

CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_site_template`
--

INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
(4, 's1', '', 150, 'pitstop');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile`
--

CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile`
--

INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8) 8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_lang`
--

CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile_lang`
--

INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');

-- --------------------------------------------------------

--
-- Структура таблицы `b_smile_set`
--

CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_smile_set`
--

INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_ap`
--

CREATE TABLE `b_socialservices_ap` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact`
--

CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_contact_connect`
--

CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_message`
--

CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user`
--

CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_socialservices_user_link`
--

CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker`
--

CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_sticker_group_task`
--

CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_sticker_group_task`
--

INSERT INTO `b_sticker_group_task` (`GROUP_ID`, `TASK_ID`) VALUES
(5, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `b_task`
--

CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task`
--

INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
(42, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
(43, 'seo_full_access', 'W', 'seo', 'Y', '', 'module'),
(44, 'Контент-редакторы', 'Q', 'main', 'N', 'Разрешено изменять информацию в своем профайле. Управление кешем', 'module');

-- --------------------------------------------------------

--
-- Структура таблицы `b_task_operation`
--

CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_task_operation`
--

INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(13, 38),
(15, 39),
(16, 39),
(16, 40),
(17, 39),
(17, 40),
(17, 41),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(19, 50),
(19, 52),
(19, 53),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(20, 54),
(22, 55),
(23, 55),
(23, 56),
(23, 60),
(24, 55),
(24, 60),
(24, 61),
(24, 62),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 60),
(25, 61),
(25, 62),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(26, 62),
(28, 63),
(29, 63),
(29, 64),
(29, 65),
(29, 66),
(31, 67),
(32, 68),
(32, 69),
(34, 70),
(34, 71),
(35, 72),
(36, 70),
(36, 71),
(36, 73),
(37, 70),
(37, 71),
(37, 72),
(37, 73),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(38, 77),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(39, 81),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(42, 89),
(43, 88),
(43, 89),
(44, 2),
(44, 3),
(44, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `b_undo`
--

CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_undo`
--

INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
('21ccee43381feadfa865200438e0e5aaa', 'main', 'autosave', 'CAutoSave::_Restore', 'a:59:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"ACTIVE_FROM\";s:10:\"05.01.2016\";s:9:\"ACTIVE_TO\";s:0:\"\";s:4:\"NAME\";s:70:\"Открытие новой точки в БЦ Город Столиц\";s:4:\"CODE\";s:0:\"\";s:4:\"SORT\";s:3:\"500\";s:15:\"PREVIEW_PICTURE\";s:3:\"183\";s:21:\"PREVIEW_PICTURE_descr\";s:0:\"\";s:25:\"bxu_filesX000091XX000093X\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:17:\"PREVIEW_TEXT_TYPE\";s:0:\"\";s:12:\"PREVIEW_TEXT\";s:388:\"Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!\";s:14:\"DETAIL_PICTURE\";s:3:\"184\";s:20:\"DETAIL_PICTURE_descr\";s:0:\"\";s:16:\"DETAIL_TEXT_TYPE\";s:0:\"\";s:11:\"DETAIL_TEXT\";s:388:\"Дорогие гости, рады сообщить вам об открытие нового кафе возле м.Выставочная, МоскваСити, в здании БЦ Город Столиц.\nКафе удобно расположено на цокольном этаже башни Санкт-Петербург. Приходите, мы всегда рады Вам!!!\";s:77:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:78:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_TITLEX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:80:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_KEYWORDSX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:81:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_KEYWORDSX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:83:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_DESCRIPTIONX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:84:\"IPROPERTY_TEMPLATESX000091XELEMENT_META_DESCRIPTIONX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:77:\"IPROPERTY_TEMPLATESX000091XELEMENT_PAGE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:78:\"IPROPERTY_TEMPLATESX000091XELEMENT_PAGE_TITLEX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_ALTX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_ALTX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:93:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:94:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_TITLEX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:93:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:89:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XLOWERX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XTRANSLITX000093X\";s:0:\"\";s:89:\"IPROPERTY_TEMPLATESX000091XELEMENT_PREVIEW_PICTURE_FILE_NAMEX000093XX000091XSPACEX000093X\";s:0:\"\";s:90:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_ALTX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_ALTX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_TITLEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:93:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_TITLEX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XTEMPLATEX000093X\";s:0:\"\";s:92:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XINHERITEDX000093X\";s:0:\"\";s:88:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XLOWERX000093X\";s:0:\"\";s:91:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XTRANSLITX000093X\";s:0:\"\";s:88:\"IPROPERTY_TEMPLATESX000091XELEMENT_DETAIL_PICTURE_FILE_NAMEX000093XX000091XSPACEX000093X\";s:0:\"\";s:4:\"TAGS\";s:0:\"\";s:7:\"ck_TAGS\";s:0:\"\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:8:\"dontsave\";s:0:\"\";s:12:\"save_and_add\";s:0:\"\";s:25:\"form_element_1_active_tab\";s:5:\"edit5\";s:20:\"find_section_section\";s:2:\"-1\";s:6:\"filter\";s:1:\"Y\";s:10:\"set_filter\";s:1:\"Y\";s:12:\"linked_state\";s:1:\"N\";s:6:\"Update\";s:1:\"Y\";s:4:\"from\";s:0:\"\";s:2:\"WF\";s:1:\"N\";s:10:\"return_url\";s:0:\"\";s:2:\"ID\";s:2:\"34\";s:17:\"IBLOCK_SECTION_ID\";s:1:\"0\";s:6:\"TMP_ID\";s:1:\"0\";}', 1, 1530408191);

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_metadata`
--

CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL,
  `URL` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_urlpreview_route`
--

CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL,
  `ROUTE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user`
--

CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user`
--

INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`) VALUES
(1, '2018-06-30 21:09:23', 'pitstop_admin', '[t5GH!f8f9a9bd394f32233cccf27a73501b6f0c', 'CFTSKeVU4f1eee65a0c56cfcf033884e0f4859d3', 'Y', '', '', 'totohatta@gmail.com', '2018-07-01 05:13:36', '2018-01-15 02:20:52', 's1', '', '', '', '', NULL, NULL, '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', NULL, '', '', NULL, '', NULL, NULL, '2018-07-01 00:09:23', '', NULL, 0, NULL, '', NULL, NULL, '', NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access`
--

CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access`
--

INSERT INTO `b_user_access` (`USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
(0, 'group', 'G2'),
(1, 'user', 'U1'),
(1, 'group', 'G1'),
(1, 'group', 'G3'),
(1, 'group', 'G4'),
(1, 'group', 'G2');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_access_check`
--

CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_access_check`
--

INSERT INTO `b_user_access_check` (`USER_ID`, `PROVIDER_ID`) VALUES
(1, 'group'),
(1, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_auth_action`
--

CREATE TABLE `b_user_auth_action` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_counter`
--

CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_digest`
--

CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field`
--

CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_confirm`
--

CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_enum`
--

CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_field_lang`
--

CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_group`
--

CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_group`
--

INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_hit_auth`
--

CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_index`
--

CREATE TABLE `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_index`
--

INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
(1, '001', '', '001 gbgbunggn tznvy pbz gbgbunggn@tznvy.pbz cvgfgbc_nqzva', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_option`
--

CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_user_option`
--

INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 0, 'main.interface', 'global', 'a:1:{s:5:\"theme\";s:4:\"gray\";}', 'Y'),
(3, 1, 'admin_panel', 'settings', 'a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:3:\"off\";}', 'N'),
(4, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(5, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(6, 1, 'main', 'helper_hero_admin', 'a:2:{s:4:\"time\";s:10:\"1522838026\";s:4:\"show\";s:1:\"Y\";}', 'N'),
(9, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(11, 1, 'fileman', 'last_pathes', 's:264:\"a:10:{i:0;s:5:\"/news\";i:1;s:12:\"/baza-znaniy\";i:2;s:5:\"/cafe\";i:3;s:8:\"/site_ie\";i:4;s:8:\"/include\";i:5;s:43:\"/bitrix/templates/pitstop/components/bitrix\";i:6;s:17:\"/bitrix/templates\";i:7;s:7:\"/bitrix\";i:8;s:9:\"/site-map\";i:9;s:29:\"/bitrix/templates/pitstop/css\";}\";', 'N'),
(13, 1, 'admin_menu', 'pos', 'a:3:{s:8:\"sections\";s:401:\"highloadblock_tools,iblock_redirect,menu_bitrixcloud,menu_system,menu_iblock_%2Faktsii%2F12,menu_iblock_%2Faktsii%2F13,menu_iblock_/aktsii,menu_iblock_%2Fmenu%2F5,seo_search_engine,menu_site,menu_seo,menu_users,menu_iblock_%2Fservo%2F15,iblock_admin,menu_iblock_%2Ffranchise%2F7,menu_translate,menu_util,menu_fileman,backup,menu_fileman_site_s1_,menu_perfmon,menu_module_settings,menu_fileman_file_s1_\";s:3:\"ver\";s:2:\"on\";s:5:\"width\";s:3:\"447\";}', 'N'),
(19, 1, 'main.interface.grid', 'tbl_iblock_admin_508c75c8507a2ae5223dfd2faeb98122', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(56, 1, 'html_editor', 'type_selector_DETAIL_TEXT1', 'a:1:{s:4:\"type\";s:4:\"text\";}', 'N'),
(136, 1, 'main.interface.grid', 'tbl_iblock_508c75c8507a2ae5223dfd2faeb98122', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(143, 1, 'main.interface.grid', 'tbl_iblock_admin_8d6ab84ca2af9fccd4e4048694176ebf', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(145, 1, 'main.interface.grid', 'tbl_iblock_admin_f4145c86ca60004968b7b2900161d03e', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(149, 1, 'html_editor', 'type_selector_PREVIEW_TEXT5', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(170, 1, 'main.interface.grid', 'tbl_iblock_admin_86024cad1e83101d97359d7351051156', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(175, 1, 'checklist', 'autotest_start', 's:1:\"Y\";', 'N'),
(177, 0, 'checklist', 'autotest_start', 's:1:\"Y\";', 'Y'),
(218, 1, 'main.interface.grid', 'tbl_iblock_admin_2767cc3ede7592a47bd6657e3799565c', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(223, 1, 'main.interface.grid', 'tbl_iblock_admin_0ec7bd10ef5d2c99e7121241f8f12d1f', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(239, 1, 'html_editor', 'type_selector_PREVIEW_TEXT7', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(251, 1, 'main.interface.grid', 'tbl_iblock_admin_d2626f412da748e711ca4f4ae9428664', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(363, 1, 'main.interface.grid', 'tbl_iblock_8d6ab84ca2af9fccd4e4048694176ebf', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(390, 1, 'main.interface.grid', 'tbl_iblock_admin_8eaee5e7db7b6fcf6ec25a8c54ee79a6', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(531, 1, 'html_editor', 'type_selector_MESSAGE', 'a:1:{s:4:\"type\";s:4:\"text\";}', 'N'),
(636, 1, 'main.interface.grid', 'tbl_iblock_0ec7bd10ef5d2c99e7121241f8f12d1f', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(647, 1, 'main.interface.grid', 'tbl_iblock_d2626f412da748e711ca4f4ae9428664', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(655, 1, 'html_editor', 'type_selector_PREVIEW_TEXT1', 'a:1:{s:4:\"type\";s:4:\"text\";}', 'N'),
(657, 1, 'html_editor', 'user_settings_', 'a:5:{s:16:\"link_dialog_type\";s:8:\"internal\";s:4:\"view\";s:4:\"code\";s:14:\"split_vertical\";s:1:\"0\";s:13:\"taskbar_shown\";s:1:\"1\";s:13:\"taskbar_width\";s:3:\"259\";}', 'N'),
(683, 1, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:7:{s:20:\"ADMIN_INFO@333333333\";a:4:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";N;}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:859:\"											 \r\n<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"> \r\n<tbody> \r\n<tr><td class=\"bx-gadget-gray\">Создатель сайта:</td><td><a href=\"https://www.waytostart.ru/\" >https://www.waytostart.ru/</a></td><td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"  /></td></tr>\r\n \r\n<tr><td class=\"bx-gadget-gray\">Адрес сайта:</td><td><a href=\"http://pitstop-cafe.ru\" >http://pitstop-cafe.ru</a></td></tr>\r\n \r\n<tr><td class=\"bx-gadget-gray\">Сайт сдан:</td><td>02 февраля 2018 г.</td></tr>\r\n \r\n<tr><td class=\"bx-gadget-gray\">Ответственное лицо:</td><td>Виктор</td></tr>\r\n \r\n<tr><td class=\"bx-gadget-gray\">E-mail:</td><td><a href=\"totohatta@gmail.com\" >totohatta@gmail.com</a></td></tr>\r\n </tbody>\r\n </table>\r\n <br />\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:4:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";N;}s:25:\"ADMIN_SITESPEED@666666777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";N;}s:23:\"ADMIN_PERFMON@666666666\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";N;}s:19:\"RSSREADER@777777777\";a:5:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}s:8:\"USERDATA\";N;}s:23:\"ADMIN_MARKETPALCE@22549\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";N;}}}}', 'N'),
(741, 1, 'start_menu', 'recent', 'a:5:{i:0;a:4:{s:3:\"url\";s:117:\"/bitrix/admin/iblock_element_admin.php?IBLOCK_ID=5&type=menu&lang=ru&find_el_y=Y&back_url_pub=%2Fmenu%2Fkofe-latte%2F\";s:4:\"text\";s:16:\"Элементы\";s:5:\"title\";s:23:\"Все элементы\";s:4:\"icon\";s:9:\"undefined\";}i:1;a:4:{s:3:\"url\";s:100:\"/bitrix/admin/iblock_element_admin.php?IBLOCK_ID=6&type=gallery&lang=ru&find_el_y=Y&back_url_pub=%2F\";s:4:\"text\";s:16:\"Элементы\";s:5:\"title\";s:23:\"Все элементы\";s:4:\"icon\";s:9:\"undefined\";}i:2;a:4:{s:3:\"url\";s:53:\"/bitrix/admin/user_admin.php?lang=ru&back_url_pub=%2F\";s:4:\"text\";s:39:\"Список пользователей\";s:5:\"title\";s:64:\"Управление пользователями сервера\";s:4:\"icon\";s:9:\"undefined\";}i:3;a:4:{s:3:\"url\";s:98:\"/bitrix/admin/iblock_admin.php?type=menu&lang=ru&admin=N&back_url_pub=%2Fmenu%2F%3Fclear_cache%3DY\";s:4:\"text\";s:8:\"Меню\";s:5:\"title\";s:8:\"Меню\";s:4:\"icon\";s:9:\"undefined\";}i:4;a:4:{s:3:\"url\";s:128:\"/bitrix/admin/iblock_section_admin.php?IBLOCK_ID=5&type=menu&lang=ru&find_section_section=0&back_url_pub=%2Fmenu%2Fkofe-latte%2F\";s:4:\"text\";s:8:\"Меню\";s:5:\"title\";s:8:\"Меню\";s:4:\"icon\";s:9:\"undefined\";}}', 'N'),
(903, 1, 'main.interface.grid', 'tbl_user', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(978, 1, 'edit', 'admin_tabs', 'a:1:{s:10:\"fix_bottom\";s:2:\"on\";}', 'N'),
(1033, 1, 'main.interface.grid', 'tbl_iblock_2767cc3ede7592a47bd6657e3799565c', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(1051, 1, 'main.interface.grid', 'tbl_iblock_admin_4d08831abe3e2098950d89cf731f787d', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(1052, 1, 'html_editor', 'type_selector_DESCRIPTION', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1058, 1, 'main.interface.grid', 'tbl_iblock_4d08831abe3e2098950d89cf731f787d', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(1090, 1, 'edit', 'tabControl_e220f4255271f3565a594ce31f0c25fe', 'a:1:{s:6:\"expand\";s:2:\"on\";}', 'N'),
(1141, 1, 'html_editor', 'type_selector_PREVIEW_TEXT12', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1143, 1, 'html_editor', 'type_selector_DETAIL_TEXT12', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1158, 1, 'bx.windowmanager.9.5', 'options_89ae384549d233849576298c2bd23ec9', 'a:4:{s:3:\"pin\";s:5:\"false\";s:9:\"transform\";s:5:\"false\";s:3:\"top\";s:5:\"false\";s:4:\"left\";s:5:\"false\";}', 'N'),
(1404, 1, 'html_editor', 'type_selector_DETAIL_TEXT14', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1406, 1, 'html_editor', 'type_selector_PREVIEW_TEXT14', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1533, 1, 'bx.windowmanager.9.5', 'options_a913cbea5f4b90b1cf965d94074e5d44', 'a:4:{s:3:\"pin\";s:5:\"false\";s:9:\"transform\";s:5:\"false\";s:3:\"top\";s:5:\"false\";s:4:\"left\";s:5:\"false\";}', 'N'),
(1542, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/public_file_edit_src.php', 'a:2:{s:5:\"width\";s:3:\"961\";s:6:\"height\";s:3:\"437\";}', 'N'),
(1559, 1, 'html_editor', 'type_selector_DETAIL_TEXT5', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1566, 1, 'list', 'tbl_iblock_element_84e17326232461dcdab96d7e3aded2d5', 'a:4:{s:7:\"columns\";s:36:\"NAME,ACTIVE,SORT,TIMESTAMP_X,ID,CODE\";s:2:\"by\";s:11:\"timestamp_x\";s:5:\"order\";s:4:\"desc\";s:9:\"page_size\";s:2:\"20\";}', 'N'),
(1616, 1, 'main', 'fileinput', 'a:2:{s:4:\"mode\";s:9:\"mode-pict\";s:10:\"frameFiles\";s:1:\"Y\";}', 'N'),
(1662, 1, 'fileman', 'file_dialog_config', 's:35:\"s1;/upload/iblock/fc7;list;type;asc\";', 'N'),
(1665, 1, 'edit', 'seoSitemapTabControl_6783898d5eddf32883ced5c979dc199f', 'a:1:{s:6:\"expand\";s:2:\"on\";}', 'N'),
(1673, 1, 'html_editor', 'type_selector_DETAIL_TEXT6', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1676, 1, 'main.ui.filter', 'tbl_iblock_8d6ab84ca2af9fccd4e4048694176ebf', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:4:{s:4:\"name\";s:12:\"Фильтр\";s:6:\"fields\";a:1:{s:4:\"NAME\";s:0:\"\";}s:10:\"additional\";a:0:{}s:11:\"filter_rows\";s:4:\"NAME\";}}}', 'N'),
(1733, 1, 'fileman', 'medialib_def_type', 's:1:\"1\";', 'N'),
(1790, 1, 'bx.windowmanager.9.5', 'options_5ceb5619ac6ac5563c8edf3856cbc0a7', 'a:4:{s:3:\"pin\";s:5:\"false\";s:9:\"transform\";s:5:\"false\";s:3:\"top\";s:5:\"false\";s:4:\"left\";s:5:\"false\";}', 'N'),
(1839, 1, 'main.interface.grid', 'tbl_iblock_admin_ea99a69060675b32075406b9f310cbf9', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(1844, 1, 'form', 'form_element_15', 'a:1:{s:4:\"tabs\";s:202:\"edit1--#--Элемент--,--ID--#--ID--,--SORT--#--Сортировка--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--PREVIEW_TEXT--#--Описание для анонса--;--\";}', 'N'),
(1853, 1, 'html_editor', 'type_selector_PREVIEW_TEXT15', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(1865, 1, 'main.interface.grid', 'tbl_iblock_ea99a69060675b32075406b9f310cbf9', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:2:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(2040, 1, 'fileman', 'file_copy_move_config', 's:61:\"a:2:{s:7:\"advMode\";b:1;s:10:\"caseOption\";s:11:\"auto_rename\";}\";', 'N'),
(2227, 1, 'access_dialog_recent', 'other', 'a:1:{i:0;s:2:\"AU\";}', 'N');

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `b_xml_tree`
--

CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `b_xml_tree`
--

INSERT INTO `b_xml_tree` (`ID`, `PARENT_ID`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `NAME`, `VALUE`, `ATTRIBUTES`) VALUES
(1, 0, 1, 320, 0, 'КоммерческаяИнформация', NULL, 'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2010-06-22T12:53:42\";}'),
(2, 1, 2, 67, 1, 'Классификатор', NULL, NULL),
(3, 2, 3, 4, 2, 'Ид', '2', NULL),
(4, 2, 5, 6, 2, 'Наименование', 'Вакансии', NULL),
(5, 2, 7, 64, 2, 'Свойства', NULL, NULL),
(6, 5, 8, 15, 3, 'Свойство', NULL, NULL),
(7, 6, 9, 10, 4, 'Ид', 'CML2_ACTIVE', NULL),
(8, 6, 11, 12, 4, 'Наименование', 'БитриксАктивность', NULL),
(9, 6, 13, 14, 4, 'Множественное', 'false', NULL),
(10, 5, 16, 23, 3, 'Свойство', NULL, NULL),
(11, 10, 17, 18, 4, 'Ид', 'CML2_CODE', NULL),
(12, 10, 19, 20, 4, 'Наименование', 'Символьный код', NULL),
(13, 10, 21, 22, 4, 'Множественное', 'false', NULL),
(14, 5, 24, 31, 3, 'Свойство', NULL, NULL),
(15, 14, 25, 26, 4, 'Ид', 'CML2_SORT', NULL),
(16, 14, 27, 28, 4, 'Наименование', 'Сортировка', NULL),
(17, 14, 29, 30, 4, 'Множественное', 'false', NULL),
(18, 5, 32, 39, 3, 'Свойство', NULL, NULL),
(19, 18, 33, 34, 4, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(20, 18, 35, 36, 4, 'Наименование', 'Начало активности', NULL),
(21, 18, 37, 38, 4, 'Множественное', 'false', NULL),
(22, 5, 40, 47, 3, 'Свойство', NULL, NULL),
(23, 22, 41, 42, 4, 'Ид', 'CML2_ACTIVE_TO', NULL),
(24, 22, 43, 44, 4, 'Наименование', 'Окончание активности', NULL),
(25, 22, 45, 46, 4, 'Множественное', 'false', NULL),
(26, 5, 48, 55, 3, 'Свойство', NULL, NULL),
(27, 26, 49, 50, 4, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(28, 26, 51, 52, 4, 'Наименование', 'Анонс', NULL),
(29, 26, 53, 54, 4, 'Множественное', 'false', NULL),
(30, 5, 56, 63, 3, 'Свойство', NULL, NULL),
(31, 30, 57, 58, 4, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(32, 30, 59, 60, 4, 'Наименование', 'Картинка анонса', NULL),
(33, 30, 61, 62, 4, 'Множественное', 'false', NULL),
(34, 2, 65, 66, 2, 'Группы', NULL, NULL),
(35, 1, 68, 319, 1, 'Каталог', NULL, NULL),
(36, 35, 69, 70, 2, 'Ид', 'furniture_vacancies', NULL),
(37, 35, 71, 72, 2, 'ИдКлассификатора', '2', NULL),
(38, 35, 73, 74, 2, 'Наименование', 'Вакансии', NULL),
(39, 35, 75, 76, 2, 'БитриксКод', 'furniture_vacancies', NULL),
(40, 35, 77, 78, 2, 'БитриксСортировка', '500', NULL),
(41, 35, 79, 80, 2, 'БитриксURLСписок', '#SITE_DIR#/company/vacancies.php', NULL),
(42, 35, 81, 82, 2, 'БитриксURLДеталь', '#SITE_DIR#/company/vacancies.php##ID#', NULL),
(43, 35, 83, 84, 2, 'БитриксURLРаздел', NULL, NULL),
(44, 35, 85, 86, 2, 'БитриксКартинка', NULL, NULL),
(45, 35, 87, 88, 2, 'БитриксИндексироватьЭлементы', 'true', NULL),
(46, 35, 89, 90, 2, 'БитриксИндексироватьРазделы', 'false', NULL),
(47, 35, 91, 92, 2, 'БитриксДокументооборот', 'false', NULL),
(48, 35, 93, 154, 2, 'БитриксПодписи', NULL, NULL),
(49, 48, 94, 99, 3, 'БитриксПодпись', NULL, NULL),
(50, 49, 95, 96, 4, 'Ид', 'ELEMENT_NAME', NULL),
(51, 49, 97, 98, 4, 'Значение', 'Вакансия', NULL),
(52, 48, 100, 105, 3, 'БитриксПодпись', NULL, NULL),
(53, 52, 101, 102, 4, 'Ид', 'ELEMENTS_NAME', NULL),
(54, 52, 103, 104, 4, 'Значение', 'Вакансии', NULL),
(55, 48, 106, 111, 3, 'БитриксПодпись', NULL, NULL),
(56, 55, 107, 108, 4, 'Ид', 'ELEMENT_ADD', NULL),
(57, 55, 109, 110, 4, 'Значение', 'Добавить вакансию', NULL),
(58, 48, 112, 117, 3, 'БитриксПодпись', NULL, NULL),
(59, 58, 113, 114, 4, 'Ид', 'ELEMENT_EDIT', NULL),
(60, 58, 115, 116, 4, 'Значение', 'Изменить вакансию', NULL),
(61, 48, 118, 123, 3, 'БитриксПодпись', NULL, NULL),
(62, 61, 119, 120, 4, 'Ид', 'ELEMENT_DELETE', NULL),
(63, 61, 121, 122, 4, 'Значение', 'Удалить вакансию', NULL),
(64, 48, 124, 129, 3, 'БитриксПодпись', NULL, NULL),
(65, 64, 125, 126, 4, 'Ид', 'SECTION_NAME', NULL),
(66, 64, 127, 128, 4, 'Значение', 'Раздел', NULL),
(67, 48, 130, 135, 3, 'БитриксПодпись', NULL, NULL),
(68, 67, 131, 132, 4, 'Ид', 'SECTIONS_NAME', NULL),
(69, 67, 133, 134, 4, 'Значение', 'Разделы', NULL),
(70, 48, 136, 141, 3, 'БитриксПодпись', NULL, NULL),
(71, 70, 137, 138, 4, 'Ид', 'SECTION_ADD', NULL),
(72, 70, 139, 140, 4, 'Значение', 'Добавить раздел', NULL),
(73, 48, 142, 147, 3, 'БитриксПодпись', NULL, NULL),
(74, 73, 143, 144, 4, 'Ид', 'SECTION_EDIT', NULL),
(75, 73, 145, 146, 4, 'Значение', 'Изменить раздел', NULL),
(76, 48, 148, 153, 3, 'БитриксПодпись', NULL, NULL),
(77, 76, 149, 150, 4, 'Ид', 'SECTION_DELETE', NULL),
(78, 76, 151, 152, 4, 'Значение', 'Удалить раздел', NULL),
(79, 35, 155, 318, 2, 'Товары', NULL, NULL),
(80, 79, 156, 209, 3, 'Товар', NULL, NULL),
(81, 80, 157, 158, 4, 'Ид', '2', NULL),
(82, 80, 159, 160, 4, 'Наименование', 'Продавец-дизайнер (кухни)', NULL),
(83, 80, 161, 162, 4, 'БитриксТеги', NULL, NULL),
(84, 80, 163, 164, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Уверенный пользователь ПК, навыки черчения от руки и в программах, опыт работы дизайнером/конструктором в мебельной сфере, этика делового общения</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Консультирование клиентов по кухонной мебели, оставление художественно-конструкторских проектов, прием и оформление заказов.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Зарплата: 13500 оклад + % от личных продаж + премии‚ совокупный доход от 20000 руб,полный соц. пакет‚ оформление согласно ТК РФ</p>\r\n ', NULL),
(85, 80, 165, 208, 4, 'ЗначенияСвойств', NULL, NULL),
(86, 85, 166, 171, 5, 'ЗначенияСвойства', NULL, NULL),
(87, 86, 167, 168, 6, 'Ид', 'CML2_ACTIVE', NULL),
(88, 86, 169, 170, 6, 'Значение', 'true', NULL),
(89, 85, 172, 177, 5, 'ЗначенияСвойства', NULL, NULL),
(90, 89, 173, 174, 6, 'Ид', 'CML2_CODE', NULL),
(91, 89, 175, 176, 6, 'Значение', NULL, NULL),
(92, 85, 178, 183, 5, 'ЗначенияСвойства', NULL, NULL),
(93, 92, 179, 180, 6, 'Ид', 'CML2_SORT', NULL),
(94, 92, 181, 182, 6, 'Значение', '200', NULL),
(95, 85, 184, 189, 5, 'ЗначенияСвойства', NULL, NULL),
(96, 95, 185, 186, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(97, 95, 187, 188, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(98, 85, 190, 195, 5, 'ЗначенияСвойства', NULL, NULL),
(99, 98, 191, 192, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(100, 98, 193, 194, 6, 'Значение', NULL, NULL),
(101, 85, 196, 201, 5, 'ЗначенияСвойства', NULL, NULL),
(102, 101, 197, 198, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(103, 101, 199, 200, 6, 'Значение', NULL, NULL),
(104, 85, 202, 207, 5, 'ЗначенияСвойства', NULL, NULL),
(105, 104, 203, 204, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(106, 104, 205, 206, 6, 'Значение', NULL, NULL),
(107, 79, 210, 263, 3, 'Товар', NULL, NULL),
(108, 107, 211, 212, 4, 'Ид', '3', NULL),
(109, 107, 213, 214, 4, 'Наименование', 'Директор магазина', NULL),
(110, 107, 215, 216, 4, 'БитриксТеги', NULL, NULL),
(111, 107, 217, 218, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Высшее образование‚ опыт руководящей работы в рознице от 3 лет‚ опытный пользователь ПК‚ этика делового общения‚ знание методов управления и заключения договоров‚ отличное знание торгового и трудового законодательств‚ ответственность‚ инициативность‚ активность.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Руководство деятельностью магазина‚ организация эффективной работы персонала магазина‚ финансово-хозяйственная деятельность и отчетность‚ выполнение плана продаж‚ отчетность.</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>Трудоустройство по ТК РФ‚ полный соц. пакет‚ график работы 5 чере 2 (168 час/мес)‚ зарплата: оклад 28000 + % от оборота + премии‚ совокупный доход от 35000 руб</p>\r\n ', NULL),
(112, 107, 219, 262, 4, 'ЗначенияСвойств', NULL, NULL),
(113, 112, 220, 225, 5, 'ЗначенияСвойства', NULL, NULL),
(114, 113, 221, 222, 6, 'Ид', 'CML2_ACTIVE', NULL),
(115, 113, 223, 224, 6, 'Значение', 'true', NULL),
(116, 112, 226, 231, 5, 'ЗначенияСвойства', NULL, NULL),
(117, 116, 227, 228, 6, 'Ид', 'CML2_CODE', NULL),
(118, 116, 229, 230, 6, 'Значение', NULL, NULL),
(119, 112, 232, 237, 5, 'ЗначенияСвойства', NULL, NULL),
(120, 119, 233, 234, 6, 'Ид', 'CML2_SORT', NULL),
(121, 119, 235, 236, 6, 'Значение', '300', NULL),
(122, 112, 238, 243, 5, 'ЗначенияСвойства', NULL, NULL),
(123, 122, 239, 240, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(124, 122, 241, 242, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(125, 112, 244, 249, 5, 'ЗначенияСвойства', NULL, NULL),
(126, 125, 245, 246, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(127, 125, 247, 248, 6, 'Значение', NULL, NULL),
(128, 112, 250, 255, 5, 'ЗначенияСвойства', NULL, NULL),
(129, 128, 251, 252, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(130, 128, 253, 254, 6, 'Значение', NULL, NULL),
(131, 112, 256, 261, 5, 'ЗначенияСвойства', NULL, NULL),
(132, 131, 257, 258, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(133, 131, 259, 260, 6, 'Значение', NULL, NULL),
(134, 79, 264, 317, 3, 'Товар', NULL, NULL),
(135, 134, 265, 266, 4, 'Ид', '4', NULL),
(136, 134, 267, 268, 4, 'Наименование', 'Бухгалтер отдела учета готовой продукции', NULL),
(137, 134, 269, 270, 4, 'БитриксТеги', NULL, NULL),
(138, 134, 271, 272, 4, 'Описание', '<b>Требования</b> 						 						 \r\n<p>Жен., 22-45, уверенный пользователь ПК, опыт работы бухгалтером приветсвуется, знание бухгалтерского учета (базовый уровень), самостоятельность, ответственность, коммуникабельность, быстрая обучаемость, желание работать.</p>\r\n 						 						<b>Обязанности</b> 						 \r\n<p>Работа с первичными документами по учету МПЗ Ведение журналов-ордеров по производственным счетам Формирование материальных отчетов подразделений Исполнение дополнительных функций по указанию руководителя</p>\r\n 						 						<b>Условия</b> 						 \r\n<p>График работы 5 дней в неделю, адрес работы г. Шатура, Ботинский пр-д, 37. Зарплата: оклад 10 800 р. + премия 40% от оклада, полный соц. пакет.</p>\r\n ', NULL),
(139, 134, 273, 316, 4, 'ЗначенияСвойств', NULL, NULL),
(140, 139, 274, 279, 5, 'ЗначенияСвойства', NULL, NULL),
(141, 140, 275, 276, 6, 'Ид', 'CML2_ACTIVE', NULL),
(142, 140, 277, 278, 6, 'Значение', 'true', NULL),
(143, 139, 280, 285, 5, 'ЗначенияСвойства', NULL, NULL),
(144, 143, 281, 282, 6, 'Ид', 'CML2_CODE', NULL),
(145, 143, 283, 284, 6, 'Значение', NULL, NULL),
(146, 139, 286, 291, 5, 'ЗначенияСвойства', NULL, NULL),
(147, 146, 287, 288, 6, 'Ид', 'CML2_SORT', NULL),
(148, 146, 289, 290, 6, 'Значение', '400', NULL),
(149, 139, 292, 297, 5, 'ЗначенияСвойства', NULL, NULL),
(150, 149, 293, 294, 6, 'Ид', 'CML2_ACTIVE_FROM', NULL),
(151, 149, 295, 296, 6, 'Значение', '2010-05-01 00:00:00', NULL),
(152, 139, 298, 303, 5, 'ЗначенияСвойства', NULL, NULL),
(153, 152, 299, 300, 6, 'Ид', 'CML2_ACTIVE_TO', NULL),
(154, 152, 301, 302, 6, 'Значение', NULL, NULL),
(155, 139, 304, 309, 5, 'ЗначенияСвойства', NULL, NULL),
(156, 155, 305, 306, 6, 'Ид', 'CML2_PREVIEW_TEXT', NULL),
(157, 155, 307, 308, 6, 'Значение', NULL, NULL),
(158, 139, 310, 315, 5, 'ЗначенияСвойства', NULL, NULL),
(159, 158, 311, 312, 6, 'Ид', 'CML2_PREVIEW_PICTURE', NULL),
(160, 158, 313, 314, 6, 'Значение', NULL, NULL),
(161, 0, 30, 0, 0, '', NULL, NULL),
(162, 0, 31, 0, 0, '', NULL, NULL),
(163, 0, 32, 0, 0, '', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_AD_TAG` (`TAG`);

--
-- Индексы таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  ADD KEY `IX_ADM_NTFY_LID` (`LID`);

--
-- Индексы таблицы `b_agent`
--
ALTER TABLE `b_agent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  ADD KEY `ix_agent_user_id` (`USER_ID`);

--
-- Индексы таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_app_password_user` (`USER_ID`);

--
-- Индексы таблицы `b_b24connector_buttons`
--
ALTER TABLE `b_b24connector_buttons`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_bitrixcloud_option_1` (`NAME`);

--
-- Индексы таблицы `b_cache_tag`
--
ALTER TABLE `b_cache_tag`
  ADD KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  ADD KEY `ix_b_cache_tag_1` (`TAG`);

--
-- Индексы таблицы `b_captcha`
--
ALTER TABLE `b_captcha`
  ADD UNIQUE KEY `UX_B_CAPTCHA` (`ID`);

--
-- Индексы таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  ADD KEY `ix_b_file_resize_file` (`FILE_ID`);

--
-- Индексы таблицы `b_clouds_file_upload`
--
ALTER TABLE `b_clouds_file_upload`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  ADD KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  ADD KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`);

--
-- Индексы таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  ADD KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  ADD KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`);

--
-- Индексы таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  ADD KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  ADD KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`);

--
-- Индексы таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`);

--
-- Индексы таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`);

--
-- Индексы таблицы `b_counter_data`
--
ALTER TABLE `b_counter_data`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_culture`
--
ALTER TABLE `b_culture`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_event`
--
ALTER TABLE `b_event`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_success` (`SUCCESS_EXEC`),
  ADD KEY `ix_b_event_date_exec` (`DATE_EXEC`);

--
-- Индексы таблицы `b_event_attachment`
--
ALTER TABLE `b_event_attachment`
  ADD PRIMARY KEY (`EVENT_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  ADD KEY `ix_b_event_log_audit_type` (`AUDIT_TYPE_ID`);

--
-- Индексы таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_event_message_name` (`EVENT_NAME`(50));

--
-- Индексы таблицы `b_event_message_attachment`
--
ALTER TABLE `b_event_message_attachment`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`);

--
-- Индексы таблицы `b_event_message_site`
--
ALTER TABLE `b_event_message_site`
  ADD PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`);

--
-- Индексы таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_file`
--
ALTER TABLE `b_file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`);

--
-- Индексы таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_filters`
--
ALTER TABLE `b_filters`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_finder_dest`
--
ALTER TABLE `b_finder_dest`
  ADD PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  ADD KEY `IX_FINDER_DEST` (`CODE_TYPE`);

--
-- Индексы таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group`
--
ALTER TABLE `b_group`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_collection_task`
--
ALTER TABLE `b_group_collection_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_group_subordinate`
--
ALTER TABLE `b_group_subordinate`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_group_task`
--
ALTER TABLE `b_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  ADD KEY `ix_hot_keys_code` (`CODE_ID`),
  ADD KEY `ix_hot_keys_user` (`USER_ID`);

--
-- Индексы таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  ADD KEY `ix_hot_keys_code_url` (`URL`);

--
-- Индексы таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`);

--
-- Индексы таблицы `b_iblock_cache`
--
ALTER TABLE `b_iblock_cache`
  ADD PRIMARY KEY (`CACHE_KEY`);

--
-- Индексы таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  ADD KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_element_iprop`
--
ALTER TABLE `b_iblock_element_iprop`
  ADD PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_element_lock`
--
ALTER TABLE `b_iblock_element_lock`
  ADD PRIMARY KEY (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  ADD KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`);

--
-- Индексы таблицы `b_iblock_element_right`
--
ALTER TABLE `b_iblock_element_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_fields`
--
ALTER TABLE `b_iblock_fields`
  ADD PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`);

--
-- Индексы таблицы `b_iblock_group`
--
ALTER TABLE `b_iblock_group`
  ADD UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`);

--
-- Индексы таблицы `b_iblock_iblock_iprop`
--
ALTER TABLE `b_iblock_iblock_iprop`
  ADD PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`);

--
-- Индексы таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`);

--
-- Индексы таблицы `b_iblock_messages`
--
ALTER TABLE `b_iblock_messages`
  ADD PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`);

--
-- Индексы таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  ADD KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  ADD KEY `ix_iblock_property_2` (`CODE`);

--
-- Индексы таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`);

--
-- Индексы таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  ADD KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  ADD KEY `ix_b_iblock_right_task_id` (`TASK_ID`);

--
-- Индексы таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  ADD KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  ADD KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  ADD KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  ADD KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_section_element`
--
ALTER TABLE `b_iblock_section_element`
  ADD UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  ADD KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`);

--
-- Индексы таблицы `b_iblock_section_iprop`
--
ALTER TABLE `b_iblock_section_iprop`
  ADD PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  ADD KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`);

--
-- Индексы таблицы `b_iblock_section_property`
--
ALTER TABLE `b_iblock_section_property`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  ADD KEY `ix_b_iblock_section_property_2` (`SECTION_ID`);

--
-- Индексы таблицы `b_iblock_section_right`
--
ALTER TABLE `b_iblock_section_right`
  ADD PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  ADD KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  ADD KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`);

--
-- Индексы таблицы `b_iblock_sequence`
--
ALTER TABLE `b_iblock_sequence`
  ADD PRIMARY KEY (`IBLOCK_ID`,`CODE`);

--
-- Индексы таблицы `b_iblock_site`
--
ALTER TABLE `b_iblock_site`
  ADD PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_iblock_type`
--
ALTER TABLE `b_iblock_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_lang`
--
ALTER TABLE `b_lang`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_language`
--
ALTER TABLE `b_language`
  ADD PRIMARY KEY (`LID`);

--
-- Индексы таблицы `b_lang_domain`
--
ALTER TABLE `b_lang_domain`
  ADD PRIMARY KEY (`LID`,`DOMAIN`);

--
-- Индексы таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_collection_item`
--
ALTER TABLE `b_medialib_collection_item`
  ADD PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`);

--
-- Индексы таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module`
--
ALTER TABLE `b_module`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20));

--
-- Индексы таблицы `b_operation`
--
ALTER TABLE `b_operation`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_option`
--
ALTER TABLE `b_option`
  ADD UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  ADD KEY `ix_option_name` (`NAME`);

--
-- Индексы таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`);

--
-- Индексы таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_ERROR_0` (`HIT_ID`);

--
-- Индексы таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_HIT_0` (`DATE_HIT`);

--
-- Индексы таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`);

--
-- Индексы таблицы `b_perf_index_suggest_sql`
--
ALTER TABLE `b_perf_index_suggest_sql`
  ADD PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  ADD KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`);

--
-- Индексы таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  ADD KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`);

--
-- Индексы таблицы `b_perf_sql_backtrace`
--
ALTER TABLE `b_perf_sql_backtrace`
  ADD PRIMARY KEY (`SQL_ID`,`NN`);

--
-- Индексы таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`);

--
-- Индексы таблицы `b_perf_tab_stat`
--
ALTER TABLE `b_perf_tab_stat`
  ADD PRIMARY KEY (`TABLE_NAME`);

--
-- Индексы таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`);

--
-- Индексы таблицы `b_rating`
--
ALTER TABLE `b_rating`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`);

--
-- Индексы таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  ADD KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  ADD KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`);

--
-- Индексы таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  ADD KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  ADD KEY `IX_B_RAT_USER_2` (`ENTITY_ID`);

--
-- Индексы таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  ADD KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  ADD KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  ADD KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  ADD KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`);

--
-- Индексы таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RATING_ID` (`GROUP_ID`,`TYPE`);

--
-- Индексы таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  ADD KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`);

--
-- Индексы таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`);

--
-- Индексы таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  ADD KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  ADD KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`);

--
-- Индексы таблицы `b_search_content_freq`
--
ALTER TABLE `b_search_content_freq`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_param`
--
ALTER TABLE `b_search_content_param`
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  ADD KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_right`
--
ALTER TABLE `b_search_content_right`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_search_content_site`
--
ALTER TABLE `b_search_content_site`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`);

--
-- Индексы таблицы `b_search_content_stem`
--
ALTER TABLE `b_search_content_stem`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  ADD KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_text`
--
ALTER TABLE `b_search_content_text`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_content_title`
--
ALTER TABLE `b_search_content_title`
  ADD UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  ADD KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`);

--
-- Индексы таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`);

--
-- Индексы таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  ADD KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`);

--
-- Индексы таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  ADD KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_search_tags`
--
ALTER TABLE `b_search_tags`
  ADD PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  ADD KEY `IX_B_SEARCH_TAGS_0` (`NAME`);

--
-- Индексы таблицы `b_search_user_right`
--
ALTER TABLE `b_search_user_right`
  ADD UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`);

--
-- Индексы таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  ADD KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`);

--
-- Индексы таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`);

--
-- Индексы таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_seo_adv_link`
--
ALTER TABLE `b_seo_adv_link`
  ADD PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`);

--
-- Индексы таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  ADD KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  ADD KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`);

--
-- Индексы таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  ADD KEY `ix_b_seo_adv_region1` (`PARENT_ID`);

--
-- Индексы таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`);

--
-- Индексы таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`);

--
-- Индексы таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  ADD KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`);

--
-- Индексы таблицы `b_seo_service_webhook`
--
ALTER TABLE `b_seo_service_webhook`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`);

--
-- Индексы таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  ADD KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  ADD KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`);

--
-- Индексы таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`);

--
-- Индексы таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  ADD KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`);

--
-- Индексы таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  ADD KEY `ux_b_short_uri_2` (`URI_CRC`);

--
-- Индексы таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_site_template_site` (`SITE_ID`);

--
-- Индексы таблицы `b_smile`
--
ALTER TABLE `b_smile`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`);

--
-- Индексы таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`);

--
-- Индексы таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact1` (`USER_ID`),
  ADD KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  ADD KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  ADD KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  ADD KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`);

--
-- Индексы таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  ADD KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`);

--
-- Индексы таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  ADD KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  ADD KEY `ix_b_socialservices_user_link_7` (`LINK_UID`);

--
-- Индексы таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_sticker_group_task`
--
ALTER TABLE `b_sticker_group_task`
  ADD PRIMARY KEY (`GROUP_ID`,`TASK_ID`);

--
-- Индексы таблицы `b_task`
--
ALTER TABLE `b_task`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`);

--
-- Индексы таблицы `b_task_operation`
--
ALTER TABLE `b_task_operation`
  ADD PRIMARY KEY (`TASK_ID`,`OPERATION_ID`);

--
-- Индексы таблицы `b_undo`
--
ALTER TABLE `b_undo`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_URLPREVIEW_METADATA_URL` (`URL`);

--
-- Индексы таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`);

--
-- Индексы таблицы `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  ADD KEY `ix_b_user_email` (`EMAIL`),
  ADD KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  ADD KEY `IX_B_USER_XML_ID` (`XML_ID`);

--
-- Индексы таблицы `b_user_access`
--
ALTER TABLE `b_user_access`
  ADD KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  ADD KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  ADD KEY `ix_ua_access` (`ACCESS_CODE`);

--
-- Индексы таблицы `b_user_access_check`
--
ALTER TABLE `b_user_access_check`
  ADD KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`);

--
-- Индексы таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  ADD KEY `ix_auth_action_date` (`ACTION_DATE`);

--
-- Индексы таблицы `b_user_counter`
--
ALTER TABLE `b_user_counter`
  ADD PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  ADD KEY `ix_buc_tag` (`TAG`),
  ADD KEY `ix_buc_code` (`CODE`),
  ADD KEY `ix_buc_ts` (`TIMESTAMP_X`),
  ADD KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`);

--
-- Индексы таблицы `b_user_digest`
--
ALTER TABLE `b_user_digest`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`);

--
-- Индексы таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`);

--
-- Индексы таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`);

--
-- Индексы таблицы `b_user_field_lang`
--
ALTER TABLE `b_user_field_lang`
  ADD PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`);

--
-- Индексы таблицы `b_user_group`
--
ALTER TABLE `b_user_group`
  ADD UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  ADD KEY `ix_user_group_group` (`GROUP_ID`);

--
-- Индексы таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  ADD KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  ADD KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`);

--
-- Индексы таблицы `b_user_index`
--
ALTER TABLE `b_user_index`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Индексы таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`);

--
-- Индексы таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ux_user_hash` (`USER_ID`);

--
-- Индексы таблицы `b_xml_tree`
--
ALTER TABLE `b_xml_tree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  ADD KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `b_admin_notify`
--
ALTER TABLE `b_admin_notify`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT для таблицы `b_admin_notify_lang`
--
ALTER TABLE `b_admin_notify_lang`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `b_agent`
--
ALTER TABLE `b_agent`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT для таблицы `b_app_password`
--
ALTER TABLE `b_app_password`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_bitrixcloud_option`
--
ALTER TABLE `b_bitrixcloud_option`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `b_checklist`
--
ALTER TABLE `b_checklist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_bucket`
--
ALTER TABLE `b_clouds_file_bucket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_clouds_file_resize`
--
ALTER TABLE `b_clouds_file_resize`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_component_params`
--
ALTER TABLE `b_component_params`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- AUTO_INCREMENT для таблицы `b_composite_log`
--
ALTER TABLE `b_composite_log`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_composite_page`
--
ALTER TABLE `b_composite_page`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_agreement`
--
ALTER TABLE `b_consent_agreement`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_field`
--
ALTER TABLE `b_consent_field`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_consent_user_consent`
--
ALTER TABLE `b_consent_user_consent`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_culture`
--
ALTER TABLE `b_culture`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_event`
--
ALTER TABLE `b_event`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_event_log`
--
ALTER TABLE `b_event_log`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- AUTO_INCREMENT для таблицы `b_event_message`
--
ALTER TABLE `b_event_message`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `b_event_type`
--
ALTER TABLE `b_event_type`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `b_favorite`
--
ALTER TABLE `b_favorite`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_file`
--
ALTER TABLE `b_file`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT для таблицы `b_file_search`
--
ALTER TABLE `b_file_search`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_filters`
--
ALTER TABLE `b_filters`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_geoip_handlers`
--
ALTER TABLE `b_geoip_handlers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_group`
--
ALTER TABLE `b_group`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity`
--
ALTER TABLE `b_hlblock_entity`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hlblock_entity_rights`
--
ALTER TABLE `b_hlblock_entity_rights`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys`
--
ALTER TABLE `b_hot_keys`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_hot_keys_code`
--
ALTER TABLE `b_hot_keys_code`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT для таблицы `b_iblock`
--
ALTER TABLE `b_iblock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `b_iblock_element`
--
ALTER TABLE `b_iblock_element`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT для таблицы `b_iblock_element_property`
--
ALTER TABLE `b_iblock_element_property`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT для таблицы `b_iblock_iproperty`
--
ALTER TABLE `b_iblock_iproperty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `b_iblock_offers_tmp`
--
ALTER TABLE `b_iblock_offers_tmp`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property`
--
ALTER TABLE `b_iblock_property`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `b_iblock_property_enum`
--
ALTER TABLE `b_iblock_property_enum`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `b_iblock_right`
--
ALTER TABLE `b_iblock_right`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_rss`
--
ALTER TABLE `b_iblock_rss`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_iblock_section`
--
ALTER TABLE `b_iblock_section`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_collection`
--
ALTER TABLE `b_medialib_collection`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_item`
--
ALTER TABLE `b_medialib_item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_medialib_type`
--
ALTER TABLE `b_medialib_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_module_group`
--
ALTER TABLE `b_module_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_module_to_module`
--
ALTER TABLE `b_module_to_module`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT для таблицы `b_operation`
--
ALTER TABLE `b_operation`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT для таблицы `b_perf_cache`
--
ALTER TABLE `b_perf_cache`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_cluster`
--
ALTER TABLE `b_perf_cluster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_component`
--
ALTER TABLE `b_perf_component`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_perf_error`
--
ALTER TABLE `b_perf_error`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_history`
--
ALTER TABLE `b_perf_history`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_perf_hit`
--
ALTER TABLE `b_perf_hit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_ban`
--
ALTER TABLE `b_perf_index_ban`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_complete`
--
ALTER TABLE `b_perf_index_complete`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_index_suggest`
--
ALTER TABLE `b_perf_index_suggest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_sql`
--
ALTER TABLE `b_perf_sql`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT для таблицы `b_perf_tab_column_stat`
--
ALTER TABLE `b_perf_tab_column_stat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_perf_test`
--
ALTER TABLE `b_perf_test`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT для таблицы `b_rating`
--
ALTER TABLE `b_rating`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_rating_component`
--
ALTER TABLE `b_rating_component`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_component_results`
--
ALTER TABLE `b_rating_component_results`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_results`
--
ALTER TABLE `b_rating_results`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule`
--
ALTER TABLE `b_rating_rule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `b_rating_rule_vetting`
--
ALTER TABLE `b_rating_rule_vetting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_user`
--
ALTER TABLE `b_rating_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote`
--
ALTER TABLE `b_rating_vote`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_vote_group`
--
ALTER TABLE `b_rating_vote_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting`
--
ALTER TABLE `b_rating_voting`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_voting_prepare`
--
ALTER TABLE `b_rating_voting_prepare`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_rating_weight`
--
ALTER TABLE `b_rating_weight`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_search_content`
--
ALTER TABLE `b_search_content`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT для таблицы `b_search_custom_rank`
--
ALTER TABLE `b_search_custom_rank`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_phrase`
--
ALTER TABLE `b_search_phrase`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_search_stem`
--
ALTER TABLE `b_search_stem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2799;

--
-- AUTO_INCREMENT для таблицы `b_search_suggest`
--
ALTER TABLE `b_search_suggest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_autolog`
--
ALTER TABLE `b_seo_adv_autolog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_banner`
--
ALTER TABLE `b_seo_adv_banner`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_campaign`
--
ALTER TABLE `b_seo_adv_campaign`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_group`
--
ALTER TABLE `b_seo_adv_group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_log`
--
ALTER TABLE `b_seo_adv_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_order`
--
ALTER TABLE `b_seo_adv_order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_adv_region`
--
ALTER TABLE `b_seo_adv_region`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_keywords`
--
ALTER TABLE `b_seo_keywords`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `b_seo_search_engine`
--
ALTER TABLE `b_seo_search_engine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_log`
--
ALTER TABLE `b_seo_service_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_rtg_queue`
--
ALTER TABLE `b_seo_service_rtg_queue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_service_webhook`
--
ALTER TABLE `b_seo_service_webhook`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap`
--
ALTER TABLE `b_seo_sitemap`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_entity`
--
ALTER TABLE `b_seo_sitemap_entity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_iblock`
--
ALTER TABLE `b_seo_sitemap_iblock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_sitemap_runtime`
--
ALTER TABLE `b_seo_sitemap_runtime`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_seo_yandex_direct_stat`
--
ALTER TABLE `b_seo_yandex_direct_stat`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_short_uri`
--
ALTER TABLE `b_short_uri`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_site_template`
--
ALTER TABLE `b_site_template`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `b_smile`
--
ALTER TABLE `b_smile`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `b_smile_lang`
--
ALTER TABLE `b_smile_lang`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `b_smile_set`
--
ALTER TABLE `b_smile_set`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_ap`
--
ALTER TABLE `b_socialservices_ap`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact`
--
ALTER TABLE `b_socialservices_contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_contact_connect`
--
ALTER TABLE `b_socialservices_contact_connect`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_message`
--
ALTER TABLE `b_socialservices_message`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_user`
--
ALTER TABLE `b_socialservices_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_socialservices_user_link`
--
ALTER TABLE `b_socialservices_user_link`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_sticker`
--
ALTER TABLE `b_sticker`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_task`
--
ALTER TABLE `b_task`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_metadata`
--
ALTER TABLE `b_urlpreview_metadata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_urlpreview_route`
--
ALTER TABLE `b_urlpreview_route`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user`
--
ALTER TABLE `b_user`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_auth_action`
--
ALTER TABLE `b_user_auth_action`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `b_user_field`
--
ALTER TABLE `b_user_field`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_confirm`
--
ALTER TABLE `b_user_field_confirm`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_field_enum`
--
ALTER TABLE `b_user_field_enum`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_hit_auth`
--
ALTER TABLE `b_user_hit_auth`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `b_user_option`
--
ALTER TABLE `b_user_option`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2393;

--
-- AUTO_INCREMENT для таблицы `b_user_stored_auth`
--
ALTER TABLE `b_user_stored_auth`
  MODIFY `ID` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `b_xml_tree`
--
ALTER TABLE `b_xml_tree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
