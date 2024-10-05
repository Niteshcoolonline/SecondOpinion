/*
  Warnings:

  - A unique constraint covering the columns `[input_detail_id]` on the table `OutputDetails` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "OutputDetails_input_detail_id_key" ON "OutputDetails"("input_detail_id");
