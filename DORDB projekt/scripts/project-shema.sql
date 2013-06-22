CREATE TABLE Jizdy
(
	jizda_id      NUMBER(8,2) NOT NULL,
	"start"         VARCHAR2(100) NOT NULL,
	cil           VARCHAR2(100) NOT NULL,
	datum         DATE NOT NULL,
	vzdalenost    NUMBER(8,2) NOT NULL,
	vypujceni_id  NUMBER(8,2) NULL
)
;


CREATE TABLE Model
(
	model_id  NUMBER(8,2) NOT NULL,
	znacka    VARCHAR2(50) NOT NULL,
	model     VARCHAR2(50) NULL,
	obsah     NUMBER(8,2) NULL,
	spotreba  FLOAT NULL
)
;


CREATE TABLE Pobocka
(
	pobocka_id  NUMBER(8,2) NOT NULL,
	mesto       VARCHAR2(50) NOT NULL,
	adresa      VARCHAR2(50) NULL,
	stat        VARCHAR2(50) NOT NULL
)
;


CREATE TABLE Ridici
(
	ridic_id      NUMBER(8,2) NOT NULL,
	jmeno         VARCHAR2(50) NOT NULL,
	prijmeni      VARCHAR2(50) NOT NULL,
	pobocka_id    NUMBER(8,2) NOT NULL,
	osobni_cislo  NVARCHAR2(50) NULL
)
;


CREATE TABLE Vozidlo
(
	vozidlo_id      NUMBER(8,2) NOT NULL,
	datum_porizeni  DATE NOT NULL,
	najeto          NUMBER(8,2) NOT NULL,
	spz             VARCHAR2(50) NOT NULL,
	model_id        NUMBER(8,2) NOT NULL,
	pobocka_id      NUMBER(8,2) NOT NULL
)
;


CREATE TABLE Vypujceni
(
	vypujcka_id        NUMBER(8,2) NOT NULL,
	datum_vypujceni    DATE NOT NULL,
	datum_vraceni      DATE NULL,
	ridic_id           NUMBER(8,2) NOT NULL,
	vozidlo_id         NUMBER(8,2) NOT NULL,
	vzdalenost_celkem  NUMBER(8,2) NOT NULL
)
;



ALTER TABLE Jizdy ADD CONSTRAINT PK_Jizdy 
	PRIMARY KEY (jizda_id) 
 USING INDEX 
;

ALTER TABLE Model ADD CONSTRAINT PK_Model 
	PRIMARY KEY (model_id) 
 USING INDEX 
;

ALTER TABLE Pobocka ADD CONSTRAINT PK_Oddeleni 
	PRIMARY KEY (pobocka_id) 
 USING INDEX 
;

ALTER TABLE Ridici ADD CONSTRAINT PK_Ridici 
	PRIMARY KEY (ridic_id) 
 USING INDEX 
;

ALTER TABLE Vozidlo ADD CONSTRAINT PK_Vozidlo 
	PRIMARY KEY (vozidlo_id) 
 USING INDEX 
;

ALTER TABLE Vypujceni ADD CONSTRAINT PK_Vypujceni 
	PRIMARY KEY (vypujcka_id) 
 USING INDEX 
;


ALTER TABLE Vozidlo
	ADD CONSTRAINT UQ_Vozidlo_spz UNIQUE (spz)
 USING INDEX 
;


ALTER TABLE Jizdy ADD CONSTRAINT FK_Jizdy_Vypujceni 
	FOREIGN KEY (vypujceni_id) REFERENCES Vypujceni (vypujcka_id)
;

ALTER TABLE Ridici ADD CONSTRAINT FK_Ridici_Pobocka 
	FOREIGN KEY (pobocka_id) REFERENCES Pobocka (pobocka_id)
;

ALTER TABLE Vozidlo ADD CONSTRAINT FK_Vozidlo_Model 
	FOREIGN KEY (model_id) REFERENCES Model (model_id)
;

ALTER TABLE Vozidlo ADD CONSTRAINT FK_Vozidlo_Pobocka 
	FOREIGN KEY (pobocka_id) REFERENCES Pobocka (pobocka_id)
;

ALTER TABLE Vypujceni ADD CONSTRAINT FK_Vypujceni_Ridici 
	FOREIGN KEY (ridic_id) REFERENCES Ridici (ridic_id)
;

ALTER TABLE Vypujceni ADD CONSTRAINT FK_Vypujceni_Vozidlo 
	FOREIGN KEY (vozidlo_id) REFERENCES Vozidlo (vozidlo_id)
;






CREATE SEQUENCE Jizdy_jizda_id_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER SET_Jizdy_jizda_id
BEFORE INSERT
ON Jizdy
FOR EACH ROW
BEGIN
  SELECT Jizdy_jizda_id_SEQ.NEXTVAL
  INTO :NEW.jizda_id
  FROM DUAL;
END;
/

CREATE SEQUENCE Model_model_id_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER SET_Model_model_id
BEFORE INSERT
ON Model
FOR EACH ROW
BEGIN
  SELECT Model_model_id_SEQ.NEXTVAL
  INTO :NEW.model_id
  FROM DUAL;
END;
/

CREATE SEQUENCE Pobocka_pobocka_id_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER SET_Pobocka_pobocka_id
BEFORE INSERT
ON Pobocka
FOR EACH ROW
BEGIN
  SELECT Pobocka_pobocka_id_SEQ.NEXTVAL
  INTO :NEW.pobocka_id
  FROM DUAL;
END;
/

CREATE SEQUENCE Ridici_ridic_id_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER SET_Ridici_ridic_id
BEFORE INSERT
ON Ridici
FOR EACH ROW
BEGIN
  SELECT Ridici_ridic_id_SEQ.NEXTVAL
  INTO :NEW.ridic_id
  FROM DUAL;
END;
/

CREATE SEQUENCE Vozidlo_vozidlo_id_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER SET_Vozidlo_vozidlo_id
BEFORE INSERT
ON Vozidlo
FOR EACH ROW
BEGIN
  SELECT Vozidlo_vozidlo_id_SEQ.NEXTVAL
  INTO :NEW.vozidlo_id
  FROM DUAL;
END;
/

CREATE SEQUENCE Vypujceni_vypujcka_id_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE OR REPLACE TRIGGER SET_Vypujceni_vypujcka_id
BEFORE INSERT
ON Vypujceni
FOR EACH ROW
BEGIN
  SELECT Vypujceni_vypujcka_id_SEQ.NEXTVAL
  INTO :NEW.vypujcka_id
  FROM DUAL;
END;
/
