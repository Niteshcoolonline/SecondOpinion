-- CreateTable
CREATE TABLE "InputDetails" (
    "id" SERIAL NOT NULL,
    "pathd" "PathD" NOT NULL DEFAULT 'T',
    "como" "COMO" NOT NULL DEFAULT 'DIABETES',
    "disease" VARCHAR(191) NOT NULL,
    "sub_disease" VARCHAR(191) NOT NULL,
    "bio_markers" VARCHAR(191) NOT NULL,
    "perf_stat" "PerfStat" NOT NULL DEFAULT 'FULLY_ACTIVE',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InputDetails_pkey" PRIMARY KEY ("id")
);
