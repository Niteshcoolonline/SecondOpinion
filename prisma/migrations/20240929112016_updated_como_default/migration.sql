/*
  Warnings:

  - The values [HYPERTENSION] on the enum `COMO` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "COMO_new" AS ENUM ('DIABETES', 'HYPERTENTION', 'CARDIAC_DISORDER', 'NONE');
ALTER TABLE "InputDetails" ALTER COLUMN "como" DROP DEFAULT;
ALTER TABLE "InputDetails" ALTER COLUMN "como" TYPE "COMO_new" USING ("como"::text::"COMO_new");
ALTER TYPE "COMO" RENAME TO "COMO_old";
ALTER TYPE "COMO_new" RENAME TO "COMO";
DROP TYPE "COMO_old";
ALTER TABLE "InputDetails" ALTER COLUMN "como" SET DEFAULT 'NONE';
COMMIT;
