--1.Vypi�e v�echny �idi�e, kte�� najezdili v�ce jak 35000km
select
  * 
from 
  ridici
where 
  ridic_id in 
  (
    select 
      ridic_id 
    from 
      vypujceni 
    group by 
      ridic_id
    having 
      sum(vzdalenost_celkem) >= 35000
  );

--2.Vyp�e automobil a model (podle ujet�ch kilometru) a jejich model.
select
  m.znacka
  ,m.model
  ,v.spz
  ,t.celkem
from
  vozidlo v
  join model m on v.model_id = m.model_id
  join
  (
  select
    vozidlo_id
    ,sum(vzdalenost_celkem) celkem
  from
    vypujceni
  group by
    vozidlo_id
  ) t on v.vozidlo_id = t.vozidlo_id
order by
  t.celkem desc;
--3.Vyp�e v�echny �idi�e, kte�� za leden, �nor a b�ezen roku 2013 ud�lali alespo� 20 j�zd
select
  ridici.*
from
  (
    select 
      ridic_id
    from
      vypujceni
    where 
      datum_vypujceni >= '1.1.2013' and datum_vypujceni <= '31.3.2013'
    group by
      ridic_id
    having
      count(*) >= 20
  ) t
  join ridici on t.ridic_id = ridici.ridic_id
;
--4.Vyp�e (v�echny) datum vypuj�en�, model, sqz a jm�no �idi�e, podle vzd�lenosti, ktrou ujeli na jedno vyp�j�en�.
select
  v.datum_vypujceni
  ,m.znacka || ' ' || m.model vozidlo_model
  ,vo.spz
  ,r.prijmeni || ' ' || r.jmeno jmeno
  ,v.vzdalenost_celkem
from
  vypujceni v
  join ridici r on v.ridic_id = r.ridic_id
  join vozidlo vo on v.vozidlo_id = vo.vozidlo_id
  join model m on m.model_id = vo.model_id
order by
  v.vzdalenost_celkem desc
;
--5.Vyp�e v�echny �idi�e, kter� ��dili vozidlo, model MAN
select distinct
  r.*
from
  vypujceni v
  join ridici r on v.ridic_id = r.ridic_id
  join vozidlo vo on v.vozidlo_id = vo.vozidlo_id
  join model m on m.model_id = vo.model_id
where
  m.znacka = 'MAN'
;




