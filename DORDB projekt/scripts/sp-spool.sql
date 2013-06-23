> select * from (select * from vypujceni order by vypujcka_id desc) where rownum < 11
       1000|23.02.13       |24.02.13     |        11|        43|              680
        999|13.01.13       |15.01.13     |        25|        61|              648
        998|03.01.13       |06.01.13     |        14|        56|              893
        997|01.03.13       |02.03.13     |         9|        49|              672
        996|20.03.13       |22.03.13     |         1|         9|              596
        995|10.04.13       |13.04.13     |        29|        56|             1680
        994|21.04.13       |23.04.13     |        31|        77|             1114
        993|19.01.13       |21.01.13     |        38|        99|             1302
        992|18.04.13       |19.04.13     |        33|        33|              463
        991|23.04.13       |25.04.13     |        26|        38|              389

 10 rows selected 

> /
> DECLARE
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

Error starting at line 4 in command:
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
Error report:
ORA-06550: line 11, column 3:
PLS-00201: identifier 'NOVA_VYPUJCKA' must be declared
ORA-06550: line 11, column 3:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:
> select * from (select * from vypujceni order by vypujcka_id desc) where rownum < 11
       1000|23.02.13       |24.02.13     |        11|        43|              680
        999|13.01.13       |15.01.13     |        25|        61|              648
        998|03.01.13       |06.01.13     |        14|        56|              893
        997|01.03.13       |02.03.13     |         9|        49|              672
        996|20.03.13       |22.03.13     |         1|         9|              596
        995|10.04.13       |13.04.13     |        29|        56|             1680
        994|21.04.13       |23.04.13     |        31|        77|             1114
        993|19.01.13       |21.01.13     |        38|        99|             1302
        992|18.04.13       |19.04.13     |        33|        33|              463
        991|23.04.13       |25.04.13     |        26|        38|              389

 10 rows selected 

> /
> select * from (select * from jizdy order by jizda_id desc) where rownum < 11
      2970|Kingston-on-Thames                                                                                  |Linz                                                                                                |24.02.13|       535|        1000
      2969|Kingston-on-Thames                                                                                  |Lens-Saint-Servais                                                                                  |23.02.13|       145|        1000
      2968|Ledbury                                                                                             |Dunedin                                                                                             |15.01.13|       291|         999
      2967|Herfelingen                                                                                         |Smetlede                                                                                            |14.01.13|       357|         999
      2966|Houtave                                                                                             |Linz                                                                                                |05.01.13|       150|         998
      2965|Istres                                                                                              |Chelsea                                                                                             |04.01.13|       512|         998
      2964|Windermere                                                                                          |Istres                                                                                              |04.01.13|       231|         998
      2963|Nimy                                                                                                |Bissegem                                                                                            |02.03.13|       236|         997
      2962|Hohen Neuendorf                                                                                     |Bridgnorth                                                                                          |01.03.13|       436|         997
      2961|Portsoy                                                                                             |Bossut-Gottechain                                                                                   |20.03.13|       596|         996

 10 rows selected 

> /
> DECLARE
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

Error starting at line 25 in command:
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
Error report:
ORA-06550: line 17, column 3:
PLS-00201: identifier 'NOVA_JIZDA' must be declared
ORA-06550: line 17, column 3:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:
> select * from (select * from jizdy order by jizda_id desc) where rownum < 11
      2970|Kingston-on-Thames                                                                                  |Linz                                                                                                |24.02.13|       535|        1000
      2969|Kingston-on-Thames                                                                                  |Lens-Saint-Servais                                                                                  |23.02.13|       145|        1000
      2968|Ledbury                                                                                             |Dunedin                                                                                             |15.01.13|       291|         999
      2967|Herfelingen                                                                                         |Smetlede                                                                                            |14.01.13|       357|         999
      2966|Houtave                                                                                             |Linz                                                                                                |05.01.13|       150|         998
      2965|Istres                                                                                              |Chelsea                                                                                             |04.01.13|       512|         998
      2964|Windermere                                                                                          |Istres                                                                                              |04.01.13|       231|         998
      2963|Nimy                                                                                                |Bissegem                                                                                            |02.03.13|       236|         997
      2962|Hohen Neuendorf                                                                                     |Bridgnorth                                                                                          |01.03.13|       436|         997
      2961|Portsoy                                                                                             |Bossut-Gottechain                                                                                   |20.03.13|       596|         996

 10 rows selected 

> /
