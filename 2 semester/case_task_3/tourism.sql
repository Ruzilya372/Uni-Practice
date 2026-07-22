-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20260706.3e756d69dd
-- https://www.phpmyadmin.net/
--
-- Хост: 192.168.30.23
-- Время создания: Июл 22 2026 г., 14:57
-- Версия сервера: 8.0.18
-- Версия PHP: 8.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tourism`
--

-- --------------------------------------------------------

--
-- Структура таблицы `insurances`
--

CREATE TABLE `insurances` (
  `id_insurance` int(11) NOT NULL,
  `insurance_type` varchar(100) NOT NULL,
  `company` varchar(200) NOT NULL,
  `coverage_amount` decimal(10,2) NOT NULL,
  `validity_days` int(11) DEFAULT '30',
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `insurances`
--

INSERT INTO `insurances` (`id_insurance`, `insurance_type`, `company`, `coverage_amount`, `validity_days`, `price`) VALUES
(1, 'Медицинская страховка', 'СОГАЗ', 50000.00, 30, 2000.00),
(2, 'Страховка от несчастных случаев', 'Ингосстрах', 100000.00, 30, 3500.00),
(3, 'Медицинская страховка расширенная', 'Ренессанс', 75000.00, 45, 3000.00),
(4, 'Страховка багажа', 'АльфаСтрахование', 30000.00, 15, 1500.00),
(5, 'Страховка от отмены поездки', 'ВСК', 150000.00, 60, 5000.00);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_tourist` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `id_service` int(11) DEFAULT NULL,
  `id_insurance` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `travel_date` date NOT NULL,
  `count_people` int(11) NOT NULL DEFAULT '1',
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'новый',
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id_order`, `id_tourist`, `id_tour`, `id_service`, `id_insurance`, `order_date`, `travel_date`, `count_people`, `total_price`, `status`, `comment`) VALUES
(1, 1, 1, 1, 1, '2024-06-01', '2026-08-15', 2, 97000.00, 'подтверждён', 'Номер с видом на море'),
(2, 2, 2, 2, 2, '2024-06-05', '2026-09-20', 3, 270500.00, 'оплачен', 'Экскурсии включены'),
(3, 1, 3, NULL, 3, '2024-06-10', '2026-12-10', 1, 123000.00, 'новый', 'Один из Альп'),
(4, 3, 1, 4, 1, '2024-06-15', '2026-07-01', 4, 185000.00, 'подтверждён', 'Семейный номер'),
(5, 4, 4, 5, NULL, '2024-06-20', '2026-07-15', 2, 78000.00, 'новый', NULL),
(6, 5, 5, 3, 4, '2024-06-25', '2026-08-01', 2, 412000.00, 'оплачен', 'Романтический тур'),
(7, 2, 3, NULL, 5, '2024-07-01', '2026-12-20', 2, 250000.00, 'новый', 'Новогодний тур');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id_service` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id_service`, `name`, `description`, `price`, `category`) VALUES
(1, 'Трансфер из аэропорта', 'Встреча в аэропорту и доставка до отеля', 3000.00, 'транспорт'),
(2, 'Обзорная экскурсия по городу', 'Экскурсия с гидом на автобусе', 5000.00, 'экскурсия'),
(3, 'Дополнительное питание', 'Обеды и ужины в ресторане отеля', 7000.00, 'питание'),
(4, 'Аренда автомобиля', 'Автомобиль бизнес-класса на время отдыха', 15000.00, 'транспорт'),
(5, 'Визовая поддержка', 'Оформление визы, консультация', 4000.00, 'документы'),
(6, 'Страховка от отмены поездки', 'Страхование рисков отмены тура', 2000.00, 'страхование');

-- --------------------------------------------------------

--
-- Структура таблицы `tourists`
--

CREATE TABLE `tourists` (
  `id_tourist` int(11) NOT NULL,
  `fio` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `passport` varchar(20) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tourists`
--

INSERT INTO `tourists` (`id_tourist`, `fio`, `phone`, `email`, `passport`, `birth_date`, `registration_date`) VALUES
(1, 'Иванов Иван Иванович', '+7-999-123-45-67', 'ivanov@mail.ru', '1234-567890', '1990-05-15', '2024-01-10'),
(2, 'Петрова Мария Сергеевна', '+7-999-234-56-78', 'petrova@mail.ru', '2345-678901', '1985-08-20', '2024-02-15'),
(3, 'Сидоров Алексей Петрович', '+7-999-345-67-89', 'sidorov@mail.ru', '3456-789012', '1995-12-10', '2024-03-01'),
(4, 'Козлова Екатерина Дмитриевна', '+7-999-456-78-90', 'kozlova@mail.ru', '4567-890123', '1992-07-25', '2024-04-05'),
(5, 'Морозов Денис Андреевич', '+7-999-567-89-01', 'morozov@mail.ru', '5678-901234', '1988-11-30', '2024-05-12');

-- --------------------------------------------------------

--
-- Структура таблицы `tours`
--

CREATE TABLE `tours` (
  `id_tour` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text,
  `duration` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `hotel` varchar(200) DEFAULT NULL,
  `max_people` int(11) DEFAULT '2',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tours`
--

INSERT INTO `tours` (`id_tour`, `name`, `description`, `duration`, `price`, `country`, `city`, `hotel`, `max_people`, `is_active`) VALUES
(1, 'Отдых в Турции', 'Всё включено, пляж, бассейн, анимация', 7, 45000.00, 'Турция', 'Анталия', 'Sunny Beach Resort', 4, 1),
(2, 'Экскурсионный тур в Италию', 'Рим, Флоренция, Венеция, экскурсии с гидом', 10, 85000.00, 'Италия', 'Рим', 'Grand Hotel Roma', 6, 1),
(3, 'Горнолыжный курорт в Швейцарии', 'Швейцарские Альпы, горнолыжные трассы', 5, 120000.00, 'Швейцария', 'Церматт', 'Alpine Resort', 3, 1),
(4, 'Тур по Золотому кольцу', 'Древние города России, музеи, храмы', 8, 35000.00, 'Россия', 'Москва', 'Золотое кольцо отель', 8, 1),
(5, 'Отдых на Мальдивах', 'Островной курорт, дайвинг, спа', 12, 200000.00, 'Мальдивы', 'Мале', 'Paradise Island Resort', 2, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id_insurance`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_tourist` (`id_tourist`),
  ADD KEY `id_tour` (`id_tour`),
  ADD KEY `id_service` (`id_service`),
  ADD KEY `id_insurance` (`id_insurance`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`);

--
-- Индексы таблицы `tourists`
--
ALTER TABLE `tourists`
  ADD PRIMARY KEY (`id_tourist`),
  ADD UNIQUE KEY `passport` (`passport`);

--
-- Индексы таблицы `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id_tour`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id_insurance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `tourists`
--
ALTER TABLE `tourists`
  MODIFY `id_tourist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tours`
--
ALTER TABLE `tours`
  MODIFY `id_tour` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourists` (`id_tourist`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_tour`) REFERENCES `tours` (`id_tour`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`id_insurance`) REFERENCES `insurances` (`id_insurance`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
