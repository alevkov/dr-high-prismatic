/*
  Warnings:

  - You are about to drop the column `status` on the `Experience` table. All the data in the column will be lost.
  - You are about to drop the column `toxicity` on the `Substance` table. All the data in the column will be lost.
  - Changed the type of `sex` on the `Biometric` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `roa` on the `Experience` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `toxicities` to the `Substance` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `type` on the `Substance` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `primary_form` on the `Substance` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "ExperienceState" AS ENUM ('Planning', 'Started', 'Completed', 'Reflected');

-- CreateEnum
CREATE TYPE "Form" AS ENUM ('Pill', 'Liquid', 'Botanical', 'Fungus', 'Powder', 'Tab', 'Seed', 'Crystal');

-- CreateEnum
CREATE TYPE "InteractionType" AS ENUM ('LowRiskSynergy', 'LowRiskNoSynergy', 'Dangerous', 'Unpredictable', 'ReverseSynergy');

-- CreateEnum
CREATE TYPE "RoaType" AS ENUM ('Oral', 'Sublingual', 'Buccal', 'Insufflated', 'Rectal', 'Transdermal', 'Subcutaneous', 'Intramuscular', 'Intravenous', 'Intrathecal', 'Smoked', 'Transconjunctival');

-- CreateEnum
CREATE TYPE "Sex" AS ENUM ('Male', 'Female', 'Other');

-- CreateEnum
CREATE TYPE "SubstanceType" AS ENUM ('Cannabinoids', 'Empathogens', 'Stimulants', 'Psychedelics', 'Dissociatives', 'Depressants', 'Deliriants', 'Opioids');

-- CreateEnum
CREATE TYPE "Toxicity" AS ENUM ('Liver', 'Neural');

-- AlterTable
ALTER TABLE "Biometric" DROP COLUMN "sex",
ADD COLUMN     "sex" "Sex" NOT NULL;

-- AlterTable
ALTER TABLE "Experience" DROP COLUMN "status",
ADD COLUMN     "state" "ExperienceState" NOT NULL DEFAULT E'Started',
DROP COLUMN "roa",
ADD COLUMN     "roa" "RoaType" NOT NULL;

-- AlterTable
ALTER TABLE "Substance" DROP COLUMN "toxicity",
ADD COLUMN     "toxicities" JSONB NOT NULL,
DROP COLUMN "type",
ADD COLUMN     "type" "SubstanceType" NOT NULL,
DROP COLUMN "primary_form",
ADD COLUMN     "primary_form" "Form" NOT NULL;

-- DropEnum
DROP TYPE "experiencestate";

-- DropEnum
DROP TYPE "form";

-- DropEnum
DROP TYPE "interactiontype";

-- DropEnum
DROP TYPE "roatype";

-- DropEnum
DROP TYPE "sex";

-- DropEnum
DROP TYPE "substancetype";

-- DropEnum
DROP TYPE "toxicity";
