-- GroupName : TechCraft
-- ProjectName : AutoByteCare
-- WebsiteName : autobytecare
-- Members :  Shree Dhar Acharya : 8899288
--            Rishab Abbhi : 8874858
--            Rohit Rana : 8874589 
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema autobytecare
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema autobytecare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `autobytecare` DEFAULT CHARACTER SET utf8 ;
USE `autobytecare` ;

-- -----------------------------------------------------
-- Table `autobytecare`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`customers` (
  `customer_id` INT(8) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone_number` BIGINT(10) NOT NULL,
  `address_id` INT(8) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC),
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC),
  INDEX `fk_customers_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_customers_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `autobytecare`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `autobytecare`.`automobiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`automobiles` (
  `automobile_id` INT(8) NOT NULL,
  `manufacturer` VARCHAR(50) NOT NULL,
  `model` VARCHAR(50) NOT NULL,
  `year` INT(4) NOT NULL,
  `plate_number` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`automobile_id`),
  UNIQUE INDEX `plate_number_UNIQUE` (`plate_number` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`services` (
  `service_id` INT(8) NOT NULL,
  `service_name` VARCHAR(50) NOT NULL,
  `service_details` VARCHAR(255) NOT NULL,
  `service_cost` DOUBLE(5,2) NOT NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`appointments` (
  `appointment_id` INT(8) NOT NULL,
  `date` DATETIME NOT NULL,
  `notes` VARCHAR(255) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `customer_id` INT(8) NOT NULL,
  `service_id` INT(8) NULL,
  `automobile_id` INT(8) NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `fk_appointments_automobiles1_idx` (`automobile_id` ASC),
  INDEX `fk_appointments_customers1_idx` (`customer_id` ASC),
  INDEX `fk_appointments_services1_idx` (`service_id` ASC),
  CONSTRAINT `fk_appointments_automobiles1`
    FOREIGN KEY (`automobile_id`)
    REFERENCES `autobytecare`.`automobiles` (`automobile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointments_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `autobytecare`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointments_services1`
    FOREIGN KEY (`service_id`)
    REFERENCES `autobytecare`.`services` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`suppliers` (
  `supplier_id` INT(8) NOT NULL,
  `supplier_name` VARCHAR(50) NOT NULL,
  `supplier_email` VARCHAR(50) NOT NULL,
  `supplier_phone` BIGINT(10) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE INDEX `supplier_email_UNIQUE` (`supplier_email` ASC),
  UNIQUE INDEX `supplier_phone_UNIQUE` (`supplier_phone` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`parts` (
  `part_id` INT(8) NOT NULL,
  `part_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DOUBLE(5,2) NOT NULL,
  `supplier_id` INT(8) NOT NULL,
  PRIMARY KEY (`part_id`),
  INDEX `fk_parts_suppliers1_idx` (`supplier_id` ASC),
  CONSTRAINT `fk_parts_suppliers1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `autobytecare`.`suppliers` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`mechanics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`mechanics` (
  `mechanic_id` INT(8) NOT NULL,
  `mechanic_name` VARCHAR(50) NOT NULL,
  `mechanic_email` VARCHAR(50) NOT NULL,
  `mechanic_phone` BIGINT(10) NOT NULL,
  `mechanic_specialities` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`mechanic_id`),
  UNIQUE INDEX `mechanic_email_UNIQUE` (`mechanic_email` ASC),
  UNIQUE INDEX `mechanic_phone_UNIQUE` (`mechanic_phone` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`work_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`work_orders` (
  `work_order_id` INT(8) NOT NULL,
  `labor_hours` DOUBLE NOT NULL,
  `total_cost` DOUBLE(5,2) NOT NULL,
  `part_id` INT(8) NOT NULL,
  `mechanic_id` INT(8) NOT NULL,
  `appointment_id` INT(8) NOT NULL,
  PRIMARY KEY (`work_order_id`, `mechanic_id`, `appointment_id`),
  INDEX `fk_work_orders_parts1_idx` (`part_id` ASC),
  INDEX `fk_work_orders_appointments1_idx` (`appointment_id` ASC),
  INDEX `fk_work_orders_mechanics1_idx` (`mechanic_id` ASC),
  CONSTRAINT `fk_work_orders_parts1`
    FOREIGN KEY (`part_id`)
    REFERENCES `autobytecare`.`parts` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_orders_appointments1`
    FOREIGN KEY (`appointment_id`)
    REFERENCES `autobytecare`.`appointments` (`appointment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_work_orders_mechanics1`
    FOREIGN KEY (`mechanic_id`)
    REFERENCES `autobytecare`.`mechanics` (`mechanic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`invoices` (
  `invoice_id` INT(8) NOT NULL,
  `date` DATETIME NOT NULL,
  `total_cost` DOUBLE(7,2) NOT NULL,
  `work_order_id` INT(8) NOT NULL,
  `customer_id` INT(8) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoices_customers1_idx` (`customer_id` ASC),
  INDEX `fk_invoices_work_orders1_idx` (`work_order_id` ASC),
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `autobytecare`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_work_orders1`
    FOREIGN KEY (`work_order_id`)
    REFERENCES `autobytecare`.`work_orders` (`work_order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `autobytecare`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`payments` (
  `payment_id` INT(8) NOT NULL,
  `payment_amount` DOUBLE(7,2) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `invoice_id` INT(8) NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payments_invoices1_idx` (`invoice_id` ASC),
  CONSTRAINT `fk_payments_invoices1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `autobytecare`.`invoices` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `autobytecare`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autobytecare`.`address` (
  `address_id` INT(8) NOT NULL AUTO_INCREMENT,
  `primary_address` VARCHAR(50) NOT NULL,
  `secondary_address` VARCHAR(50) NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  `country` VARCHAR(50) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`)
)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
