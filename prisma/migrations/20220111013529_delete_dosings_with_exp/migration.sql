-- DropForeignKey
ALTER TABLE "Dosing" DROP CONSTRAINT "Dosing_experience_id_fkey";

-- AddForeignKey
ALTER TABLE "Dosing" ADD CONSTRAINT "Dosing_experience_id_fkey" FOREIGN KEY ("experience_id") REFERENCES "Experience"("id") ON DELETE CASCADE ON UPDATE CASCADE;
