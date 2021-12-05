/*
  Warnings:

  - You are about to drop the column `ref` on the `Experience` table. All the data in the column will be lost.
  - Added the required column `experience_ref` to the `Experience` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Experience" DROP COLUMN "ref",
ADD COLUMN     "experience_ref" UUID NOT NULL;
