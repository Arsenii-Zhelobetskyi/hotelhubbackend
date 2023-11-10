/*
  Warnings:

  - You are about to drop the `photo` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `comfortPlusHouse` DROP FOREIGN KEY `comfortPlusHouse_ibfk_1`;

-- DropForeignKey
ALTER TABLE `comfortPlusHouse` DROP FOREIGN KEY `comfortPlusHouse_ibfk_2`;

-- DropForeignKey
ALTER TABLE `payCheck` DROP FOREIGN KEY `payCheck_ibfk_1`;

-- DropForeignKey
ALTER TABLE `photo` DROP FOREIGN KEY `photo_ibfk_1`;

-- DropForeignKey
ALTER TABLE `photo` DROP FOREIGN KEY `photo_ibfk_2`;

-- DropForeignKey
ALTER TABLE `photo` DROP FOREIGN KEY `photo_ibfk_3`;

-- DropForeignKey
ALTER TABLE `reservation` DROP FOREIGN KEY `reservation_ibfk_1`;

-- DropForeignKey
ALTER TABLE `reservation` DROP FOREIGN KEY `reservation_ibfk_2`;

-- DropForeignKey
ALTER TABLE `reservation_object` DROP FOREIGN KEY `reservation_object_ibfk_1`;

-- DropForeignKey
ALTER TABLE `reservation_object` DROP FOREIGN KEY `reservation_object_ibfk_2`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `review_ibfk_1`;

-- DropForeignKey
ALTER TABLE `review` DROP FOREIGN KEY `review_ibfk_2`;

-- DropForeignKey
ALTER TABLE `room` DROP FOREIGN KEY `room_ibfk_1`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_ibfk_1`;

-- AlterTable
ALTER TABLE `hotel` ADD COLUMN `photo` VARCHAR(250) NULL;

-- DropTable
DROP TABLE `photo`;

-- CreateTable
CREATE TABLE `housePhoto` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `house_id` INTEGER UNSIGNED NULL,
    `photo` TEXT NULL,

    INDEX `house_id`(`house_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `order_date` DATE NULL,
    `total_amount` DECIMAL(10, 2) NULL,
    `user_id` INTEGER UNSIGNED NULL,

    INDEX `user_id`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roomPhoto` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `room_id` INTEGER UNSIGNED NULL,
    `photo` TEXT NULL,

    INDEX `room_id`(`room_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `comfortPlusHouse` ADD CONSTRAINT `comfortPlusHouse_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `comfortPlusHouse` ADD CONSTRAINT `comfortPlusHouse_ibfk_2` FOREIGN KEY (`comfort_id`) REFERENCES `comfort`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `payCheck` ADD CONSTRAINT `payCheck_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation` ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `reservation_object`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation_object` ADD CONSTRAINT `reservation_object_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `reservation_object` ADD CONSTRAINT `reservation_object_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `review` ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `reservation_object`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `room` ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `housePhoto` ADD CONSTRAINT `housePhoto_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `order_history` ADD CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `roomPhoto` ADD CONSTRAINT `roomPhoto_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
