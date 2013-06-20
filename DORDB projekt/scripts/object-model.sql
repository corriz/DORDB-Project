create type pobocka_object as object(
	"ID" 		NUMBER(10),
	"MESTO" 	NVARCHAR2(50),
	"ADRESA" 	NVARCHAR2(50),
	"STAT" 		NVARCHAR2(50)
);

create type ridic_object as object (
	"ID" 		NUMBER(10),
	"JMENO" 	NVARCHAR2(50),
	"PRIJMENI" 	NVARCHAR2(50)
);

create type vozidlo_object as object (
	"ID"		NUMBER(10),
	"DATUM_PORIZENI" DATE,
	"NAJETO"	NUMBER(10),
	"SPZ"		NVARCHAR2(50),
);

create type model_object as object (
	"ID"		NUMBER(10),
	"ZNACKA"	NVARCHAR2(50),
	"MODEL"		NVARCHAR2(20),
	"OBSAH"		NUMBER(10),
	"SPOTREBA"	FLOAT (10)
);

create type vypujcky_object as object (
	"ID"	NUMBER(10),
	"DATUM_VYPUJCENI" DATE,
	"DATUM_VRACENI" DATE,
	"VZDALENOST_CELKEM" NUMBER(10),
);
