/*
  Warnings:

  - You are about to drop the column `typicalUnits` on the `Substance` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Substance" DROP COLUMN "typicalUnits",
ADD COLUMN     "typical_units" TEXT;
