/*
  Warnings:

  - Added the required column `password` to the `LoginAttempt` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "LoginAttempt" ADD COLUMN     "password" VARCHAR(120) NOT NULL;
