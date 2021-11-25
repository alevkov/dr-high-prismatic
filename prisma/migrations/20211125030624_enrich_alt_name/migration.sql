/*
  Warnings:

  - Added the required column `brand` to the `AlternativeName` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `AlternativeName` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "AlternativeNameType" AS ENUM ('Slang', 'Pharmaceutical', 'Chemical');

-- AlterTable
ALTER TABLE "AlternativeName" ADD COLUMN     "brand" BOOLEAN NOT NULL,
ADD COLUMN     "type" "AlternativeNameType" NOT NULL;
