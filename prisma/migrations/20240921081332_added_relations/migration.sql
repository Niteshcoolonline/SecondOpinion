/*
  Warnings:

  - You are about to drop the `Patient` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Patient";

-- CreateTable
CREATE TABLE "Patients" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
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

    CONSTRAINT "Patients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Patients_age_key" ON "Patients"("age");

-- AddForeignKey
ALTER TABLE "Patients" ADD CONSTRAINT "Patients_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
