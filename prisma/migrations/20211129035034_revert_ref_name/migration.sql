/*
  Warnings:

  - You are about to drop the column `experience_ref` on the `Experience` table. All the data in the column will be lost.
  - The required column `ref` was added to the `Experience` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "Experience" DROP COLUMN "experience_ref",
ADD COLUMN     "ref" UUID NOT NULL;
