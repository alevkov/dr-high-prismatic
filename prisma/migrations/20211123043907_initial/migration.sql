-- CreateEnum
CREATE TYPE "experiencestate" AS ENUM ('planning', 'started', 'completed', 'reflected');

-- CreateEnum
CREATE TYPE "form" AS ENUM ('pill', 'liquid', 'botanical', 'fungus', 'powder', 'tab', 'seed');

-- CreateEnum
CREATE TYPE "interactiontype" AS ENUM ('low_risk_synergy', 'low_risk_no_synergy', 'dangerous', 'unpredictable', 'reverse_synergy');

-- CreateEnum
CREATE TYPE "roatype" AS ENUM ('oral', 'sublingual', 'buccal', 'insufflated', 'rectal', 'transdermal', 'subcutaneous', 'intramuscular', 'intravenous', 'intrathecal', 'smoked', 'transconjunctival');

-- CreateEnum
CREATE TYPE "sex" AS ENUM ('male', 'female', 'other');

-- CreateEnum
CREATE TYPE "substancetype" AS ENUM ('cannabinoids', 'empathogens', 'stimulants', 'psychedelics', 'dissociatives', 'depressants', 'deliriants', 'opioids');

-- CreateEnum
CREATE TYPE "toxicity" AS ENUM ('liver', 'neural');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(120) NOT NULL,
    "password_hash" VARCHAR(128),
    "first_name" VARCHAR(32),
    "last_name" VARCHAR(32),
    "username" VARCHAR(32) NOT NULL,
    "birthday" DATE,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Biometric" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,
    "height" INTEGER NOT NULL,
    "sex" "sex" NOT NULL,

    CONSTRAINT "Biometric_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Substance" (
    "id" SERIAL NOT NULL,
    "type" "substancetype" NOT NULL,
    "primary_name" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "addiction_potential" SMALLINT,
    "toxicity" "toxicity" NOT NULL,
    "form" "form"[],
    "primary_form" "form" NOT NULL,
    "interactions" TEXT[],

    CONSTRAINT "Substance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chemical" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "salt" TEXT,
    "isomer" TEXT,
    "formula" TEXT,

    CONSTRAINT "Chemical_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" SERIAL NOT NULL,
    "ref" TEXT,
    "user_id" INTEGER NOT NULL,
    "created" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "started" TIMESTAMPTZ(6),
    "completed" TIMESTAMPTZ(6),
    "reflected" TIMESTAMPTZ(6),
    "status" "experiencestate" NOT NULL DEFAULT E'started',
    "first_time" BOOLEAN NOT NULL DEFAULT true,
    "place_slug" VARCHAR(128) NOT NULL,
    "roa" "roatype" NOT NULL,
    "mood" INTEGER NOT NULL,

    CONSTRAINT "Experience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AlternativeName" (
    "name" TEXT NOT NULL,
    "substance_id" INTEGER NOT NULL,

    CONSTRAINT "AlternativeName_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "CrossTolerance" (
    "name" TEXT NOT NULL,
    "strength" INTEGER NOT NULL,

    CONSTRAINT "CrossTolerance_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Roa" (
    "id" SERIAL NOT NULL,
    "substance_id" INTEGER NOT NULL,
    "bioavailability_min" DOUBLE PRECISION NOT NULL,
    "bioavailability_max" DOUBLE PRECISION NOT NULL,
    "half_life_min" DOUBLE PRECISION NOT NULL,
    "half_life_max" DOUBLE PRECISION NOT NULL,
    "half_life_units" TEXT NOT NULL,

    CONSTRAINT "Roa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoaDose" (
    "id" SERIAL NOT NULL,
    "roa_id" INTEGER NOT NULL,
    "threshold_value" DOUBLE PRECISION NOT NULL,
    "threshold_units" TEXT NOT NULL,
    "heavy_value" DOUBLE PRECISION NOT NULL,
    "heavy_units" TEXT NOT NULL,
    "common_min" DOUBLE PRECISION NOT NULL,
    "common_max" DOUBLE PRECISION NOT NULL,
    "common_units" TEXT NOT NULL,
    "weak_min" DOUBLE PRECISION NOT NULL,
    "weak_max" DOUBLE PRECISION NOT NULL,
    "weak_units" TEXT NOT NULL,
    "strong_min" DOUBLE PRECISION NOT NULL,
    "strong_max" DOUBLE PRECISION NOT NULL,
    "strong_units" TEXT NOT NULL,

    CONSTRAINT "RoaDose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoaDuration" (
    "id" SERIAL NOT NULL,
    "roa_id" INTEGER NOT NULL,
    "afterglow_min" DOUBLE PRECISION NOT NULL,
    "afterglow_max" DOUBLE PRECISION NOT NULL,
    "afterglow_units" TEXT NOT NULL,
    "comeup_min" DOUBLE PRECISION NOT NULL,
    "comeup_max" DOUBLE PRECISION NOT NULL,
    "comeup_units" TEXT NOT NULL,
    "duration_min" DOUBLE PRECISION NOT NULL,
    "duration_max" DOUBLE PRECISION NOT NULL,
    "duration_units" TEXT NOT NULL,
    "offset_min" DOUBLE PRECISION NOT NULL,
    "offset_max" DOUBLE PRECISION NOT NULL,
    "offset_units" TEXT NOT NULL,
    "onset_min" DOUBLE PRECISION NOT NULL,
    "onset_max" DOUBLE PRECISION NOT NULL,
    "onset_units" TEXT NOT NULL,
    "peak_min" DOUBLE PRECISION NOT NULL,
    "peak_max" DOUBLE PRECISION NOT NULL,
    "peak_units" TEXT NOT NULL,
    "total_min" DOUBLE PRECISION NOT NULL,
    "total_max" DOUBLE PRECISION NOT NULL,
    "total_units" TEXT NOT NULL,

    CONSTRAINT "RoaDuration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitRange" (
    "min" DOUBLE PRECISION NOT NULL,
    "max" DOUBLE PRECISION NOT NULL,
    "units" TEXT NOT NULL,

    CONSTRAINT "UnitRange_pkey" PRIMARY KEY ("min","max","units")
);

-- CreateTable
CREATE TABLE "UnitValue" (
    "value" DOUBLE PRECISION NOT NULL,
    "units" TEXT NOT NULL,

    CONSTRAINT "UnitValue_pkey" PRIMARY KEY ("value","units")
);

-- CreateTable
CREATE TABLE "Dosing" (
    "experience_id" INTEGER NOT NULL,
    "dose_value" DOUBLE PRECISION NOT NULL,
    "dose_units" TEXT NOT NULL,
    "submitted_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "substance" TEXT NOT NULL,

    CONSTRAINT "Dosing_pkey" PRIMARY KEY ("experience_id","substance","submitted_at")
);

-- CreateTable
CREATE TABLE "Bioavailability" (
    "roa_id" INTEGER NOT NULL,
    "min" DOUBLE PRECISION NOT NULL,
    "max" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Bioavailability_pkey" PRIMARY KEY ("min","max")
);

-- CreateTable
CREATE TABLE "Interaction" (
    "name" TEXT NOT NULL,
    "type" "interactiontype" NOT NULL,

    CONSTRAINT "Interaction_pkey" PRIMARY KEY ("name","type")
);

-- CreateTable
CREATE TABLE "_ChemicalToSubstance" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ExperienceToSubstance" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "user_id_uindex" ON "User"("id");

-- CreateIndex
CREATE INDEX "user_email_index" ON "User"("email");

-- CreateIndex
CREATE INDEX "user_first_name_index" ON "User"("first_name");

-- CreateIndex
CREATE INDEX "user_last_name_index" ON "User"("last_name");

-- CreateIndex
CREATE INDEX "user_username_index" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Biometric_user_id_key" ON "Biometric"("user_id");

-- CreateIndex
CREATE INDEX "biometric_id_uindex" ON "Biometric"("id");

-- CreateIndex
CREATE INDEX "substance_id_uindex" ON "Substance"("id");

-- CreateIndex
CREATE INDEX "substance_name_index" ON "Substance"("primary_name");

-- CreateIndex
CREATE INDEX "chemical_id_uindex" ON "Chemical"("id");

-- CreateIndex
CREATE INDEX "chemical_name_index" ON "Chemical"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Experience_ref_key" ON "Experience"("ref");

-- CreateIndex
CREATE INDEX "experience_id_uindex" ON "Experience"("id");

-- CreateIndex
CREATE UNIQUE INDEX "AlternativeName_name_key" ON "AlternativeName"("name");

-- CreateIndex
CREATE INDEX "alternative_name_name_uindex" ON "AlternativeName"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CrossTolerance_name_key" ON "CrossTolerance"("name");

-- CreateIndex
CREATE INDEX "cross_tolerance_name_uindex" ON "CrossTolerance"("name");

-- CreateIndex
CREATE INDEX "roa_id_uindex" ON "Roa"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Roa_bioavailability_min_bioavailability_max_key" ON "Roa"("bioavailability_min", "bioavailability_max");

-- CreateIndex
CREATE UNIQUE INDEX "Roa_half_life_min_half_life_max_half_life_units_key" ON "Roa"("half_life_min", "half_life_max", "half_life_units");

-- CreateIndex
CREATE UNIQUE INDEX "RoaDose_roa_id_key" ON "RoaDose"("roa_id");

-- CreateIndex
CREATE INDEX "roa_dose_id_uindex" ON "RoaDose"("id");

-- CreateIndex
CREATE UNIQUE INDEX "RoaDuration_roa_id_key" ON "RoaDuration"("roa_id");

-- CreateIndex
CREATE INDEX "roa_duration_id_uindex" ON "RoaDuration"("id");

-- CreateIndex
CREATE UNIQUE INDEX "_ChemicalToSubstance_AB_unique" ON "_ChemicalToSubstance"("A", "B");

-- CreateIndex
CREATE INDEX "_ChemicalToSubstance_B_index" ON "_ChemicalToSubstance"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ExperienceToSubstance_AB_unique" ON "_ExperienceToSubstance"("A", "B");

-- CreateIndex
CREATE INDEX "_ExperienceToSubstance_B_index" ON "_ExperienceToSubstance"("B");

-- AddForeignKey
ALTER TABLE "Biometric" ADD CONSTRAINT "Biometric_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AlternativeName" ADD CONSTRAINT "AlternativeName_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roa" ADD CONSTRAINT "Roa_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roa" ADD CONSTRAINT "Roa_bioavailability_min_bioavailability_max_fkey" FOREIGN KEY ("bioavailability_min", "bioavailability_max") REFERENCES "Bioavailability"("min", "max") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roa" ADD CONSTRAINT "Roa_half_life_min_half_life_max_half_life_units_fkey" FOREIGN KEY ("half_life_min", "half_life_max", "half_life_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_roa_id_fkey" FOREIGN KEY ("roa_id") REFERENCES "Roa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_threshold_value_threshold_units_fkey" FOREIGN KEY ("threshold_value", "threshold_units") REFERENCES "UnitValue"("value", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_heavy_value_heavy_units_fkey" FOREIGN KEY ("heavy_value", "heavy_units") REFERENCES "UnitValue"("value", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_common_min_common_max_common_units_fkey" FOREIGN KEY ("common_min", "common_max", "common_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_weak_min_weak_max_weak_units_fkey" FOREIGN KEY ("weak_min", "weak_max", "weak_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_strong_min_strong_max_strong_units_fkey" FOREIGN KEY ("strong_min", "strong_max", "strong_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_roa_id_fkey" FOREIGN KEY ("roa_id") REFERENCES "Roa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_afterglow_min_afterglow_max_afterglow_units_fkey" FOREIGN KEY ("afterglow_min", "afterglow_max", "afterglow_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_comeup_min_comeup_max_comeup_units_fkey" FOREIGN KEY ("comeup_min", "comeup_max", "comeup_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_duration_min_duration_max_duration_units_fkey" FOREIGN KEY ("duration_min", "duration_max", "duration_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_offset_min_offset_max_offset_units_fkey" FOREIGN KEY ("offset_min", "offset_max", "offset_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_onset_min_onset_max_onset_units_fkey" FOREIGN KEY ("onset_min", "onset_max", "onset_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_peak_min_peak_max_peak_units_fkey" FOREIGN KEY ("peak_min", "peak_max", "peak_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_total_min_total_max_total_units_fkey" FOREIGN KEY ("total_min", "total_max", "total_units") REFERENCES "UnitRange"("min", "max", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dosing" ADD CONSTRAINT "Dosing_experience_id_fkey" FOREIGN KEY ("experience_id") REFERENCES "Experience"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dosing" ADD CONSTRAINT "Dosing_dose_value_dose_units_fkey" FOREIGN KEY ("dose_value", "dose_units") REFERENCES "UnitValue"("value", "units") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChemicalToSubstance" ADD FOREIGN KEY ("A") REFERENCES "Chemical"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ChemicalToSubstance" ADD FOREIGN KEY ("B") REFERENCES "Substance"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExperienceToSubstance" ADD FOREIGN KEY ("A") REFERENCES "Experience"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExperienceToSubstance" ADD FOREIGN KEY ("B") REFERENCES "Substance"("id") ON DELETE CASCADE ON UPDATE CASCADE;
