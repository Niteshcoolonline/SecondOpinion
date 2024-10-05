/*
  Warnings:

  - A unique constraint covering the columns `[phone]` on the table `Patients` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Patients_phone_key" ON "Patients"("phone");
