create table ogrenciler
(
ogrenci_no char(7),  --uzunlugunu bildigimiz stringler icin kullanilir
isim varchar(20),  -- uzunlugunu bilmedigimiz String'ler icin kullanilir.
soyisim varchar(25), 
not_ort real,  -- ondalikli sayilar icin kullanilir double gibi
kayit_tarihi date -- 
	
);

    -- varolan bir tablodan yeni bir tablo olusturma.
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler;

select * from notlar;

--tablo icine veri ekleme:

insert into notlar values ('ayse',75.5);
insert into notlar values ('hakan',75.5);
insert into notlar values ('selim',75.5);
insert into notlar values ('seri',75.5);

select * from notlar;



-- CONSTRAINT 
-- UNIQUE

create table ogrenciler6
(
ogrenci_no char(7) unique,
isim varchar(20) not null, 
soyisim varchar(25), 
not_ort real,  
kayit_tarihi date
	
);
select * from ogrenciler6;

insert into ogrenciler6 values ('1234567','soner','evren',75.5,now());
insert into ogrenciler6 values ('1234867','soner','evren',75.5,now());
insert into ogrenciler6 (ogrenci_no,soyisim,not_ort) values ('1235695','evren',80); --not null kistlamasi var hata verir.

--primary key olusturma 

create table ogrenciler7
(
ogrenci_no char(7) primary key,
isim varchar(20), 
soyisim varchar(25), 
not_ort real,  
kayit_tarihi date
	
);

--primary key atamasi 2.yol:
-- Eger constraint ismi vermek istersek bu yolu kullanabiliriz
create table ogrenciler8
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25), 
not_ort real,  
kayit_tarihi date,
constraint ogr primary key (ogrenci_no)	
);
/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
create table tedarikciler3
(
tedarikci_id char(7) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(25)
	
);

create table urunler
(
tedarikci_id char(7),
urun_id char(7),
foreign key (tedarikci_id) references tedarikciler3(tedarikci_id)
);

select * from tedarikciler3;
select * from urunler;
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”,
“isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, 
“sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar (
id varchar(15) primary key,
isim varchar(20) unique,
maas int not null,
ise_baslama date
);

create table adresler
(
adres_id varchar(30),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
foreign key (adres_id) references calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- unique constraint oldugu icin kabul etmedi.
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --null maas olmaz
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --unique 2 tane olmaz
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- hatali 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); -- null kabul etti
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --primary unique olmali
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');  -- 2 adet primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');  --null olmaz

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;

--check constraint ------

create table calisanlar1 (
id varchar(15) primary key,
isim varchar(20) unique,
maas int check(maas>10000),
ise_baslama date
);


INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,9000, '2018-04-14');  --condition sebebiyle...

--- DQL where kullanimi
Select * from calisanlar;
select isim from calisanlar;

-- calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz.
select isim,maas from calisanlar where maas>5000;

-- calisanlar tablosundan ismi velihan olan tum verileri listeleyiniz.
select * from calisanlar where isim='Veli Han';

-- calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz.

select * from calisanlar where maas=5000;

-- DML --- delete:
delete from calisanlar;  --- eger parent table baska chil tablo ile iliskili ise once child table silinmelidir. 

-- adresler tablosundaan sehri antep olan verileri silelim.

delete from adresler where sehir = 'Antep';
select * from adresler;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
CREATE TABLE ogrenciler9
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler9 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler9 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler9 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler9 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler9 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler9 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler9;
-- ismi Mustafa Bak ve Nesibe Yilmaz olan kayitlari silelim 

delete from ogrenciler9 where isim='Mustafa Bak' or isim = 'Nesibe Yilmaz';

-- veli ismi hasan olan datayi silelim...

delete from ogrenciler9 where veli_isim='Hasan';

-- TRUNCATE --------
-----bir tablodaki tum verileri geri alamayacagimiz sekilde siler. Sartli silme yapmaz.

truncate table ogrenciler9 --- butun verileri siler. 

drop table if exists talebeler -- eger tablo varsa tabloyu siler. 

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);













