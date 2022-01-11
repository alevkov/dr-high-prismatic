-- AlterTable
ALTER TABLE "Experience" ADD COLUMN     "custom_substance_id" TEXT;

-- CreateTable
CREATE TABLE "CustomSubstance" (
    "id" SERIAL NOT NULL,
    "public_id" TEXT NOT NULL,
    "primary_name" TEXT,
    "forms" JSONB,
    "primary_form" TEXT,
    "roas" JSONB,
    "typical_units" TEXT,
    "alternative_names" JSONB,
    "substance_type" TEXT,

    CONSTRAINT "CustomSubstance_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "CustomSubstance_id_uindex" ON "CustomSubstance"("id");
