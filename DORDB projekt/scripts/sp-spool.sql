select * from (select * from vypujceni order by vypujcka_id desc) where rownum < 11;
/
DECLARE
  OSOBNI_CISLO_IN VARCHAR2(50);
  SPZ_IN VARCHAR2(200);
  DATUM_IN DATE;
  cc number;
BEGIN
  OSOBNI_CISLO_IN := 'N67';
  SPZ_IN := '1Z1 5589';
  DATUM_IN := '29.5.2013';
  
  NOVA_VYPUJCKA(
    OSOBNI_CISLO_IN => OSOBNI_CISLO_IN,
    SPZ_IN => SPZ_IN,
    DATUM_IN => DATUM_IN
  );
END;
/
select * from (select * from vypujceni order by vypujcka_id desc) where rownum < 11;
/
select * from (select * from jizdy order by jizda_id desc) where rownum < 11;
/
DECLARE
  OSOBNI_CISLO_IN VARCHAR2(50);
  SPZ_IN VARCHAR2(200);
  DATUM_IN DATE;
  START_IN VARCHAR2(200);
  CIL_IN VARCHAR2(200);
  VZDALENOST_IN NUMBER;
  cc number;
BEGIN
  OSOBNI_CISLO_IN := 'N67';
  SPZ_IN := '1Z1 5589';
  DATUM_IN := '29.5.2013';
  START_IN := 'HK';
  CIL_IN := 'PCE';
  VZDALENOST_IN := 35;
  
  NOVA_JIZDA(
    OSOBNI_CISLO_IN => OSOBNI_CISLO_IN,
    SPZ_IN => SPZ_IN,
    DATUM_IN => DATUM_IN,
    START_IN => START_IN,
    CIL_IN => CIL_IN,
    VZDALENOST_IN => VZDALENOST_IN
  );
END;
/
select * from (select * from jizdy order by jizda_id desc) where rownum < 11;
/