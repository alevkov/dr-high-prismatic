-- AlterEnum
ALTER TYPE "form" ADD VALUE 'crystal';

-- RenameIndex
ALTER INDEX "alternative_name_name_uindex" RENAME TO "Alternative_Name_name_uindex";

-- RenameIndex
ALTER INDEX "biometric_id_uindex" RENAME TO "Biometric_id_uindex";

-- RenameIndex
ALTER INDEX "chemical_id_uindex" RENAME TO "Chemical_id_uindex";

-- RenameIndex
ALTER INDEX "chemical_name_index" RENAME TO "Chemical_name_index";

-- RenameIndex
ALTER INDEX "cross_tolerance_name_uindex" RENAME TO "Cross_Tolerance_name_uindex";

-- RenameIndex
ALTER INDEX "experience_id_uindex" RENAME TO "Experience_id_uindex";

-- RenameIndex
ALTER INDEX "roa_id_uindex" RENAME TO "Roa_id_uindex";

-- RenameIndex
ALTER INDEX "roa_dose_id_uindex" RENAME TO "Roa_Dose_id_uindex";

-- RenameIndex
ALTER INDEX "roa_duration_id_uindex" RENAME TO "Roa_Duration_id_uindex";

-- RenameIndex
ALTER INDEX "substance_id_uindex" RENAME TO "Substance_id_uindex";

-- RenameIndex
ALTER INDEX "substance_name_index" RENAME TO "Substance_name_index";

-- RenameIndex
ALTER INDEX "user_email_index" RENAME TO "User_email_index";

-- RenameIndex
ALTER INDEX "user_first_name_index" RENAME TO "User_first_name_index";

-- RenameIndex
ALTER INDEX "user_id_uindex" RENAME TO "User_id_uindex";

-- RenameIndex
ALTER INDEX "user_last_name_index" RENAME TO "User_last_name_index";

-- RenameIndex
ALTER INDEX "user_username_index" RENAME TO "User_username_index";
