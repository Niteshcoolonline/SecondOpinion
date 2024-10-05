/*
  Warnings:

  - You are about to drop the column `bio_markers` on the `Patients` table. All the data in the column will be lost.
  - You are about to drop the column `como` on the `Patients` table. All the data in the column will be lost.
  - You are about to drop the column `disease` on the `Patients` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Patients` table. All the data in the column will be lost.
  - You are about to drop the column `pathd` on the `Patients` table. All the data in the column will be lost.
  - You are about to drop the column `perf_stat` on the `Patients` table. All the data in the column will be lost.
  - You are about to drop the column `sub_disease` on the `Patients` table. All the data in the column will be lost.
  - Added the required column `email` to the `Patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `first_name` to the `Patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_name` to the `Patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone` to the `Patients` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Patients" DROP COLUMN "bio_markers",
DROP COLUMN "como",
DROP COLUMN "disease",
DROP COLUMN "name",
DROP COLUMN "pathd",
DROP COLUMN "perf_stat",
DROP COLUMN "sub_disease",
ADD COLUMN     "email" VARCHAR(191) NOT NULL,
ADD COLUMN     "first_name" VARCHAR(191) NOT NULL,
ADD COLUMN     "last_name" VARCHAR(191) NOT NULL,
ADD COLUMN     "phone" VARCHAR(20) NOT NULL;
