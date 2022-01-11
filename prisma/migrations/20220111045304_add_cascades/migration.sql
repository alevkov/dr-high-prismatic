-- DropForeignKey
ALTER TABLE "AlternativeName" DROP CONSTRAINT "AlternativeName_substance_id_fkey";

-- DropForeignKey
ALTER TABLE "Roa" DROP CONSTRAINT "Roa_substance_id_fkey";

-- DropForeignKey
ALTER TABLE "RoaDose" DROP CONSTRAINT "RoaDose_roa_id_fkey";

-- DropForeignKey
ALTER TABLE "RoaDuration" DROP CONSTRAINT "RoaDuration_roa_id_fkey";

-- DropForeignKey
ALTER TABLE "SubstancesOnChemicals" DROP CONSTRAINT "SubstancesOnChemicals_chemical_id_fkey";

-- DropForeignKey
ALTER TABLE "SubstancesOnChemicals" DROP CONSTRAINT "SubstancesOnChemicals_substance_id_fkey";

-- AddForeignKey
ALTER TABLE "AlternativeName" ADD CONSTRAINT "AlternativeName_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roa" ADD CONSTRAINT "Roa_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_roa_id_fkey" FOREIGN KEY ("roa_id") REFERENCES "Roa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_roa_id_fkey" FOREIGN KEY ("roa_id") REFERENCES "Roa"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubstancesOnChemicals" ADD CONSTRAINT "SubstancesOnChemicals_chemical_id_fkey" FOREIGN KEY ("chemical_id") REFERENCES "Chemical"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubstancesOnChemicals" ADD CONSTRAINT "SubstancesOnChemicals_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE CASCADE ON UPDATE CASCADE;
