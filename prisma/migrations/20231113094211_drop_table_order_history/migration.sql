/*
  Warnings:

  - You are about to drop the `order_history` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `order_history` DROP FOREIGN KEY `order_history_ibfk_1`;

-- DropTable
DROP TABLE `order_history`;
