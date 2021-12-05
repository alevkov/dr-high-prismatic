-- CreateTable
CREATE TABLE "AlternativeName" (
    "name" TEXT NOT NULL,
    "substance_id" INTEGER NOT NULL,
    "alternativeNameTypeValue" TEXT NOT NULL,

    CONSTRAINT "AlternativeName_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "AlternativeNameType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "AlternativeNameType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "Biometric" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,
    "height" INTEGER NOT NULL,
    "sexValue" TEXT NOT NULL,

    CONSTRAINT "Biometric_pkey" PRIMARY KEY ("id")
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
CREATE TABLE "Dosing" (
    "id" SERIAL NOT NULL,
    "experience_id" INTEGER NOT NULL,
    "dose" JSONB NOT NULL,
    "submitted_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "substance" TEXT NOT NULL,

    CONSTRAINT "Dosing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "substance_id" INTEGER NOT NULL,
    "created" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "started" TIMESTAMP(3),
    "completed" TIMESTAMP(3),
    "reflected" TIMESTAMP(3),
    "first_time" BOOLEAN NOT NULL DEFAULT true,
    "place" VARCHAR(128) NOT NULL,
    "mood" INTEGER NOT NULL,
    "experienceStateValue" TEXT NOT NULL,
    "roaTypeValue" TEXT NOT NULL,
    "formTypeValue" TEXT NOT NULL,
    "ref" UUID NOT NULL,

    CONSTRAINT "Experience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExperienceStateType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "ExperienceStateType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "FormType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "FormType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "InteractionType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "InteractionType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "LoginAttempt" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(120) NOT NULL,
    "token" VARCHAR,
    "password" VARCHAR(120),
    "at" TIMESTAMP(6),

    CONSTRAINT "LoginAttempt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roa" (
    "id" SERIAL NOT NULL,
    "substance_id" INTEGER NOT NULL,
    "bioavailability" JSONB NOT NULL,
    "half_life" JSONB NOT NULL,
    "roaTypeValue" TEXT NOT NULL,

    CONSTRAINT "Roa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoaDose" (
    "id" SERIAL NOT NULL,
    "roa_id" INTEGER NOT NULL,
    "threshold" JSONB NOT NULL,
    "heavy" JSONB NOT NULL,
    "common" JSONB NOT NULL,
    "weak" JSONB NOT NULL,
    "strong" JSONB NOT NULL,

    CONSTRAINT "RoaDose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoaDuration" (
    "id" SERIAL NOT NULL,
    "roa_id" INTEGER NOT NULL,
    "afterglow" JSONB NOT NULL,
    "comeup" JSONB NOT NULL,
    "duration" JSONB NOT NULL,
    "offset" JSONB NOT NULL,
    "onset" JSONB NOT NULL,
    "peak" JSONB NOT NULL,
    "total" JSONB NOT NULL,

    CONSTRAINT "RoaDuration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoaType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "RoaType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "SexType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "SexType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "Substance" (
    "id" SERIAL NOT NULL,
    "primary_name" TEXT NOT NULL,
    "summary" TEXT NOT NULL,
    "addiction_potential" SMALLINT,
    "toxicities" JSONB NOT NULL,
    "forms" JSONB NOT NULL,
    "interactions" JSONB NOT NULL,
    "cross_tolerances" JSONB NOT NULL,
    "image_url" TEXT,
    "substanceTypeValue" TEXT NOT NULL,
    "formValue" TEXT NOT NULL,

    CONSTRAINT "Substance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubstanceType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "SubstanceType_pkey" PRIMARY KEY ("value")
);

-- CreateTable
CREATE TABLE "SubstancesOnChemicals" (
    "chemical_id" INTEGER NOT NULL,
    "substance_id" INTEGER NOT NULL,

    CONSTRAINT "SubstancesOnChemicals_pkey" PRIMARY KEY ("chemical_id","substance_id")
);

-- CreateTable
CREATE TABLE "ToxicityType" (
    "value" TEXT NOT NULL,

    CONSTRAINT "ToxicityType_pkey" PRIMARY KEY ("value")
);

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

-- CreateIndex
CREATE UNIQUE INDEX "AlternativeName_name_key" ON "AlternativeName"("name");

-- CreateIndex
CREATE INDEX "Alternative_Name_name_uindex" ON "AlternativeName"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AlternativeNameType_value_key" ON "AlternativeNameType"("value");

-- CreateIndex
CREATE INDEX "Alternative_Name_Type_value_uindex" ON "AlternativeNameType"("value");

-- CreateIndex
CREATE UNIQUE INDEX "Biometric_user_id_key" ON "Biometric"("user_id");

-- CreateIndex
CREATE INDEX "Biometric_id_uindex" ON "Biometric"("id");

-- CreateIndex
CREATE INDEX "Chemical_id_uindex" ON "Chemical"("id");

-- CreateIndex
CREATE INDEX "Chemical_name_index" ON "Chemical"("name");

-- CreateIndex
CREATE INDEX "Dosing_id_uindex" ON "Dosing"("id");

-- CreateIndex
CREATE INDEX "Experience_id_uindex" ON "Experience"("id");

-- CreateIndex
CREATE UNIQUE INDEX "ExperienceStateType_value_key" ON "ExperienceStateType"("value");

-- CreateIndex
CREATE INDEX "Experience_State_Type_value_uindex" ON "ExperienceStateType"("value");

-- CreateIndex
CREATE UNIQUE INDEX "FormType_value_key" ON "FormType"("value");

-- CreateIndex
CREATE INDEX "Form_Type_value_uindex" ON "FormType"("value");

-- CreateIndex
CREATE UNIQUE INDEX "InteractionType_value_key" ON "InteractionType"("value");

-- CreateIndex
CREATE INDEX "Interaction_Type_value_uindex" ON "InteractionType"("value");

-- CreateIndex
CREATE INDEX "Login_Attempt_id_uindex" ON "LoginAttempt"("id");

-- CreateIndex
CREATE INDEX "Roa_id_uindex" ON "Roa"("id");

-- CreateIndex
CREATE UNIQUE INDEX "RoaDose_roa_id_key" ON "RoaDose"("roa_id");

-- CreateIndex
CREATE INDEX "Roa_Dose_id_uindex" ON "RoaDose"("id");

-- CreateIndex
CREATE UNIQUE INDEX "RoaDuration_roa_id_key" ON "RoaDuration"("roa_id");

-- CreateIndex
CREATE INDEX "Roa_Duration_id_uindex" ON "RoaDuration"("id");

-- CreateIndex
CREATE UNIQUE INDEX "RoaType_value_key" ON "RoaType"("value");

-- CreateIndex
CREATE INDEX "Roa_Type_value_uindex" ON "RoaType"("value");

-- CreateIndex
CREATE UNIQUE INDEX "SexType_value_key" ON "SexType"("value");

-- CreateIndex
CREATE INDEX "Sex_Type_value_uindex" ON "SexType"("value");

-- CreateIndex
CREATE INDEX "Substance_id_uindex" ON "Substance"("id");

-- CreateIndex
CREATE INDEX "Substance_name_index" ON "Substance"("primary_name");

-- CreateIndex
CREATE UNIQUE INDEX "SubstanceType_value_key" ON "SubstanceType"("value");

-- CreateIndex
CREATE INDEX "Substance_Type_value_uindex" ON "SubstanceType"("value");

-- CreateIndex
CREATE UNIQUE INDEX "ToxicityType_value_key" ON "ToxicityType"("value");

-- CreateIndex
CREATE INDEX "Toxicity_Type_value_uindex" ON "ToxicityType"("value");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "User_email_index" ON "User"("email");

-- CreateIndex
CREATE INDEX "User_first_name_index" ON "User"("first_name");

-- CreateIndex
CREATE INDEX "User_id_uindex" ON "User"("id");

-- CreateIndex
CREATE INDEX "User_last_name_index" ON "User"("last_name");

-- CreateIndex
CREATE INDEX "User_username_index" ON "User"("username");

-- AddForeignKey
ALTER TABLE "AlternativeName" ADD CONSTRAINT "AlternativeName_alternativeNameTypeValue_fkey" FOREIGN KEY ("alternativeNameTypeValue") REFERENCES "AlternativeNameType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AlternativeName" ADD CONSTRAINT "AlternativeName_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Biometric" ADD CONSTRAINT "Biometric_sexValue_fkey" FOREIGN KEY ("sexValue") REFERENCES "SexType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Biometric" ADD CONSTRAINT "Biometric_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dosing" ADD CONSTRAINT "Dosing_experience_id_fkey" FOREIGN KEY ("experience_id") REFERENCES "Experience"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_experienceStateValue_fkey" FOREIGN KEY ("experienceStateValue") REFERENCES "ExperienceStateType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_formTypeValue_fkey" FOREIGN KEY ("formTypeValue") REFERENCES "FormType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_roaTypeValue_fkey" FOREIGN KEY ("roaTypeValue") REFERENCES "RoaType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Experience" ADD CONSTRAINT "Experience_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roa" ADD CONSTRAINT "Roa_roaTypeValue_fkey" FOREIGN KEY ("roaTypeValue") REFERENCES "RoaType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Roa" ADD CONSTRAINT "Roa_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDose" ADD CONSTRAINT "RoaDose_roa_id_fkey" FOREIGN KEY ("roa_id") REFERENCES "Roa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoaDuration" ADD CONSTRAINT "RoaDuration_roa_id_fkey" FOREIGN KEY ("roa_id") REFERENCES "Roa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Substance" ADD CONSTRAINT "Substance_formValue_fkey" FOREIGN KEY ("formValue") REFERENCES "FormType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Substance" ADD CONSTRAINT "Substance_substanceTypeValue_fkey" FOREIGN KEY ("substanceTypeValue") REFERENCES "SubstanceType"("value") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubstancesOnChemicals" ADD CONSTRAINT "SubstancesOnChemicals_chemical_id_fkey" FOREIGN KEY ("chemical_id") REFERENCES "Chemical"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubstancesOnChemicals" ADD CONSTRAINT "SubstancesOnChemicals_substance_id_fkey" FOREIGN KEY ("substance_id") REFERENCES "Substance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
