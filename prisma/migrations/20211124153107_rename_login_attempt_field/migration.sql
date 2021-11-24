/*
  Warnings:

  - You are about to drop the column `password` on the `LoginAttempt` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "LoginAttempt" DROP COLUMN "password",
ADD COLUMN     "token" VARCHAR;
