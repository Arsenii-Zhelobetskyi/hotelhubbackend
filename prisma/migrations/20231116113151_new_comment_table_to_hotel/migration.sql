-- CreateTable
CREATE TABLE `hotels_comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NULL,
    `body` VARCHAR(150) NULL,
    `rating` INTEGER NOT NULL,
    `date` DATETIME(0) NOT NULL DEFAULT (curdate()),
    `hotel_id` INTEGER UNSIGNED NOT NULL,

    INDEX `hotels_comments_hotel_id_fk`(`hotel_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `hotels_comments` ADD CONSTRAINT `hotels_comments_hotel_id_fk` FOREIGN KEY (`hotel_id`) REFERENCES `hotel`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
