-- MySQL Workbench Synchronization
-- Generated: 2022-10-26 19:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: wilia

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `factura` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `factura`.`FacturaCabecera` (
  `idFacturaCabecera` INT(11) NOT NULL AUTO_INCREMENT,
  `FechaFacCabecera` DATETIME NOT NULL DEFAULT NOW(),
  `igvFacturaCabecera` DECIMAL(18,2) NOT NULL,
  `subtotalFacturaCabecera` DECIMAL(18,2) NOT NULL,
  `totalFacturaCabecera` DECIMAL(18,2) NOT NULL,
  `estadoFactura` CHAR(1) NOT NULL,
  `idempresa` INT(11) NOT NULL,
  `idtipopago` INT(11) NOT NULL,
  `idcliente` INT(11) NOT NULL,
  PRIMARY KEY (`idFacturaCabecera`),
  INDEX `fk_FacturaCabecera_empresa1_idx` (`idempresa` ASC) VISIBLE,
  INDEX `fk_FacturaCabecera_tipopago1_idx` (`idtipopago` ASC) VISIBLE,
  INDEX `fk_FacturaCabecera_cliente1_idx` (`idcliente` ASC) VISIBLE,
  CONSTRAINT `fk_FacturaCabecera_empresa1`
    FOREIGN KEY (`idempresa`)
    REFERENCES `factura`.`empresa` (`idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaCabecera_tipopago1`
    FOREIGN KEY (`idtipopago`)
    REFERENCES `factura`.`tipopago` (`idtipopago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FacturaCabecera_cliente1`
    FOREIGN KEY (`idcliente`)
    REFERENCES `factura`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `factura`.`Productos` (
  `idProductos` INT(11) NOT NULL AUTO_INCREMENT,
  `idFacturaDetalle` INT(11) NOT NULL,
  `idFacturaCabecera` INT(11) NOT NULL,
  `nombreProductos` VARCHAR(45) NOT NULL,
  `valorProducto` DECIMAL(18,2) NOT NULL,
  `igvProducto` TINYINT(4) NOT NULL,
  PRIMARY KEY (`idProductos`),
  INDEX `fk_Productos_FacturaDetalle1_idx` (`idFacturaDetalle` ASC, `idFacturaCabecera` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_FacturaDetalle1`
    FOREIGN KEY (`idFacturaDetalle` , `idFacturaCabecera`)
    REFERENCES `factura`.`FacturaDetalle` (`idFacturaDetalle` , `idFacturaCabecera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `factura`.`FacturaDetalle` (
  `idFacturaDetalle` INT(11) NOT NULL AUTO_INCREMENT,
  `idFacturaCabecera` INT(11) NOT NULL,
  `cantFacturaDetalle` INT(11) NOT NULL,
  `valorFacturaDetalle` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`idFacturaDetalle`, `idFacturaCabecera`),
  INDEX `fk_FacturaDetalle_FacturaCabecera_idx` (`idFacturaCabecera` ASC) VISIBLE,
  CONSTRAINT `fk_FacturaDetalle_FacturaCabecera`
    FOREIGN KEY (`idFacturaCabecera`)
    REFERENCES `factura`.`FacturaCabecera` (`idFacturaCabecera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `factura`.`empresa` (
  `idempresa` INT(11) NOT NULL AUTO_INCREMENT,
  `rucempresa` VARCHAR(45) NOT NULL,
  `nombreempresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `factura`.`tipopago` (
  `idtipopago` INT(11) NOT NULL AUTO_INCREMENT,
  `descripciontipopago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipopago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `factura`.`cliente` (
  `idcliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrecliente` VARCHAR(45) NOT NULL,
  `nroidentificacion` VARCHAR(45) NOT NULL,
  `direccioncliente` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
