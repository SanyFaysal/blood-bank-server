/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "donar_status" AS ENUM ('PENDIG', 'ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "ROLE" AS ENUM ('USER', 'DONAR');

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "role" "ROLE" NOT NULL DEFAULT 'USER',
    "password" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "doners" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "blood_group_id" TEXT NOT NULL,
    "date_of_birth" TIMESTAMP(3) NOT NULL,
    "phone_number" TEXT NOT NULL,
    "emmergency_contact" TEXT,
    "last_donation_date" TIMESTAMP(3),
    "total_donations" TEXT,
    "upcoming_eligibility" TEXT,
    "photo" TEXT,
    "status" TEXT NOT NULL,

    CONSTRAINT "doners_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blood_group" (
    "id" TEXT NOT NULL,
    "blood_type" TEXT NOT NULL,

    CONSTRAINT "blood_group_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "doners_user_id_key" ON "doners"("user_id");

-- AddForeignKey
ALTER TABLE "doners" ADD CONSTRAINT "doners_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "doners" ADD CONSTRAINT "doners_blood_group_id_fkey" FOREIGN KEY ("blood_group_id") REFERENCES "blood_group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
