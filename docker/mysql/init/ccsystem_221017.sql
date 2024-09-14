-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2022 年 10 月 24 日 03:11
-- サーバのバージョン： 10.2.7-MariaDB
-- PHP のバージョン: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `ccsystem`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_block_access`
--

CREATE TABLE `frema_block_access` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `block_user_id` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_card_info`
--

CREATE TABLE `frema_card_info` (
  `user_id` varchar(250) CHARACTER SET utf8 NOT NULL,
  `token` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `customer_id` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `last_receipt_url` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `enabled_customer` tinyint(1) NOT NULL DEFAULT 0,
  `regist_key` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `subscription_id` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `canceled_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_carriage_plan`
--

CREATE TABLE `frema_carriage_plan` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_carriage_plan`
--

INSERT INTO `frema_carriage_plan` (`id`, `name`, `enabled`, `regist_date`, `update_date`) VALUES
(1, '送料込', 1, '2017-05-22 00:57:43', '2017-05-22 00:57:43'),
(2, '送料無料', 1, '2017-05-22 00:57:43', '2017-05-22 00:57:43');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_carriage_type`
--

CREATE TABLE `frema_carriage_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_carriage_type`
--

INSERT INTO `frema_carriage_type` (`id`, `name`, `enabled`, `regist_date`, `update_date`) VALUES
(1, '1～2日で発送', 1, '2017-05-22 01:06:38', '2017-05-22 01:06:38'),
(2, '3～5日で発送', 1, '2017-09-15 00:35:28', '2017-09-15 00:35:28'),
(3, '7日以内に発送', 1, '2017-09-15 00:35:42', '2017-09-15 00:35:42');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_cash_flow`
--

CREATE TABLE `frema_cash_flow` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `joined_user_id` int(11) DEFAULT 0,
  `stripe_price_id` varchar(50) DEFAULT NULL,
  `monthly_plan_user_id` int(11) DEFAULT 0,
  `stripe_payment_id` varchar(100) DEFAULT '',
  `in_out` tinyint(4) NOT NULL COMMENT '1:????,2:?o??',
  `amount` int(11) NOT NULL,
  `commission` int(11) NOT NULL,
  `system_commision_buyer` int(11) NOT NULL DEFAULT 0,
  `system_commision_seller` int(11) NOT NULL DEFAULT 0,
  `settlement_commision_buyer` int(11) NOT NULL DEFAULT 0,
  `settlement_commision_seller` int(11) NOT NULL DEFAULT 0,
  `transfer_fee` int(11) NOT NULL DEFAULT 0,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_category`
--

CREATE TABLE `frema_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_category`
--

INSERT INTO `frema_category` (`id`, `name`, `enabled`, `regist_date`, `update_date`) VALUES
(1, 'カテゴリー１', 1, '2022-10-24 01:19:45', '2022-10-24 01:19:45');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_delivery_type`
--

CREATE TABLE `frema_delivery_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_delivery_type`
--

INSERT INTO `frema_delivery_type` (`id`, `name`, `enabled`, `regist_date`, `update_date`) VALUES
(1, '普通郵便（定形・定形外）', 1, '2017-05-22 01:05:52', '2017-05-22 01:05:52'),
(2, 'ゆうメール', 1, '2017-06-16 00:28:48', '2017-06-16 00:28:48'),
(3, 'スマートレター', 1, '2017-09-13 00:40:21', '2017-09-13 00:40:21'),
(4, 'レターパック（ライト・プラス）', 1, '2017-09-15 01:54:32', '2017-09-15 01:54:32'),
(5, 'ゆうパック', 1, '2018-07-23 13:07:52', '2018-07-23 13:07:52'),
(6, 'ヤマト宅急便', 1, '2018-07-23 13:13:49', '2018-07-23 13:13:49'),
(7, '宅急便コンパクト', 1, '2018-07-23 13:14:13', '2018-07-23 13:14:13'),
(8, '佐川急便', 1, '2018-07-23 13:14:24', '2018-07-23 13:14:24'),
(9, '代引き（手数料は出品者負担）', 1, '2018-10-15 11:05:47', '2018-10-15 11:05:47'),
(10, '代引き（手数料は購入者負担）', 1, '2018-10-17 12:50:47', '2018-10-17 12:50:47'),
(11, 'その他', 1, '2018-10-17 12:50:58', '2018-10-17 12:50:58');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_evaluate`
--

CREATE TABLE `frema_evaluate` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `point` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_evaluate`
--

INSERT INTO `frema_evaluate` (`id`, `name`, `point`, `regist_date`, `update_date`) VALUES
(1, '良い', 1, '2017-06-26 21:53:36', '2017-06-26 21:53:36'),
(2, '普通', 0, '2017-06-26 21:53:36', '2017-06-26 21:53:36'),
(3, '悪い', -1, '2017-06-26 21:53:55', '2017-06-26 21:53:55');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_favorites`
--

CREATE TABLE `frema_favorites` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_free_input_item`
--

CREATE TABLE `frema_free_input_item` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `field_type` int(11) NOT NULL COMMENT 'フィールドのタイプ（1:プルダウン、2:チェックボックス、3:ラジオボタン）',
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `updata_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_free_input_item`
--

INSERT INTO `frema_free_input_item` (`id`, `name`, `field_type`, `enabled`, `updata_date`, `regist_date`) VALUES
(1, '物件地域', 1, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(2, '住所', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(3, '物件種別', 1, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(4, '価格帯', 1, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(5, '利回り', 1, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(6, '駅まで', 1, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(7, '間取り', 1, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(8, '土地面積', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(9, '建物面積', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(10, '専有面積', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(11, '築年数', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(12, '土地権利', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(13, '構造', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(14, '建ぺい率', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(15, '容積率', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(16, '総戸数・所在階', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(17, '用途地域', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(18, '地目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(19, '都市計画区域', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(20, '取引態様', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(21, '建築確認番号', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(22, '引き渡し', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(23, '自由項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(24, '自由項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(25, '自由項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(26, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(27, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(28, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(29, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(30, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(31, '積み地(名称/住所)', 0, 0, '2022-10-24 01:16:09', '2022-09-20 06:56:37'),
(32, '集荷日時', 0, 0, '2022-10-24 01:16:10', '2022-09-20 06:56:37'),
(33, '納品先(名称/住所)', 0, 0, '2022-10-24 01:16:10', '2022-09-20 06:56:37'),
(34, '車両', 1, 0, '2022-10-24 01:16:10', '2022-09-20 06:56:37'),
(35, '募集台数', 0, 0, '2022-10-24 01:16:11', '2022-09-20 06:56:37'),
(36, '車両の温度帯', 1, 0, '2022-10-24 01:16:12', '2022-09-20 06:56:37'),
(37, '配送物/荷姿', 0, 0, '2022-10-24 01:16:12', '2022-09-20 06:56:37'),
(38, '数量', 0, 0, '2022-10-24 01:16:12', '2022-09-20 06:56:37'),
(39, '片道/往復', 1, 0, '2022-10-24 01:16:13', '2022-09-20 06:56:37'),
(40, '距離制/時間制/実走/定期便', 1, 0, '2022-10-24 01:16:13', '2022-09-20 06:56:37'),
(41, '特記事項(注意事項)', 0, 0, '2022-10-24 01:16:14', '2022-09-20 06:56:37'),
(42, '見積金額', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(43, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(44, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37'),
(45, '追加項目', 0, 0, '2022-09-20 06:56:37', '2022-09-20 06:56:37');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_free_input_item_value`
--

CREATE TABLE `frema_free_input_item_value` (
  `id` int(11) NOT NULL,
  `free_input_item_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_free_input_item_value`
--

INSERT INTO `frema_free_input_item_value` (`id`, `free_input_item_id`, `name`, `order_number`, `enabled`, `update_date`, `regist_date`, `value`) VALUES
(1, 1, '北海道', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(2, 1, '青森県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(3, 1, '岩手県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(4, 1, '宮城県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(5, 1, '秋田県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(6, 1, '山形県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(7, 1, '福島県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(8, 1, '茨城県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(9, 1, '栃木県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(10, 1, '群馬県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(11, 1, '埼玉県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(12, 1, '千葉県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(13, 1, '東京都', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(14, 1, '神奈川県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(15, 1, '新潟県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(16, 1, '富山県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(17, 1, '石川県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(18, 1, '福井県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(19, 1, '山梨県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(20, 1, '長野県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(21, 1, '岐阜県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(22, 1, '静岡県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(23, 1, '愛知県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(24, 1, '三重県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(25, 1, '滋賀県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(26, 1, '京都府', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(27, 1, '大阪府', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(28, 1, '兵庫県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(29, 1, '奈良県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(30, 1, '和歌山県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(31, 1, '鳥取県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(32, 1, '島根県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(33, 1, '岡山県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(34, 1, '広島県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(35, 1, '山口県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(36, 1, '徳島県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(37, 1, '香川県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(38, 1, '愛媛県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(39, 1, '高知県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(40, 1, '福岡県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(41, 1, '佐賀県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(42, 1, '長崎県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(43, 1, '熊本県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(44, 1, '大分県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(45, 1, '宮崎県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(46, 1, '鹿児島県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(47, 1, '沖縄県', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(60, 3, '1棟マンション', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(61, 3, '1棟アパート', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(62, 3, '1棟商業ビル', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(63, 3, '戸建賃貸', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(64, 3, '賃貸併用住宅', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(65, 3, '倉庫', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(66, 3, '工場', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(67, 3, '駐車場', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(68, 3, 'ホテル', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(69, 3, '区分マンション', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(70, 3, '区分店舗', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(71, 3, '区分事務所', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(72, 3, '土地', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(80, 4, '300万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(81, 4, '500万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(82, 4, '800万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(83, 4, '1000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(84, 4, '1500万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(85, 4, '2000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(86, 4, '3000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(87, 4, '4000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(88, 4, '5000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(89, 4, '7000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(90, 4, '9000万円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(91, 4, '1億円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(92, 4, '2億円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(93, 4, '3億円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(94, 4, '5億円以下', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(100, 5, '3%以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(101, 5, '5%以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(102, 5, '10%以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(103, 5, '15%以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(104, 5, '20%以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(105, 5, '25%以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(106, 6, '3分以内', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(107, 6, '5分以内', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(108, 6, '7分以内', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(109, 6, '10分以内', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(110, 6, '15分以内', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(111, 6, '20分以内', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(120, 7, 'ワンルーム', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(121, 7, '1K', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(122, 7, '2K', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(123, 7, '3K', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(124, 7, '4K', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(125, 7, '1DK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(126, 7, '2DK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(127, 7, '3DK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(128, 7, '4DK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(129, 7, '1LDK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(130, 7, '2LDK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(131, 7, '3LDK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(132, 7, '4LDK', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(133, 7, '5DK以上', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(134, 34, '軽貨物', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(135, 34, '2t', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(136, 34, '4t', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(137, 34, '10t', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(138, 34, 'その他', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(139, 36, '常温', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(140, 36, 'チルド', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(141, 36, '冷凍', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(142, 36, 'その他', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(143, 39, '片道', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(144, 39, '往復', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(145, 40, '距離制', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(146, 40, '時間制', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(147, 40, '実走', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(148, 40, '定期便', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL),
(149, 40, 'その他', 0, 1, '2022-09-20 06:56:31', '2022-09-20 06:56:31', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_good`
--

CREATE TABLE `frema_good` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `good_count` int(11) NOT NULL DEFAULT 1,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_identification`
--

CREATE TABLE `frema_identification` (
  `user_id` int(11) NOT NULL,
  `photo` mediumblob DEFAULT NULL,
  `photo2` mediumblob DEFAULT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_information`
--

CREATE TABLE `frema_information` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_invoice`
--

CREATE TABLE `frema_invoice` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `month` varchar(8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `transaction_count` int(11) NOT NULL DEFAULT 0,
  `transaction_amount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `commission_rate` int(11) NOT NULL DEFAULT 0,
  `commission` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_invoice_details`
--

CREATE TABLE `frema_invoice_details` (
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_item`
--

CREATE TABLE `frema_item` (
  `id` int(11) NOT NULL,
  `access_count` int(11) DEFAULT 0,
  `owner_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `item_state` int(11) DEFAULT NULL,
  `remarks` varchar(16000) NOT NULL,
  `pref` int(11) DEFAULT 0,
  `carriage_plan` int(11) DEFAULT NULL,
  `carriage_type` int(11) DEFAULT NULL,
  `delivery_type` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `delivery_price` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) DEFAULT NULL,
  `photo` mediumblob DEFAULT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `show_evaluate` tinyint(1) DEFAULT 0,
  `with_delivery` tinyint(1) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `visible` tinyint(1) DEFAULT 1,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `shipping_item` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_item_free_input`
--

CREATE TABLE `frema_item_free_input` (
  `item_id` int(11) NOT NULL,
  `free_input_item_id` int(11) NOT NULL,
  `free_input_item_value_id` int(11) NOT NULL,
  `free_input_item_value_text` varchar(250) DEFAULT '',
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_item_free_input_tmp`
--

CREATE TABLE `frema_item_free_input_tmp` (
  `item_id` int(11) NOT NULL,
  `free_input_item_id` int(11) NOT NULL,
  `free_input_item_value_id` int(11) NOT NULL,
  `free_input_item_value_text` varchar(250) CHARACTER SET utf8 NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `frema_item_free_input_tmp`
--

INSERT INTO `frema_item_free_input_tmp` (`item_id`, `free_input_item_id`, `free_input_item_value_id`, `free_input_item_value_text`, `update_date`, `regist_date`) VALUES
(1, 1, 13, 'テスト', '2022-07-09 07:15:01', '2021-10-13 08:27:59'),
(1, 2, 0, 'テスト', '2021-10-13 08:27:59', '2021-10-13 08:27:59'),
(1, 3, 60, 'テスト', '2022-07-09 07:15:01', '2021-10-13 08:27:59'),
(1, 4, 83, 'テスト', '2022-07-09 07:15:01', '2021-10-13 08:27:59'),
(1, 5, 102, 'テスト', '2022-07-09 07:15:01', '2021-10-13 08:27:59'),
(1, 6, 109, 'テスト', '2022-07-09 07:15:01', '2021-10-13 08:27:59'),
(1, 7, 129, 'テスト', '2022-07-09 07:15:01', '2021-10-13 08:27:59'),
(1, 8, 0, 'テスト', '2021-10-13 08:27:59', '2021-10-13 08:27:59'),
(1, 9, 0, 'テスト', '2021-10-13 08:27:59', '2021-10-13 08:27:59'),
(1, 10, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 11, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 12, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 13, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 14, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 15, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 16, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 17, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 18, 0, 'テスト', '2021-10-13 08:27:59', '2021-10-13 08:27:59'),
(1, 19, 0, 'テスト', '2021-10-13 08:27:59', '2021-10-13 08:27:59'),
(1, 20, 0, 'テスト', '2021-10-13 08:27:59', '2021-10-13 08:27:59'),
(1, 21, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 22, 0, '', '2022-07-09 07:15:01', '2022-07-09 07:15:01'),
(1, 31, 0, '神奈川県横浜市新横浜', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 32, 0, '9月15日', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 33, 0, '神奈川県川崎市○○○', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 34, 137, '', '2022-09-20 07:05:41', '2022-08-10 06:02:58'),
(1, 35, 0, '5台', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 36, 139, '', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 37, 0, 'ハコ', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 38, 0, '10', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 39, 144, '', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 40, 147, '', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(1, 41, 0, '速度制限', '2022-08-10 06:02:58', '2022-08-10 06:02:58'),
(2, 1, 1, '自由項目1', '2022-07-11 06:49:42', '2021-10-13 08:28:26'),
(2, 2, 0, 'テスト', '2021-10-13 08:28:26', '2021-10-13 08:28:26'),
(2, 3, 63, 'テスト', '2022-07-11 06:49:42', '2021-10-13 08:28:26'),
(2, 4, 80, 'テスト', '2022-07-11 06:49:42', '2021-10-13 08:28:26'),
(2, 5, 100, 'テスト', '2022-07-11 06:49:42', '2021-10-13 08:28:26'),
(2, 6, 106, 'テスト', '2022-07-11 06:49:42', '2021-10-13 08:28:26'),
(2, 7, 121, 'テスト', '2022-07-11 06:49:42', '2021-10-13 08:28:26'),
(2, 8, 0, 'テスト', '2021-10-13 08:28:26', '2021-10-13 08:28:26'),
(2, 9, 0, '自由項目名9', '2021-10-13 08:28:26', '2021-10-13 08:28:26'),
(2, 10, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 11, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 12, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 13, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 14, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 15, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 16, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 17, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 18, 0, 'テスト18', '2021-10-13 08:28:26', '2021-10-13 08:28:26'),
(2, 19, 0, 'テスト', '2021-10-13 08:28:26', '2021-10-13 08:28:26'),
(2, 20, 0, 'テスト', '2021-10-13 08:28:26', '2021-10-13 08:28:26'),
(2, 21, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 22, 0, '', '2022-07-11 06:49:42', '2022-07-11 06:49:42'),
(2, 31, 0, '東京都台東区台東1-9-4', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 32, 0, '9月15日', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 33, 0, '神奈川県川崎市', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 34, 137, '', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 35, 0, '5台', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 36, 139, '', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 37, 0, 'ハコ', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 38, 0, '10', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 39, 144, '', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 40, 147, '', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(2, 41, 0, '', '2022-08-24 08:11:38', '2022-08-24 08:11:38'),
(3, 1, 0, '', '2022-02-21 01:20:35', '2022-02-21 01:20:35'),
(3, 9, 0, '違反かも', '2022-02-21 01:20:35', '2022-02-21 01:20:35'),
(3, 31, 0, '東京都台東区台東1-9-4', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 32, 0, '9月14日', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 33, 0, '神奈川県川崎市', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 34, 0, '軽貨物', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 35, 0, '5台', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 36, 0, '常温', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 37, 0, '砂利・自由', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 38, 0, '1', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 39, 0, '往復', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 40, 0, '50km', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 41, 0, '', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(3, 42, 0, '50000', '2022-08-02 09:05:53', '2022-08-02 09:05:53'),
(4, 31, 0, '東京都台東区台東1-9-4', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 32, 0, '9月14日', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 33, 0, '神奈川県川崎市', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 34, 0, '軽貨物', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 35, 0, '5台', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 36, 0, '常温', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 37, 0, '砂利・自由', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 38, 0, '1', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 39, 0, '往復', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 40, 0, '50km', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 41, 0, '特記事項・必要事項', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(4, 42, 0, '78000', '2022-08-06 22:55:12', '2022-08-06 22:55:12'),
(5, 31, 0, '東京都台東区台東1-9-4', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 32, 0, '9月14日', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 33, 0, '神奈川県川崎市', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 34, 0, '軽貨物', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 35, 0, '5台', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 36, 0, '常温', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 37, 0, '砂利・自由', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 38, 0, '1', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 39, 0, '往復', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 40, 0, '50km', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 41, 0, '特記事項', '2022-08-08 05:30:00', '2022-08-08 05:30:00'),
(5, 42, 0, '12345', '2022-08-08 05:30:00', '2022-08-08 05:30:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_item_photo`
--

CREATE TABLE `frema_item_photo` (
  `item_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `photo` mediumblob NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_item_state`
--

CREATE TABLE `frema_item_state` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_item_state`
--

INSERT INTO `frema_item_state` (`id`, `name`, `enabled`, `regist_date`, `update_date`) VALUES
(1, '新品（未使用）', 1, '2017-05-22 00:46:09', '2017-05-22 00:46:09'),
(2, '未使用に近い', 1, '2017-05-22 00:46:09', '2017-05-22 00:46:09'),
(3, '目立った傷や汚れなし ', 1, '2017-05-22 00:46:20', '2017-05-22 00:46:20'),
(4, 'やや傷や汚れあり', 1, '2018-11-28 22:37:46', '2018-11-28 22:37:46'),
(5, '傷や汚れあり', 1, '2018-11-28 22:37:46', '2018-11-28 22:37:46'),
(6, '役務（サービスの提供）', 1, '2018-11-28 22:38:16', '2018-11-28 22:38:16'),
(7, 'その他', 1, '2018-11-28 22:38:16', '2018-11-28 22:38:16');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_item_tmp`
--

CREATE TABLE `frema_item_tmp` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `item_state` int(11) DEFAULT NULL,
  `remarks` varchar(16000) NOT NULL,
  `pref` int(11) DEFAULT 0,
  `carriage_plan` int(11) DEFAULT NULL,
  `carriage_type` int(11) DEFAULT NULL,
  `delivery_type` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `delivery_price` int(11) DEFAULT 0,
  `stock` int(11) DEFAULT NULL,
  `photo` mediumblob DEFAULT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `show_evaluate` tinyint(1) DEFAULT 0,
  `with_delivery` tinyint(1) NOT NULL DEFAULT 1,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_login_session`
--

CREATE TABLE `frema_login_session` (
  `hash_key` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_login_session`
--

INSERT INTO `frema_login_session` (`hash_key`, `user_id`, `regist_date`, `update_date`) VALUES
('b7ec3856a2624d3fce015b656adb108db8ca3541', 1, '2022-10-24 03:10:30', '2022-10-24 03:10:30'),
('e65d2bb5187d52d0ccc8d72fb4c2068d10348762', 2, '2022-10-24 01:27:44', '2022-10-24 01:27:44');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_mail_history`
--

CREATE TABLE `frema_mail_history` (
  `id` int(11) NOT NULL,
  `subject` varchar(200) CHARACTER SET utf8 NOT NULL,
  `body` varchar(4000) CHARACTER SET utf8 NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_mail_history_target`
--

CREATE TABLE `frema_mail_history_target` (
  `mail_history_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_monthly_payment_agreement`
--

CREATE TABLE `frema_monthly_payment_agreement` (
  `user_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `stripe_price_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_subscription_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agreemented` tinyint(1) NOT NULL DEFAULT 1,
  `contract_period_date` date NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_monthly_payment_plan`
--

CREATE TABLE `frema_monthly_payment_plan` (
  `stripe_price_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `system_commision_buyer` int(11) NOT NULL,
  `system_commision_seller` int(11) NOT NULL,
  `settlement_commision_buyer` int(11) NOT NULL,
  `settlement_commision_seller` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `frema_monthly_payment_plan`
--

INSERT INTO `frema_monthly_payment_plan` (`stripe_price_id`, `user_id`, `price`, `system_commision_buyer`, `system_commision_seller`, `settlement_commision_buyer`, `settlement_commision_seller`, `regist_date`, `update_date`) VALUES
('price_1LwGcbHcKklSsoCeK7MkGAY5', 1, 5400, 540, 540, 194, 194, '2022-10-24 02:42:37', '2022-10-24 02:42:37'),
('price_1LwGosHcKklSsoCeCrAovNCo', 1, 5400, 0, 540, 0, 194, '2022-10-24 02:55:18', '2022-10-24 02:55:18'),
('price_1LwH3SHcKklSsoCeYh7HpQo8', 1, 2980, 0, 298, 0, 107, '2022-10-24 03:10:22', '2022-10-24 03:10:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_negotiation`
--

CREATE TABLE `frema_negotiation` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `kbn` int(11) NOT NULL,
  `regist_date` timestamp NULL DEFAULT current_timestamp(),
  `update_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_order`
--

CREATE TABLE `frema_order` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `buy_count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `settlement_commision_seller` int(11) DEFAULT NULL,
  `settlement_commision_buyer` int(11) DEFAULT NULL,
  `system_commision_seller` int(11) DEFAULT NULL,
  `system_commision_buyer` int(11) DEFAULT NULL,
  `delivery_price` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL,
  `cash_flow` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:???????A1:???????A2:?????ς?',
  `payment` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1:?U?荞??,2:?N???W?b?g',
  `seller_evaluate` int(11) NOT NULL DEFAULT 0,
  `buyer_evaluate` int(11) NOT NULL DEFAULT 0,
  `seller_comment` varchar(1000) NOT NULL DEFAULT '',
  `buyer_comment` varchar(1000) NOT NULL DEFAULT '',
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_order_number`
--

CREATE TABLE `frema_order_number` (
  `order_number` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_payout_history`
--

CREATE TABLE `frema_payout_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `system_commision_buyer` int(11) NOT NULL DEFAULT 0,
  `system_commision_seller` int(11) NOT NULL DEFAULT 0,
  `settlement_commision_buyer` int(11) NOT NULL DEFAULT 0,
  `settlement_commision_seller` int(11) NOT NULL DEFAULT 0,
  `transfer_fee` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:???????A1:?U???ς?',
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_pr`
--

CREATE TABLE `frema_pr` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(400) NOT NULL DEFAULT '',
  `icon` varchar(50) NOT NULL DEFAULT '',
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_pr`
--

INSERT INTO `frema_pr` (`id`, `title`, `description`, `icon`, `update_date`, `regist_date`) VALUES
(1, '出品が簡単', '最短3分で出品ができます。下書きも保存できるので複数の出品が簡単。', 'far fa-check-circle', '2021-05-18 06:36:45', '2021-03-19 00:36:59'),
(2, '料金は成約時のみ', '出品料や月会費は一切御座いません。売れた時のみ安心して出品いただけます。', 'fas fa-yen-sign', '2021-05-18 06:36:45', '2021-03-19 00:36:59'),
(3, '購入前も安心', '購入前に質問できるので安心して取引ができます。', 'fa fa-heart', '2021-05-18 06:36:45', '2021-03-19 00:36:59');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_pref`
--

CREATE TABLE `frema_pref` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_pref`
--

INSERT INTO `frema_pref` (`id`, `name`, `enabled`, `regist_date`, `update_date`) VALUES
(1, '北海道', 1, '2017-04-17 22:29:37', '2017-04-17 22:29:37'),
(2, '青森県', 1, '2017-04-17 22:30:32', '2017-04-17 22:30:32'),
(3, '岩手県', 1, '2017-04-17 22:30:33', '2017-04-17 22:30:33'),
(4, '宮城県', 1, '2017-04-17 22:30:34', '2017-04-17 22:30:34'),
(5, '秋田県', 1, '2017-04-17 22:30:35', '2017-04-17 22:30:35'),
(6, '山形県', 1, '2017-04-17 22:30:36', '2017-04-17 22:30:36'),
(7, '福島県', 1, '2017-04-17 22:30:37', '2017-04-17 22:30:37'),
(8, '茨城県', 1, '2017-04-17 22:30:38', '2017-04-17 22:30:38'),
(9, '栃木県', 1, '2017-04-17 22:30:39', '2017-04-17 22:30:39'),
(10, '群馬県', 1, '2017-04-17 22:30:40', '2017-04-17 22:30:40'),
(11, '埼玉県', 1, '2017-04-17 22:30:40', '2017-04-17 22:30:40'),
(12, '千葉県', 1, '2017-04-17 22:30:41', '2017-04-17 22:30:41'),
(13, '東京都', 1, '2017-04-17 22:30:42', '2017-04-17 22:30:42'),
(14, '神奈川県', 1, '2017-04-17 22:30:43', '2017-04-17 22:30:43'),
(15, '新潟県', 1, '2017-04-17 22:32:42', '2017-04-17 22:32:42'),
(16, '富山県', 1, '2017-04-17 22:32:43', '2017-04-17 22:32:43'),
(17, '石川県', 1, '2017-04-17 22:32:44', '2017-04-17 22:32:44'),
(18, '福井県', 1, '2017-04-17 22:32:45', '2017-04-17 22:32:45'),
(19, '山梨県', 1, '2017-04-17 22:32:46', '2017-04-17 22:32:46'),
(20, '長野県', 1, '2017-04-17 22:32:47', '2017-04-17 22:32:47'),
(21, '岐阜県', 1, '2017-04-17 22:32:48', '2017-04-17 22:32:48'),
(22, '静岡県', 1, '2017-04-17 22:33:08', '2017-04-17 22:33:08'),
(23, '愛知県', 1, '2017-04-17 22:33:15', '2017-04-17 22:33:15'),
(24, '三重県', 1, '2017-04-17 22:33:16', '2017-04-17 22:33:16'),
(25, '滋賀県', 1, '2017-04-17 22:33:17', '2017-04-17 22:33:17'),
(26, '京都府', 1, '2017-04-17 22:33:18', '2017-04-17 22:33:18'),
(27, '大阪府', 1, '2017-04-17 22:33:18', '2017-04-17 22:33:18'),
(28, '兵庫県', 1, '2017-04-17 22:33:19', '2017-04-17 22:33:19'),
(29, '奈良県', 1, '2017-04-17 22:33:21', '2017-04-17 22:33:21'),
(30, '和歌山県', 1, '2017-04-17 22:33:22', '2017-04-17 22:33:22'),
(31, '鳥取県', 1, '2017-04-17 22:33:24', '2017-04-17 22:33:24'),
(32, '島根県', 1, '2017-04-17 22:33:25', '2017-04-17 22:33:25'),
(33, '岡山県', 1, '2017-04-17 22:33:26', '2017-04-17 22:33:26'),
(34, '広島県', 1, '2017-04-17 22:33:27', '2017-04-17 22:33:27'),
(35, '山口県', 1, '2017-04-17 22:33:28', '2017-04-17 22:33:28'),
(36, '徳島県', 1, '2017-04-17 22:33:29', '2017-04-17 22:33:29'),
(37, '香川県', 1, '2017-04-17 22:33:30', '2017-04-17 22:33:30'),
(38, '愛媛県', 1, '2017-04-17 22:33:31', '2017-04-17 22:33:31'),
(39, '高知県', 1, '2017-04-17 22:33:32', '2017-04-17 22:33:32'),
(40, '福岡県', 1, '2017-04-17 22:33:33', '2017-04-17 22:33:33'),
(41, '佐賀県', 1, '2017-04-17 22:33:33', '2017-04-17 22:33:33'),
(42, '長崎県', 1, '2017-04-17 22:33:34', '2017-04-17 22:33:34'),
(43, '熊本県', 1, '2017-04-17 22:33:36', '2017-04-17 22:33:36'),
(44, '大分県', 1, '2017-04-17 22:33:37', '2017-04-17 22:33:37'),
(45, '宮崎県', 1, '2017-04-17 22:33:38', '2017-04-17 22:33:38'),
(46, '鹿児島県', 1, '2017-04-17 22:33:39', '2017-04-17 22:33:39'),
(47, '沖縄県', 1, '2017-04-17 22:36:12', '2017-04-17 22:36:12');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_request`
--

CREATE TABLE `frema_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_request_follow`
--

CREATE TABLE `frema_request_follow` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_setting`
--

CREATE TABLE `frema_setting` (
  `commission_rate` int(11) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_settle_plan`
--

CREATE TABLE `frema_settle_plan` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_slider`
--

CREATE TABLE `frema_slider` (
  `id` int(11) NOT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_sns`
--

CREATE TABLE `frema_sns` (
  `user_id` int(11) NOT NULL,
  `twitter_url` varchar(400) NOT NULL,
  `facebook_url` varchar(400) NOT NULL,
  `youtube_url` varchar(400) NOT NULL,
  `instagram_url` varchar(400) NOT NULL,
  `other1_url` varchar(400) NOT NULL,
  `other2_url` varchar(400) NOT NULL,
  `other3_url` varchar(400) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_stripe_payment`
--

CREATE TABLE `frema_stripe_payment` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_system`
--

CREATE TABLE `frema_system` (
  `order_number` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_system`
--

INSERT INTO `frema_system` (`order_number`) VALUES
(3);

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_system_config`
--

CREATE TABLE `frema_system_config` (
  `item_name` varchar(50) NOT NULL DEFAULT '商品',
  `commission_rate` decimal(10,2) NOT NULL,
  `from_email` varchar(100) NOT NULL DEFAULT '',
  `from_email_name` varchar(100) NOT NULL DEFAULT '',
  `to_email` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(250) NOT NULL DEFAULT '',
  `financial_institution_name` varchar(50) NOT NULL DEFAULT '' COMMENT '???Z?@?֖?',
  `branch_name` varchar(50) NOT NULL DEFAULT '' COMMENT '?x?X??',
  `deposit_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '?a??????',
  `account_number` varchar(10) NOT NULL DEFAULT '' COMMENT '?????ԍ?',
  `account_holder` varchar(50) NOT NULL DEFAULT '' COMMENT '???????`',
  `uneisha` varchar(250) NOT NULL DEFAULT '',
  `shozaichi` varchar(250) NOT NULL DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `email` varchar(250) DEFAULT '',
  `company_name` varchar(250) NOT NULL DEFAULT '',
  `kiyaku_date` varchar(100) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  `banner_url` varchar(250) DEFAULT '1',
  `sns_twitter` varchar(200) DEFAULT NULL,
  `sns_instagram` varchar(200) DEFAULT NULL,
  `sns_facebook` varchar(200) DEFAULT NULL,
  `sns_line` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `use_stripe` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_access_key` varchar(200) NOT NULL DEFAULT '',
  `stripe_secret_key` varchar(200) NOT NULL DEFAULT '',
  `stripe_product_id` varchar(50) DEFAULT NULL,
  `settlement_rate` decimal(10,2) NOT NULL DEFAULT 10.00,
  `transfer_fee` int(11) NOT NULL DEFAULT 330,
  `transfer_fee_rate` decimal(10,2) NOT NULL DEFAULT 10.00,
  `introduction_price` int(11) DEFAULT 0,
  `enabled_shop_mode` tinyint(1) DEFAULT 0,
  `enabled_category` tinyint(1) NOT NULL,
  `enabled_delivery_type` tinyint(1) NOT NULL,
  `enabled_carriage_type` tinyint(1) NOT NULL,
  `enabled_postage` tinyint(1) NOT NULL,
  `enabled_pref` tinyint(1) NOT NULL,
  `enabled_item_state` tinyint(1) NOT NULL,
  `enabled_search_bar` tinyint(1) NOT NULL DEFAULT 0,
  `enabled_disp_pr` tinyint(1) DEFAULT 1,
  `enabled_image` tinyint(1) DEFAULT 1,
  `enabled_video` tinyint(1) DEFAULT 1,
  `view_user_name` tinyint(1) DEFAULT 0,
  `view_user_addr` tinyint(1) DEFAULT 0,
  `view_user_tel` tinyint(1) DEFAULT 0,
  `enabled_item` tinyint(1) DEFAULT 1,
  `enabled_slider` tinyint(1) DEFAULT 1,
  `enabled_disp_affiliate` tinyint(1) DEFAULT 1,
  `enabled_sell_button` tinyint(1) DEFAULT 1,
  `enabled_fee_bear_buyer` tinyint(1) DEFAULT 1,
  `enabled_fee_bear_seller` tinyint(1) DEFAULT 1,
  `enabled_transfer_fee` tinyint(1) DEFAULT 1,
  `use_googleoauth` tinyint(1) DEFAULT 0,
  `googleoauth_client_id` varchar(100) DEFAULT NULL,
  `googleoauth_client_secret` varchar(100) DEFAULT NULL,
  `other_script` text DEFAULT '',
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `enabled_top_map_mode` varchar(1) DEFAULT NULL,
  `enabled_free_items_mode` varchar(1) DEFAULT NULL,
  `enabled_shipping_mode` varchar(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_system_config`
--

INSERT INTO `frema_system_config` (`item_name`, `commission_rate`, `from_email`, `from_email_name`, `to_email`, `site_name`, `financial_institution_name`, `branch_name`, `deposit_type`, `account_number`, `account_holder`, `uneisha`, `shozaichi`, `tel`, `email`, `company_name`, `kiyaku_date`, `keyword`, `banner_url`, `sns_twitter`, `sns_instagram`, `sns_facebook`, `sns_line`, `description`, `use_stripe`, `stripe_access_key`, `stripe_secret_key`, `stripe_product_id`, `settlement_rate`, `transfer_fee`, `transfer_fee_rate`, `introduction_price`, `enabled_shop_mode`, `enabled_category`, `enabled_delivery_type`, `enabled_carriage_type`, `enabled_postage`, `enabled_pref`, `enabled_item_state`, `enabled_search_bar`, `enabled_disp_pr`, `enabled_image`, `enabled_video`, `view_user_name`, `view_user_addr`, `view_user_tel`, `enabled_item`, `enabled_slider`, `enabled_disp_affiliate`, `enabled_sell_button`, `enabled_fee_bear_buyer`, `enabled_fee_bear_seller`, `enabled_transfer_fee`, `use_googleoauth`, `googleoauth_client_id`, `googleoauth_client_secret`, `other_script`, `update_date`, `regist_date`, `enabled_top_map_mode`, `enabled_free_items_mode`, `enabled_shipping_mode`) VALUES
('商品', '10.00', 'info@192.168.55.10', 'フリミー', 'info@192.168.55.10', 'フリミー', '日本テスト銀行', '本店テスト部', 1, '12345678', 'テストメイギ', '', '', '123-456-789', 'info@example.com', '', '', 'スキマ,スキル販売,特技販売,特技売る,スキル購入,個人売買,出品,副業,ライティング,デザイン,イラスト', 'https://elefantinc.com/ccsystem', '', '', '', '', '最短3分で出品できる。かんたんにスキルの販売ができるスキマ時間サイト。自分の特技・スキルを初心者でも販売できます。出品手数料無料です。販売したときのに料金が掛かるので安心して無料で掲載できます。', 1, 'pk_test_qhLyjrvQz7KmWpBKifi7Ec1T008VUihE5g', 'sk_test_61eAquFENkY4wjjuAlsFegsk004rWs1Hv0', 'prod_Mfaa6Rl5KkJqXf', '3.60', 500, '10.00', 100, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, '1026451917120-3nj44c8f7tqvu3ili5bda0uubofl39f3.apps.googleusercontent.com', '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', '', '2022-10-24 03:08:57', '2020-04-07 05:20:26', '', '', '0');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_type`
--

CREATE TABLE `frema_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL,
  `commission_rate` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_type`
--

INSERT INTO `frema_type` (`id`, `name`, `enabled`, `price`, `commission_rate`, `number`, `regist_date`, `update_date`) VALUES
(1, '法人', 1, 0, 8, 2, '2017-04-17 22:18:58', '2017-04-17 22:18:58'),
(2, '個人', 1, 0, 8, 1, '2017-04-17 22:18:58', '2017-04-17 22:18:58');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_user`
--

CREATE TABLE `frema_user` (
  `id` int(11) NOT NULL,
  `hash_id` varchar(20) NOT NULL,
  `password` varchar(150) NOT NULL,
  `email` varchar(190) NOT NULL,
  `ipaddr` varchar(16) DEFAULT NULL,
  `nickname` varchar(250) NOT NULL,
  `name` varchar(50) NOT NULL,
  `name_kana` varchar(100) NOT NULL,
  `company` varchar(200) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `pref` int(11) DEFAULT NULL,
  `financial_institution_name` varchar(50) NOT NULL DEFAULT '' COMMENT '???Z?@?֖?',
  `branch_name` varchar(50) NOT NULL DEFAULT '' COMMENT '?x?X??',
  `deposit_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '?a??????',
  `account_number` varchar(10) NOT NULL DEFAULT '' COMMENT '?????ԍ?',
  `account_holder` varchar(50) NOT NULL DEFAULT '' COMMENT '???????`',
  `self_pr` text DEFAULT '',
  `type` int(11) DEFAULT NULL,
  `shop` tinyint(1) DEFAULT 0,
  `buying` tinyint(1) DEFAULT 1,
  `selling` tinyint(1) DEFAULT 1,
  `send_use` tinyint(1) DEFAULT NULL,
  `settle_plan` int(11) NOT NULL DEFAULT 1,
  `identification` tinyint(4) NOT NULL DEFAULT 0,
  `introducer_id` int(11) DEFAULT NULL,
  `introduction_status` tinyint(1) DEFAULT 0,
  `introduction_price` int(11) DEFAULT 0,
  `monthly_video_price` int(11) DEFAULT 0,
  `stripe_price_id` varchar(50) DEFAULT NULL,
  `kobutsu_name` varchar(100) DEFAULT NULL,
  `kobutsu_kouan_name` varchar(100) DEFAULT NULL,
  `kobutsu_number` varchar(20) DEFAULT NULL,
  `google_user_id` varchar(64) DEFAULT NULL,
  `google_icon_url` varchar(250) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `invalid` tinyint(1) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `frema_user`
--

INSERT INTO `frema_user` (`id`, `hash_id`, `password`, `email`, `ipaddr`, `nickname`, `name`, `name_kana`, `company`, `tel`, `addr`, `zip`, `pref`, `financial_institution_name`, `branch_name`, `deposit_type`, `account_number`, `account_holder`, `self_pr`, `type`, `shop`, `buying`, `selling`, `send_use`, `settle_plan`, `identification`, `introducer_id`, `introduction_status`, `introduction_price`, `monthly_video_price`, `stripe_price_id`, `kobutsu_name`, `kobutsu_kouan_name`, `kobutsu_number`, `google_user_id`, `google_icon_url`, `admin`, `enabled`, `invalid`, `regist_date`, `update_date`) VALUES
(1, 'a8dbee27', '$2y$10$sFzGuCLpN2Kc4OS173u3UeDq8INHiiKiYgfJYZLAZ197XeHoxeXHu', 'admin@example.com', '192.168.55.1', 'かんり', 'システム管理者', 'システムカンリシャ', NULL, '12-3456-7890', '東京都中央区1-2-3', '123-0000', 13, 'テスト企業', 'テスト支店', 1, '1234567890', 'テストタロウ', '', 1, 1, 1, 1, NULL, 1, 1, NULL, 0, 0, 0, 'price_1LwH3SHcKklSsoCeYh7HpQo8', NULL, NULL, NULL, NULL, NULL, 1, 1, 0, '2022-10-24 01:19:45', '2022-10-24 03:10:22'),
(2, 'c23ef094', '$2y$10$kwrBKfArb9oWI7WDxRE1ceExbpAEPczTOOyfsQDenRmOcDwassB7C', 'test@example.com', '192.168.55.1', '', '山田太郎', 'ヤマダタロウ', NULL, NULL, NULL, NULL, NULL, '', '', 0, '', '', '', NULL, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2022-10-24 01:27:29', '2022-10-24 01:27:39');

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_video`
--

CREATE TABLE `frema_video` (
  `group_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `hash_key` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `frema_video_group`
--

CREATE TABLE `frema_video_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `price` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `access_count` int(11) NOT NULL DEFAULT 0,
  `regist_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `frema_block_access`
--
ALTER TABLE `frema_block_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frema_block_access_idx1` (`user_id`,`block_user_id`),
  ADD KEY `frema_block_access_idx2` (`block_user_id`);

--
-- テーブルのインデックス `frema_card_info`
--
ALTER TABLE `frema_card_info`
  ADD PRIMARY KEY (`user_id`);

--
-- テーブルのインデックス `frema_carriage_plan`
--
ALTER TABLE `frema_carriage_plan`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_carriage_type`
--
ALTER TABLE `frema_carriage_type`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_cash_flow`
--
ALTER TABLE `frema_cash_flow`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_category`
--
ALTER TABLE `frema_category`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_delivery_type`
--
ALTER TABLE `frema_delivery_type`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_evaluate`
--
ALTER TABLE `frema_evaluate`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_favorites`
--
ALTER TABLE `frema_favorites`
  ADD PRIMARY KEY (`user_id`,`item_id`);

--
-- テーブルのインデックス `frema_free_input_item_value`
--
ALTER TABLE `frema_free_input_item_value`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_good`
--
ALTER TABLE `frema_good`
  ADD PRIMARY KEY (`item_id`,`user_id`);

--
-- テーブルのインデックス `frema_information`
--
ALTER TABLE `frema_information`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_invoice`
--
ALTER TABLE `frema_invoice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frema_invoice_idx1` (`user_id`,`month`);

--
-- テーブルのインデックス `frema_invoice_details`
--
ALTER TABLE `frema_invoice_details`
  ADD PRIMARY KEY (`order_id`);

--
-- テーブルのインデックス `frema_item`
--
ALTER TABLE `frema_item`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_item_free_input`
--
ALTER TABLE `frema_item_free_input`
  ADD PRIMARY KEY (`item_id`,`free_input_item_id`);

--
-- テーブルのインデックス `frema_item_free_input_tmp`
--
ALTER TABLE `frema_item_free_input_tmp`
  ADD PRIMARY KEY (`item_id`,`free_input_item_id`);

--
-- テーブルのインデックス `frema_item_photo`
--
ALTER TABLE `frema_item_photo`
  ADD PRIMARY KEY (`item_id`,`number`);

--
-- テーブルのインデックス `frema_item_state`
--
ALTER TABLE `frema_item_state`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_item_tmp`
--
ALTER TABLE `frema_item_tmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frema_item_tmp_idx01` (`owner_id`) USING BTREE;

--
-- テーブルのインデックス `frema_login_session`
--
ALTER TABLE `frema_login_session`
  ADD PRIMARY KEY (`hash_key`);

--
-- テーブルのインデックス `frema_mail_history`
--
ALTER TABLE `frema_mail_history`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_mail_history_target`
--
ALTER TABLE `frema_mail_history_target`
  ADD PRIMARY KEY (`mail_history_id`,`user_id`);

--
-- テーブルのインデックス `frema_monthly_payment_agreement`
--
ALTER TABLE `frema_monthly_payment_agreement`
  ADD PRIMARY KEY (`user_id`,`seller_id`);

--
-- テーブルのインデックス `frema_monthly_payment_plan`
--
ALTER TABLE `frema_monthly_payment_plan`
  ADD PRIMARY KEY (`stripe_price_id`),
  ADD UNIQUE KEY `frema_monthly_payment_plan_idx1` (`user_id`,`price`,`system_commision_buyer`,`system_commision_seller`,`settlement_commision_buyer`,`settlement_commision_seller`);

--
-- テーブルのインデックス `frema_negotiation`
--
ALTER TABLE `frema_negotiation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`,`user_id`);

--
-- テーブルのインデックス `frema_order`
--
ALTER TABLE `frema_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frema_order_idx1` (`item_id`);

--
-- テーブルのインデックス `frema_order_number`
--
ALTER TABLE `frema_order_number`
  ADD PRIMARY KEY (`order_number`);

--
-- テーブルのインデックス `frema_payout_history`
--
ALTER TABLE `frema_payout_history`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_pr`
--
ALTER TABLE `frema_pr`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_pref`
--
ALTER TABLE `frema_pref`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_request`
--
ALTER TABLE `frema_request`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_request_follow`
--
ALTER TABLE `frema_request_follow`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_settle_plan`
--
ALTER TABLE `frema_settle_plan`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_slider`
--
ALTER TABLE `frema_slider`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_sns`
--
ALTER TABLE `frema_sns`
  ADD PRIMARY KEY (`user_id`);

--
-- テーブルのインデックス `frema_stripe_payment`
--
ALTER TABLE `frema_stripe_payment`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_type`
--
ALTER TABLE `frema_type`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `frema_user`
--
ALTER TABLE `frema_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frema_user_idx1` (`email`),
  ADD KEY `frema_user_idx2` (`introducer_id`);

--
-- テーブルのインデックス `frema_video`
--
ALTER TABLE `frema_video`
  ADD PRIMARY KEY (`group_id`,`number`),
  ADD KEY `frema_video_idx1` (`hash_key`);

--
-- テーブルのインデックス `frema_video_group`
--
ALTER TABLE `frema_video_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `frema_video_group_idx1` (`group_key`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `frema_block_access`
--
ALTER TABLE `frema_block_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_carriage_plan`
--
ALTER TABLE `frema_carriage_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `frema_carriage_type`
--
ALTER TABLE `frema_carriage_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `frema_cash_flow`
--
ALTER TABLE `frema_cash_flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_category`
--
ALTER TABLE `frema_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `frema_delivery_type`
--
ALTER TABLE `frema_delivery_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- テーブルの AUTO_INCREMENT `frema_free_input_item_value`
--
ALTER TABLE `frema_free_input_item_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- テーブルの AUTO_INCREMENT `frema_information`
--
ALTER TABLE `frema_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_invoice`
--
ALTER TABLE `frema_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_item`
--
ALTER TABLE `frema_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_item_state`
--
ALTER TABLE `frema_item_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `frema_item_tmp`
--
ALTER TABLE `frema_item_tmp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_mail_history`
--
ALTER TABLE `frema_mail_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_negotiation`
--
ALTER TABLE `frema_negotiation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_order`
--
ALTER TABLE `frema_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_payout_history`
--
ALTER TABLE `frema_payout_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_request`
--
ALTER TABLE `frema_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_request_follow`
--
ALTER TABLE `frema_request_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `frema_user`
--
ALTER TABLE `frema_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `frema_video_group`
--
ALTER TABLE `frema_video_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

