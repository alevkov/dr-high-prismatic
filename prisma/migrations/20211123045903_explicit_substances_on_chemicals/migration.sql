/*
  Warnings:

  - You are about to drop the `_ChemicalToSubstance` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ChemicalToSubstance" DROP CONSTRAINT "_ChemicalToSubstance_A_fkey";

-- DropForeignKey
ALTER TABLE "_ChemicalToSubstance" DROP CONSTRAINT "_ChemicalToSubstance_B_fkey";

-- DropTable
DROP TABLE "_ChemicalToSubstance";

-- CreateTable
CREATE TABLE "SubstancesOnChemicals" (
    "chemical_id" INTEGER NOT NULL,
    "substance_id" INTEGER NOT NULL,

    CONSTRAINT "SubstancesOnChemicals_pkey" PRIMARY KEY ("chemical_id","substance_id")
);

-- AddForeignKey
ALTER TABLE "SubstancesOnChemicals" ADD CONSTRAINT "SubstancesOnChemicals_chemical_id_fkey" FOREIGN KEY ("chemical_id") REFERENCES "Chemical"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubstancesOnChemicals" ADD CONSTRAINT "SubstancesOnChemicals_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
