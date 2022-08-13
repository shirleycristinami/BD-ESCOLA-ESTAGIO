-- MySQL Workbench Synchronization
-- Generated: 2022-08-12 21:24
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Shirley

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `ESTAGIO` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `ESTAGIO`.`ALUNO` (
  `idaluno` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `disciplina_iddisciplina` INT(11) NOT NULL,
  `projeto_aluno` VARCHAR(45) NOT NULL,
  INDEX `idaluno` (`idaluno` ASC) INVISIBLE,
  PRIMARY KEY (`idaluno`, `disciplina_iddisciplina`),
  INDEX `fk_ALUNO_disciplina1_idx` (`disciplina_iddisciplina` ASC) INVISIBLE,
  CONSTRAINT `fk_ALUNO_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `ESTAGIO`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ESTAGIO`.`disciplina` (
  `iddisciplina` INT(11) NOT NULL,
  `nome_disciplina` VARCHAR(45) NOT NULL,
  `codigo_disciplina` VARCHAR(45) NOT NULL,
  `prof_discipina` VARCHAR(45) NOT NULL,
  `sala_disciplina` VARCHAR(45) NOT NULL,
  `professor_idprofessor` INT(11) NOT NULL,
  `professor_ALUNO_idaluno` INT(11) NOT NULL,
  `professor_ALUNO_disciplina_iddisciplina` INT(11) NOT NULL,
  PRIMARY KEY (`iddisciplina`),
  INDEX `fk_disciplina_professor1_idx` (`professor_idprofessor` ASC, `professor_ALUNO_idaluno` ASC, `professor_ALUNO_disciplina_iddisciplina` ASC) VISIBLE,
  CONSTRAINT `fk_disciplina_professor1`
    FOREIGN KEY (`professor_idprofessor` , `professor_ALUNO_idaluno` , `professor_ALUNO_disciplina_iddisciplina`)
    REFERENCES `ESTAGIO`.`professor` (`idprofessor` , `ALUNO_idaluno` , `ALUNO_disciplina_iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ESTAGIO`.`professor` (
  `idprofessor` INT(11) NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(45) NOT NULL,
  `orient_projeto` VARCHAR(45) NOT NULL,
  `ALUNO_idaluno` INT(11) NOT NULL,
  `ALUNO_disciplina_iddisciplina` INT(11) NOT NULL,
  PRIMARY KEY (`idprofessor`, `ALUNO_idaluno`, `ALUNO_disciplina_iddisciplina`),
  INDEX `fk_professor_ALUNO1_idx` (`ALUNO_idaluno` ASC, `ALUNO_disciplina_iddisciplina` ASC) VISIBLE,
  CONSTRAINT `fk_professor_ALUNO1`
    FOREIGN KEY (`ALUNO_idaluno` , `ALUNO_disciplina_iddisciplina`)
    REFERENCES `ESTAGIO`.`ALUNO` (`idaluno` , `disciplina_iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ESTAGIO`.`Empresa` (
  `idEmpresa` INT(11) NOT NULL,
  `nome_empresa` VARCHAR(45) NOT NULL,
  `endereco_empresa` VARCHAR(45) NOT NULL,
  `tel_empresa` VARCHAR(45) NOT NULL,
  `area_estagio` VARCHAR(45) NOT NULL,
  `cod_estagiario` INT(11) NOT NULL,
  `nome_estagiario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  INDEX `idempresa` (`idEmpresa` ASC) INVISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `ESTAGIO`.`ESTAGIO` (
  `Empresa_idEmpresa` INT(11) NOT NULL,
  `ALUNO_idaluno` INT(11) NOT NULL,
  `ALUNO_disciplina_iddisciplina` INT(11) NOT NULL,
  PRIMARY KEY (`Empresa_idEmpresa`, `ALUNO_idaluno`, `ALUNO_disciplina_iddisciplina`),
  INDEX `fk_Empresa_has_ALUNO_ALUNO1_idx` (`ALUNO_idaluno` ASC, `ALUNO_disciplina_iddisciplina` ASC) VISIBLE,
  INDEX `fk_Empresa_has_ALUNO_Empresa1_idx` (`Empresa_idEmpresa` ASC) VISIBLE,
  CONSTRAINT `fk_Empresa_has_ALUNO_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `ESTAGIO`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empresa_has_ALUNO_ALUNO1`
    FOREIGN KEY (`ALUNO_idaluno` , `ALUNO_disciplina_iddisciplina`)
    REFERENCES `ESTAGIO`.`ALUNO` (`idaluno` , `disciplina_iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DELIMITER $$

USE `ESTAGIO`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ESTAGIO`.`ALUNO_AFTER_INSERT` AFTER INSERT ON `ALUNO` FOR EACH ROW
BEGIN

END
$$

USE `ESTAGIO`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ESTAGIO`.`ALUNO_BEFORE_UPDATE` BEFORE UPDATE ON `ALUNO` FOR EACH ROW
BEGIN

END
$$

USE `ESTAGIO`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ESTAGIO`.`ALUNO_AFTER_UPDATE` AFTER UPDATE ON `ALUNO` FOR EACH ROW
BEGIN

END
$$

USE `ESTAGIO`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ESTAGIO`.`ALUNO_BEFORE_DELETE` BEFORE DELETE ON `ALUNO` FOR EACH ROW
BEGIN

END
$$

USE `ESTAGIO`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ESTAGIO`.`ALUNO_AFTER_DELETE` AFTER DELETE ON `ALUNO` FOR EACH ROW
BEGIN

END
$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
