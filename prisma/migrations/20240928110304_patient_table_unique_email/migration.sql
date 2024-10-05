/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `Patients` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Patients_email_key" ON "Patients"("email");
