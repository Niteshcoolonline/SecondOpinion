/*
  Warnings:

  - You are about to drop the column `bio_makers` on the `Patients` table. All the data in the column will be lost.
  - Added the required column `bio_markers` to the `Patients` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Patients" DROP COLUMN "bio_makers",
ADD COLUMN     "bio_markers" VARCHAR(191) NOT NULL;
