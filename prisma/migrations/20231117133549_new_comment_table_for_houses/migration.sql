-- CreateTable
CREATE TABLE `houses_comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NULL,
    `body` VARCHAR(150) NULL,
    `rating` INTEGER NOT NULL,
    `date` DATETIME(0) NOT NULL DEFAULT (curdate()),
    `house_id` INTEGER UNSIGNED NOT NULL,

    INDEX `houses_comments_house_id_fk`(`house_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `houses_comments` ADD CONSTRAINT `houses_comments_house_id_fk` FOREIGN KEY (`house_id`) REFERENCES `house`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
