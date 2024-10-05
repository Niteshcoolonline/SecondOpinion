/*
  Warnings:

  - Added the required column `age` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `race` to the `InputDetails` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "InputDetails" ADD COLUMN     "age" INTEGER NOT NULL,
ADD COLUMN     "gender" VARCHAR(191) NOT NULL,
ADD COLUMN     "race" VARCHAR(191) NOT NULL;
