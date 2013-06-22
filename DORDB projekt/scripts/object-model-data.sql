delete from OBJ_POBOCKA;
delete from OBJ_MODEL;
delete from OBJ_VOZIDLO;
delete from OBJ_RIDICI;
delete from OBJ_VYPUJCENI;
delete from OBJ_JIZDY;

insert into OBJ_POBOCKA (POBOCKA_ID,MESTO,ADRESA,STAT) (SELECT POBOCKA_ID, MESTO,ADRESA,STAT from POBOCKA);
insert into OBJ_MODEL (MODEL_ID,ZNACKA,MODEL,OBSAH,SPOTREBA) (SELECT MODEL_ID,ZNACKA,MODEL,OBSAH,SPOTREBA from MODEL);

/*NAPLNI VOZIDLO*/
insert into OBJ_VOZIDLO (VOZIDLO_ID,DATUM_PORIZENI,NAJETO,SPZ) (SELECT VOZIDLO_ID,DATUM_PORIZENI,NAJETO,SPZ from VOZIDLO);
update OBJ_VOZIDLO ov set ov.MODEL_ID = (
	select REF(ovt) from OBJ_MODEL ovt where ovt.MODEL_ID = (
		select v.MODEL_ID from VOZIDLO v where v.MODEL_ID = ov.MODEL_ID
	)
);
update OBJ_VOZIDLO op set op.POBOCKA_ID = (
	select REF(obp) from OBJ_POBOCKA obp where obp.POBOCKA_ID = (
		select v.POBOCKA_ID from VOZIDLO v where v.POBOCKA_ID = op.POBOCKA_ID
	)
);

/*NAPLNI RIDICE*/
insert into OBJ_RIDICI (RIDIC_ID,JMENO,PRIJMENI) (SELECT RIDIC_ID,JMENO,PRIJMENI from RIDICI);
update OBJ_RIDICI obt set obt.POBOCKA_ID = (
	select REF(obp) from OBJ_POBOCKA obp where obp.POBOCKA_ID = (
		select r.POBOCKA_ID from RIDICI r where r.POBOCKA_ID = obt.POBOCKA_ID
	)
);

/*NAPLNI VYPUJCKY*/
insert into OBJ_VYPUJCENI (VYPUJCKA_ID,DATUM_VYPUJCENI,DATUM_VRACENI,VZDALENOST_CELKEM) (SELECT VYPUJCKA_ID,DATUM_VYPUJCENI,DATUM_VRACENI,VZDALENOST_CELKEM);
update OBJ_VYPUJCENI obv set obv.RIDICI_ID = (
	select REF(obr) from OBJ_RIDICI obr where obr.RIDIC_ID = (
		select vyp.RIDIC_ID from VYJPUJCENI vyp where vyp.RODIC_ID = obv.RIDIC_ID
	)
);
insert into OBJ_VYPUJCENI (VYPUJCKA_ID,DATUM_VYPUJCENI,DATUM_VRACENI,VZDALENOST_CELKEM) (SELECT VYPUJCKA_ID,DATUM_VYPUJCENI,DATUM_VRACENI,VZDALENOST_CELKEM);
update OBJ_VYPUJCENI voz set voz.VOZIDLO_ID = (
	select REF(obvz) from OBJ_VOZIDLO obvz where obvz.VOZIDLO_ID = (
		select vyp.VOZIDLO_ID from VYJPUJCENI vyp where vyp.VOZIDLO_ID = voz.VOZIDLO_ID
	)
);

/*NAPLNI JIZDY*/
insert into OBJ_JIZDY (JIZDA_ID,START,CIL,DATUM,VZDALENOST) (SELECT JIZDA_ID,START,CIL,DATUM,VZDALENOST);
update OBJ_JIZDY voz set voz.vypujceni_id = (
	select REF(vpref) from OBJ_VOZIDLO vozref where vpref.vypujceni_id = (
		select vyp.VOZIDLO_ID from JIZDY vyp where vyp.vypujceni_id = voz.vypujceni_id
	)
);