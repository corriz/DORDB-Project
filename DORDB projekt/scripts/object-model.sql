create type type_pobocka as object(
	"POBOCKA_ID" 		NUMBER(10),
	"MESTO" 	NVARCHAR2(50),
	"ADRESA" 	NVARCHAR2(50),
	"STAT" 		NVARCHAR2(50)
);

create type type_model as object (
	"MODEL_ID"		NUMBER(10),
	"ZNACKA"	NVARCHAR2(50),
	"MODEL"		NVARCHAR2(20),
	"OBSAH"		NUMBER(10),
	"SPOTREBA"	FLOAT (10)
);

create type type_ridici as object (
	"RIDIC_ID" 		NUMBER(10),
	"JMENO" 		NVARCHAR2(50),
	"PRIJMENI" 		NVARCHAR2(50),
	"POBOCKA_ID" 	REF TYPE_POBOCKA
);

create type type_vozidlo as object (
	"VOZIDLO_ID"		NUMBER(10),
	"DATUM_PORIZENI" DATE,
	"NAJETO"	NUMBER(10),
	"SPZ"		NVARCHAR2(50),
	"MODEL_ID"	REF TYPE_MODEL,
	"POBOCKA_ID" REF TYPE_POBOCKA
);

create type type_vypujceni as object (
	"VYPUJCKA_ID"	NUMBER(10),
	"DATUM_VYPUJCENI" DATE,
	"DATUM_VRACENI" DATE,
	"RIDIC_ID"	REF TYPE_RIDICI,
	"VOZIDLO_ID"	REF TYPE_VOZIDLO
	"VZDALENOST_CELKEM" NUMBER(10),
);

create type type_jizdy as object (
	"JIZDY_ID"	NUMBER(10),
	"START" NVARCHAR2(50),
	"CIL"	NVARCHAR2(50),
	"DATUM" DATE,
	"VZDALENOST" NUMBER(10),
	"VYPUJCENI_ID" REF TYPE_VYPUJCENI
);

CREATE TABLE OBJ_POBOCKA of TYPE_POBOCKA;

CREATE TABLE OBJ_MODEL of TYPE_MODEL;

CREATE TABLE OBJ_RIDIC of TYPE_RIDIC 
(foreign key (POBOCKA_ID) references OBJ_POBOCKA);

CREATE TABLE OBJ_VOZIDLO of TYPE_VOZIDLO 
(foreign key (MODE_ID) references OBJ_MODEL,
foreign key (POBOCKA_ID) references OBJ_POBOCKA);

CREATE TABLE OBJ_VYPUJCENI of TYPE_VYPUJCENI
(foreign key (RIDICI_ID) references OBJ_RIDICI,
foreign key (VOZIDLO_ID) references OBJ_VOZIDLO);

CREATE TABLE OBJ_JIZDY of TYPE_JIZDY
(foreign key (VYPUJCENI_ID) references OBJ_VYPUJCENI);

