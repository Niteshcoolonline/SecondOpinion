/*
  Warnings:

  - Changed the type of `age` on the `Patients` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropIndex
DROP INDEX "Patients_age_key";

-- AlterTable
ALTER TABLE "Patients" DROP COLUMN "age",
ADD COLUMN     "age" INTEGER NOT NULL;
