-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 23, 2021 at 10:29 AM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `alive_ip`
--

CREATE TABLE IF NOT EXISTS `alive_ip` (
  `id` bigint(20) NOT NULL,
  `nodeid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bought`
--

CREATE TABLE IF NOT EXISTS `bought` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `shopid` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `renew` bigint(11) NOT NULL,
  `coupon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `is_notified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE IF NOT EXISTS `commission` (
  `id` bigint(20) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ref_by` bigint(20) NOT NULL,
  `ref_get` decimal(12,2) NOT NULL,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `name` varchar(255) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`name`, `value`) VALUES
('accessdenied', '0'),
('add_emoji_to_server_name', '1'),
('admin_telegram', ''),
('alipay_public_key', ''),
('alipay_url', NULL),
('allowaccess', '0'),
('alphavantage_apikey', ''),
('api_key', 'PN6puMODcazWgmWo8oRw'),
('appName', 'Xpanel'),
('aws_key', ''),
('aws_region', 'eu-west-2'),
('aws_secret', ''),
('backup_email', ''),
('backup_password', ''),
('baseUrl', 'https://xpanel.gbxcloud.com'),
('buy_reset', '1'),
('client_id', ''),
('coinpayments_Private_Key', ''),
('coinpayments_Public_Key', ''),
('cp_ipn_secret', ''),
('cp_merchant_id', ''),
('crypto_secret', ''),
('email_backup', '0'),
('email_verify', '0'),
('enablepayments', '0'),
('enable_alipay', '0'),
('enable_backup', '0'),
('enable_bitcoin', '0'),
('enable_ga_tracking', '0'),
('enable_hbo', '0'),
('enable_hulu', '0'),
('enable_invite', '1'),
('enable_ios_account', '0'),
('enable_kill', '1'),
('enable_netflix', '0'),
('enable_notification', '0'),
('enable_paypal', '0'),
('enable_reg', '0'),
('enable_tawkchat', '0'),
('enable_telegram', '0'),
('enable_wechat', '0'),
('exp_reset', '1'),
('f2fpay_app_id', ''),
('ga_id', 'ga:xxxxxx'),
('hbo_id', ''),
('hbo_key', ''),
('hulu_id', ''),
('hulu_key', ''),
('h_captcha', '0'),
('h_captcha_key', ''),
('h_captcha_secrete', ''),
('ios_account', ''),
('ios_passwd', ''),
('jkstate', NULL),
('lastheart', NULL),
('lastpay', NULL),
('LoginLogs', '1'),
('loginverify', '0'),
('logo_path', '/app/app-assets/images/img/X.png'),
('mailDriver', '0'),
('mailgun_domain', ''),
('mailgun_key', ''),
('mailgun_sender', ''),
('maintenance', '1'),
('merchant_private_key', ''),
('mgate_api_url', ''),
('mgate_app_id', ''),
('mgate_app_secret', ''),
('mobile_verify', '0'),
('mugglepayAppSecret', ''),
('muKey', 'xpanel2021'),
('netflix_id', ''),
('netflix_pass', ''),
('order_exp', '5'),
('paypal_client', ''),
('paypal_mode', 'sandbox'),
('paypal_secret', ''),
('pay_bal', '1'),
('pwdMethod', 'sha256'),
('rate', '6.47'),
('rebate', '5'),
('reg_connector', '1'),
('reg_group', '1'),
('reg_level', '3'),
('reg_speed', '1024'),
('reg_traffic', '1'),
('reg_traffic_exp', '1'),
('rememberMeDuration', '7'),
('restrictions', ''),
('restrict_email', '0'),
('restrict_email_list', '@gmail.com,@protonmail.com,@ymail.com,@hotmail.co.uk,@hotmail.com,@qq.com,@outlook.com,@163.com,@126.com,@live.com,@msn.com,@yeah.net,@foxmail.com'),
('salt', 'Xpanel20210701'),
('sendgrid_key', ''),
('sendgrid_name', ''),
('sendgrid_sender', ''),
('ShareAccounts', '0'),
('site_key', 'Xpanel20210701?'),
('smsDriver', '0'),
('smtp_host', 'smtp.sendgrid.net'),
('smtp_name', 'XPANEL'),
('smtp_password', ''),
('smtp_port', '465'),
('smtp_sender', 'no-reply@xpanel.xxx.com'),
('smtp_ssl', '1'),
('smtp_username', ''),
('stripe_key', ''),
('stripe_webhook', ''),
('subUrl', 'https://xpanel.gbxcloud.com/link/'),
('tawkchat_api', ''),
('tawkchat_id', ''),
('telegram_backup', '0'),
('telegram_bot', ''),
('telegram_chatid', ''),
('telegram_gid', ''),
('telegram_group_link', ''),
('telegram_group_quiet', '1'),
('telegram_request_token', 'sjhueAMAndnenw2k2k1mmsJSJWMWiwiwthgfhgfhx'),
('telegram_token', ''),
('theadpay_key', ''),
('theadpay_mchid', ''),
('theadpay_url', ''),
('tracking_id', 'UA-xxxxxx-x'),
('Tutoriallink', 'https://'),
('TutorialState', '0'),
('twillo_account_sid', ''),
('twillo_auth_token', ''),
('twillo_number', '+165xxxxxxxx'),
('ViewLogs', '0'),
('WebapiSafe', '1'),
('wechat_url', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `countrycode` char(3) NOT NULL,
  `countryname` varchar(200) NOT NULL,
  `code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countrycode`, `countryname`, `code`) VALUES
('ABW', 'Aruba', 'aw'),
('AFG', 'Afghanistan', 'af'),
('AGO', 'Angola', 'ao'),
('AIA', 'Anguilla', 'ai'),
('ALA', 'Åland', 'ax'),
('ALB', 'Albania', 'al'),
('AND', 'Andorra', 'ad'),
('ARE', 'United Arab Emirates', 'ae'),
('ARG', 'Argentina', 'ar'),
('ARM', 'Armenia', 'am'),
('ASM', 'American Samoa', 'as'),
('ATA', 'Antarctica', 'aq'),
('ATF', 'French Southern Territories', 'tf'),
('ATG', 'Antigua and Barbuda', 'ag'),
('AUS', 'Australia', 'au'),
('AUT', 'Austria', 'at'),
('AZE', 'Azerbaijan', 'az'),
('BDI', 'Burundi', 'bi'),
('BEL', 'Belgium', 'be'),
('BEN', 'Benin', 'bj'),
('BES', 'Bonaire', 'bq'),
('BFA', 'Burkina Faso', 'bf'),
('BGD', 'Bangladesh', 'bd'),
('BGR', 'Bulgaria', 'bg'),
('BHR', 'Bahrain', 'bh'),
('BHS', 'Bahamas', 'bs'),
('BIH', 'Bosnia and Herzegovina', 'ba'),
('BLM', 'Saint Barthélemy', 'bl'),
('BLR', 'Belarus', 'by'),
('BLZ', 'Belize', 'bz'),
('BMU', 'Bermuda', 'bm'),
('BOL', 'Bolivia', 'bo'),
('BRA', 'Brazil', 'br'),
('BRB', 'Barbados', 'bb'),
('BRN', 'Brunei', 'bn'),
('BTN', 'Bhutan', 'bt'),
('BVT', 'Bouvet Island', 'bv'),
('BWA', 'Botswana', 'bw'),
('CAF', 'Central African Republic', 'cf'),
('CAN', 'Canada', 'ca'),
('CCK', 'Cocos [Keeling] Islands', 'cc'),
('CHE', 'Switzerland', 'ch'),
('CHL', 'Chile', 'cl'),
('CHN', 'China', 'cn'),
('CIV', 'Ivory Coast', 'ci'),
('CMR', 'Cameroon', 'cm'),
('COD', 'Democratic Republic of the Congo', 'cd'),
('COG', 'Republic of the Congo', 'cg'),
('COK', 'Cook Islands', 'ck'),
('COL', 'Colombia', 'co'),
('COM', 'Comoros', 'km'),
('CPV', 'Cape Verde', 'cv'),
('CRI', 'Costa Rica', 'cr'),
('CUB', 'Cuba', 'cu'),
('CUW', 'Curacao', 'cw'),
('CXR', 'Christmas Island', 'cx'),
('CYM', 'Cayman Islands', 'ky'),
('CYP', 'Cyprus', 'cy'),
('CZE', 'Czech Republic', 'cz'),
('DEU', 'Germany', 'de'),
('DJI', 'Djibouti', 'dj'),
('DMA', 'Dominica', 'dm'),
('DNK', 'Denmark', 'dk'),
('DOM', 'Dominican Republic', 'do'),
('DZA', 'Algeria', 'dz'),
('ECU', 'Ecuador', 'ec'),
('EGY', 'Egypt', 'eg'),
('ERI', 'Eritrea', 'er'),
('ESH', 'Western Sahara', 'eh'),
('ESP', 'Spain', 'es'),
('EST', 'Estonia', 'ee'),
('ETH', 'Ethiopia', 'et'),
('FIN', 'Finland', 'fi'),
('FJI', 'Fiji', 'fj'),
('FLK', 'Falkland Islands', 'fk'),
('FRA', 'France', 'fr'),
('FRO', 'Faroe Islands', 'fo'),
('FSM', 'Micronesia', 'fm'),
('GAB', 'Gabon', 'ga'),
('GBR', 'United Kingdom', 'gb'),
('GEO', 'Georgia', 'ge'),
('GGY', 'Guernsey', 'gg'),
('GHA', 'Ghana', 'gh'),
('GIB', 'Gibraltar', 'gi'),
('GIN', 'Guinea', 'gn'),
('GLP', 'Guadeloupe', 'gp'),
('GMB', 'Gambia', 'gm'),
('GNB', 'Guinea-Bissau', 'gw'),
('GNQ', 'Equatorial Guinea', 'gq'),
('GRC', 'Greece', 'gr'),
('GRD', 'Grenada', 'gd'),
('GRL', 'Greenland', 'gl'),
('GTM', 'Guatemala', 'gt'),
('GUF', 'French Guiana', 'gf'),
('GUM', 'Guam', 'gu'),
('GUY', 'Guyana', 'gy'),
('HKG', 'Hong Kong', 'hk'),
('HMD', 'Heard Island and McDonald Islands', 'hm'),
('HND', 'Honduras', 'hn'),
('HRV', 'Croatia', 'hr'),
('HTI', 'Haiti', 'ht'),
('HUN', 'Hungary', 'hu'),
('IDN', 'Indonesia', 'id'),
('IMN', 'Isle of Man', 'im'),
('IND', 'India', 'in'),
('IOT', 'British Indian Ocean Territory', 'io'),
('IRL', 'Ireland', 'ie'),
('IRN', 'Iran', 'ir'),
('IRQ', 'Iraq', 'iq'),
('ISL', 'Iceland', 'is'),
('ISR', 'Israel', 'il'),
('ITA', 'Italy', 'it'),
('JAM', 'Jamaica', 'jm'),
('JEY', 'Jersey', 'je'),
('JOR', 'Jordan', 'jo'),
('JPN', 'Japan', 'jp'),
('KAZ', 'Kazakhstan', 'kz'),
('KEN', 'Kenya', 'ke'),
('KGZ', 'Kyrgyzstan', 'kg'),
('KHM', 'Cambodia', 'kh'),
('KIR', 'Kiribati', 'ki'),
('KNA', 'Saint Kitts and Nevis', 'kn'),
('KOR', 'South Korea', 'KR'),
('KWT', 'Kuwait', 'kw'),
('LAO', 'Laos', 'la'),
('LBN', 'Lebanon', 'lb'),
('LBR', 'Liberia', 'lr'),
('LBY', 'Libya', 'ly'),
('LCA', 'Saint Lucia', 'lc'),
('LIE', 'Liechtenstein', 'li'),
('LKA', 'Sri Lanka', 'lk'),
('LSO', 'Lesotho', 'ls'),
('LTU', 'Lithuania', 'lt'),
('LUX', 'Luxembourg', 'lu'),
('LVA', 'Latvia', 'lv'),
('MAC', 'Macao', 'mo'),
('MAF', 'Saint Martin', 'mf'),
('MAR', 'Morocco', 'ma'),
('MCO', 'Monaco', 'mc'),
('MDA', 'Moldova', 'md'),
('MDG', 'Madagascar', 'mg'),
('MDV', 'Maldives', 'mv'),
('MEX', 'Mexico', 'mx'),
('MHL', 'Marshall Islands', 'mh'),
('MKD', 'Macedonia', 'mk'),
('MLI', 'Mali', 'ml'),
('MLT', 'Malta', 'mt'),
('MMR', 'Myanmar [Burma]', 'mm'),
('MNE', 'Montenegro', 'me'),
('MNG', 'Mongolia', 'mn'),
('MNP', 'Northern Mariana Islands', 'mp'),
('MOZ', 'Mozambique', 'mz'),
('MRT', 'Mauritania', 'mr'),
('MSR', 'Montserrat', 'ms'),
('MTQ', 'Martinique', 'mq'),
('MUS', 'Mauritius', 'mu'),
('MWI', 'Malawi', 'mw'),
('MYS', 'Malaysia', 'my'),
('MYT', 'Mayotte', 'yt'),
('NAM', 'Namibia', 'na'),
('NCL', 'New Caledonia', 'nc'),
('NER', 'Niger', 'ne'),
('NFK', 'Norfolk Island', 'nf'),
('NGA', 'Nigeria', 'ng'),
('NIC', 'Nicaragua', 'ni'),
('NIU', 'Niue', 'nu'),
('NLD', 'Netherlands', 'nl'),
('NOR', 'Norway', 'no'),
('NPL', 'Nepal', 'np'),
('NRU', 'Nauru', 'nr'),
('NZL', 'New Zealand', 'nz'),
('OMN', 'Oman', 'om'),
('PAK', 'Pakistan', 'pk'),
('PAN', 'Panama', 'pa'),
('PCN', 'Pitcairn Islands', 'pn'),
('PER', 'Peru', 'pe'),
('PHL', 'Philippines', 'ph'),
('PLW', 'Palau', 'pw'),
('PNG', 'Papua New Guinea', 'pg'),
('POL', 'Poland', 'pl'),
('PRI', 'Puerto Rico', 'pr'),
('PRK', 'North Korea', 'kp'),
('PRT', 'Portugal', 'pt'),
('PRY', 'Paraguay', 'py'),
('PSE', 'Palestine', 'ps'),
('PYF', 'French Polynesia', 'pf'),
('QAT', 'Qatar', 'qa'),
('REU', 'Réunion', 're'),
('ROU', 'Romania', 'ro'),
('RUS', 'Russia', 'ru'),
('RWA', 'Rwanda', 'rw'),
('SAU', 'Saudi Arabia', 'sa'),
('SDN', 'Sudan', 'sd'),
('SEN', 'Senegal', 'sn'),
('SGP', 'Singapore', 'sg'),
('SGS', 'South Georgia and the South Sandwich Islands', 'gs'),
('SHN', 'Saint Helena', 'sh'),
('SJM', 'Svalbard and Jan Mayen', 'sj'),
('SLB', 'Solomon Islands', 'sb'),
('SLE', 'Sierra Leone', 'sl'),
('SLV', 'El Salvador', 'sv'),
('SMR', 'San Marino', 'sm'),
('SOM', 'Somalia', 'so'),
('SPM', 'Saint Pierre and Miquelon', 'pm'),
('SRB', 'Serbia', 'rs'),
('SSD', 'South Sudan', 'ss'),
('STP', 'São Tomé and Príncipe', 'st'),
('SUR', 'Suriname', 'sr'),
('SVK', 'Slovakia', 'sk'),
('SVN', 'Slovenia', 'si'),
('SWE', 'Sweden', 'se'),
('SWZ', 'Swaziland', 'sz'),
('SXM', 'Sint Maarten', 'sx'),
('SYC', 'Seychelles', 'sc'),
('SYR', 'Syria', 'sy'),
('TCA', 'Turks and Caicos Islands', 'tc'),
('TCD', 'Chad', 'td'),
('TGO', 'Togo', 'tg'),
('THA', 'Thailand', 'th'),
('TJK', 'Tajikistan', 'tj'),
('TKL', 'Tokelau', 'tk'),
('TKM', 'Turkmenistan', 'tm'),
('TLS', 'East Timor', 'tl'),
('TON', 'Tonga', 'to'),
('TTO', 'Trinidad and Tobago', 'tt'),
('TUN', 'Tunisia', 'tn'),
('TUR', 'Turkey', 'tr'),
('TUV', 'Tuvalu', 'tv'),
('TWN', 'Taiwan', 'tw'),
('TZA', 'Tanzania', 'tz'),
('UGA', 'Uganda', 'ug'),
('UKR', 'Ukraine', 'ua'),
('UMI', 'U.S. Minor Outlying Islands', 'um'),
('URY', 'Uruguay', 'uy'),
('USA', 'United States', 'us'),
('UZB', 'Uzbekistan', 'uz'),
('VAT', 'Vatican City', 'va'),
('VCT', 'Saint Vincent and the Grenadines', 'vc'),
('VEN', 'Venezuela', 've'),
('VGB', 'British Virgin Islands', 'vg'),
('VIR', 'U.S. Virgin Islands', 'vi'),
('VNM', 'Vietnam', 'vn'),
('VUT', 'Vanuatu', 'vu'),
('WLF', 'Wallis and Futuna', 'wf'),
('WSM', 'Samoa', 'ws'),
('XKX', 'Kosovo', 'xk'),
('YEM', 'Yemen', 'ye'),
('ZAF', 'South Africa', 'za'),
('ZMB', 'Zambia', 'zm'),
('ZWE', 'Zimbabwe', 'zw');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `id` bigint(20) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `code` text NOT NULL,
  `newuser` int(11) NOT NULL,
  `usage_no` int(20) NOT NULL,
  `expire` datetime NOT NULL,
  `package` text NOT NULL,
  `credit` int(11) NOT NULL,
  `type` bigint(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_queue`
--

CREATE TABLE IF NOT EXISTS `email_queue` (
  `id` bigint(20) NOT NULL,
  `to_email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `array` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Email Queue 發件列表';

-- --------------------------------------------------------

--
-- Table structure for table `email_verify`
--

CREATE TABLE IF NOT EXISTS `email_verify` (
  `id` bigint(20) NOT NULL,
  `email` text NOT NULL,
  `ip` text NOT NULL,
  `code` text NOT NULL,
  `expire_in` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `isocodes`
--

CREATE TABLE IF NOT EXISTS `isocodes` (
  `id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `isocodes`
--

INSERT INTO `isocodes` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `address` text NOT NULL,
  `port` int(11) NOT NULL,
  `token` text NOT NULL,
  `ios` int(11) NOT NULL DEFAULT '0',
  `userid` bigint(20) NOT NULL,
  `isp` text,
  `geo` int(11) DEFAULT NULL,
  `method` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_ip`
--

CREATE TABLE IF NOT EXISTS `login_ip` (
  `id` bigint(20) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `ip` text NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_verify`
--

CREATE TABLE IF NOT EXISTS `mobile_verify` (
  `id` bigint(20) NOT NULL,
  `mobile` text CHARACTER SET utf8,
  `code` text CHARACTER SET utf8,
  `expire_in` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `markdown` longtext NOT NULL,
  `content_cn` longtext NOT NULL,
  `markdown_cn` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) NOT NULL,
  `close_date` bigint(20) DEFAULT NULL,
  `create_date` bigint(20) DEFAULT NULL,
  `is_auto` int(11) DEFAULT NULL,
  `notify_url` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `pay_id` varchar(255) DEFAULT NULL,
  `pay_url` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `really_price` decimal(12,2) DEFAULT NULL,
  `return_url` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `packagetype` varchar(2) DEFAULT NULL,
  `packageid` bigint(10) DEFAULT NULL,
  `packagexp` bigint(10) DEFAULT NULL,
  `coupon` varchar(25) DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `exp` bigint(20) DEFAULT NULL,
  `expdate` text,
  `amount` varchar(11) DEFAULT NULL,
  `wallet` text,
  `pending` varchar(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `id` bigint(20) NOT NULL,
  `type` varchar(25) DEFAULT NULL,
  `name` text,
  `cn_name` text,
  `content` text NOT NULL,
  `category` varchar(25) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `price` decimal(12,2) DEFAULT NULL,
  `expire_days` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE IF NOT EXISTS `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `init_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pay_qrcode`
--

CREATE TABLE IF NOT EXISTS `pay_qrcode` (
  `id` bigint(20) NOT NULL,
  `pay_url` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rule_list`
--

CREATE TABLE IF NOT EXISTS `rule_list` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `regex` longtext COLLATE utf8mb4_unicode_ci,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rule_list`
--

INSERT INTO `rule_list` (`id`, `name`, `regex`, `type`) VALUES
(1, '360-1', '(.*\\.||)(360|360safe|so|360totalsecurity|qihoo|qhimg)\\.(cn|com)', 1),
(2, 'Spam-1', '(^.*@)(guerrillamail|guerrillamailblock|sharklasers|grr|pokemail|spam4|bccto|chacuo|027168).(info|biz|com|de|net|org|me|la)', 1),
(3, 'Spam-2', '(Subject|HELO|SMTP)', 1),
(4, 'Thunder', '(.?)(xunlei|sandai|Thunder|XLLiveUD)(.)', 1),
(5, 'BitTorrent', 'BitTorrent protocol', 1),
(6, 'BT', '(torrent|.torrent|peer_id=|info_hash|get_peers|find_node|BitTorrent|announce_peer|announce.php?passkey=)', 1),
(7, '360-2', '(.+.|^)(360|so).(cn|com)', 1),
(8, 'Baidu-Nav', '(api|ps|sv|offnavi|newvector|ulog.imap|newloc)(.map|).(baidu|n.shifen).com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rule_log`
--

CREATE TABLE IF NOT EXISTS `rule_log` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `datetime` bigint(20) NOT NULL,
  `server_id` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` int(3) NOT NULL,
  `server` varchar(128) NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT 'aes-128-gcm',
  `info` varchar(128) DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `traffic_rate` float NOT NULL DEFAULT '1',
  `node_class` int(11) NOT NULL DEFAULT '0',
  `node_speedlimit` int(20) NOT NULL DEFAULT '0',
  `node_connector` int(11) NOT NULL DEFAULT '0',
  `node_bandwidth` bigint(20) NOT NULL DEFAULT '0',
  `node_heartbeat` bigint(20) NOT NULL DEFAULT '0',
  `node_ip` text,
  `node_group` int(11) NOT NULL DEFAULT '0',
  `online` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(3) NOT NULL DEFAULT '0',
  `mu_only` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`id`, `name`, `type`, `server`, `method`, `info`, `status`, `traffic_rate`, `node_class`, `node_speedlimit`, `node_connector`, `node_bandwidth`, `node_heartbeat`, `node_ip`, `node_group`, `online`, `sort`, `mu_only`) VALUES
(1, 'Expired/流量过期了', 1, '8.8.8;port=443|server=google.com', 'aes-256-gcm', 'United Kingdom', NULL, 0, -1, 0, 0, 0, 0, '8.8.8.8', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `server_info`
--

CREATE TABLE IF NOT EXISTS `server_info` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `uptime` float NOT NULL,
  `load` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `server_online_log`
--

CREATE TABLE IF NOT EXISTS `server_online_log` (
  `id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setup`
--

CREATE TABLE IF NOT EXISTS `setup` (
  `id` int(25) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `content` text,
  `datetime` bigint(25) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `url` text,
  `link` text
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setup`
--

INSERT INTO `setup` (`id`, `title`, `type`, `content`, `datetime`, `status`, `url`, `link`) VALUES
(1, 'ClashForAndroid', '1', '', 1626729684, 1, '/download/Clash.apk', 'clash=1'),
(2, 'AnXray', '1', '', 1627002113, 1, 'https://github.com/XTLS/AnXray/releases', 'anxray=1'),
(3, 'V2rayNG', '1', '', 1626729707, 1, 'https://github.com/2dust/v2rayNG/releases', 'config=1'),
(4, 'ClashForWindows', '3', '', 1626729673, 1, '/download/Clash.exe', 'clash=1'),
(5, 'V2rayN', '3', '', 1626729663, 1, '/download/v2rayN.zip', 'config=1'),
(6, 'Shadowrocket', '2', '', 1626729742, 1, 'https://itunes.apple.com/us/app/shadowrocket/id932747118?mt=8', 'list=shadowrocket'),
(7, 'QuantumultX', '2', '', 1626729765, 1, 'https://apps.apple.com/us/app/quantumult-x/id1443988620', 'quantumultx=1'),
(8, 'ClashForWindows(Mac)', '4', '', 1626729789, 1, '/download/Clash.dmg', 'clash=1'),
(9, 'ClashX', '4', '', 1626729810, 1, '/download/ClashX.dmg', 'clash=1'),
(10, 'Qv2ray', '5', '', 1626729846, 1, '/download/Qv2rayLinux.zip', 'config=1');

-- --------------------------------------------------------

--
-- Table structure for table `telegram_session`
--

CREATE TABLE IF NOT EXISTS `telegram_session` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `session_content` text,
  `datetime` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

INSERT INTO `telegram_session` (`id`, `user_id`, `type`, `session_content`, `datetime`) VALUES
(1, 1, 0, 'TEkQNDnmdRaea7pb', 1627125795);
--
-- Table structure for table `telegram_tasks`
--

CREATE TABLE IF NOT EXISTS `telegram_tasks` (
  `id` int(11) unsigned NOT NULL,
  `type` int(8) NOT NULL COMMENT '任务类型',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '任务状态',
  `chatid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Telegram Chat ID',
  `messageid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Telegram Message ID',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '任务详细内容',
  `process` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '临时任务进度',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '网站用户 ID',
  `tguserid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Telegram User ID',
  `executetime` bigint(20) NOT NULL COMMENT '任务执行时间',
  `datetime` bigint(20) NOT NULL COMMENT '任务产生时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Telegram 任务列表';

-- --------------------------------------------------------

--
-- Table structure for table `tmp_price`
--

CREATE TABLE IF NOT EXISTS `tmp_price` (
  `price` varchar(255) NOT NULL,
  `oid` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(32) NOT NULL,
  `pass` varchar(256) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  `uuid` text COMMENT 'uuid',
  `mobile` varchar(20) DEFAULT NULL,
  `t` int(11) NOT NULL DEFAULT '0',
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `transfer_enable` bigint(20) NOT NULL,
  `forbidden_ip` varchar(182) DEFAULT '',
  `forbidden_port` longtext,
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  `reg_date` datetime NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `expire_time` int(11) NOT NULL DEFAULT '0',
  `reg_ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `node_speedlimit` int(20) NOT NULL DEFAULT '0',
  `node_connector` int(11) NOT NULL DEFAULT '0',
  `is_admin` int(2) NOT NULL DEFAULT '0',
  `last_day_t` bigint(20) NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL DEFAULT '0',
  `expire_in` datetime NOT NULL DEFAULT '2099-06-04 00:05:00',
  `remark` text,
  `node_group` int(11) NOT NULL DEFAULT '0',
  `reset_day` int(11) NOT NULL DEFAULT '0',
  `reset_bandwidth` decimal(12,2) NOT NULL DEFAULT '0.00',
  `telegram_id` bigint(20) DEFAULT NULL,
  `telegram_name` varchar(25) DEFAULT NULL,
  `expire_notified` tinyint(1) NOT NULL DEFAULT '0',
  `traffic_notified` tinyint(1) NOT NULL DEFAULT '0',
  `afflink` varchar(25) DEFAULT NULL,
  `notification` int(3) NOT NULL DEFAULT '1',
  `ref_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_subscribe_log`
--

CREATE TABLE IF NOT EXISTS `user_subscribe_log` (
  `id` int(11) unsigned NOT NULL,
  `user_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱',
  `subscribe_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '获取的订阅类型',
  `request_ip` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求 IP',
  `request_time` datetime NOT NULL COMMENT '请求时间',
  `request_user_agent` text COLLATE utf8mb4_unicode_ci COMMENT '请求 UA 信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户订阅日志';

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_traffic_log`
--

CREATE TABLE IF NOT EXISTS `user_traffic_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` varchar(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alive_ip`
--
ALTER TABLE `alive_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bought`
--
ALTER TABLE `bought`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countrycode`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verify`
--
ALTER TABLE `email_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `isocodes`
--
ALTER TABLE `isocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_ip`
--
ALTER TABLE `login_ip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_verify`
--
ALTER TABLE `mobile_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_qrcode`
--
ALTER TABLE `pay_qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule_list`
--
ALTER TABLE `rule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule_log`
--
ALTER TABLE `rule_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_info`
--
ALTER TABLE `server_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_online_log`
--
ALTER TABLE `server_online_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup`
--
ALTER TABLE `setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram_session`
--
ALTER TABLE `telegram_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telegram_tasks`
--
ALTER TABLE `telegram_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_price`
--
ALTER TABLE `tmp_price`
  ADD PRIMARY KEY (`price`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alive_ip`
--
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bought`
--
ALTER TABLE `bought`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_verify`
--
ALTER TABLE `email_verify`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `isocodes`
--
ALTER TABLE `isocodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_ip`
--
ALTER TABLE `login_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mobile_verify`
--
ALTER TABLE `mobile_verify`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pay_qrcode`
--
ALTER TABLE `pay_qrcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rule_list`
--
ALTER TABLE `rule_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rule_log`
--
ALTER TABLE `rule_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `server_info`
--
ALTER TABLE `server_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `server_online_log`
--
ALTER TABLE `server_online_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setup`
--
ALTER TABLE `setup`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telegram_session`
--
ALTER TABLE `telegram_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `telegram_tasks`
--
ALTER TABLE `telegram_tasks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_subscribe_log`
--
ALTER TABLE `user_subscribe_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
