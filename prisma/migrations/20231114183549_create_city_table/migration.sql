-- AlterTable
ALTER TABLE `hotel` ADD COLUMN `cityId` INTEGER UNSIGNED NULL;

-- AlterTable
ALTER TABLE `house` ADD COLUMN `cityId` INTEGER UNSIGNED NULL;

-- CreateTable
CREATE TABLE `city` (
    `cityId` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(100) NULL,
    `name` VARCHAR(100) NULL,

    INDEX `idx_city`(`name`, `country`),
    PRIMARY KEY (`cityId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `hotel` ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city`(`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `house` ADD CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city`(`cityId`) ON DELETE CASCADE ON UPDATE NO ACTION;
