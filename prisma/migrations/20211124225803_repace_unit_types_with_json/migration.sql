/*
  Warnings:

  - You are about to drop the column `common_max` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `common_min` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `common_units` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `heavy_units` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `heavy_value` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `strong_max` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `strong_min` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `strong_units` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `threshold_units` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `threshold_value` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `weak_max` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `weak_min` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `weak_units` on the `RoaDose` table. All the data in the column will be lost.
  - You are about to drop the column `afterglow_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `afterglow_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `afterglow_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `comeup_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `comeup_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `comeup_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `duration_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `duration_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `duration_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `offset_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `offset_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `offset_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `onset_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `onset_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `onset_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `peak_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `peak_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `peak_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `total_max` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `total_min` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the column `total_units` on the `RoaDuration` table. All the data in the column will be lost.
  - You are about to drop the `UnitRange` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UnitValue` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `common` to the `RoaDose` table without a default value. This is not possible if the table is not empty.
  - Added the required column `heavy` to the `RoaDose` table without a default value. This is not possible if the table is not empty.
  - Added the required column `strong` to the `RoaDose` table without a default value. This is not possible if the table is not empty.
  - Added the required column `threshold` to the `RoaDose` table without a default value. This is not possible if the table is not empty.
  - Added the required column `weak` to the `RoaDose` table without a default value. This is not possible if the table is not empty.
  - Added the required column `afterglow` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Added the required column `comeup` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Added the required column `duration` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Added the required column `offset` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Added the required column `onset` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Added the required column `peak` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total` to the `RoaDuration` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `forms` on the `Substance` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "RoaDose" DROP CONSTRAINT "RoaDose_common_min_common_max_common_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDose" DROP CONSTRAINT "RoaDose_heavy_value_heavy_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDose" DROP CONSTRAINT "RoaDose_strong_min_strong_max_strong_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDose" DROP CONSTRAINT "RoaDose_threshold_value_threshold_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDose" DROP CONSTRAINT "RoaDose_weak_min_weak_max_weak_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_afterglow_min_afterglow_max_afterglow_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_comeup_min_comeup_max_comeup_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_duration_min_duration_max_duration_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_offset_min_offset_max_offset_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_onset_min_onset_max_onset_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_peak_min_peak_max_peak_units_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_total_min_total_max_total_units_fkey";

-- AlterTable
ALTER TABLE "RoaDose" DROP COLUMN "common_max",
DROP COLUMN "common_min",
DROP COLUMN "common_units",
DROP COLUMN "heavy_units",
DROP COLUMN "heavy_value",
DROP COLUMN "strong_max",
DROP COLUMN "strong_min",
DROP COLUMN "strong_units",
DROP COLUMN "threshold_units",
DROP COLUMN "threshold_value",
DROP COLUMN "weak_max",
DROP COLUMN "weak_min",
DROP COLUMN "weak_units",
ADD COLUMN     "common" JSONB NOT NULL,
ADD COLUMN     "heavy" JSONB NOT NULL,
ADD COLUMN     "strong" JSONB NOT NULL,
ADD COLUMN     "threshold" JSONB NOT NULL,
ADD COLUMN     "weak" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "RoaDuration" DROP COLUMN "afterglow_max",
DROP COLUMN "afterglow_min",
DROP COLUMN "afterglow_units",
DROP COLUMN "comeup_max",
DROP COLUMN "comeup_min",
DROP COLUMN "comeup_units",
DROP COLUMN "duration_max",
DROP COLUMN "duration_min",
DROP COLUMN "duration_units",
DROP COLUMN "offset_max",
DROP COLUMN "offset_min",
DROP COLUMN "offset_units",
DROP COLUMN "onset_max",
DROP COLUMN "onset_min",
DROP COLUMN "onset_units",
DROP COLUMN "peak_max",
DROP COLUMN "peak_min",
DROP COLUMN "peak_units",
DROP COLUMN "total_max",
DROP COLUMN "total_min",
DROP COLUMN "total_units",
ADD COLUMN     "afterglow" JSONB NOT NULL,
ADD COLUMN     "comeup" JSONB NOT NULL,
ADD COLUMN     "duration" JSONB NOT NULL,
ADD COLUMN     "offset" JSONB NOT NULL,
ADD COLUMN     "onset" JSONB NOT NULL,
ADD COLUMN     "peak" JSONB NOT NULL,
ADD COLUMN     "total" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "Substance" DROP COLUMN "forms",
ADD COLUMN     "forms" JSONB NOT NULL;

-- DropTable
DROP TABLE "UnitRange";

-- DropTable
DROP TABLE "UnitValue";
