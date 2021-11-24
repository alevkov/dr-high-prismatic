/*
  Warnings:

  - You are about to drop the column `dose_units` on the `Dosing` table. All the data in the column will be lost.
  - You are about to drop the column `dose_value` on the `Dosing` table. All the data in the column will be lost.
  - You are about to drop the column `place_slug` on the `Experience` table. All the data in the column will be lost.
  - You are about to drop the column `bioavailability_max` on the `Roa` table. All the data in the column will be lost.
  - You are about to drop the column `bioavailability_min` on the `Roa` table. All the data in the column will be lost.
  - You are about to drop the column `half_life_max` on the `Roa` table. All the data in the column will be lost.
  - You are about to drop the column `half_life_min` on the `Roa` table. All the data in the column will be lost.
  - You are about to drop the column `half_life_units` on the `Roa` table. All the data in the column will be lost.
  - You are about to drop the column `form` on the `Substance` table. All the data in the column will be lost.
  - You are about to drop the `Bioavailability` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CrossTolerance` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `dose` to the `Dosing` table without a default value. This is not possible if the table is not empty.
  - Added the required column `place` to the `Experience` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bioavailability` to the `Roa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `half_life` to the `Roa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cross_tolerances` to the `Substance` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `interactions` on the `Substance` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Biometric" DROP CONSTRAINT "Biometric_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Dosing" DROP CONSTRAINT "Dosing_dose_value_dose_units_fkey";

-- DropForeignKey
ALTER TABLE "Experience" DROP CONSTRAINT "Experience_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Roa" DROP CONSTRAINT "Roa_bioavailability_min_bioavailability_max_fkey";

-- DropForeignKey
ALTER TABLE "Roa" DROP CONSTRAINT "Roa_half_life_min_half_life_max_half_life_units_fkey";

-- DropIndex
DROP INDEX "Roa_bioavailability_min_bioavailability_max_key";

-- DropIndex
DROP INDEX "Roa_half_life_min_half_life_max_half_life_units_key";

-- AlterTable
ALTER TABLE "Dosing" DROP COLUMN "dose_units",
DROP COLUMN "dose_value",
ADD COLUMN     "dose" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "Experience" DROP COLUMN "place_slug",
ADD COLUMN     "place" VARCHAR(128) NOT NULL;

-- AlterTable
ALTER TABLE "Roa" DROP COLUMN "bioavailability_max",
DROP COLUMN "bioavailability_min",
DROP COLUMN "half_life_max",
DROP COLUMN "half_life_min",
DROP COLUMN "half_life_units",
ADD COLUMN     "bioavailability" JSONB NOT NULL,
ADD COLUMN     "half_life" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "Substance" DROP COLUMN "form",
ADD COLUMN     "cross_tolerances" JSONB NOT NULL,
ADD COLUMN     "forms" "form"[],
DROP COLUMN "interactions",
ADD COLUMN     "interactions" JSONB NOT NULL;

-- DropTable
DROP TABLE "Bioavailability";

-- DropTable
DROP TABLE "CrossTolerance";

-- AddForeignKey
ALTER TABLE "Biometric" ADD CONSTRAINT "Biometric_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
