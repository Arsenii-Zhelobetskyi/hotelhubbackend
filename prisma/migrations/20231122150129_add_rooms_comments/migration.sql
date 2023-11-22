-- CreateTable
CREATE TABLE `rooms_comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NULL,
    `body` VARCHAR(150) NULL,
    `rating` INTEGER NOT NULL,
    `date` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `room_id` INTEGER UNSIGNED NOT NULL,

    INDEX `rooms_comments_room_id_fk`(`room_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `rooms_comments` ADD CONSTRAINT `rooms_comments_room_id_fk` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
