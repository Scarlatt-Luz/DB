-- MySQL Script generated by MySQL Workbench
-- Wed Jan 19 22:11:02 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_agua_viva
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_agua_viva
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_agua_viva` DEFAULT CHARACTER SET utf8 ;
USE `db_agua_viva` ;

-- -----------------------------------------------------
-- Table `db_agua_viva`.`tb_tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agua_viva`.`tb_tema` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tema` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_agua_viva`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agua_viva`.`tb_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tipoUsuario` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_agua_viva`.`tb_postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_agua_viva`.`tb_postagem` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `data` DATE NOT NULL,
  `regiao` VARCHAR(255) NOT NULL,
  `texto` VARCHAR(1000) NOT NULL,
  `foto` VARCHAR(255) NULL,
  `tb_tema_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`, `tb_tema_id`, `tb_usuario_id`),
  INDEX `fk_postagem_tema_idx` (`tb_tema_id` ASC) VISIBLE,
  INDEX `fk_postagem_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_postagem_tema`
    FOREIGN KEY (`tb_tema_id`)
    REFERENCES `db_agua_viva`.`tb_tema` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postagem_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_agua_viva`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
