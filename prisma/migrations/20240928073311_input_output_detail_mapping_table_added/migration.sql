-- CreateTable
CREATE TABLE "InputOutputPatientMappings" (
    "id" SERIAL NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "output_detail_id" INTEGER NOT NULL,
    "input_detail_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InputOutputPatientMappings_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "InputOutputPatientMappings" ADD CONSTRAINT "InputOutputPatientMappings_patient_id_fkey" FOREIGN KEY ("patient_id") REFERENCES "Patients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InputOutputPatientMappings" ADD CONSTRAINT "InputOutputPatientMappings_output_detail_id_fkey" FOREIGN KEY ("output_detail_id") REFERENCES "OutputDetails"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InputOutputPatientMappings" ADD CONSTRAINT "InputOutputPatientMappings_input_detail_id_fkey" FOREIGN KEY ("input_detail_id") REFERENCES "InputDetails"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
