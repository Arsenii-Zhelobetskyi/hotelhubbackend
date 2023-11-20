/*
  Warnings:

  - You are about to alter the column `photo` on the `hotel` table. The data in that column could be lost. The data in that column will be cast from `VarChar(250)` to `Json`.

*/
-- AlterTable
ALTER TABLE `hotel` MODIFY `photo` JSON NULL;
