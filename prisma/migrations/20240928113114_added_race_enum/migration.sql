/*
  Warnings:

  - The `race` column on the `InputDetails` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Race" AS ENUM ('WHITE', 'ASIAN', 'HISPANIC');

-- AlterTable
ALTER TABLE "InputDetails" DROP COLUMN "race",
ADD COLUMN     "race" "Race" NOT NULL DEFAULT 'WHITE';
