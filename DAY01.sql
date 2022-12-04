
-- DDL - DATA definition language:
-- create   -tablo olusturma.

create table ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,  -- ondalikli sayilar icin kullanilir double gibi
kayit_tarihi date
	
);

-- varolan tablodan yeni bir tablo olusturma:
create table ogrenci_notlari
as
select isim,soyisim,not_ort from ogrenciler;

--DMl - data manipulation language.
-- insert veri ekleme:

insert into ogrenciler values ('1234567','Burak','yildiz',99.8,now());
insert into ogrenciler values ('1234567','Burak','yildiz',99.8,'2022-12-01');
--bir tabloya parcali veri eklemek istersek:
insert into ogrenciler(isim,soyisim) values('soner','yildiz');

-- DQL -data query language .
-- select

select * from ogrenciler;






					  