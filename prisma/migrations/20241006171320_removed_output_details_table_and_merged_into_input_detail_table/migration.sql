/*
  Warnings:

  - You are about to drop the column `output_detail_id` on the `InputOutputPatientMappings` table. All the data in the column will be lost.
  - You are about to drop the `OutputDetails` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `ae` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ae_management` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `alternate_drug` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `guideline_link` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `overall_survival` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payer_pathway` to the `InputDetails` table without a default value. This is not possible if the table is not empty.
  - Added the required column `preferred_drug` to the `InputDetails` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "InputOutputPatientMappings" DROP CONSTRAINT "InputOutputPatientMappings_output_detail_id_fkey";

-- DropForeignKey
ALTER TABLE "OutputDetails" DROP CONSTRAINT "OutputDetails_input_detail_id_fkey";

-- AlterTable
ALTER TABLE "InputDetails" ADD COLUMN     "ae" VARCHAR(191) NOT NULL,
ADD COLUMN     "ae_management" VARCHAR(191) NOT NULL,
ADD COLUMN     "alternate_drug" VARCHAR(191) NOT NULL,
ADD COLUMN     "guideline_link" VARCHAR(191) NOT NULL,
ADD COLUMN     "overall_survival" VARCHAR(191) NOT NULL,
ADD COLUMN     "payer_pathway" VARCHAR(191) NOT NULL,
ADD COLUMN     "preferred_drug" VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE "InputOutputPatientMappings" DROP COLUMN "output_detail_id";

-- DropTable
DROP TABLE "OutputDetails";
