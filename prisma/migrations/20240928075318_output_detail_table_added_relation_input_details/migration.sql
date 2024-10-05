/*
  Warnings:

  - Added the required column `input_detail_id` to the `OutputDetails` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "OutputDetails" ADD COLUMN     "input_detail_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "OutputDetails" ADD CONSTRAINT "OutputDetails_input_detail_id_fkey" FOREIGN KEY ("input_detail_id") REFERENCES "InputDetails"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
