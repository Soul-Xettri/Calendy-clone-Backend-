-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `user_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Appointment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` VARCHAR(191) NULL,
    `startingTime` VARCHAR(191) NULL,
    `endingTime` VARCHAR(191) NULL,
    `services` VARCHAR(191) NULL,
    `attachment` VARCHAR(191) NULL,
    `status` ENUM('PENDING', 'APPROVED', 'RESCHEDULED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RescheduleAppointment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` VARCHAR(191) NOT NULL,
    `startingTime` VARCHAR(191) NULL,
    `endingTime` VARCHAR(191) NULL,
    `appointmentId` INTEGER NOT NULL,

    UNIQUE INDEX `RescheduleAppointment_appointmentId_key`(`appointmentId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Availability` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sundayId` INTEGER NOT NULL,
    `mondayId` INTEGER NOT NULL,
    `wednesdayId` INTEGER NOT NULL,
    `tuesdayId` INTEGER NOT NULL,
    `thursdayId` INTEGER NOT NULL,
    `fridayId` INTEGER NOT NULL,
    `saturdayId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Availability_sundayId_key`(`sundayId`),
    UNIQUE INDEX `Availability_mondayId_key`(`mondayId`),
    UNIQUE INDEX `Availability_wednesdayId_key`(`wednesdayId`),
    UNIQUE INDEX `Availability_tuesdayId_key`(`tuesdayId`),
    UNIQUE INDEX `Availability_thursdayId_key`(`thursdayId`),
    UNIQUE INDEX `Availability_fridayId_key`(`fridayId`),
    UNIQUE INDEX `Availability_saturdayId_key`(`saturdayId`),
    UNIQUE INDEX `Availability_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sunday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Monday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tuesday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Wednesday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Thursday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Friday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Saturday` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `available` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Clock` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `startTime` VARCHAR(191) NOT NULL,
    `endTime` VARCHAR(191) NOT NULL,
    `available` BOOLEAN NOT NULL DEFAULT true,
    `sundayId` INTEGER NULL,
    `mondayId` INTEGER NULL,
    `tuesdayId` INTEGER NULL,
    `wednesdayId` INTEGER NULL,
    `thursdayId` INTEGER NULL,
    `fridayId` INTEGER NULL,
    `saturdayId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OverRideAvailability` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `overRideDate` VARCHAR(191) NOT NULL,
    `startTime` VARCHAR(191) NOT NULL,
    `endTime` VARCHAR(191) NOT NULL,
    `available` BOOLEAN NOT NULL DEFAULT true,
    `availabilityId` INTEGER NULL,
    `userId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_AppointmentToAvailability` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_AppointmentToAvailability_AB_unique`(`A`, `B`),
    INDEX `_AppointmentToAvailability_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_AppointmentToOverRideAvailability` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_AppointmentToOverRideAvailability_AB_unique`(`A`, `B`),
    INDEX `_AppointmentToOverRideAvailability_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `RescheduleAppointment` ADD CONSTRAINT `RescheduleAppointment_appointmentId_fkey` FOREIGN KEY (`appointmentId`) REFERENCES `Appointment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_sundayId_fkey` FOREIGN KEY (`sundayId`) REFERENCES `Sunday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_mondayId_fkey` FOREIGN KEY (`mondayId`) REFERENCES `Monday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_tuesdayId_fkey` FOREIGN KEY (`tuesdayId`) REFERENCES `Tuesday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_wednesdayId_fkey` FOREIGN KEY (`wednesdayId`) REFERENCES `Wednesday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_thursdayId_fkey` FOREIGN KEY (`thursdayId`) REFERENCES `Thursday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_fridayId_fkey` FOREIGN KEY (`fridayId`) REFERENCES `Friday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Availability` ADD CONSTRAINT `Availability_saturdayId_fkey` FOREIGN KEY (`saturdayId`) REFERENCES `Saturday`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_sundayId_fkey` FOREIGN KEY (`sundayId`) REFERENCES `Sunday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_mondayId_fkey` FOREIGN KEY (`mondayId`) REFERENCES `Monday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_tuesdayId_fkey` FOREIGN KEY (`tuesdayId`) REFERENCES `Tuesday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_wednesdayId_fkey` FOREIGN KEY (`wednesdayId`) REFERENCES `Wednesday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_thursdayId_fkey` FOREIGN KEY (`thursdayId`) REFERENCES `Thursday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_fridayId_fkey` FOREIGN KEY (`fridayId`) REFERENCES `Friday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Clock` ADD CONSTRAINT `Clock_saturdayId_fkey` FOREIGN KEY (`saturdayId`) REFERENCES `Saturday`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OverRideAvailability` ADD CONSTRAINT `OverRideAvailability_availabilityId_fkey` FOREIGN KEY (`availabilityId`) REFERENCES `Availability`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OverRideAvailability` ADD CONSTRAINT `OverRideAvailability_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AppointmentToAvailability` ADD CONSTRAINT `_AppointmentToAvailability_A_fkey` FOREIGN KEY (`A`) REFERENCES `Appointment`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AppointmentToAvailability` ADD CONSTRAINT `_AppointmentToAvailability_B_fkey` FOREIGN KEY (`B`) REFERENCES `Availability`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AppointmentToOverRideAvailability` ADD CONSTRAINT `_AppointmentToOverRideAvailability_A_fkey` FOREIGN KEY (`A`) REFERENCES `Appointment`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_AppointmentToOverRideAvailability` ADD CONSTRAINT `_AppointmentToOverRideAvailability_B_fkey` FOREIGN KEY (`B`) REFERENCES `OverRideAvailability`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
