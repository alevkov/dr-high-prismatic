/*
  Warnings:

  - You are about to drop the `_ExperienceToSubstance` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `substance_id` to the `Experience` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_ExperienceToSubstance" DROP CONSTRAINT "_ExperienceToSubstance_A_fkey";

-- DropForeignKey
ALTER TABLE "_ExperienceToSubstance" DROP CONSTRAINT "_ExperienceToSubstance_B_fkey";

-- AlterTable
ALTER TABLE "Experience" ADD COLUMN     "substance_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "_ExperienceToSubstance";

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
