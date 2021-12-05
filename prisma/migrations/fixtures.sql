INSERT INTO public."SubstanceType" (value) VALUES ('STIMULANT');
INSERT INTO public."SubstanceType" (value) VALUES ('PSYCHEDELIC');
INSERT INTO public."SubstanceType" (value) VALUES ('DISSOCIATIVE');
INSERT INTO public."SubstanceType" (value) VALUES ('INTOXICATING_DEPRESSANT');
INSERT INTO public."SubstanceType" (value) VALUES ('CANNABINOID');
INSERT INTO public."SubstanceType" (value) VALUES ('ONEIROGEN');
INSERT INTO public."SubstanceType" (value) VALUES ('DEPRESSANT');
INSERT INTO public."SubstanceType" (value) VALUES ('EMPATHOGEN');
INSERT INTO public."SubstanceType" (value) VALUES ('EUPHORIANT');
INSERT INTO public."SubstanceType" (value) VALUES ('SEDATIVE');
INSERT INTO public."SubstanceType" (value) VALUES ('NOOTROPIC');
INSERT INTO public."SubstanceType" (value) VALUES ('DELIRIANT');
INSERT INTO public."SubstanceType" (value) VALUES ('OTHER_UNSPECIFIED');
INSERT INTO public."SubstanceType" (value) VALUES ('OPIOID');
INSERT INTO public."SubstanceType" (value) VALUES ('EUGEROIC');
INSERT INTO public."SubstanceType" (value) VALUES ('CHOLINERGIC');

INSERT INTO public."ToxicityType" (value) VALUES ('CNS');
INSERT INTO public."ToxicityType" (value) VALUES ('LIVER');
INSERT INTO public."ToxicityType" (value) VALUES ('CARDIO');
INSERT INTO public."ToxicityType" (value) VALUES ('RETINAL');
INSERT INTO public."ToxicityType" (value) VALUES ('PULMONARY');
INSERT INTO public."ToxicityType" (value) VALUES ('TERATOGENIC');
INSERT INTO public."ToxicityType" (value) VALUES ('HEMATOLOGIC');
INSERT INTO public."ToxicityType" (value) VALUES ('REPRODUCTIVE');
INSERT INTO public."ToxicityType" (value) VALUES ('MUSCULAR');
INSERT INTO public."ToxicityType" (value) VALUES ('CARCINOGENIC');
INSERT INTO public."ToxicityType" (value) VALUES ('ACUTE_DEATH_UNSPECIFIED');
INSERT INTO public."ToxicityType" (value) VALUES ('RENAL');
INSERT INTO public."ToxicityType" (value) VALUES ('VESICAL');
INSERT INTO public."ToxicityType" (value) VALUES ('SKELETAL');
INSERT INTO public."ToxicityType" (value) VALUES ('DERMATOLOGIC');
INSERT INTO public."ToxicityType" (value) VALUES ('IRRITANT_UNSPECIFIED');
INSERT INTO public."ToxicityType" (value) VALUES ('GASTRO');
INSERT INTO public."ToxicityType" (value) VALUES ('PANCREATIC');
INSERT INTO public."ToxicityType" (value) VALUES ('PNS');
INSERT INTO public."ToxicityType" (value) VALUES ('MUTAGENIC');
INSERT INTO public."ToxicityType" (value) VALUES ('OTHER_UNSPECIFIED');

INSERT INTO public."AlternativeNameType" (value) VALUES ('SLANG');
INSERT INTO public."AlternativeNameType" (value) VALUES ('PHARMACEUTICAL');
INSERT INTO public."AlternativeNameType" (value) VALUES ('CHEMICAL');

INSERT INTO public."ExperienceStateType" (value) VALUES ('CREATED');
INSERT INTO public."ExperienceStateType" (value) VALUES ('STARTED');
INSERT INTO public."ExperienceStateType" (value) VALUES ('COMPLETED');
INSERT INTO public."ExperienceStateType" (value) VALUES ('REFLECTED');

INSERT INTO public."FormType" (value) VALUES ('CRYSTAL');
INSERT INTO public."FormType" (value) VALUES ('POWDER');
INSERT INTO public."FormType" (value) VALUES ('LIQUID');
INSERT INTO public."FormType" (value) VALUES ('COMPOUND_LIQUID');
INSERT INTO public."FormType" (value) VALUES ('LEAF');
INSERT INTO public."FormType" (value) VALUES ('FUNGUS');
INSERT INTO public."FormType" (value) VALUES ('VAPOR');
INSERT INTO public."FormType" (value) VALUES ('IV_SOLUTION');
INSERT INTO public."FormType" (value) VALUES ('GEL');
INSERT INTO public."FormType" (value) VALUES ('TROCHE');
INSERT INTO public."FormType" (value) VALUES ('EDIBLE');
INSERT INTO public."FormType" (value) VALUES ('TAB');
INSERT INTO public."FormType" (value) VALUES ('SEED');
INSERT INTO public."FormType" (value) VALUES ('ADULTERATED_BOTANICAL');
INSERT INTO public."FormType" (value) VALUES ('INCENSE');
INSERT INTO public."FormType" (value) VALUES ('NUT');
INSERT INTO public."FormType" (value) VALUES ('SAP');
INSERT INTO public."FormType" (value) VALUES ('DRIED_LEAF');
INSERT INTO public."FormType" (value) VALUES ('CONCENTRATE');
INSERT INTO public."FormType" (value) VALUES ('FLOWER');
INSERT INTO public."FormType" (value) VALUES ('DRIED_FLOWER');
INSERT INTO public."FormType" (value) VALUES ('EXTERNAL_THERAPY');
INSERT INTO public."FormType" (value) VALUES ('CAPSULE');
INSERT INTO public."FormType" (value) VALUES ('SPANSULE');
INSERT INTO public."FormType" (value) VALUES ('SMOKKING_MIXTURE_UNSPECIFIED');
INSERT INTO public."FormType" (value) VALUES ('INTRATHECAL_PUMP');
INSERT INTO public."FormType" (value) VALUES ('RECTAL_SUPPOSITORY');
INSERT INTO public."FormType" (value) VALUES ('VAGINAL_SUPPOSITORY');
INSERT INTO public."FormType" (value) VALUES ('OTHER_UNSPECIFIED');

INSERT INTO public."RoaType" (value) VALUES ('ORAL');
INSERT INTO public."RoaType" (value) VALUES ('INTRANASAL');
INSERT INTO public."RoaType" (value) VALUES ('SUBCUTANEOUS');
INSERT INTO public."RoaType" (value) VALUES ('INTRAMUSCULAR');
INSERT INTO public."RoaType" (value) VALUES ('INTRAVENOUS');
INSERT INTO public."RoaType" (value) VALUES ('RECTAL');
INSERT INTO public."RoaType" (value) VALUES ('VAGINAL');
INSERT INTO public."RoaType" (value) VALUES ('RESPIRATORY');
INSERT INTO public."RoaType" (value) VALUES ('INTRATHECAL');
INSERT INTO public."RoaType" (value) VALUES ('OTIC');
INSERT INTO public."RoaType" (value) VALUES ('BUCCAL');
INSERT INTO public."RoaType" (value) VALUES ('IRRIGATION');
INSERT INTO public."RoaType" (value) VALUES ('PERIODONTAL');
INSERT INTO public."RoaType" (value) VALUES ('SUBLINGUAL');
INSERT INTO public."RoaType" (value) VALUES ('TOPICAL');
INSERT INTO public."RoaType" (value) VALUES ('OTHER_UNSPECIFIED');

INSERT INTO public."SexType" (value) VALUES ('MALE');
INSERT INTO public."SexType" (value) VALUES ('FEMALE');
INSERT INTO public."SexType" (value) VALUES ('OTHER');

INSERT INTO public."Substance" (id, primary_name, summary, addiction_potential, toxicities, forms, interactions, cross_tolerances, image_url, "substanceTypeValue", "formValue") VALUES (1, 'Methamphetamine', 'A dopaminergic-noradrenergic stimulant of the Amphetamine class.', 5, '["CNS", "CARDIO"]', '["CRYSTAL", "CAPSULE", "IV_SOLUTION"]', '{"": ""}', '{"": ""}', null, 'STIMULANT', 'CRYSTAL');

INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Crystal', 1, 'SLANG');
INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Meth', 1, 'SLANG');
INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Desoxyn', 1, 'PHARMACEUTICAL');
INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Ice', 1, 'SLANG');
INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Methedrine', 1, 'PHARMACEUTICAL');
INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Desoxyephedrine', 1, 'CHEMICAL');
INSERT INTO public."AlternativeName" (name, substance_id, "alternativeNameTypeValue") VALUES ('Methamphetamine', 1, 'CHEMICAL');

INSERT INTO public."Roa" (id, substance_id, bioavailability, half_life, "roaTypeValue") VALUES (1, 1, '[{"v": 70, "type": "Oral"}, {"v": 100, "type": "Intravenous"}]', '{"u": "h", "mn": 5, "mx": 30}', 'ORAL');

INSERT INTO public."RoaDose" (id, roa_id, threshold, heavy, common, weak, strong) VALUES (1, 1, '{"u": "mg", "mn": 2, "mx": 5}', '{"u": "mg", "mn": 60, "mx": 200}', '{"u": "mg", "mn": 15, "mx": 30}', '{"u": "mg", "mn": 5, "mx": 15}', '{"u": "mg", "mn": 30, "mx": 60}');

INSERT INTO public."RoaDuration" (id, roa_id, afterglow, comeup, duration, "offset", onset, peak, total) VALUES (1, 1, '{"u": "h", "mn": 12, "mx": 24}', '{"u": "h", "mn": 3, "mx": 4}', '{"u": "h", "mn": 7, "mx": 12}', '{"u": "h", "mn": 3, "mx": 4}', '{"u": "m", "mn": 20, "mx": 45}', '{"u": "h", "mn": 3, "mx": 5}', '{"u": "h", "mn": 7, "mx": 24}');

INSERT INTO public."Chemical" (id, name, salt, isomer, formula) VALUES (1, 'N-methylamphetamine', 'hydrochloride', '(dl)-Methamphetamine', 'C10H15N');

INSERT INTO public."SubstancesOnChemicals" (chemical_id, substance_id) VALUES (1, 1);
