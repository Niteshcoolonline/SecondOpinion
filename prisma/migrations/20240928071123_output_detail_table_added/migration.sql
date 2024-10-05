-- CreateTable
CREATE TABLE "OutputDetails" (
    "id" SERIAL NOT NULL,
    "preferred_drug" VARCHAR(191) NOT NULL,
    "alternate_drug" VARCHAR(191) NOT NULL,
    "guideline_link" VARCHAR(191) NOT NULL,
    "payer_pathway" VARCHAR(191) NOT NULL,
    "overall_survival" VARCHAR(191) NOT NULL,
    "ae" VARCHAR(191) NOT NULL,
    "ae_management" VARCHAR(191) NOT NULL,

    CONSTRAINT "OutputDetails_pkey" PRIMARY KEY ("id")
);
