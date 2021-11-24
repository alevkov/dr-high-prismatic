-- CreateTable
CREATE TABLE "LoginAttempt" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(120) NOT NULL,
    "password_hash" VARCHAR(120) NOT NULL,
    "at" DATE NOT NULL,

    CONSTRAINT "LoginAttempt_pkey" PRIMARY KEY ("id")
);
