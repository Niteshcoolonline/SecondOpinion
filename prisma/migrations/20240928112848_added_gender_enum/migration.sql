/*
  Warnings:

  - The `gender` column on the `InputDetails` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'TS');

-- AlterTable
ALTER TABLE "InputDetails" DROP COLUMN "gender",
ADD COLUMN     "gender" "Gender" NOT NULL DEFAULT 'MALE';
