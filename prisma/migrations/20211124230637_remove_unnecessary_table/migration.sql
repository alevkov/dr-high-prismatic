/*
  Warnings:

  - The primary key for the `Dosing` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the `Interaction` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[id]` on the table `Dosing` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id` to the `Dosing` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Dosing" DROP CONSTRAINT "Dosing_pkey",
ADD COLUMN     "id" INTEGER NOT NULL,
ADD CONSTRAINT "Dosing_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Interaction";

-- CreateIndex
CREATE UNIQUE INDEX "Dosing_id_key" ON "Dosing"("id");
