-- CreateTable
CREATE TABLE `comfort` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `comfortPlusHouse` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `house_id` INTEGER UNSIGNED NULL,
    `comfort_id` INTEGER UNSIGNED NULL,
    `status` ENUM('true', 'false') NULL,

    INDEX `comfort_id`(`comfort_id`),
    INDEX `house_id`(`house_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hotel` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `address` VARCHAR(100) NULL,
    `roomN` SMALLINT UNSIGNED NULL,
    `placeN` SMALLINT UNSIGNED NULL,
    `description` VARCHAR(250) NULL,
    `contact_inf` VARCHAR(50) NULL,

    INDEX `idx_hotel_name`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `house` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `address` VARCHAR(100) NULL,
    `name` VARCHAR(50) NULL,
    `roomN` SMALLINT UNSIGNED NULL,
    `placeN` SMALLINT UNSIGNED NULL,
    `description` VARCHAR(250) NULL,
    `contact_inf` VARCHAR(50) NULL,
    `status` ENUM('free', 'occupied') NULL,
    `price` SMALLINT UNSIGNED NULL,

    INDEX `idx_house_num`(`roomN`, `placeN`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payCheck` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `reservation_id` INTEGER UNSIGNED NULL,
    `sum` SMALLINT UNSIGNED NULL,
    `date` DATETIME(0) NULL,
    `payType` ENUM('cash', 'debit_card', 'online_wallet') NULL,

    INDEX `reservation_id`(`reservation_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `photo` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `room_id` INTEGER UNSIGNED NULL,
    `hotel_id` INTEGER UNSIGNED NULL,
    `house_id` INTEGER UNSIGNED NULL,
    `photo` MEDIUMBLOB NULL,

    INDEX `hotel_id`(`hotel_id`),
    INDEX `house_id`(`house_id`),
    INDEX `room_id`(`room_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reservation` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NULL,
    `object_id` INTEGER NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `status` ENUM('active', 'denied', 'end') NULL,
    `sum` SMALLINT UNSIGNED NULL,

    INDEX `object_id`(`object_id`),
    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reservation_object` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `house_id` INTEGER UNSIGNED NULL,
    `room_id` INTEGER UNSIGNED NULL,

    INDEX `house_id`(`house_id`),
    INDEX `room_id`(`room_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `review` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NULL,
    `object_id` INTEGER NULL,
    `rate` TINYINT NULL,
    `text` VARCHAR(250) NULL,
    `date` DATETIME(0) NULL,

    INDEX `object_id`(`object_id`),
    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `room` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `hotel_id` INTEGER UNSIGNED NULL,
    `placeN` SMALLINT UNSIGNED NULL,
    `status` ENUM('free', 'occupied') NULL,
    `description` VARCHAR(250) NULL,
    `price` SMALLINT UNSIGNED NULL,

    INDEX `hotel_id`(`hotel_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `email` VARCHAR(50) NULL,
    `password` VARCHAR(50) NULL,
    `role_id` INTEGER UNSIGNED NULL,

    UNIQUE INDEX `email`(`email`),
    INDEX `role_id`(`role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `comfortPlusHouse` ADD CONSTRAINT `comfortPlusHouse_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `comfortPlusHouse` ADD CONSTRAINT `comfortPlusHouse_ibfk_2` FOREIGN KEY (`comfort_id`) REFERENCES `comfort`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `payCheck` ADD CONSTRAINT `payCheck_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `photo` ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `photo` ADD CONSTRAINT `photo_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `photo` ADD CONSTRAINT `photo_ibfk_3` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `reservation_object`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation_object` ADD CONSTRAINT `reservation_object_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation_object` ADD CONSTRAINT `reservation_object_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `reservation_object`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `room` ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

