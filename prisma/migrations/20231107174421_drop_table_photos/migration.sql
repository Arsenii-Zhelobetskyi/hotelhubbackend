/*
  Warnings:

  - You are about to drop the `housePhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `roomPhoto` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `housePhoto` DROP FOREIGN KEY `housePhoto_ibfk_1`;

-- DropForeignKey
ALTER TABLE `roomPhoto` DROP FOREIGN KEY `roomPhoto_ibfk_1`;

-- AlterTable
ALTER TABLE `house` ADD COLUMN `photo` JSON NULL;

-- AlterTable
ALTER TABLE `room` ADD COLUMN `photo` JSON NULL;

-- DropTable
DROP TABLE `housePhoto`;

-- DropTable
DROP TABLE `roomPhoto`;
