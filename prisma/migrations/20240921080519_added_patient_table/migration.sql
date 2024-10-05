-- CreateEnum
CREATE TYPE "PathD" AS ENUM ('T', 'N', 'M');

-- CreateEnum
CREATE TYPE "COMO" AS ENUM ('DIABETES', 'HYPERTENSION', 'CARDIAC_DISORDER');

-- CreateEnum
CREATE TYPE "PerfStat" AS ENUM ('FULLY_ACTIVE', 'MODERATE_ACTIVE', 'INACTIVE');

-- CreateTable
CREATE TABLE "Patient" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(191) NOT NULL,
    "age" VARCHAR(191) NOT NULL,
    "gender" VARCHAR(191) NOT NULL,
    "race" VARCHAR(191) NOT NULL,
    "pathd" "PathD" NOT NULL DEFAULT 'T',
    "como" "COMO" NOT NULL DEFAULT 'DIABETES',
    "disease" VARCHAR(191) NOT NULL,
    "sub_disease" VARCHAR(191) NOT NULL,
    "bio_makers" VARCHAR(191) NOT NULL,
    "perf_stat" "PerfStat" NOT NULL DEFAULT 'FULLY_ACTIVE',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Patient_age_key" ON "Patient"("age");
