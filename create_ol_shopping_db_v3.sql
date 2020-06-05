-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ol_shopping
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ol_shopping
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ol_shopping` DEFAULT CHARACTER SET utf8 ;
USE `ol_shopping` ;

-- -----------------------------------------------------
-- Table `ol_shopping`.`shipping_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`shipping_address` (
  `address_no` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_no` INT(11) NOT NULL,
  `street_no` INT(11) NOT NULL,
  `apartment_no` INT(11) NULL DEFAULT NULL,
  `street_name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(6) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_no`),
  INDEX `fk_shipping_address_customer1` (`customer_no` ASC) VISIBLE,
  CONSTRAINT `fk_shipping_address_customer1`
    FOREIGN KEY (`customer_no`)
    REFERENCES `ol_shopping`.`customer` (`customer_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 413
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`payment_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`payment_method` (
  `payment_method_no` INT(11) NOT NULL,
  `customer_no` INT(11) NOT NULL,
  `method` ENUM('MasterCard', 'VISA') NOT NULL,
  `card_no` VARCHAR(45) NOT NULL,
  `owner_name` VARCHAR(45) NOT NULL,
  `expiry_date` DATE NOT NULL,
  `security_no` INT(11) NOT NULL,
  PRIMARY KEY (`payment_method_no`),
  INDEX `fk_payment_method_customer1_idx` (`customer_no` ASC) VISIBLE,
  CONSTRAINT `fk_payment_method_customer1`
    FOREIGN KEY (`customer_no`)
    REFERENCES `ol_shopping`.`customer` (`customer_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`customer` (
  `customer_no` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `street_no` INT(11) NOT NULL,
  `apartment_no` INT(11) NULL DEFAULT NULL,
  `street_name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(6) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `shipping_address` INT(11) NOT NULL,
  `email_address` VARCHAR(100) NULL DEFAULT NULL,
  `phone_no` VARCHAR(45) NULL DEFAULT NULL,
  `payment_method` INT(11) NOT NULL,
  PRIMARY KEY (`customer_no`),
  INDEX `shipping_address` (`shipping_address` ASC) VISIBLE,
  INDEX `payment_method` (`payment_method` ASC) VISIBLE,
  CONSTRAINT `customer_ibfk_1`
    FOREIGN KEY (`shipping_address`)
    REFERENCES `ol_shopping`.`shipping_address` (`address_no`)
    ON DELETE CASCADE,
  CONSTRAINT `customer_ibfk_2`
    FOREIGN KEY (`payment_method`)
    REFERENCES `ol_shopping`.`payment_method` (`payment_method_no`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 107
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`transporter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`transporter` (
  `transporter_no` INT(11) NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `street_no` INT(11) NOT NULL,
  `street_name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(6) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `phone_no` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`transporter_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 7006
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`order_header`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`order_header` (
  `order_no` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_no` INT(11) NOT NULL,
  `transporter_no` INT(11) NOT NULL,
  `order_date` DATE NOT NULL,
  `total_amount` DECIMAL(10,2) NOT NULL,
  `customer_note` VARCHAR(255) NULL DEFAULT NULL,
  `shipping_date` DATE NOT NULL,
  PRIMARY KEY (`order_no`),
  INDEX `fk_order_header_customer1_idx` (`customer_no` ASC) VISIBLE,
  INDEX `fk_order_header_transporter1_idx` (`transporter_no` ASC) VISIBLE,
  CONSTRAINT `fk_order_header_customer1`
    FOREIGN KEY (`customer_no`)
    REFERENCES `ol_shopping`.`customer` (`customer_no`),
  CONSTRAINT `fk_order_header_transporter1`
    FOREIGN KEY (`transporter_no`)
    REFERENCES `ol_shopping`.`transporter` (`transporter_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 307
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`vendor` (
  `vendor_no` INT(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(45) NOT NULL,
  `street_no` INT(11) NOT NULL,
  `street_name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(6) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `phone_no` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`vendor_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`product` (
  `product_no` INT(11) NOT NULL AUTO_INCREMENT,
  `vendor_no` INT(11) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `size` ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL') NULL DEFAULT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `cost_of_goods` DECIMAL(10,2) NOT NULL,
  `inventory_amount` INT(11) NOT NULL,
  `availability_date` DATE NOT NULL,
  PRIMARY KEY (`product_no`),
  INDEX `fk_product_vendor_idx` (`vendor_no` ASC) VISIBLE,
  CONSTRAINT `fk_product_vendor`
    FOREIGN KEY (`vendor_no`)
    REFERENCES `ol_shopping`.`vendor` (`vendor_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 9006
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`order_detail` (
  `orderdetail_no` INT(11) NOT NULL AUTO_INCREMENT,
  `order_no` INT(11) NOT NULL,
  `product_no` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`orderdetail_no`),
  INDEX `fk_order_detail_order_header1_idx` (`order_no` ASC) VISIBLE,
  INDEX `fk_order_detail_product1_idx` (`product_no` ASC) VISIBLE,
  CONSTRAINT `fk_order_detail_order_header1`
    FOREIGN KEY (`order_no`)
    REFERENCES `ol_shopping`.`order_header` (`order_no`),
  CONSTRAINT `fk_order_detail_product1`
    FOREIGN KEY (`product_no`)
    REFERENCES `ol_shopping`.`product` (`product_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 509
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ol_shopping`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ol_shopping`.`review` (
  `product_no` INT(11) NOT NULL,
  `customer_no` INT(11) NOT NULL,
  `rating` ENUM('1', '2', '3', '4', '5') NOT NULL,
  `comment` VARCHAR(255) NULL DEFAULT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`product_no`),
  INDEX `fk_review_product1_idx` (`product_no` ASC) VISIBLE,
  INDEX `fk_review_customer1_idx` (`customer_no` ASC) VISIBLE,
  CONSTRAINT `fk_review_customer1`
    FOREIGN KEY (`customer_no`)
    REFERENCES `ol_shopping`.`customer` (`customer_no`),
  CONSTRAINT `fk_review_product1`
    FOREIGN KEY (`product_no`)
    REFERENCES `ol_shopping`.`product` (`product_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
