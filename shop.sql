-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2017 at 11:38 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `sort_order`, `status`) VALUES
(1, 'Рубашки', 1, 1),
(2, 'Платья', 2, 1),
(3, 'Футболки', 3, 1),
(4, 'Брюки', 4, 1),
(5, 'Сумки', 5, 1),
(6, 'Пиджаки', 6, 1),
(7, 'Майки', 7, 1),
(8, 'Галстуки', 8, 1),
(9, 'Очки', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `price` float UNSIGNED NOT NULL,
  `availability` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/upload/images/products/no-image.png',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `is_recommended` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand`, `image`, `description`, `is_new`, `is_recommended`, `status`) VALUES
(1, 'Вафля необычная', 3, 666, 100, 1, 'ФедрКомпани', '/template/images/home/product1.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 1, 1, 1),
(2, 'Зевс настольный', 2, 321, 100, 1, 'Олимп', '/template/images/home/product2.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 1, 1),
(3, 'Ауди', 3, 54232, 999.99, 1, 'Ауди моторс', '/template/images/home/product3.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(4, 'Сони Хпериа Ч', 4, 666666, 1024, 1, 'Сони', '/template/images/home/product4.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 1, 1),
(5, 'Кошка', 6, 111, 123.12, 1, 'Дом', '/template/images/home/product5.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 1, 0, 1),
(6, 'Вафля обычная', 1, 123, 55.4, 1, 'Абибас', '/template/images/home/product1.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(7, 'Зевс настольный', 2, 321, 100, 1, 'Олимп', '/template/images/home/product2.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(8, 'Ауди', 3, 54232, 999.99, 1, 'Ауди моторс', '/template/images/home/product3.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(9, 'Сони Хпериа Ч', 4, 666666, 1024, 1, 'Сони', '/template/images/home/product4.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(10, 'Кошка', 6, 111, 123.12, 1, 'Дом', '/template/images/home/product5.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 1, 0, 1),
(11, 'Вафля обычная', 1, 123, 55.4, 1, 'Абибас', '/template/images/home/product1.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 1, 1),
(12, 'Зевс настольный', 2, 321, 100, 1, 'Олимп', '/template/images/home/product2.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(13, 'Ауди', 3, 54232, 999.99, 1, 'Ауди моторс', '/template/images/home/product3.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(14, 'Сони Хпериа Ч', 4, 666666, 1024, 1, 'Сони', '/template/images/home/product4.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(15, 'Кошка', 6, 111, 123.12, 1, 'Дом', '/template/images/home/product5.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 1, 1, 1),
(16, 'Вафля обычная', 1, 123, 55.4, 1, 'Абибас', '/template/images/home/product1.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(17, 'Зевс настольный', 2, 321, 100, 1, 'Олимп', '/template/images/home/product2.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(18, 'Ауди', 3, 54232, 999.99, 1, 'Ауди моторс', '/template/images/home/product3.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 1, 1),
(19, 'Сони Хпериа Ч', 4, 666666, 1024, 1, 'Сони', '/template/images/home/product4.jpg', 'Banjo coloring book man braid schlitz, swag church-key echo park gastropub fashion axe kogi brunch polaroid microdosing gochujang cold-pressed. Mlkshk vinyl VHS leggings, listicle direct trade seitan hell of 90\'s kickstarter echo park. Flexitarian banjo migas kickstarter small batch, fashion axe lomo williamsburg prism man bun heirloom jianbing. Tattooed bushwick coloring book dreamcatcher, tumeric humblebrag mixtape actually williamsburg single-origin coffee vegan. Green juice yr chicharrones, crucifix whatever taxidermy listicle fap normcore etsy. Pickled fingerstache freegan narwhal williamsburg. Farm-to-table austin hammock XOXO flannel selfies.\r\n\r\nTousled hammock tumeric waistcoat tacos gluten-free. Tilde health goth distillery synth cardigan swag. Waistcoat bicycle rights sriracha twee +1 retro. Church-key green juice vexillologist shoreditch. Readymade typewriter la croix master cleanse coloring book, seitan prism raw denim dreamcatcher keytar street art 90\'s mlkshk edison bulb. +1 ugh offal salvia, thundercats 8-bit glossier pinterest four dollar toast jean shorts pickled cornhole pug letterpress. Neutra chambray la croix selfies, four dollar toast viral you probably haven\'t heard of them post-ironic forage small batch vaporware coloring book.', 0, 0, 1),
(22, 'feaf', 3, 123, 321, 1, 'grsgsr', '/upload/images/products/no-image.png', 'яияияв', 1, 1, 1),
(23, 'feafae', 1, 123, 321312, 1, 'gsgsr', '/upload/images/products/no-image.png', 'grsgsr', 1, 1, 1),
(24, 'feafeaf', 1, 123, 325425, 1, 'gsrg', '/upload/images/products/no-image.png', 'faefeaea', 1, 1, 1),
(25, 'faefaef g', 1, 1234, 4253, 1, 'g rg', '/upload/images/products/no-image.png', 'gsrg sr s', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `products` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `user_name`, `user_phone`, `user_comment`, `user_id`, `products`, `date`, `status`) VALUES
(2, 'Василий', '88005555555', 'Давай по бырому привози', 0, '{"19":1,"15":1,"12":1}', '2017-01-23 09:04:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
