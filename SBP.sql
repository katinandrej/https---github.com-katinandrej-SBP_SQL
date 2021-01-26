-- CREATE
--KREIRANJE SCHEMA
CREATE SCHEMA Otvaranje_kartona;
go
CREATE SCHEMA Zakazivanje_pregleda;
go
CREATE SCHEMA Pregled;
go
CREATE SCHEMA Usluge_i_lekovi;
go
CREATE SCHEMA Uput;
go
CREATE SCHEMA Davanje_vakcina;
go
CREATE SCHEMA Edukacija;
go
CREATE SCHEMA Bolovanje;
go

--KREIRANJE TABELA
--Otvaranje_kartona.STARATELJ
if object_id('Otvaranje_kartona.STARATELJ','U') is not null
	drop table Otvaranje_kartona.STARATELJ
go

CREATE TABLE Otvaranje_kartona.STARATELJ(
JMBG_STR nchar(13) NOT NULL,
IME_STR nchar(15) NOT NULL,
PREZIME_STR nchar(30) NOT NULL,
DATRODJENJA_STR date NOT NULL,
ZANIMANJE_STR nvarchar(30),
FIRMA_STR nvarchar(30),
POL_STR nchar NOT NULL,
ADRESA_STR nchar(30) NOT NULL,
BRTEL_STR nvarchar(15) ,
MOBTEL_STR nvarchar(15) ,
EMAIL_STR nvarchar(50) ,
DRZAVLJANSTVO_STR nchar(30) NOT NULL,
);

--Otvaranje_kartona.ODGOVORAN
if object_id('Otvaranje_kartona.ODGOVORAN','U') is not null
	drop table Otvaranje_kartona.ODGOVORAN
go

CREATE TABLE Otvaranje_kartona.ODGOVORAN(
JMBG_STR nchar(13) NOT NULL,
PRIORITET bit NOT NULL,
SIF_KARTON int NOT NULL,
SIF_ULOGA int NOT NULL
);

--Otvaranje_kartona.ULOGA
if object_id('Otvaranje_kartona.ULOGA','U') is not null
	drop table Otvaranje_kartona.ULOGA
go

CREATE TABLE Otvaranje_kartona.ULOGA(
SIF_ULOGA int NOT NULL,
ULOGA nchar(15) NOT NULL
);

--Sekvenca
IF OBJECT_ID('Otvaranje_kartona.ULOGA_SEQ') IS NOT NULL
	DROP SEQUENCE Otvaranje_kartona.ULOGA_SEQ
GO

CREATE SEQUENCE Otvaranje_kartona.ULOGA_SEQ AS INT
	START WITH 1
	CYCLE;


--Otvaranje_kartona.KARTON
if object_id('Otvaranje_kartona.KARTON','U') is not null
	drop table Otvaranje_kartona.KARTON
go

CREATE TABLE Otvaranje_kartona.KARTON(
SIF_KARTON int IDENTITY NOT NULL,
JMBG_KARTON nchar(13) NOT NULL,
IME_KARTON nchar(15) NOT NULL,
PREZIME_KARTON nchar(30) NOT NULL,
POL_KARTON nchar NOT NULL,
DATRODJENJA_KARTON date NOT NULL,
DATOTVARANJA_KARTON date NOT NULL,
MESTO_RODJENJA nchar(30) NOT NULL,
OPSTINA_RODJENJA nchar(30) NOT NULL,
ADRESA_KARTON nchar(70) NOT NULL,
DRZAVLJANSTVO_KARTON nchar(30) NOT NULL,
DAT_ZAKLJ_UGOVOR date NOT NULL,
SIF_ZDR int NOT NULL
);

--Otvaranje_kartona.HRONICNA_BOLEST
if object_id('Otvaranje_kartona.HRONICNA_BOLEST','U') is not null
	drop table Otvaranje_kartona.HRONICNA_BOLEST
go

CREATE TABLE Otvaranje_kartona.HRONICNA_BOLEST(
RBR_HRONBOLEST int IDENTITY NOT NULL,
DATUM_UTVRDJIVANJA_HRONBOLEST date,
SIF_DIJAGNOZA int,
SIF_KARTON int NOT NULL
);

--Otvaranje_kartona.RIZIK_I_ALERGIJA
if object_id('Otvaranje_kartona.RIZIK_I_ALERGIJA','U') is not null
	drop table Otvaranje_kartona.RIZIK_I_ALERGIJA
go

CREATE TABLE Otvaranje_kartona.RIZIK_I_ALERGIJA(
RBR_RA int IDENTITY NOT NULL,
NAZIV_RA nchar(30) NOT NULL,
AKTUELAN_RA bit NOT NULL,
DATUM_UTVRDJIVANJA_RA date,
SIF_DIJAGNOZA int NOT NULL,
SIF_KARTON int NOT NULL
);

--Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST
if object_id('Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST','U') is not null
	drop table Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST
go

CREATE TABLE Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST(
SIF_DIJAGNOZA int IDENTITY NOT NULL,
NAZIV_DIJAGNOZA nchar(100) NOT NULL,
);

--Pregled.KNJIGA_PREGLEDA
if object_id('Pregled.KNJIGA_PREGLEDA','U') is not null
	drop table Pregled.KNJIGA_PREGLEDA
go

CREATE TABLE Pregled.KNJIGA_PREGLEDA(
SIF_K_PREGLED int IDENTITY NOT NULL,
IME_PREG_PAC nchar(15),
PREZIME_PREG_PAC nchar(30),
DATRODJENJA_PREG_PAC date NOT NULL,
OPIS_PREG_PAC nvarchar(100) NOT NULL,
POL_PREG_PAC nchar,
ADRESA_PREG_PAC nchar(50),
DRZAVLJANSTVO_PREG_PAC nchar(30)
);

--Pregled.PREGLED
if object_id('Pregled.PREGLED','U') is not null
	drop table Pregled.PREGLED
go

CREATE TABLE Pregled.PREGLED(
SIF_PREGLED int IDENTITY NOT NULL,
JMBG_STR nchar(13),
SIF_TIPPREGLED int NOT NULL,
SIF_ZDR int NOT NULL,
DATUM_RADNIKAL date NOT NULL,
SIF_TERMIN int NOT NULL,
DATUMPOCETKA date,
TRAJANJE_BOLOVANJA int,
SIF_K_PREGLED int,
SIF_ZDR_POSTOJI int,--SIF_ZDR preimenovan
SIF_KARTON int NOT NULL
);

--Otvaranje_kartona.UTVRDJUJE_SE
if object_id('Otvaranje_kartona.UTVRDJUJE_SE','U') is not null
	drop table Otvaranje_kartona.UTVRDJUJE_SE
go

CREATE TABLE Otvaranje_kartona.UTVRDJUJE_SE(
SIF_PREGLED int NOT NULL,
SIF_DIJAGNOZA int NOT NULL,
SIF_KARTON int NOT NULL
);

--Usluge_i_lekovi.SE_SALJE
if object_id('Usluge_i_lekovi.SE_SALJE','U') is not null
	drop table Usluge_i_lekovi.SE_SALJE
go

CREATE TABLE Usluge_i_lekovi.SE_SALJE(
SIF_PREGLED int NOT NULL,
SIF_USLUGA int NOT NULL,
SIF_KARTON int NOT NULL, 
KOLICINA int NOT NULL
);

--Usluge_i_lekovi.USLUGA
if object_id('Usluge_i_lekovi.USLUGA','U') is not null
	drop table Usluge_i_lekovi.USLUGA
go

CREATE TABLE Usluge_i_lekovi.USLUGA(
SIF_USLUGA int IDENTITY NOT NULL,
NAZIV_USLUGA nchar(100) NOT NULL,
);

--Usluge_i_lekovi.RECEPT
if object_id('Usluge_i_lekovi.RECEPT','U') is not null
	drop table Usluge_i_lekovi.RECEPT
go

CREATE TABLE Usluge_i_lekovi.RECEPT(
SIF_RECEPT int IDENTITY NOT NULL,
ROK_VAZENJA_RECEPT date NOT NULL,
BROJDANAKONZUMACIJE int NOT NULL,
BROJDNEVNOGKONZUMIRANJA int NOT NULL,
SIF_KARTON int NOT NULL, 
SIF_LEK int NOT NULL, 
SIF_PREGLED int NOT NULL, 
);

--Usluge_i_lekovi.LEK
if object_id('Usluge_i_lekovi.LEK','U') is not null
	drop table Usluge_i_lekovi.LEK
go

CREATE TABLE Usluge_i_lekovi.LEK(
SIF_LEK int IDENTITY NOT NULL,
NAZIV_LEK nchar(80) NOT NULL,
MILIGRAMAZA_LEK int NOT NULL,
FARMACEUTSKIOBLIK nchar(60) NOT NULL,
NACINUPOTREBE_LEK nchar(60) NOT NULL
);

--Pregled.PARAMETAR
if object_id('Pregled.PARAMETAR','U') is not null
	drop table Pregled.PARAMETAR
go

CREATE TABLE Pregled.PARAMETAR(
SIF_PARAMETAR int IDENTITY NOT NULL,
NAZIV_PARAMETAR nchar(50) NOT NULL,
JEDINICA_MERE nchar(30) NOT NULL
);

--Pregled.DODATNI_PARAMETAR
if object_id('Pregled.DODATNI_PARAMETAR','U') is not null
	drop table Pregled.DODATNI_PARAMETAR
go

CREATE TABLE Pregled.DODATNI_PARAMETAR(
SIF_PARAMETAR int NOT NULL,
VREDNOST_DP nvarchar(20) NOT NULL,
SIF_KARTON int NOT NULL,
SIF_PREGLED int NOT NULL
);

--Pregled.TIP_PREGLEDA
if object_id('Pregled.TIP_PREGLEDA','U') is not null
	drop table Pregled.TIP_PREGLEDA
go

CREATE TABLE Pregled.TIP_PREGLEDA(
SIF_TIPPREGLED int IDENTITY NOT NULL,
NAZIV_TIPPREGLEDA nchar(50) NOT NULL,
IMA_DIJAGNOZU bit
);

--Pregled.MERI
if object_id('Pregled.MERI','U') is not null
	drop table Pregled.MERI
go

CREATE TABLE Pregled.MERI(
SIF_TIPPREGLED int NOT NULL,
SIF_PARAMETAR int NOT NULL
);

--Pregled.REZULTAT
if object_id('Pregled.REZULTAT','U') is not null
	drop table Pregled.REZULTAT
go

CREATE TABLE Pregled.REZULTAT(
SIF_KARTON int NOT NULL,
SIF_PREGLED int NOT NULL,
SIF_TIPPREGLED int NOT NULL,
SIF_PARAMETAR int NOT NULL,
VREDNOST nchar(20) NOT NULL,
);

--Uput.UPUT
if object_id('Uput.UPUT','U') is not null
	drop table Uput.UPUT
go

CREATE TABLE Uput.UPUT(
SIF_UPUT int IDENTITY NOT NULL,
SIF_KARTON int NOT NULL,
SIF_PREGLED int NOT NULL,
SIF_INSTITUCIJE int NOT NULL,
SIF_SPECIJALIZACIJE int NOT NULL,
OPIS nchar(50) NOT NULL,
VAZENJE_UPUT date NOT NULL
);

--Uput.TRAZE_SE
if object_id('Uput.TRAZE_SE','U') is not null
	drop table Uput.TRAZE_SE
go

CREATE TABLE Uput.TRAZE_SE(
SIF_UPUT int NOT NULL,
SIF_PARAMETAR int NOT NULL,
);

--Uput.SIFARNIK_SPECIJALIZACIJE
if object_id('Uput.SIFARNIK_SPECIJALIZACIJE','U') is not null
	drop table Uput.SIFARNIK_SPECIJALIZACIJE
go

CREATE TABLE Uput.SIFARNIK_SPECIJALIZACIJE(
SIF_SPECIJALIZACIJE int IDENTITY NOT NULL,
NAZIV_SPECIJALIZACIJE nchar(300) NOT NULL,
);

--Uput.SIFARNIK_INSTITUCIJE
if object_id('Uput.SIFARNIK_INSTITUCIJE','U') is not null
	drop table Uput.SIFARNIK_INSTITUCIJE
go

CREATE TABLE Uput.SIFARNIK_INSTITUCIJE(
SIF_INSTITUCIJE int IDENTITY NOT NULL,
NAZIV_INSTITUCIJE nchar(300) NOT NULL,
KONTAKT nvarchar(15) NOT NULL,
ADRESA nchar(50),
EMAIL nvarchar(50)
);

--Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
if object_id('Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR','U') is not null
	drop table Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
go

CREATE TABLE Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR(
RBR_ARHIVA int IDENTITY NOT NULL,
DATZAKLJUCIVANJA date NOT NULL,
DATRASKIDANJA date NOT NULL,
RAZLOG_PROMENE nchar(500) NOT NULL,
BR_UGOVORA int NOT NULL,
SIF_KARTON int NOT NULL,
SIF_ZDR int NOT NULL,
);

--Edukacija.ZDRAVSTVENI_RADNIK
if object_id('Edukacija.ZDRAVSTVENI_RADNIK','U') is not null
	drop table Edukacija.ZDRAVSTVENI_RADNIK
go

CREATE TABLE Edukacija.ZDRAVSTVENI_RADNIK(
SIF_ZDR int IDENTITY NOT NULL,

IME_ZDR nchar(15) NOT NULL,
PREZIME_ZDR nchar(30) NOT NULL,
DATRODJENJA_ZDR date NOT NULL,
ADRESA_ZDR nchar(30) NOT NULL,
MESTO_ZDR nchar(30) NOT NULL,
TEL_ZDR nvarchar(15) NOT NULL,
EMAIL_ZDR nvarchar(50) NOT NULL,
LOZINKA_ZDR nvarchar(20) NOT NULL,
DATZAPOSLENJA_ZDR date NOT NULL,
RADNI_STAZ int NOT NULL,
BRSLOBODNIHDANA int NOT NULL,
BRDANAGODISNJEG int NOT NULL
);

--Edukacija.LEKAR
if object_id('Edukacija.LEKAR','U') is not null
	drop table Edukacija.LEKAR
go

CREATE TABLE Edukacija.LEKAR(
SIF_ZDR int NOT NULL,
BRBODOVA_LEKAR int NOT NULL,
DAT_DIPL date NOT NULL,
DAT_SPEC date NOT NULL,
VRSTA_SPEC nchar(50) NOT NULL,
SIF_K_PREGLED int NOT NULL
);

--Edukacija.MEDICINSKI_TEHNICAR
if object_id('Edukacija.MEDICINSKI_TEHNICAR','U') is not null
	drop table Edukacija.MEDICINSKI_TEHNICAR
go

CREATE TABLE Edukacija.MEDICINSKI_TEHNICAR(
SIF_ZDR int NOT NULL,
BRBODOVA_MEDTEH int NOT NULL,
);

--Edukacija.LICENCA
if object_id('Edukacija.LICENCA','U') is not null
	drop table Edukacija.LICENCA
go

CREATE TABLE Edukacija.LICENCA(
SIF_LICENCA int IDENTITY NOT NULL,
BRLICENCE int NOT NULL,
VERZIJA_LICENCA int NOT NULL,
DATUMISTEKA_LICENCA date NOT NULL,
DATUMIZDAVANJA_LICENCA date NOT NULL,
MESTOIZDAVANJA_LICENCA nchar(30) NOT NULL,
SIF_ZDR int NOT NULL
);

--Edukacija.EDUKACIJA
if object_id('Edukacija.EDUKACIJA','U') is not null
	drop table Edukacija.EDUKACIJA
go

CREATE TABLE Edukacija.EDUKACIJA(
SIF_EDU int IDENTITY NOT NULL,
MESTO_EDU nchar(15) NOT NULL,
DATUM_EDU date NOT NULL,
BRDANA_EDU int NOT NULL,
BRBODOVASLUSAOCA_EDU int NOT NULL,
BRBODOVAPREDAVACA_EDU int NOT NULL,
NAZIV_EDU nchar(300) NOT NULL,
SIF_TIPEDU int NOT NULL,
SIF_INST int NOT NULL,
);

--Edukacija.TIP_EDUKACIJE
if object_id('Edukacija.TIP_EDUKACIJE','U') is not null
	drop table Edukacija.TIP_EDUKACIJE
go

CREATE TABLE Edukacija.TIP_EDUKACIJE(
SIF_TIPEDU int IDENTITY NOT NULL,
OBLAST_TIPEDU nchar(100) NOT NULL
);

--Edukacija.INSTITUCIJA
if object_id('Edukacija.INSTITUCIJA','U') is not null
	drop table Edukacija.INSTITUCIJA
go

CREATE TABLE Edukacija.INSTITUCIJA(
SIF_INST int IDENTITY NOT NULL,
NAZIV_INST nchar(50) NOT NULL
);

--Edukacija.POHADJA
if object_id('Edukacija.POHADJA','U') is not null
	drop table Edukacija.POHADJA
go

CREATE TABLE Edukacija.POHADJA(
SIF_EDU int NOT NULL,
SIF_ZDR int NOT NULL,
PREDAVAC bit NOT NULL
);

--Davanje_vakcina.VAKCINA
if object_id('Davanje_vakcina.VAKCINA','U') is not null
	drop table Davanje_vakcina.VAKCINA
go

CREATE TABLE Davanje_vakcina.VAKCINA(
RBR_VAKCINA int IDENTITY NOT NULL,
KOMPLIKACIJE_VAKCINA nvarchar(50),
PRENETA bit NOT NULL,
DAT_DAVANJA_VAKCINE date NOT NULL,
MESTO_APLIKACIJE nchar(30) NOT NULL,
SIF_KARTON int NOT NULL,
SIF_TIPVAK int NOT NULL,
SIF_ZDR int NOT NULL,
SIF_SERIJA int NOT NULL,
);

--Davanje_vakcina.TIP_VAKCINE
if object_id('Davanje_vakcina.TIP_VAKCINE','U') is not null
	drop table Davanje_vakcina.TIP_VAKCINE
go

CREATE TABLE Davanje_vakcina.TIP_VAKCINE(
SIF_TIPVAK int IDENTITY NOT NULL,
NAZIV_TIPVAK nchar(300),
PROGRAM nchar NOT NULL,
UZRAST_OD_TIPVAK int NOT NULL,
UZRAST_DO_TIPVAK int NOT NULL,
NACIN_UPOTREBE_TIPVAK nchar(300) NOT NULL
);

--Davanje_vakcina.SERIJA_VAKCINE
if object_id('Davanje_vakcina.SERIJA_VAKCINE','U') is not null
	drop table Davanje_vakcina.SERIJA_VAKCINE
go

CREATE TABLE Davanje_vakcina.SERIJA_VAKCINE(
SIF_SERIJA int IDENTITY NOT NULL,
BR_SERIJA int NOT NULL,
DATUMNABAVKE_SERIJA date NOT NULL,
ROKTRAJANJA_SERIJA date NOT NULL,
SIF_TIPVAK int NOT NULL,
SIF_PROIZ int NOT NULL,
SIF_DOB int NOT NULL
);

--Davanje_vakcina.PROIZVODJAC
if object_id('Davanje_vakcina.PROIZVODJAC','U') is not null
	drop table Davanje_vakcina.PROIZVODJAC
go

CREATE TABLE Davanje_vakcina.PROIZVODJAC(
SIF_PROIZ int IDENTITY NOT NULL,
NAZIV_PROIZ nchar(30) NOT NULL,
SEDISTE_PROIZ nchar(30),
DIREKTOR_PROIZ nvarchar(30),
TEL_PROIZ nvarchar(15)
);

--Davanje_vakcina.DOBAVLJAC
if object_id('Davanje_vakcina.DOBAVLJAC','U') is not null
	drop table Davanje_vakcina.DOBAVLJAC
go

CREATE TABLE Davanje_vakcina.DOBAVLJAC(
SIF_DOB int IDENTITY NOT NULL,
NAZIV_DOB nchar(30) NOT NULL,
SEDISTE_DOB nchar(30),
DIREKTOR_DOB nvarchar(30),
TEL_DOB nvarchar(15)
);

--Zakazivanje_pregleda.VRSTA_DANA
if object_id('Zakazivanje_pregleda.VRSTA_DANA','U') is not null
	drop table Zakazivanje_pregleda.VRSTA_DANA
go

CREATE TABLE Zakazivanje_pregleda.VRSTA_DANA(
SIF_DANA int IDENTITY NOT NULL,
VRSTA_DANA nchar(20) NOT NULL
);

--Zakazivanje_pregleda.RADNI_KALENDAR
if object_id('Zakazivanje_pregleda.RADNI_KALENDAR','U') is not null
	drop table Zakazivanje_pregleda.RADNI_KALENDAR
go

CREATE TABLE Zakazivanje_pregleda.RADNI_KALENDAR(
DATUM_RADNIKAL date NOT NULL,
SIF_DANA int NOT NULL
);

--Zakazivanje_pregleda.LEKAREV_DAN
if object_id('Zakazivanje_pregleda.LEKAREV_DAN','U') is not null
	drop table Zakazivanje_pregleda.LEKAREV_DAN
go

CREATE TABLE Zakazivanje_pregleda.LEKAREV_DAN(

DATUM_RADNIKAL date NOT NULL,
SIF_ZDR int NOT NULL,
SIF_SMENA int NOT NULL,
SIF_ODSUSTVO int NOT NULL
);

--Zakazivanje_pregleda.SMENA
if object_id('Zakazivanje_pregleda.SMENA','U') is not null
	drop table Zakazivanje_pregleda.SMENA
go

CREATE TABLE Zakazivanje_pregleda.SMENA(
SIF_SMENA int IDENTITY NOT NULL,
NAZIV_SMENA nchar(20) NOT NULL,
POCETAK_SMENA time NOT NULL,
KRAJ_SMENA time NOT NULL
);

--Zakazivanje_pregleda.ODSUSTVO
if object_id('Zakazivanje_pregleda.ODSUSTVO','U') is not null
	drop table Zakazivanje_pregleda.ODSUSTVO
go

CREATE TABLE Zakazivanje_pregleda.ODSUSTVO(
SIF_ODSUSTVO int IDENTITY NOT NULL,
RAZLOGODSUSTVA nchar(50) NOT NULL
);

--Zakazivanje_pregleda.TERMIN
if object_id('Zakazivanje_pregleda.TERMIN','U') is not null
	drop table Zakazivanje_pregleda.TERMIN
go

CREATE TABLE Zakazivanje_pregleda.TERMIN(
SIF_TERMIN int IDENTITY NOT NULL,
POCETAK_TERMINA time NOT NULL,
KRAJ_TERMINA time NOT NULL
);

--Zakazivanje_pregleda.TERMIN_LEKARA
if object_id('Zakazivanje_pregleda.TERMIN_LEKARA','U') is not null
	drop table Zakazivanje_pregleda.TERMIN_LEKARA
go

CREATE TABLE Zakazivanje_pregleda.TERMIN_LEKARA(
SIF_ZDR int NOT NULL,
SIF_KARTON int NOT NULL,
SIF_TERMIN int NOT NULL,
SIF_ODSUSTVO int NOT NULL,
DATUM_RADNIKAL date NOT NULL,
DATUM_ZAKAZIVANJA date,
VREME_ZAKAZIVANJA time,
);



--CONSTRAINTS
--OGRANICENJA
--1. STARATELJ
ALTER TABLE Otvaranje_kartona.STARATELJ
	ADD CONSTRAINT PK_Staratelj PRIMARY KEY (JMBG_STR);
GO

ALTER TABLE Otvaranje_kartona.STARATELJ WITH CHECK
	ADD CONSTRAINT CHK_Pol_staratelja_provera CHECK (POL_STR in ('M','Z'))
GO

--2. ULOGA
ALTER TABLE Otvaranje_kartona.ULOGA
	ADD CONSTRAINT PK_Uloga PRIMARY KEY (SIF_ULOGA);
GO

ALTER TABLE Otvaranje_kartona.ULOGA
	ADD CONSTRAINT DFT_Uloga_Sif_uloga
		DEFAULT (NEXT VALUE FOR Otvaranje_kartona.ULOGA_SEQ) FOR SIF_ULOGA
GO

--3. DIJAGNOSTIKOVANA_BOLEST
ALTER TABLE Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST
	ADD CONSTRAINT PK_Dijagnostikovana_bolest PRIMARY KEY (SIF_DIJAGNOZA)
GO

--4. KNJIGA_PREGLEDA
ALTER TABLE Pregled.KNJIGA_PREGLEDA
	ADD CONSTRAINT PK_Knjiga_pregleda PRIMARY KEY (SIF_K_PREGLED)
GO

ALTER TABLE Pregled.KNJIGA_PREGLEDA WITH CHECK
	ADD CONSTRAINT CHK_Pol_pregledanog_pacijenta_provera CHECK (POL_PREG_PAC in ('M','Z'))
GO

--5. USLUGA
ALTER TABLE Usluge_i_lekovi.USLUGA
	ADD CONSTRAINT PK_Usluga PRIMARY KEY (SIF_USLUGA)
GO

--6. LEK
ALTER TABLE Usluge_i_lekovi.LEK
	ADD CONSTRAINT PK_Lek PRIMARY KEY (SIF_LEK)
GO

--7. PARAMETAR
ALTER TABLE Pregled.PARAMETAR
	ADD CONSTRAINT PK_Parametar PRIMARY KEY (SIF_PARAMETAR)
GO

--8. TIP_PREGLEDA
ALTER TABLE Pregled.TIP_PREGLEDA
	ADD CONSTRAINT PK_Tip_pregleda PRIMARY KEY (SIF_TIPPREGLED)
GO

--9. SIFARNIK_SPECIJALIZACIJE
ALTER TABLE Uput.SIFARNIK_SPECIJALIZACIJE
	ADD CONSTRAINT PK_Sifarnik_specijalizacije PRIMARY KEY (SIF_SPECIJALIZACIJE)
GO

--10. SIFARNIK_INSTITUCIJE
ALTER TABLE Uput.SIFARNIK_INSTITUCIJE
	ADD CONSTRAINT PK_Sifarnik_institucije PRIMARY KEY (SIF_INSTITUCIJE)
GO

--11. ZDRAVSTVENI_RADNIK
ALTER TABLE Edukacija.ZDRAVSTVENI_RADNIK
	ADD CONSTRAINT PK_Zdravstveni_radnik PRIMARY KEY (SIF_ZDR)
GO

ALTER TABLE Edukacija.ZDRAVSTVENI_RADNIK
	ADD CONSTRAINT CHK_Datum_zaposlenja_radnika_provera CHECK (DATRODJENJA_ZDR < DATZAPOSLENJA_ZDR)

ALTER TABLE Edukacija.ZDRAVSTVENI_RADNIK
	ADD CONSTRAINT CHK_Br_slobodnih_dana_provera CHECK (BRSLOBODNIHDANA >= 0)	

ALTER TABLE Edukacija.ZDRAVSTVENI_RADNIK
	ADD CONSTRAINT CHK_Br_dana_godisnjeg_provera CHECK (BRDANAGODISNJEG >= 0)	

--12 TIP_EDUKACIJE
ALTER TABLE Edukacija.TIP_EDUKACIJE
	ADD CONSTRAINT PK_Tip_edukacije PRIMARY KEY (SIF_TIPEDU)
GO

--13 INSTITUCIJA
ALTER TABLE Edukacija.INSTITUCIJA
	ADD CONSTRAINT PK_Institucija PRIMARY KEY (SIF_INST)
GO

--14. TIP_VAKCINE
ALTER TABLE Davanje_vakcina.TIP_VAKCINE
	ADD CONSTRAINT PK_Tip_vakcine PRIMARY KEY (SIF_TIPVAK)
GO


ALTER TABLE Davanje_vakcina.TIP_VAKCINE
	ADD CONSTRAINT CHK_PUzrast_od_tipvak_provera CHECK (UZRAST_OD_TIPVAK >= 0)
GO

ALTER TABLE Davanje_vakcina.TIP_VAKCINE
	ADD CONSTRAINT CHK_PUzrast_do_tipvak_provera CHECK (UZRAST_DO_TIPVAK >= 0)
GO


ALTER TABLE Davanje_vakcina.TIP_VAKCINE
	ADD CONSTRAINT CHK_Provera_uzrasta CHECK (UZRAST_OD_TIPVAK < UZRAST_DO_TIPVAK)
GO

--15 PROIZVODJAC
ALTER TABLE Davanje_vakcina.PROIZVODJAC
	ADD CONSTRAINT PK_Proizvodjac PRIMARY KEY (SIF_PROIZ)
GO

--16. DOBAVLJAC
ALTER TABLE Davanje_vakcina.DOBAVLJAC
	ADD CONSTRAINT PK_Dobavljac PRIMARY KEY (SIF_DOB)
GO

--17. VRSTA_DANA
ALTER TABLE Zakazivanje_pregleda.VRSTA_DANA
	ADD CONSTRAINT PK_Vrsta_dana PRIMARY KEY (SIF_DANA)
GO

--18. SMENA
ALTER TABLE Zakazivanje_pregleda.SMENA
	ADD CONSTRAINT PK_Smena PRIMARY KEY (SIF_SMENA)
GO

ALTER TABLE Zakazivanje_pregleda.SMENA WITH CHECK
	ADD CONSTRAINT CHK_Smena_trajanje_provera CHECK (POCETAK_SMENA < KRAJ_SMENA)
GO

--19. ODSUSTVO
ALTER TABLE Zakazivanje_pregleda.ODSUSTVO
	ADD CONSTRAINT PK_Odsustvo PRIMARY KEY (SIF_ODSUSTVO)
GO

--20. TERMIN
ALTER TABLE Zakazivanje_pregleda.TERMIN
	ADD CONSTRAINT PK_Termin PRIMARY KEY (SIF_TERMIN)
GO

ALTER TABLE Zakazivanje_pregleda.TERMIN WITH CHECK
	ADD CONSTRAINT CHK_Termin_trajanje_provera CHECK (POCETAK_TERMINA < KRAJ_TERMINA)
GO

--21. MERI
ALTER TABLE Pregled.MERI
	ADD CONSTRAINT PK_Meri PRIMARY KEY (SIF_TIPPREGLED, SIF_PARAMETAR)
GO

ALTER TABLE Pregled.MERI
	ADD CONSTRAINT FK_Meri_Tip_pregleda FOREIGN KEY (SIF_TIPPREGLED)
		REFERENCES Pregled.TIP_PREGLEDA (SIF_TIPPREGLED)
GO

ALTER TABLE Pregled.MERI
	ADD CONSTRAINT FK_Meri_Parametar FOREIGN KEY (SIF_PARAMETAR)
		REFERENCES Pregled.PARAMETAR (SIF_PARAMETAR)
GO

--22. KARTON
ALTER TABLE Otvaranje_kartona.KARTON 
	ADD CONSTRAINT PK_Karton PRIMARY KEY (SIF_KARTON);
GO

ALTER TABLE Otvaranje_kartona.KARTON
	ADD CONSTRAINT FK_Karton_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR);
GO

ALTER TABLE Otvaranje_kartona.KARTON WITH CHECK
	ADD CONSTRAINT CHK_Datum_zakljucivanja_provera CHECK (DATOTVARANJA_KARTON > DATRODJENJA_KARTON)
GO

ALTER TABLE Otvaranje_kartona.KARTON WITH CHECK
	ADD CONSTRAINT CHK_Pol_karton_provera CHECK (POL_KARTON in ('M','Z'))
GO

--23. ARHIVIRAN_IZABRANI_LEKAR
ALTER TABLE Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
	ADD CONSTRAINT PK_Arhiviran_izabrani_lekar PRIMARY KEY (RBR_ARHIVA, SIF_KARTON)
GO

ALTER TABLE Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
	ADD CONSTRAINT FK_Arhiviran_izabrani_lekar_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

ALTER TABLE Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
	ADD CONSTRAINT FK_Arhiviran_izabrani_lekar_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
	ADD CONSTRAINT CHK_Datum_zakljucivanja_ugovora_provera CHECK (DATZAKLJUCIVANJA < DATRASKIDANJA)
GO

ALTER TABLE Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
	ADD CONSTRAINT CHK_Br_ugovora_provera CHECK (BR_UGOVORA > 0)
GO

--24. ODGOVORAN
ALTER TABLE Otvaranje_kartona.ODGOVORAN
	ADD CONSTRAINT PK_Odgovoran PRIMARY KEY (JMBG_STR, SIF_KARTON)
GO

ALTER TABLE Otvaranje_kartona.ODGOVORAN
	ADD CONSTRAINT FK_Odgovoran_Uloga FOREIGN KEY (SIF_ULOGA)
		REFERENCES Otvaranje_kartona.ULOGA (SIF_ULOGA)
GO

ALTER TABLE Otvaranje_kartona.ODGOVORAN
	ADD CONSTRAINT FK_Odgovoran_Staratelj FOREIGN KEY (JMBG_STR)
		REFERENCES Otvaranje_kartona.STARATELJ (JMBG_STR)
GO

ALTER TABLE Otvaranje_kartona.ODGOVORAN
	ADD CONSTRAINT FK_Odgovoran_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

--25. HRONICNA_BOLEST
ALTER TABLE Otvaranje_kartona.HRONICNA_BOLEST
	ADD CONSTRAINT PK_Hronicna_bolest PRIMARY KEY (SIF_KARTON, RBR_HRONBOLEST)
GO

ALTER TABLE Otvaranje_kartona.HRONICNA_BOLEST
	ADD CONSTRAINT FK_Hronicna_bolest_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

ALTER TABLE Otvaranje_kartona.HRONICNA_BOLEST
	ADD CONSTRAINT FK_Hronicna_bolest_Dijagnostikovana_bolest FOREIGN KEY (SIF_DIJAGNOZA)
		REFERENCES Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST (SIF_DIJAGNOZA)
GO

--26. RIZIK_I_ALERGIJA
ALTER TABLE Otvaranje_kartona.RIZIK_I_ALERGIJA
	ADD CONSTRAINT PK_RIZIK_I_ALERGIJA PRIMARY KEY (SIF_KARTON, RBR_RA)
GO

ALTER TABLE Otvaranje_kartona.RIZIK_I_ALERGIJA
	ADD CONSTRAINT FK_Rizik_i_alergija_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

ALTER TABLE Otvaranje_kartona.RIZIK_I_ALERGIJA
	ADD CONSTRAINT FK_Rizik_i_alergija_Dijagnostikovana_bolest FOREIGN KEY (SIF_DIJAGNOZA)
		REFERENCES Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST (SIF_DIJAGNOZA)
GO

--27. RADNI_KALENDAR
ALTER TABLE Zakazivanje_pregleda.RADNI_KALENDAR
	ADD CONSTRAINT PK_Radni_kalendar PRIMARY KEY (DATUM_RADNIKAL)
GO

ALTER TABLE Zakazivanje_pregleda.RADNI_KALENDAR
	ADD CONSTRAINT FK_Radni_kalendar_Vrsta_dana FOREIGN KEY (SIF_DANA)
		REFERENCES Zakazivanje_pregleda.VRSTA_DANA (SIF_DANA)
GO

--28. LEKAREV_DAN
ALTER TABLE Zakazivanje_pregleda.LEKAREV_DAN
	ADD CONSTRAINT PK_Lekarev_dan PRIMARY KEY (DATUM_RADNIKAL, SIF_ZDR)
GO

ALTER TABLE Zakazivanje_pregleda.LEKAREV_DAN
	ADD CONSTRAINT FK_Lekarev_dan_Radni_kalendar FOREIGN KEY (DATUM_RADNIKAL)
		REFERENCES Zakazivanje_pregleda.RADNI_KALENDAR (DATUM_RADNIKAL)
GO

ALTER TABLE Zakazivanje_pregleda.LEKAREV_DAN
	ADD CONSTRAINT FK_Lekarev_dan_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Zakazivanje_pregleda.LEKAREV_DAN
	ADD CONSTRAINT FK_Lekarev_dan_Smena FOREIGN KEY (SIF_SMENA)
		REFERENCES Zakazivanje_pregleda.SMENA (SIF_SMENA)
GO

ALTER TABLE Zakazivanje_pregleda.LEKAREV_DAN
	ADD CONSTRAINT FK_Lekarev_dan_Odsustvo FOREIGN KEY (SIF_ODSUSTVO)
		REFERENCES Zakazivanje_pregleda.ODSUSTVO (SIF_ODSUSTVO)
GO

--29. TERMIN_LEKARA
ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
	ADD CONSTRAINT PK_Termin_lekara PRIMARY KEY (DATUM_RADNIKAL, SIF_ZDR, SIF_TERMIN)
GO

ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
	ADD CONSTRAINT FK_Termin_lekara_Lekarev_dan FOREIGN KEY (DATUM_RADNIKAL, SIF_ZDR)
		REFERENCES Zakazivanje_pregleda.LEKAREV_DAN (DATUM_RADNIKAL, SIF_ZDR)
GO

ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
	ADD CONSTRAINT FK_Termin_lekara_Termin FOREIGN KEY (SIF_TERMIN)
		REFERENCES Zakazivanje_pregleda.TERMIN (SIF_TERMIN)
GO

ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
	ADD CONSTRAINT FK_Termin_lekara_Odsustvo FOREIGN KEY (SIF_ODSUSTVO)
		REFERENCES Zakazivanje_pregleda.ODSUSTVO (SIF_ODSUSTVO)
GO

ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
	ADD CONSTRAINT FK_Termin_lekara_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

--30. PREGLED
ALTER TABLE Pregled.PREGLED 
	ADD CONSTRAINT PK_Pregled PRIMARY KEY (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Pregled.PREGLED
	ADD CONSTRAINT FK_Pregled_Tip_pregleda FOREIGN KEY (SIF_TIPPREGLED)
		REFERENCES Pregled.TIP_PREGLEDA (SIF_TIPPREGLED)
GO

ALTER TABLE Pregled.PREGLED
	ADD CONSTRAINT FK_Pregled_Termin_lekara FOREIGN KEY (DATUM_RADNIKAL, SIF_ZDR, SIF_TERMIN)
		REFERENCES Zakazivanje_pregleda.TERMIN_LEKARA (DATUM_RADNIKAL, SIF_ZDR, SIF_TERMIN)
GO


ALTER TABLE Pregled.PREGLED
	ADD CONSTRAINT FK_Pregled_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

ALTER TABLE Pregled.PREGLED
	ADD CONSTRAINT FK_Pregled_Knjiga_pregleda FOREIGN KEY (SIF_K_PREGLED)
		REFERENCES Pregled.KNJIGA_PREGLEDA (SIF_K_PREGLED)
GO

ALTER TABLE Pregled.PREGLED
	ADD CONSTRAINT FK_Pregled_Zdravstveni_radnik_postoji FOREIGN KEY (SIF_ZDR_POSTOJI)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Pregled.PREGLED
	ADD CONSTRAINT CHK_Trajanje_bolovanja_provera CHECK (TRAJANJE_BOLOVANJA > 0 AND TRAJANJE_BOLOVANJA < 16)
GO

--31. UTVRDJUJE_SE
ALTER TABLE Otvaranje_kartona.UTVRDJUJE_SE
	ADD CONSTRAINT PK_Utvrdjuje_se PRIMARY KEY (SIF_KARTON, SIF_PREGLED, SIF_DIJAGNOZA)
GO


ALTER TABLE Otvaranje_kartona.UTVRDJUJE_SE
	ADD CONSTRAINT FK_Utvrdjuje_se_Pregled FOREIGN KEY (SIF_PREGLED, SIF_KARTON)
		REFERENCES Pregled.PREGLED (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Otvaranje_kartona.UTVRDJUJE_SE
	ADD CONSTRAINT FK_Utvrdjuje_se_Dijagnostikovana_bolest FOREIGN KEY (SIF_DIJAGNOZA)
		REFERENCES Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST (SIF_DIJAGNOZA)
GO

--32. SE_SALJE
ALTER TABLE Usluge_i_lekovi.SE_SALJE
	ADD CONSTRAINT PK_Se_salje PRIMARY KEY (SIF_KARTON, SIF_PREGLED, SIF_USLUGA)
GO

ALTER TABLE Usluge_i_lekovi.SE_SALJE
	ADD CONSTRAINT FK_Se_salje_Pregled FOREIGN KEY (SIF_PREGLED, SIF_KARTON)
		REFERENCES Pregled.PREGLED (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Usluge_i_lekovi.SE_SALJE
	ADD CONSTRAINT FK_Se_salje_Usluga FOREIGN KEY (SIF_USLUGA)
		REFERENCES Usluge_i_lekovi.USLUGA (SIF_USLUGA)
GO

ALTER TABLE Usluge_i_lekovi.SE_SALJE
	ADD CONSTRAINT CHK_Kolicina_provera CHECK (KOLICINA >= 0)
GO

--33. RECEPT
ALTER TABLE Usluge_i_lekovi.RECEPT
	ADD CONSTRAINT PK_Recept PRIMARY KEY (SIF_RECEPT)
GO


ALTER TABLE Usluge_i_lekovi.RECEPT
	ADD CONSTRAINT FK_Recept_Lek FOREIGN KEY (SIF_LEK)
		REFERENCES Usluge_i_lekovi.LEK (SIF_LEK)
GO

ALTER TABLE Usluge_i_lekovi.RECEPT
	ADD CONSTRAINT FK_Recept_Pregled FOREIGN KEY (SIF_PREGLED, SIF_KARTON)
		REFERENCES Pregled.PREGLED (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Usluge_i_lekovi.RECEPT
	ADD CONSTRAINT CHK_Br_dana_konzumacije_provera CHECK (BROJDANAKONZUMACIJE >= 0)
GO

ALTER TABLE Usluge_i_lekovi.RECEPT
	ADD CONSTRAINT CHK_Br_dnevnog_konzumiranja_provera CHECK (BROJDNEVNOGKONZUMIRANJA >= 0)
GO

--34. REZULTAT
ALTER TABLE Pregled.REZULTAT
	ADD CONSTRAINT PK_Rezultat PRIMARY KEY (SIF_KARTON, SIF_PREGLED, SIF_TIPPREGLED, SIF_PARAMETAR)
GO

ALTER TABLE Pregled.REZULTAT
	ADD CONSTRAINT FK_Rezultat_Pregled FOREIGN KEY (SIF_PREGLED, SIF_KARTON)
		REFERENCES Pregled.PREGLED (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Pregled.REZULTAT
	ADD CONSTRAINT FK_Rezultat_Tip_pregleda FOREIGN KEY (SIF_TIPPREGLED)
		REFERENCES Pregled.TIP_PREGLEDA (SIF_TIPPREGLED)
GO

ALTER TABLE Pregled.REZULTAT
	ADD CONSTRAINT FK_Rezultat_Parametar FOREIGN KEY (SIF_PARAMETAR)
		REFERENCES Pregled.PARAMETAR (SIF_PARAMETAR)
GO

--35. UPUT
ALTER TABLE Uput.UPUT
	ADD CONSTRAINT PK_Uput PRIMARY KEY (SIF_UPUT)
GO

ALTER TABLE Uput.UPUT
	ADD CONSTRAINT FK_Uput_Pregled FOREIGN KEY (SIF_PREGLED, SIF_KARTON)
		REFERENCES Pregled.PREGLED (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Uput.UPUT
	ADD CONSTRAINT FK_Uput_Institucija FOREIGN KEY (SIF_INSTITUCIJE)
		REFERENCES Uput.SIFARNIK_INSTITUCIJE (SIF_INSTITUCIJE)
GO

ALTER TABLE Uput.UPUT
	ADD CONSTRAINT FK_Uput_Specijalizacija FOREIGN KEY (SIF_SPECIJALIZACIJE)
		REFERENCES Uput.SIFARNIK_SPECIJALIZACIJE (SIF_SPECIJALIZACIJE)
GO

--36. TRAZE_SE
ALTER TABLE Uput.TRAZE_SE
	ADD CONSTRAINT PK_Traze_se PRIMARY KEY (SIF_UPUT, SIF_PARAMETAR)
GO

ALTER TABLE Uput.TRAZE_SE
	ADD CONSTRAINT FK_Traze_se_Uput FOREIGN KEY (SIF_UPUT)
		REFERENCES Uput.UPUT (SIF_UPUT)
GO

ALTER TABLE Uput.TRAZE_SE
	ADD CONSTRAINT FK_Traze_se_Parametar FOREIGN KEY (SIF_PARAMETAR)
		REFERENCES Pregled.PARAMETAR (SIF_PARAMETAR)
GO

--37. LEKAR
ALTER TABLE Edukacija.LEKAR
	ADD CONSTRAINT PK_Lekar PRIMARY KEY (SIF_ZDR)
GO

ALTER TABLE Edukacija.LEKAR
	ADD CONSTRAINT FK_Lekar_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Edukacija.LEKAR
	ADD CONSTRAINT FK_Lekar_Knjiga_pregleda FOREIGN KEY (SIF_K_PREGLED)
		REFERENCES Pregled.KNJIGA_PREGLEDA (SIF_K_PREGLED)
GO

--38. MEDICINSKI_TEHNICAR
ALTER TABLE Edukacija.MEDICINSKI_TEHNICAR
	ADD CONSTRAINT PK_Medicinski_tehnicar PRIMARY KEY (SIF_ZDR)
GO

ALTER TABLE Edukacija.MEDICINSKI_TEHNICAR
	ADD CONSTRAINT FK_Medicinski_tehnicar_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Edukacija.MEDICINSKI_TEHNICAR
	ADD CONSTRAINT CHK_Br_bodova_tehnicar_provera CHECK (BRBODOVA_MEDTEH >= 0)	
GO

--39. LICENCA
ALTER TABLE Edukacija.LICENCA
	ADD CONSTRAINT PK_Licenca PRIMARY KEY (SIF_LICENCA)
GO

ALTER TABLE Edukacija.LICENCA
	ADD CONSTRAINT FK_Licenca_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Edukacija.LICENCA
	ADD CONSTRAINT CHK_Datum_izdavanja_licence_provera CHECK (DATUMIZDAVANJA_LICENCA < DATUMISTEKA_LICENCA)
GO

ALTER TABLE Edukacija.LICENCA
	ADD CONSTRAINT CHK_Br_licence_provera CHECK (BRLICENCE >= 0)
GO

ALTER TABLE Edukacija.LICENCA
	ADD CONSTRAINT CHK_Verzija_licence_provera CHECK (VERZIJA_LICENCA >= 0)
GO

--40. EDUKACIJA
ALTER TABLE Edukacija.EDUKACIJA
	ADD CONSTRAINT PK_Edukacija PRIMARY KEY (SIF_EDU)
GO

ALTER TABLE Edukacija.EDUKACIJA
	ADD CONSTRAINT FK_Edukacija_Tip_edukacije FOREIGN KEY (SIF_TIPEDU)
		REFERENCES Edukacija.TIP_EDUKACIJE (SIF_TIPEDU)
GO

ALTER TABLE Edukacija.EDUKACIJA
	ADD CONSTRAINT FK_Edukacija_Institucija FOREIGN KEY (SIF_INST)
		REFERENCES Edukacija.INSTITUCIJA (SIF_INST)
GO

ALTER TABLE Edukacija.EDUKACIJA
	ADD CONSTRAINT CHK_Br_dana_edukacije_provera CHECK (BRDANA_EDU >= 0)
GO

ALTER TABLE Edukacija.EDUKACIJA
	ADD CONSTRAINT CHK_Br_bodova_slusaoca_provera CHECK (BRBODOVASLUSAOCA_EDU >= 0)
GO

ALTER TABLE Edukacija.EDUKACIJA
	ADD CONSTRAINT CHK_Br_bodova_predavaca_provera CHECK (BRBODOVAPREDAVACA_EDU >= 0)
GO

--41. POHADJA
ALTER TABLE Edukacija.POHADJA
	ADD CONSTRAINT PK_Pohadja PRIMARY KEY (SIF_EDU, SIF_ZDR)
GO

ALTER TABLE Edukacija.POHADJA
	ADD CONSTRAINT FK_Pohadja_Edukacija FOREIGN KEY (SIF_EDU)
		REFERENCES Edukacija.EDUKACIJA (SIF_EDU)
GO

ALTER TABLE Edukacija.POHADJA
	ADD CONSTRAINT FK_Pohadja_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

--42. SERIJA_VAKCINE
ALTER TABLE Davanje_vakcina.SERIJA_VAKCINE
	ADD CONSTRAINT PK_Serija_vakcine PRIMARY KEY (SIF_SERIJA)
GO

ALTER TABLE Davanje_vakcina.SERIJA_VAKCINE
	ADD CONSTRAINT FK_Serija_vakcine_Tip_vakcine FOREIGN KEY (SIF_TIPVAK)
		REFERENCES Davanje_vakcina.TIP_VAKCINE (SIF_TIPVAK)
GO

ALTER TABLE Davanje_vakcina.SERIJA_VAKCINE
	ADD CONSTRAINT FK_Serija_vakcine_Proizvodjac FOREIGN KEY (SIF_PROIZ)
		REFERENCES Davanje_vakcina.PROIZVODJAC (SIF_PROIZ)
GO

ALTER TABLE Davanje_vakcina.SERIJA_VAKCINE
	ADD CONSTRAINT FK_Serija_vakcine_Dobavljac FOREIGN KEY (SIF_DOB)
		REFERENCES Davanje_vakcina.DOBAVLJAC (SIF_DOB)
GO

ALTER TABLE Davanje_vakcina.SERIJA_VAKCINE
	ADD CONSTRAINT CHK_Br_serija_provera CHECK (BR_SERIJA >= 0)
GO

--43. VAKCINA
ALTER TABLE Davanje_vakcina.VAKCINA
	ADD CONSTRAINT PK_Vakcina PRIMARY KEY (SIF_KARTON, RBR_VAKCINA)
GO

ALTER TABLE Davanje_vakcina.VAKCINA
	ADD CONSTRAINT FK_Vakcina_Karton FOREIGN KEY (SIF_KARTON)
		REFERENCES Otvaranje_kartona.KARTON (SIF_KARTON)
GO

ALTER TABLE Davanje_vakcina.VAKCINA
	ADD CONSTRAINT FK_Vakcina_Tip_vakcine FOREIGN KEY (SIF_TIPVAK)
		REFERENCES Davanje_vakcina.TIP_VAKCINE (SIF_TIPVAK)
GO

ALTER TABLE Davanje_vakcina.VAKCINA
	ADD CONSTRAINT FK_Vakcina_Zdravstveni_radnik FOREIGN KEY (SIF_ZDR)
		REFERENCES Edukacija.ZDRAVSTVENI_RADNIK (SIF_ZDR)
GO

ALTER TABLE Davanje_vakcina.VAKCINA
	ADD CONSTRAINT FK_Vakcina_Serija_vakcine FOREIGN KEY (SIF_SERIJA)
		REFERENCES Davanje_vakcina.SERIJA_VAKCINE (SIF_SERIJA)
GO

--44. DODATNI_PARAMETAR
ALTER TABLE Pregled.DODATNI_PARAMETAR
	ADD CONSTRAINT PK_Dodatni_parametar PRIMARY KEY (SIF_KARTON, SIF_PREGLED, SIF_PARAMETAR)
GO

ALTER TABLE Pregled.DODATNI_PARAMETAR
	ADD CONSTRAINT FK_Dodatni_parametar_Pregled FOREIGN KEY (SIF_PREGLED, SIF_KARTON)
		REFERENCES Pregled.PREGLED (SIF_PREGLED, SIF_KARTON)
GO

ALTER TABLE Pregled.DODATNI_PARAMETAR	
	ADD CONSTRAINT FK_Dodatni_parametar_Parametar FOREIGN KEY (SIF_PARAMETAR)
		REFERENCES Pregled.PARAMETAR (SIF_PARAMETAR)
GO



-- TRIGGERS
--Ako se promeni izabrani lekar u kartonu nekog pacijenta, potrebno je upisati tu promenu u tabelu Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
IF OBJECT_ID('tr_promena_lekara', 'TR') IS NOT NULL
	DROP TRIGGER tr_promena_lekara
GO

CREATE TRIGGER tr_promena_lekara
	ON Otvaranje_kartona.KARTON
	AFTER UPDATE
AS
BEGIN
	DECLARE @sif_zdr_stari as int, @sif_zdr_novi as int
	DECLARE @datum_zak as date, @datum_rask as date
	SET @sif_zdr_stari = (select SIF_ZDR from deleted)
	SET @sif_zdr_novi = (select SIF_ZDR from inserted)
	SET @datum_zak = (select DAT_ZAKLJ_UGOVOR from deleted)
	SET @datum_rask = convert(date, getdate())

	IF (@sif_zdr_novi <> @sif_zdr_stari)
		BEGIN
			DECLARE @br_ugovora as int, @rbr_arhiva as int, @sif_karton as int
			DECLARE @razlog as varchar(300)

			SET @br_ugovora = (select count(Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR.BR_UGOVORA) from Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR) + 1;
			--SET @rbr_arhiva = (select count(rbr_arhiva) from Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR)
			SET @sif_karton = (select SIF_KARTON from inserted)

			INSERT INTO Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR(DATZAKLJUCIVANJA, DATRASKIDANJA, RAZLOG_PROMENE, BR_UGOVORA, SIF_KARTON, SIF_ZDR)
			VALUES(@datum_zak, @datum_rask, 'Promena u trigeru' ,@br_ugovora, @sif_karton, @sif_zdr_stari);

			UPDATE Otvaranje_kartona.KARTON
			SET DAT_ZAKLJ_UGOVOR = @datum_rask
			WHERE SIF_KARTON = @sif_karton

			PRINT('Transakcija je uspesno obavljena!');
		END
	ELSE
		BEGIN
			ROLLBACK TRANSACTION
			PRINT('Transakcija je ponistena!')
		END

END
GO

drop trigger tr_promena_lekara

UPDATE Otvaranje_kartona.KARTON
SET SIF_ZDR = 5
WHERE SIF_KARTON = 0

select * from Otvaranje_kartona.KARTON

select count(Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR.BR_UGOVORA) from Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
select * from Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR







--Triger koji æe, ukoliko lekar najavi odsustvo, postaviti na NULL vredsnost datum zakazivanja i vreme zakazivanja svojih pregleda kako ne bi došlo do zakazivanja pregleda koje on ne može da odradi
IF OBJECT_ID('tr_termin_lekara', 'TR') IS NOT NULL
	DROP TRIGGER tr_termin_lekara
GO

CREATE TRIGGER tr_termin_lekara
	ON Zakazivanje_pregleda.TERMIN_LEKARA
	AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @sif_odsustvo_stari as int, @sif_odsustvo_novi as int
	SET @sif_odsustvo_stari = (select sif_odsustvo from deleted)
	SET @sif_odsustvo_novi = (select sif_odsustvo from inserted)

	DECLARE  @sif_termin_novi as int
	DECLARE @sif_zdr_novi as int
	DECLARE @datum_radnikal_novi as date

	SET @sif_termin_novi = (select SIF_TERMIN from inserted)
	SET @sif_zdr_novi = (select SIF_ZDR from inserted)
	SET @datum_radnikal_novi = (select DATUM_RADNIKAL from inserted)

	IF ((@sif_odsustvo_stari <> @sif_odsustvo_novi) or (@sif_odsustvo_stari is null))
		BEGIN
			UPDATE Zakazivanje_pregleda.TERMIN_LEKARA
			SET DATUM_ZAKAZIVANJA = NULL, VREME_ZAKAZIVANJA = NULL
			WHERE SIF_ZDR = @sif_zdr_novi and SIF_TERMIN = @sif_termin_novi and DATUM_RADNIKAL = @datum_radnikal_novi
			PRINT('Transakcija je uspesno izvrsena!')
		END
	ELSE
		BEGIN
			ROLLBACK TRANSACTION
		END
END
GO

UPDATE Zakazivanje_pregleda.TERMIN_LEKARA
	SET SIF_ODSUSTVO = 7
	WHERE SIF_ZDR = 1 and SIF_TERMIN = 0 and DATUM_RADNIKAL = '2018-04-01'



drop trigger tr_termin_lekara




-- PROCEDURES
--Napisati proceduru u kojoj æe se, ako postoji pacijent sa prosleðenom šifrom, ispisivati informacije o pacijentu, vakcinama i lekaru koji je propisao vakcinu.
--Ispis treba da bude u sledeæem formatu: 
	--Ako je pacijent primio barem jednu vakcinu, ispis poèeti sa:
		--Pacijent <Ime i prezime pacijenta> primio je sledeæe vakcine:
		--<redni broj>. <Ime i prezime pacijenta> je primio vakcinu serije: <broj serije vakcine> koju je proizveo: <naziv proizvodjaca> i dobavio: <naziv dobavljaca> datuma: <datum proizvodnje serije> a koja je data: <datum davanja> od strane: <Ime i prezime lekara>
		--Ukupno datih vakcina za pacijenta: <Ukupan broj vakcina>
	--Ako pacijent nije primio niti jednu vakcinu, ispisati:
		--Pacijent <Ime i prezime pacijenta> nije primio ni jednu vakcinu!
--Ukoliko ne postoji pacijent sa prosleðenom šifrom, ispisati poruku o grešci.
IF OBJECT_ID('pr_vakcine', 'P') IS NOT NULL
	DROP PROC pr_vakcine
GO

CREATE PROC pr_vakcine
	@sif_karton as int
AS
BEGIN
	IF exists(select sif_karton from Otvaranje_kartona.KARTON)
		BEGIN
			DECLARE @ukupno as int, @imePac as varchar(30), @prezimePac as varchar(30)
			SET @imePac = (select IME_KARTON from Otvaranje_kartona.KARTON where SIF_KARTON = @sif_karton)
			SET @prezimePac = (select PREZIME_KARTON from Otvaranje_kartona.KARTON where SIF_KARTON = @sif_karton)
			SET @ukupno = (select count(sif_karton) from Davanje_vakcina.VAKCINA where SIF_KARTON = 1)
			IF (@ukupno > 0)
				BEGIN
					PRINT('Pacijent: ' + @imePac + ' ' + @prezimePac + ' primio je sledece vakcine:');
					DECLARE @dobavljac as varchar(60), @proizvodjac as varchar(60), @sif_serija as int, @dat_serija as date,
							@tip_vakcine as varchar(60), @dat_davanja as date, @ime_zdr as varchar (60), @ime_pac as varchar(60),
							@rbr_vak as int

					DECLARE cursor_vakcine CURSOR FOR
						select k.IME_KARTON + ' ' + k.PREZIME_KARTON,
								s.sif_serija, s.datumnabavke_serija, d.naziv_dob,
								p.naziv_proiz, tv.naziv_tipvak, v.dat_davanja_vakcine, 
								z.IME_ZDR + ' ' + z.PREZIME_ZDR
						from Davanje_vakcina.VAKCINA v left join Davanje_vakcina.SERIJA_VAKCINE s on v.SIF_SERIJA = s.SIF_SERIJA
							left join Davanje_vakcina.DOBAVLJAC d on d.SIF_DOB = s.SIF_DOB left join Davanje_vakcina.PROIZVODJAC p on p.SIF_PROIZ = s.SIF_PROIZ
							left join Davanje_vakcina.TIP_VAKCINE tv on tv.SIF_TIPVAK = s.SIF_TIPVAK
							left join Otvaranje_kartona.KARTON k on k.SIF_KARTON = v.SIF_KARTON
							left join Edukacija.ZDRAVSTVENI_RADNIK z on z.SIF_ZDR = v.SIF_ZDR
						where k.SIF_KARTON = @sif_karton;

					OPEN cursor_vakcine

					FETCH NEXT FROM cursor_vakcine INTO @ime_pac, @sif_serija, @dat_serija, @dobavljac, @proizvodjac,
														@tip_vakcine, @dat_davanja, @ime_zdr
					
					DECLARE @rbr as int = 0;
					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @rbr = @rbr + 1;

							PRINT (convert(varchar, @rbr) + '. ' + isnull(@ime_pac, '') + ' je primio vakcinu serije: ' + isnull(convert(varchar, @sif_serija), '') + 
									' koju je proizveo: ' + isnull(@proizvodjac, '') + ' i dobavio: ' + isnull(@dobavljac, '') + 
									' datuma: ' + isnull(convert(varchar, @dat_serija), '/') + ', a koja je data: ' + 
									isnull(convert(varchar, @dat_davanja), '/') + ' od strane radnika: ' + isnull(@ime_zdr, ''));

							FETCH NEXT FROM cursor_vakcine INTO @ime_pac, @sif_serija, @dat_serija, @dobavljac, @proizvodjac,
																@tip_vakcine, @dat_davanja, @ime_zdr
					

						END

					CLOSE cursor_vakcine

					DEALLOCATE cursor_vakcine

					print('Ukupno datih vakcina za pacijenta: ' + @imePac + ' ' + @prezimePac + ' je: ' + convert(varchar, @ukupno))
				END
			ELSE
				PRINT('Pacijent: ' + @imePac + ' ' + @prezimePac + ' nije primio ni jednu vakcinu!');
		END
	ELSE
		RAISERROR('Ne postoji pacijent sa tom sifrom!', 16, 0);
END
GO

EXEC pr_vakcine 1



select k.IME_KARTON + ' ' + k.PREZIME_KARTON as 'Ime pacijenta', v.rbr_vakcina as 'Redni broj vakcine',
		s.sif_serija as 'Sifra serije vakcine', s.datumnabavke_serija as 'Datum nabavke serije', d.naziv_dob as 'Naziv dobavljaca',
		 p.naziv_proiz as 'Naziv proizvodjaca', tv.naziv_tipvak as 'Naziv tipa vakcine', v.dat_davanja_vakcine as 'Datum davanja vakcine', 
		 z.IME_ZDR + ' ' + z.PREZIME_ZDR as 'Zdravstveni radnik'
from Davanje_vakcina.VAKCINA v left join Davanje_vakcina.SERIJA_VAKCINE s on v.SIF_SERIJA = s.SIF_SERIJA
	left join Davanje_vakcina.DOBAVLJAC d on d.SIF_DOB = s.SIF_DOB left join Davanje_vakcina.PROIZVODJAC p on p.SIF_PROIZ = s.SIF_PROIZ
	left join Davanje_vakcina.TIP_VAKCINE tv on tv.SIF_TIPVAK = s.SIF_TIPVAK
	left join Otvaranje_kartona.KARTON k on k.SIF_KARTON = v.SIF_KARTON
	left join Edukacija.ZDRAVSTVENI_RADNIK z on z.SIF_ZDR = v.SIF_ZDR
where k.SIF_KARTON = 1;


select count(sif_karton) from Davanje_vakcina.VAKCINA where SIF_KARTON = 1






--PROCEDURA TIP PREGLEDA

--Napisati proceduru u kojoj æe se, ako postoji tip pregleda sa prosleðenom šifrom, informacije o pregledima tog tipa i pacijentu koji je bio na tom pregledu 
--Ispis treba da bude u sledeæem formatu: 
	--Ako je postoji barem jedan tip pregleda, ispis poèeti sa:
		--Odraðeni su sledeæi pregledi tipa: <Naziv tipa pregleda>:
		--<redni broj>. Pregled <Naziv tipa pregleda> sa rednim brojem pregleda: <sifra pregleda> izvršen je datuma: <datum pregleda> sa pocetkom u: <pocetak termina> i krajem u: <kraj termina> za pacijenta: <ime i prezime pacijenta> 
		--Ukupno pregleda: <Broj pregleda datog tipa>
	--Ako nema pregleda tog tipa:
		--Nije bio ni jedan pregled tipa <naziv tipa pregleda>!
--Ukoliko ne postoji pregled sa datom šifrom, ispisati poruku o grešci.
IF OBJECT_ID('pr_tip', 'P') IS NOT NULL
	DROP PROC pr_tip
GO

CREATE PROC pr_tip
	@sif_tip as int
AS
BEGIN
	IF exists(select sif_tippregled from Pregled.TIP_PREGLEDA)
		BEGIN
			DECLARE @ukupno as int = (select count(sif_tippregled) from Pregled.PREGLED where SIF_TIPPREGLED = @sif_tip)
			DECLARE @naziv as varchar(100) = (select NAZIV_TIPPREGLEDA from Pregled.TIP_PREGLEDA where SIF_TIPPREGLED = @sif_tip)

			IF (@ukupno > 0)
				BEGIN
					PRINT('Odradjeni su sledeci pregledi tipa: ' + @naziv)

					DECLARE @sif_pregled as int, @datum as date, @pocetak as time, @kraj as time, @ime as varchar(60)

					DECLARE cursor_tip CURSOR FOR
						select p.SIF_PREGLED, p.DATUM_RADNIKAL, t.POCETAK_TERMINA, t.KRAJ_TERMINA, k.IME_KARTON + ' ' + k.PREZIME_KARTON
						from Pregled.TIP_PREGLEDA tp left join Pregled.PREGLED p on tp.SIF_TIPPREGLED = p.SIF_TIPPREGLED
							left join Zakazivanje_pregleda.TERMIN t on t.SIF_TERMIN = p.SIF_TERMIN
							left join Otvaranje_kartona.KARTON k on k.SIF_KARTON = p.SIF_KARTON
						where tp.SIF_TIPPREGLED = @sif_tip

					OPEN cursor_tip

					FETCH NEXT FROM cursor_tip INTO @sif_pregled, @datum, @pocetak, @kraj, @ime;

					DECLARE @rbr as int = 0;

					WHILE @@FETCH_STATUS = 0
						BEGIN
							SET @rbr = @rbr + 1;
							PRINT(convert(varchar, @rbr) + ' Pregled tipa: ' + @naziv + ' sa rednim brojem pregleda : ' + 
								convert(varchar, @sif_pregled) + ' izvrsen je datuma: ' + isnull(convert(varchar, @datum), '') + 
								' sa pocetkom u: ' + isnull(convert(varchar, @pocetak), '') + ' i krajem u: ' + isnull(convert(varchar, @kraj), '') + 
								' za pacijenta: ' + isnull(@ime, ''))

							FETCH NEXT FROM cursor_tip INTO @sif_pregled, @datum, @pocetak, @kraj, @ime;
						END

					CLOSE cursor_tip

					DEALLOCATE cursor_tip

					PRINT ('Ukupno pregleda: ' + convert(varchar, @ukupno));
				END
			ELSE
				PRINT('Nije bio ni jedan pregled tipa: ' + @naziv)
		END
	ELSE
		RAISERROR('Ne postoji tip pregleda sa tom sifrom!', 16, 0);
END
GO

EXEC pr_tip 2


select p.SIF_PREGLED, tp.NAZIV_TIPPREGLEDA, p.DATUM_RADNIKAL, t.POCETAK_TERMINA, t.KRAJ_TERMINA, k.IME_KARTON + ' ' + k.PREZIME_KARTON
from Pregled.TIP_PREGLEDA tp left join Pregled.PREGLED p on tp.SIF_TIPPREGLED = p.SIF_TIPPREGLED
	left join Zakazivanje_pregleda.TERMIN t on t.SIF_TERMIN = p.SIF_TERMIN
	left join Otvaranje_kartona.KARTON k on k.SIF_KARTON = p.SIF_KARTON
where tp.SIF_TIPPREGLED = 2

select * from Pregled.PREGLED

select count(sif_tippregled) from Pregled.PREGLED where SIF_TIPPREGLED = 2




-- INSERTS
--Otvaranje_kartona.STARATELJ
INSERT INTO Otvaranje_kartona.STARATELJ(JMBG_STR, IME_STR,PREZIME_STR, DATRODJENJA_STR, ZANIMANJE_STR, 
FIRMA_STR, POL_STR, ADRESA_STR, BRTEL_STR, MOBTEL_STR, EMAIL_STR, DRZAVLJANSTVO_STR)
VALUES ('0402991773625','Stanko','Hajduk','04-02-1996', 'Preduzetnik', null, 'M', 'Toplickih Buna 12, Loznica', '015/444-111', '066/123-4567',
'stanko@hajduci.com','srpsko'), 
 
('0402991773623', 'Milenko', 'Bobina', '04-02-1996', 'Autoelektricar', 'Elektrika Mile', 'M', 'Vase Stajica 1, Prnjavor', '015/332-123', '066/213-9990',
'milenkocar@gmail.com', 'srpsko'), 
 
('0101991773221', 'Mile', 'Karika', '01-01-1991', 'Automehanicar', 'VW Servis', 'M', 'Vase Stajica 3, Prnjavor', '015/332-231', '066/213-988',
'm.karika@gmail.com', 'srpsko'), 
 
('0501992663123', 'Dragana', 'Djokic', '05-01-1992', 'Profesor matematike', 'Gimnazija Loznica', 'Z', 'Jovana Cvijica 4, Loznica', '015/888-046', '061/222-3331',
'dabar@gmail.com', 'srpsko'),
 
('0303200112394', 'Aziza', 'Fafulic', '03-03-2001', 'Frizer', 'SZ Kardashian Looks', 'Z', 'Bolnicka 20, Loznica', '015/875-321', '069/123-456-1', null, 'srpsko'),
 
('0210981213124', 'Ildiko', 'Akos', '02-10-1981', 'Pravnik', 'Akos laws', 'Z', 'Orvelova 3, Subotica', '024/444-555-1', '060/354-998-1', 
'idilittleprincess@gmail.com', 'madjarsko'),
 
('0310986213124', 'Srna', 'Scabo', '03-10-1986', 'Umetnik', null, 'Z', 'Nusiceva 13, Subotica', '024/124-555-1', '060/353-798-1', 
'srna.art@gmail.com', 'madjarsko'),
 
('0907995773221', 'Dejan', 'Spasic', '09-02-1995', 'Poljoprivredni tehnicar', 'Monsantno inc', 'M', 'Puskinova 13a, Novi Sad', '021/332-331', '066/217-788',
'dekibre@gmail.com', 'srpsko'),
 
('0901992773221', 'Stevan', 'Stevanovic', '09-01-1992', 'Doktor', 'KCV', 'M', 'Doza Djerdja 13, Novi Sad', '021/133-291', '066/390-988',
'dr.stevan021@gmail.com', 'srpsko'), 
 
('0301994773221', 'Ivan', 'Stevanovic', '03-01-1997', 'Med.tehnicar', 'KCV', 'M', 'Doza Djerdja 12, Novi Sad', '021/133-1231', '066/390-881',
'dr.stevan021@gmail.com', 'srpsko'),
 
 
('2212996773221', 'Djordje', 'Grubacic', '10-22-1996', 'Prof. fizickog vaspitanja', 'OS Jovan Cvijic, Novi Sad', 'M', 'Loznicka 3, Novi Sad', '021/311-1231', '066/311-881',
'djole_biceps@gmail.com', 'srpsko'),
 
 
('2212996773123', 'Stefan', 'Grubacic', '10-22-1996', 'Frilenser dizajner', null, 'M', 'Loznicka 3, Novi Sad', '021/323-1231', '066/323-881',
'creative_solutions@gmail.com', 'srpsko'),
 
('0310990773123', 'Dragutin', 'Nemanjic', '10-03-1990', 'Frilenser programer', null, 'M', 'Mise Dimitrijevica 2, Novi Sad', '021/323-1333', '066/323-83333',
'dev_solutions021@gmail.com', 'srpsko'),
 
('0505975123812', 'Boris', 'Tadic', '05-05-1975', 'Politicar', null, 'M', 'Krunska 2, Beograd', '011/2222-382', '062/123-2222',
'tadic@dss.com', 'srpsko'),
  
('0505979123812', 'Jovanka', 'Muzikravic', '05-05-1979', 'Profesor knjizevnosti', null, 'Z', 'Cvijiceva 15, Beograd', '011/2123-382', '062/123-2212',
'joca-mu@dss.com', 'srpsko');

 
--Otvaranje_kartona.ULOGA
INSERT INTO Otvaranje_kartona.ULOGA (SIF_ULOGA, ULOGA)
VALUES
(NEXT VALUE FOR Otvaranje_kartona.ULOGA_SEQ, 'Otac'),
(NEXT VALUE FOR Otvaranje_kartona.ULOGA_SEQ, 'Majka'),
(NEXT VALUE FOR Otvaranje_kartona.ULOGA_SEQ, 'Staratelj');


--Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST
DBCC CHECKIDENT ('Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST', RESEED, 0);
INSERT INTO Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST(NAZIV_DIJAGNOZA)
VALUES
    ('Intestinalne infektivne bolesti'),
    ('Tuberkuloza'),
    ('Zoonoze bakterijskog porekla'),
    ('Druge bakterijske bolesti'),
    ('Virusni hepatitis'),
    ('Mikoze'),
    ('Bakterijski i drugi infektivni agens'),
    ('Druge i neoznacene infektivne bolesti'),
    ('Drugi nutritivni nedostaci'),
    ('Malnutricija'),
    ('Gojaznost i druge hiperalimentacije'),
    ('Metabolicki poremecaji'),
    ('Du?evna zaostalost'),
    ('Poremecaji psihickog razvoja'),
    ('Inflamatorna oboljenja centralnog nervnog sistema');
 
--Pregled.KNJIGA_PREGLEDA
DBCC CHECKIDENT ('Pregled.KNJIGA_PREGLEDA', RESEED, 0);
INSERT INTO Pregled.KNJIGA_PREGLEDA( IME_PREG_PAC, PREZIME_PREG_PAC, DATRODJENJA_PREG_PAC, OPIS_PREG_PAC,POL_PREG_PAC, ADRESA_PREG_PAC, DRZAVLJANSTVO_PREG_PAC)
VALUES
    ('Marko', 'Karika', '01-01-2017', 'Pacijent dosao sa temperaturom 37,9. Proveren je pritisak', 'M', 'Vase Stajica 3, Prnjavor', 'Srpsko'),
    ('Zarko', 'Karika', '03-02-2015', 'Pacijent se zali na bol u predelu vrata. Vrat je vidno otecen.', 'M', 'Vase Stajica 3, Prnjavor', 'Srpsko'),
    ('Kornel', 'Akos', '05-02-2015', 'Pacijent je dosao tesko guta hranu.', 'M', 'Orvelova 3, Subotica', 'Madjarsko'),
    ('Suljo', 'Fafulic', '06-02-2017', 'Pacijent ima bol u unutrasnjem delu uveta.', 'M', 'Bolnicka 20, Loznica', 'Srpsko'),
    ('Zeljka', 'Stevanovic', '09-10-2017', 'Pacijent ima otecen kaziprst desne ruke. Povreda je nastala prilikom udarca prsta o loptu', 'Z', 
    'Mise Dimitrijevica 2, Novi Sad', 'Srpsko'),
    ('Slavko', 'Bobina', '03-02-2015', 'Pacijent ima svrab u predelu glave. Roditelj sumnja na vaske.', 'M', 'Vase Stajica 1, Prnjavor', 'Srpsko'),
    ('Slavisa','Hajduk', '06-07-2014', 'Pacijent je blago krvario iz podlaktice desne ruke. Jasno je da se pacijent posekao na ostar predmet', 'M', 
    'Toplickih Buna 12, Loznica', 'Srpsko'),
    ('Ivanka', 'Spasic', '12-02-2015', 'Pacijent ima bol prilikom mokrenja. Analize su pokazale da ima upalu urinarnih kanala.', 'Z', 'Puskinova 13a, Novi Sad', 'Srpsko'),
    ('Ivan', 'Muzikravic', '11-03-2014', 'Pacijent ima bol u grlu, otezano guta. Analiza brisa grla je pokazala da pacijent ima streptokoke.', 'M', 'Cvijiceva 15, Beograd',
     'Srpsko'),
     ('Masa', 'Muzikravic', '02-03-2017', 'Pacijent tesko dobija na tezini.', 'Z', 'Cvijiceva 15, Beograd',
     'Srpsko'),
     ('Teodor', 'Muzikravic', '01-02-2013', 'Pacijent je dosao sa crvenilom desnog oka.', 'M', 'Cvijiceva 15, Beograd',
     'Srpsko'),
     ('Uros', 'Grubacic', '01-02-2016', 'Pacijent je dosao sa otecenim prstom, bolnim na dodir.', 'M', 'Loznicka 3, Novi Sad',
     'Srpsko'),
     ('Dimitrije', 'Grubacic', '02-01-2016', 'Pacijent ne prepoznaje lica najbolje(na blizinu).', 'M', 'Loznicka 3, Novi Sad',
     'Srpsko'), 
     ('Stefan', 'Grubacic', '03-01-2018', 'Pacijent je dosao sa otezanim disanjem i temperaturom.', 'M', 'Loznicka 3, Novi Sad',
     'Srpsko'),
     ('Ilija', 'Tadic', '02-12-2016', 'Pacijent ima svrab u predelu nogu. Uradjen alergotest koji je ukazao da je pacijent alergican.', 'M', 'Krunska 2, Begorad', 'Spsko');

 
--Usluge_i_lekovi.USLUGA
 DBCC CHECKIDENT ('Usluge_i_lekovi.USLUGA', RESEED, 0);
INSERT INTO Usluge_i_lekovi.USLUGA(NAZIV_USLUGA)
VALUES
    ('Previjanje'),
    ('Inhalacija'),
    ('Specijalisticki pregled prvi'),
    ('Specijalisticki pregled kontrolni'),
    ('Lecenje alveolita'),
    ('Ispitivanje psihomotornog razvoja u najranijem detinjstvu'),
    ('Ispitivanje pojedinacnih psihomotornih funkcija'),
    ('Procena organskog ostecenja'),
    ('Ispitivanje koordinacije pokreta'),
    ('Specijalisticki psihijatrijski pregled'),
    ('Rey test'),
    ('Elyzir test'),
    ('Behejvior psihoterapija'),
    ('Logoterapija'),
    ('Muzikoterapija'),
    ('Elektroencefalogija'),
    ('Elektrokortiografija'),
    ('Bronhospinometrija');

 
--Usluge_i_lekovi.LEK
DBCC CHECKIDENT ('Usluge_i_lekovi.Lek', RESEED, 0);
INSERT INTO Usluge_i_lekovi.LEK(NAZIV_LEK, MILIGRAMAZA_LEK, FARMACEUTSKIOBLIK, NACINUPOTREBE_LEK)
VALUES
    ('Mikonazol','40000', 'tuba, 1 po 40 g 2%', 'oralni gel'),
    ('Metronidazol', '8000', ' blister, 20 po 400 mg', 'film tableta'),
    ('Omeprazol', '300', 'blister, 15 po 20 mg', 'gastrorezistentna kapsula, tvrda'),
    ('Pantoprazol', '560', 'blister, 14 po 40 mg', 'gastrorezistentna tableta'),
    ('Esomeprazol', '140','blister, 7 po 20 mg', 'gastrorezistentna tableta'),
    ('Metoklopramid', '300', 'blister, 30 po 10 mg', 'tableta'),
    ('Ondansetron', '40', '10 po 4mg', 'film tableta'),
    ('Granisetron', '10', 'blister, 10 po 1mg', 'film tableta'),
    ('Ursodeoksiholna kiselina', '2500000', 'blister 100 po 250mg', 'kapsula tvrda'),
    ('Loperamid', '40', 'blister, 20 po 2mg', 'tableta'),
    ('Budesonid', '300', 'blister, 100 po 3mg', 'kapsula, tvrda'),
    ('Pankreatin', '6000', 'kontejner plasticni 20 po 300mg', 'kapsula, tvrda'),
    ('Insulin humani', '15', 'ulozak, 5 po 3ml', 'rastvor za injekciju u ulosku'),
    ('Glimepirid', '120', 'blister, 30 po 4 mg ', 'tableta'),
    ('Bisoprolol', '150', 'blister, 30 po 5mg', 'film tableta');
      
--Pregled.PARAMETAR
DBCC CHECKIDENT ('Pregled.PARAMETAR', RESEED, 0); 
insert into Pregled.PARAMETAR(NAZIV_PARAMETAR, JEDINICA_MERE)
VALUES
    ('Telesna temperatura', 'Stepen celzijusa'),
    ('Tezina', 'Gram'),
    ('Visina', 'Centimetar'), 
    ('Krvni pritisak', 'mmHG'),
    ('Broj otkucaja srca', 'broj puta'),
    ('Nivo secera u krvi', 'mg/dl'),
    ('Nivo holesterola u krvi', 'mmol/l'),
    ('Nivo triglicerida u krvi', 'mg/dl'),
    ('Nivo gvozdja u krvi', 'mg/l'),
    ('Nivo hemoglobina u krvi', 'mmo/l'),
    ('Niko trombocita u krvi', 'brok/mikrolitar'), 
    ('Obim struka', 'cm'), 
    ('Obim glave', 'cm'), 
    ('Obim grudi', 'cm'), 
    ('Duzina ruku', 'cm'), 
    ('Duzina nogu', 'cm');

 
--Pregled.TIP_PREGLEDA
DBCC CHECKIDENT ('Pregled.TIP_PREGLEDA', RESEED, 0);
INSERT INTO Pregled.TIP_PREGLEDA (NAZIV_TIPPREGLEDA, IMA_DIJAGNOZU)
VALUES
('Oftamoloski pregled', 1),
('Nutricionistiki pregled', 1),
('Dermatoloski pregled', 1),
('Kardioloski pregled', 1),
('Pregled respiratornih organa', 1),
('Pregledi uha, grla i nosa', 1),
('Gastroenteroloski pregledi', 1),
('Pregledi misicno-skeletnog sistema', 1),
('Pregledi centralnog nervnog sistema', 1),
('Stomatoloski pregled', 1),
('Krvna slika i pregled urina', 1),
('Preventivni pregled pedijatra', 1),
('Neonatoloski pregled', 1),
('Alergoloski pregled',1)


--Uput.SIFARNIK_INSTITUCIJE
DBCC CHECKIDENT ('Uput.SIFARNIK_INSTITUCIJE', RESEED, 0);
INSERT INTO Uput.SIFARNIK_INSTITUCIJE(NAZIV_INSTITUCIJE, KONTAKT, ADRESA, EMAIL)
VALUES ('Specijalna Hirurska Bolnica Parks Dr Dragi', '021 402539', 'Suboticka 41, Novi Sad', 'parks@gmail.com'),
('Zavod za hitnu medicinsku pomoc Novi Sad', '021 6400125', 'Vrsacka 28, Novi Sad', 'zavod@gmail.com'),
('Klinicki centar Vojvodine', '021 402533', 'Hajduk Veljkova 1, Novi Sad', 'kcv@gmail.com'),
('Opsta bolnica Djordje Joanovic Zrenjanin', '023 202539', 'Sudrucka 22, Zrenjanin', 'dj@gmail.com'),
('Institut za kardiovaskularne bolesti Vojvodine', '021 402539', 'Gunduliceva 22, Sremska Kamenica', 'kamenica@gmail.com'),
('Vojno medicinska akademija', '011 32131539', 'Crnotravska 17, Beograd', 'vma@gmail.com')


--Uput.SIFARNIK_SPECIJALIZACIJE
DBCC CHECKIDENT ('Uput.SIFARNIK_SPECIJALIZACIJE', RESEED, 0);  
INSERT INTO Uput.SIFARNIK_SPECIJALIZACIJE(NAZIV_SPECIJALIZACIJE)
VALUES
    ('Specijalisticki pregled prvi'),
    ('Specijalisticki pregled kontrolni'),
    ('Specijalisticki pregled prvi - profesor'),
    ('Specijalisticki pregled kontrolni - profesor'),
    ('Specijlisticki pregled prvi - docenta i primarijusa'),
    ('Specijalisticki stomatoloski pregled'),
    ('Specijalisticki kardiovaskularni pregled'),
    ('Specijalisticki otorinolaringoloski pregled'),
    ('Specijalisticki psiholoski pregled'),
    ('Specijalisticki pregled motorike'),
    ('Specijalisticki ortopedski pregled'),
    ('Specijalisticki oftalmoloski pregled');
 
--Uput.SIFARNIK_INSTITUCIJE
DBCC CHECKIDENT ('Edukacija.ZDRAVSTVENI_RADNIK', RESEED, 0);
INSERT INTO Edukacija.ZDRAVSTVENI_RADNIK(IME_ZDR, PREZIME_ZDR, DATRODJENJA_ZDR, ADRESA_ZDR, MESTO_ZDR, TEL_ZDR, EMAIL_ZDR, LOZINKA_ZDR, DATZAPOSLENJA_ZDR, RADNI_STAZ, BRSLOBODNIHDANA, BRDANAGODISNJEG )
VALUES
('Marko', 'Bojic', '06-10-1968', 'Cukaricka 178', 'Beograd', '062/548-985', 'markobg@gmail.com', '******', '01-25-1996', 21, 69, 35),
('Milica', 'Micic', '01-11-1962', 'Rumenacka 46', 'Novi Sad', '061/785-1111', 'micicmilica@gmail.com', '******', '05-12-1988', 30, 70, 40),
('Nikola', 'Zigic', '01-10-1985', 'Lozionicka 85', 'Novi Sad', '069/123-8458', 'nikolaz@gmail.com', '******', '07-07-2013', 4, 45, 31),
('Savo', 'Jankovic', '04-06-1973', 'Nikola Tesla 15', 'Uzice', '065/569-9854', 'jankovic@gmail.com', '******', '12-25-1995', 21, 66, 35),
('Jovana', 'Kosanovic', '10-11-1988', 'Slavka Rodica 02', 'Beograd', '067/785-1546', 'jovana88@gmail.com', '******', '04-09-2012', 5, 59, 30),
('Nemanja', 'Peric', '05-06-1969', 'Zitni Trg 23', 'Zrenjanin', '062/586-2548', 'peric@gmail.com', '******', '12-12-1990', 21, 80, 46),
('Daria', 'Gajic', '12-09-1975', 'Javka Cmelika 12', 'Novi Sad', '064/125-6511', 'gajicdaria@gmail.com', '******', '07-11-2000', 18, 60, 34),
('Andjela', 'Tankosic', '05-12-1982', 'Partizanska 65', 'Novi Sad', '066/888-9652', 'andjelat@gmail.com', '******', '09-08-2005', 12, 55, 42),
('Milena', 'Potkozarac', '12-06-1970', 'Dobrivoja Cosica 22', 'Kraljevo', '064/569-8966', 'porkozaracm@gmail.com', '******', '11-03-1998', 20, 60, 31),
('Nebojsa', 'Tonim', '08-08-1982', 'Kralja Petra 56', 'Novi Sad', '062/569-9658', 'nebojsatomin@gmail.com', '******', '03-10-2002', 15, 70, 40),
('Marija', 'Marinkov', '12-05-1956', 'Kosovska 23', 'Novi Sad', '064/859-659', 'marijans@gmail.com', '******', '10-12-1970', 47, 65, 45),
('Aleksandar', 'Stojanov', '11-02-1979', 'Vuka Karadzica 05', 'Kovacica', '066-555-9632', 'aleksandars@gmail.com', '******', '11-10-2006', 11, 65, 35),
('Milenko', 'Savic', '04-02-1965', 'Vojvode Bojovica 45', 'Beograd', '069/875-8951', 'milenkosavic@gmail.com', '******', '12-10-2000', 18, 75, 30),
('Ana', 'Jovic', '12-04-1978', 'Cirpanova 15', 'Novi Sad', '065/148-9854', 'anajovic@gmail.com', '******', '04/01/2015', 3, 56, 32),
('Jasna', 'Simic', '03-23-1976', 'Pavle Jovanovic 14', 'Beograd', '062/548-122', 'jacasimic@gmail.com', '******', '05-15-2006', 11, 69, 35),
('Marija', 'Ilic', '05-05-1982', 'Kraljevica Marka 15', 'Novi Sad', '064-569-2251', 'marijailic@gmail.com', '******', '01-01-2007', 11, 75, 39)

--Edukacija.TIP_EDUKACIJE
DBCC CHECKIDENT ('Edukacija.TIP_EDUKACIJE', RESEED, 0);
INSERT INTO Edukacija.TIP_EDUKACIJE (OBLAST_TIPEDU)
VALUES
('Lajmska bolest'),
('Prevencija posledica stresa'),
('Mehanizmi dejstva lekova u terapiji bronhijalne astme'),
('Govor tela u zdravstvu'),
('Vakcinacija dece'),
('Kako pristupiti deci'),
('Nega i ishrana deteta'),
('Evrposke smernice za dijagnozu i terapiju visokog krvnog pristiska kod dece'),
('Poremecaj rasta kod dece'),
('Preporuka za primenu vitamina K kod dece'),
('Razvoj deteta i motorika'),
('Gojaznost'),
('Zdrava ishrana dece'),
('Ultrazvuk kukova kod dece'),
('Testiranje motoricke sposobnosti kod dece')
 
--Edukacija.INSTITUCIJA
DBCC CHECKIDENT ('Edukacija.INSTITUCIJA', RESEED, 0);
INSERT INTO Edukacija.INSTITUCIJA ( NAZIV_INST)
VALUES
('Klinicki centar Vojvodine'),
('Univerzitetska decija klinika'),
('Institut za zdravstenu zastitu majke i deteta'),
('Natura'),
('Viva'),
('Neven'),
('Decija poliklinika Beograd'),
('Hotel New City, Nis'),
('Medinciski fakultet Beograd'),
('Dom zdravlja Novi Sad')
 
 
--Davanje_vakcina.TIP_VAKCINE
DBCC CHECKIDENT ('Davanje_vakcina.TIP_VAKCINE', RESEED, 0)
INSERT INTO Davanje_vakcina.TIP_VAKCINE(NAZIV_TIPVAK, PROGRAM, UZRAST_OD_TIPVAK, UZRAST_DO_TIPVAK, NACIN_UPOTREBE_TIPVAK)
VALUES
('BCG - Vakcina protiv tuberkoloze', 1, 1, 2, 'Doza BCG vakcine od 0.05ml-0.1ml u ruku.'),
('TORLAK - Vakcina protiv trbušnog tifusa', 0, 1, 80, 'Doza TORLAK vakcine od 0.05ml-0.5ml u ruku.'),
('HB – vakcina protiv hepatitisa B', 1, 1, 2, 'Doza HB vakcine od 0.05ml-0.5ml u ruku.'),
('Hib – vakcina protiv hemofiliusa influence tip B', 1, 1, 2, 'Doza Hib vakcine od 0.05ml-0.1ml u ruku.'),
('MMR – vakcina protiv malih boginja, zaušaka i rubeola', 1, 1, 2, 'Doza MMR vakcine od 0.05ml-0.1ml u anterolateralni predeo butine.'),
('DT – vakcina protiv difterije i tetanusa', 1, 1, 7, 'Doza DT vakcine od 0.03ml-0.1ml u ruku.'),
('DT – vakcina protiv difterije i tetanusa', 1, 7, 14, 'Doza DT vakcine od 0.05ml-0.1ml u ruku.'),
('OPV – vakcina protiv decije paralize', 1, 1, 14, 'Doza OPV vakcine od 0.1ml-0.2ml u ruku.'),
('DTP – vakcina protiv difterije i velikog kašlja', 1, 1, 2, 'Doza DTP vakcine od 0.5ml-0.1ml u ruku.'),
('TT – vakcina protiv tetanusa, adsorbovana', 0, 1, 2, 'Doza TT vakcine od 0.5ml-0.1ml u desnu nadlakticu.'),
('PENTAXIM - vakcina protiv Haemophilus influenzae tip B ', 0, 1, 5, 'Doza PENTAXIM vakcine od 0.5ml-0.1ml u antero-lateralna strana butine.'),
('RotaTeq - vakcina protiv dijareje izazvane rota virusom ', 0, 1, 2, 'Doza RotaTeq vakcine od 1ml-2ml je namenjena za oralnu upotrebu.'),
('GARDASIL - vakcina protiv humanog papiloma virusa', 0, 1, 2, 'Doza GARDASIL vakcine od 0.02ml-0.05ml u ruku.'),
('STAMARIL - vakcina protiv humanog papiloma virusa', 0, 1, 10, 'Doza STAMARIL vakcine od 0.5ml u anterolateralna strana butine.')

--Davanje_vakcina.PROIZVODJAC
DBCC CHECKIDENT ('Davanje_vakcina.PROIZVODJAC', RESEED, 0);
insert into Davanje_vakcina.PROIZVODJAC(NAZIV_PROIZ, SEDISTE_PROIZ, DIREKTOR_PROIZ, TEL_PROIZ)
values 
('Priorix', 'Beograd', 'Jovan Miletic', '069/896-5596'),
('GlaxoSmithKline', 'London', 'Jonh Velder', '+171-786-8866'),
('Merck & Co', 'Kanada', 'Mike Tompson', '+175-845-9654'),
('Novartis', 'Beograd', 'Miodrag Karanovic', '069/845-6558'),
('Sanofi', 'Svajcarska', 'Anna James', '+125-489-7966'),
('Torlak', 'Beograd', 'Milena Ivanovic', '069/845-5698'),
('Emergent Biosolutions', 'USA', 'Tom Luther', '517-327-1500'),
('GSK', 'Beograd', 'Nikola Teodosic', '065/789-5478'),
('PaxVax', 'Miami', 'Anbela Krus', '800-533-5899'),
('Pfizer', 'New Yourk', 'Gabriel Paccard', ' 866-475-8222'),
('Seqirus', 'Moskva', 'El Medico', '589-658-5589'),
('Valneva', 'Gaithersburg', 'Georg Constantin Brun', '301-556-4500'),
('Pasteur', 'Meriden', 'Mae Jemison', '800-822-2463'),
('Bio Diem', 'Beograd', 'Jasna Lukic', '069/986-6589'),
('Paskal', 'Los Angeles', 'Roberta Bondar', '+169-854-4858')
 
--Davanje_vakcina.DOBAVLJAC
DBCC CHECKIDENT ('Davanje_vakcina.DOBAVLJAC', RESEED, 0);
insert into Davanje_vakcina.DOBAVLJAC (NAZIV_DOB, SEDISTE_DOB, DIREKTOR_DOB, TEL_DOB)
values 
('Aventis', 'New Yourk', 'John Smith', '+658-985-5585'),
('IFPMA', 'New Zeland', 'Artur James', '+125-865-5893'),
('DCVMN', 'San Diego', 'Claud Mesih', '+558-658-5893'),
('Rota', 'Beograd', 'Aleksandra Tomic', '065/985-9862'),
('Penta', 'Beograd', 'Milos Ivanovic', '069/859-9856'),
('Mesles', 'Budapest', 'Tomas Jonas', '+989-985-6548'),
('ITKO', 'Beograd', 'Nemanja Savic', '064/875-9856'),
('Balaji Medivac', 'New Delhi', 'Chris Hampris', '+658-784-588'),
('Bionic', 'Mumbai', 'Isak Jannes', '+474-548-548'),
('Vaccine House', 'Beograd', 'Elena Gajic', '061/589-6585'),
('Moder Drug House', 'New Yourk', 'Robbin Cook', '+652-985-6896'),
('Serum and Vaccines', 'Delhi', 'Hastie Lim', '+548-985-6898'),
('Hardic Medical Store', 'Los Angeles', 'Leonar Diver', '+874-985-6985'),
('Bioslo Life', 'Prague', 'John Watson', '+8754-985-5588'),
('Vaccicare Enterprises', 'Romania', 'David Livesey', '+111-985-5733')

--Zakazivanje_pregleda.VRSTA_DANA
DBCC CHECKIDENT ('Zakazivanje_pregleda.VRSTA_DANA', RESEED, 0);
INSERT INTO Zakazivanje_pregleda.VRSTA_DANA (VRSTA_DANA)
VALUES
('radni'),
('neradni')
 
--Zakazivanje_pregleda.SMENA
DBCC CHECKIDENT ('Zakazivanje_pregleda.SMENA', RESEED, 0);
insert into Zakazivanje_pregleda.SMENA (NAZIV_SMENA, POCETAK_SMENA, KRAJ_SMENA )
values 
('prva', '00:07:00', '00:13:00'),
('druga', '00:13:00', '00:19:00'),
('dezurstvo', '00:00:00', '00:24:00')
 
--Zakazivanje_pregleda.ODSUSTVO
DBCC CHECKIDENT ('Zakazivanje_pregleda.ODSUSTVO', RESEED, 0);
INSERT INTO Zakazivanje_pregleda.ODSUSTVO (RAZLOGODSUSTVA )
VALUES
('Poslovni put'),
('Kongres'),
('Edukacija'),
('Poslovni sastanak'),
('Godisnji odmor'),
('Bolovanje'),
('Hitno odsustvo'),
('Obuka lekara')
 
--Zakazivanje_pregleda.TERMIN
DBCC CHECKIDENT ('Zakazivanje_pregleda.TERMIN', RESEED, 0);
insert into Zakazivanje_pregleda.TERMIN (POCETAK_TERMINA, KRAJ_TERMINA )
values 
('07:30', '07:45'),
('07:45', '08:00'),
('08:00', '08:15'),
('08:15', '08:30'),
('08:30', '08:45'),
('08:45', '09:00'),
('09:00', '09:15'),
('09:15', '09:30'),
('09:30', '09:45'),
('09:45', '10:00'),
('10:00', '10:15'),
('10:15', '10:30'),
('10:30', '10:45'),
('10:45', '11:00'), --pauza
('11:30', '11:45'),
('11:45', '12:00'),
('12:00', '12:15'),
('12:15', '12:30'),
('12:30', '12:45'),
('12:45', '13:00'),
('13:00', '13:15'),
('13:15', '13:30'),
('13:30', '13:45'),
('13:45', '14:00'),
('14:00', '14:15'),
('14:15', '14:30'),
('14:30', '14:45'),
('14:45', '15:00'),
('15:00', '15:15'),
('15:15', '15:30'), --pauza
('16:00', '16:15'),
('16:15', '16:30'),
('16:45', '17:00'),
('17:00', '17:15'),
('17:15', '17:30'),
('17:30', '17:45'),
('17:45', '18:00'),
('18:00', '18:15'),
('18:15', '18:30')

--Pregled.MERI
INSERT INTO Pregled.MERI(SIF_TIPPREGLED, SIF_PARAMETAR)
VALUES
(13, 2),
(13, 3),
(13,12),
(13,13),
(13,14),
(13,15),
(13,0),
(4,5),
(12,1),
(11,6),
(11,7),
(11,8),
(11,9),
(11,10),
(11,11),
(11,4)
     
--Otvaranje_kartona.KARTON
DBCC CHECKIDENT ('Otvaranje_kartona.KARTON', RESEED, 0);
insert into Otvaranje_kartona.KARTON (JMBG_KARTON, IME_KARTON, PREZIME_KARTON, POL_KARTON, DATRODJENJA_KARTON, DATOTVARANJA_KARTON,
                                    MESTO_RODJENJA, OPSTINA_RODJENJA, ADRESA_KARTON, DRZAVLJANSTVO_KARTON, DAT_ZAKLJ_UGOVOR, SIF_ZDR)
VALUES ('3005996850210', 'Andrej', 'Draginic', 'M', '02-05-1999', '04-05-2017', 'Bogatic', 'Sremska Mitrovica', 'Bartok Bele 22, Bogatic', 'srpsko', '04-05-2017', 2),
('2204015950210', 'Jovan', 'Jovic', 'M', '04-22-2015', '07-13-2017', 'Bogatic', 'Sremska Mitrovica', 'Dr Zorana Djindjica 02, Bogatic', 'srpsko', '07-22-2017', 1),
('1101012850210', 'Milovan', 'Mijic', 'M', '01-11-2012', '04-05-2017', 'Sremska Mitrovica', 'Sremska Mitrovica', 'Tekelijina 12, Sremska Mitrovica', 'srpsko', '11-12-2017', 5),
('1505012850210', 'Dragan', 'Miric', 'M', '05-15-2012', '09-25-2017', 'Novi Sad', 'Novi Sad', 'Gunduliceva 221, Novi Sad', 'srpsko', '09-25-2017', 1),
('3001014850210', 'Andrej', 'Mitrovic', 'M', '02-05-2007', '04-05-2017', 'Sid', 'Sid', 'Toplicina 01, Sid', 'srpsko', '04-08-2017', 2),
('2201014850210', 'Milan', 'Cvijanovic', 'M', '01-22-2014', '08-25-2017', 'Sid', 'Sid', 'Prizrenska 12, Sid', 'srpsko', '08-25-2017', 2),
('3012016850210', 'Danica', 'Danicic', 'Z', '12-30-2016', '04-25-2017', 'Sid', 'Sid', 'Sindjeliceva 56, Sid', 'srpsko', '04-25-2017', 6),
('0311015850210', 'Ljubica', 'Anicic', 'Z', '11-03-2015', '03-13-2017', 'Sid', 'Sid', 'Loznicka 04, Sid', 'srpsko', '04-05-2017', 9),
('2506014850210', 'Marija', 'Ljubicic', 'Z', '06-25-2014', '02-25-2017', 'Sid', 'Sid', 'Jovana Cvijica 12, Erdevik', 'srpsko', '03-12-2017', 11),
('1301017850210', 'Ana', 'Katic', 'Z', '04-30-2016', '01-13-2017', 'Sid', 'Sid', 'Marije Terezije 23, Sid', 'srpsko', '02-25-2017', 7),
('1111014850210', 'Ivana', 'Ristovski', 'Z', '11-11-2014', '02-13-2017', 'Novi Sad', 'Novi Sad', 'Banjicina 211, Novi Sad', 'srpsko', '09-21-2017', 6),
('3003016850210', 'Jovana', 'Jojic', 'Z', '03-30-2016', '02-26-2017', 'Sid', 'Sid', 'Svetog Save 22, Erdevik', 'srpsko', '02-26-2017', 6),
('3003016850212', 'Ivana', 'Jojic', 'Z', '03-29-2016', '02-26-2017', 'Sid', 'Sid', 'Svetog Save 22, Erdevik', 'srpsko', '02-26-2017', 6),
('3003016850211', 'Marija', 'Jojic', 'Z', '03-30-2016', '02-26-2017', 'Sid', 'Sid', 'Svetog Save 22, Erdevik', 'srpsko', '02-26-2017', 6),
('1103013850210', 'Mara', 'Petric', 'Z', '03-11-2013', '02-26-2017', 'Sid', 'Sid', 'Gunduliceva 12, Novi Sad', 'srpsko', '02-26-2017', 6)
 
 
--Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
DBCC CHECKIDENT ('Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR', RESEED, 0);
insert into Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR (DATZAKLJUCIVANJA, DATRASKIDANJA, RAZLOG_PROMENE, BR_UGOVORA, SIF_KARTON, SIF_ZDR)
VALUES ('07-13-2017', '07-22-2017', 'Neodgovaranje termina u kojima lekar radi roditeljima', 01, 2, 1),
('04-05-2017', '11-12-2017', 'Staratelj smatra da lecenje lekara nije adekvatno', 02, 3, 7),
('04-05-2017', '04-08-2017', 'Staratelj odlucuje da zeli da dete ide kod njihovog kucnog prijatelja', 03, 5, 3),
('03-13-2017', '04-05-2017', 'Neodgovaranje termina u kojima lekar radi roditeljima', 04, 8, 3),
('02-25-2017', '03-12-2017', 'Neodgovaranje termina u kojima lekar radi roditeljima', 05, 9, 2),
('01-13-2017', '02-25-2017', 'Staratelj smatra da lecenje lekara nije adekvatno', 06, 10, 2),
('02-13-2017', '05-01-2017', 'Staratelj smatra da lecenje lekara nije adekvatno', 07, 11, 1),
('05-01-2017', '09-21-2017', 'Staratelj smatra da lecenje lekara nije adekvatno', 08, 11, 5)
 
     
--Otvaranje_kartona.ODGOVORAN
insert into Otvaranje_kartona.ODGOVORAN (JMBG_STR, PRIORITET, SIF_KARTON, SIF_ULOGA)
VALUES ('0402991773625', 1, 1, 1),
('0402991773623', 0, 2, 1),
('0501992663123', 1, 2, 2),
('0303200112394', 1, 3, 3),
('0210981213124', 1, 4, 2),
('0101991773221', 0, 5, 1),
('0310986213124', 1, 5, 2),
('0907995773221', 1, 6, 3),
('0901992773221', 1, 7, 1),
('0301994773221', 1, 8, 1),
('2212996773221', 1, 9, 3),
('2212996773123', 1, 10, 1),
('0505975123812', 1, 11, 3),
('0505979123812', 1, 12, 2)
 
--Otvaranje_kartona.HRONICNA_BOLEST
DBCC CHECKIDENT ('Otvaranje_kartona.HRONICNA_BOLEST', RESEED, 0);
insert into Otvaranje_kartona.HRONICNA_BOLEST (DATUM_UTVRDJIVANJA_HRONBOLEST, SIF_DIJAGNOZA, SIF_KARTON)
VALUES ('01-03-2017', 2, 5),
('06-06-2017', 5, 4),
('06-11-2017', 5, 2),
('06-01-2017', 6, 3),
('04-06-2017', 2, 5),
('05-07-2017', 1, 6),
('07-04-2017', 5, 2),
('09-04-2017', 8, 11),
('02-03-2017', 5, 2),
('01-02-2017', 4, 3),
('01-02-2017', 5, 4),
('03-01-2017', 5, 6)
 
--Otvaranje_kartona.RIZIK_I_ALERGIJA
DBCC CHECKIDENT ('Otvaranje_kartona.RIZIK_I_ALERGIJA', RESEED, 0);
insert into Otvaranje_kartona.RIZIK_I_ALERGIJA (NAZIV_RA, AKTUELAN_RA, DATUM_UTVRDJIVANJA_RA, SIF_DIJAGNOZA, SIF_KARTON)
VALUES ('Urtikarija', 1, '06-06-2017', 5, 1),
('Urtikarija', 0, '04-04-2017', 2, 2),
('Urtikarija', 1, '02-05-2017', 3, 3),
('Dermatitis', 1, '01-03-2017', 2, 4),
('Dermatitis', 0, '03-11-2017', 6, 2),
('Dermatitis', 1, '03-10-2017', 8, 1),
('Dermatitis', 1, '01-11-2017', 1, 4),
('Alergija na hranu', 0, '06-06-2017', 2, 11),
('Alergija na hranu', 1, '01-02-2017', 5, 3),
('Alergija na otrov insekta', 1, '03-08-2017', 9, 7),
('Alergija na otrov insekta', 1, '06-07-2017', 10, 9)

--Zakazivanje_pregleda.RADNI_KALENDAR
insert into Zakazivanje_pregleda.RADNI_KALENDAR (DATUM_RADNIKAL, SIF_DANA)
VALUES ('04-01-2018', 1),
('04-02-2018', 0),
('04-03-2018', 0),
('04-04-2018', 1),
('04-05-2018', 0),
('04-06-2018', 0),
('04-07-2018', 0),
('04-08-2018', 0),
('04-09-2018', 1),
('04-10-2018', 0),
('04-11-2018', 0),
('04-12-2018', 0),
('04-13-2018', 0),
('04-14-2018', 0),
('04-15-2018', 1)

--Zakazivanje_pregleda.LEKAREV_DAN
insert into Zakazivanje_pregleda.LEKAREV_DAN (DATUM_RADNIKAL, SIF_ZDR, SIF_SMENA, SIF_ODSUSTVO)
VALUES ('04-01-2018', 1, 0, 1),
('04-01-2018', 3, 1, 3),
('04-02-2018', 2, 0, 4),
('04-02-2018', 4, 1, 1),
('04-03-2018', 5, 0, 1),
('04-03-2018', 1, 1, 6),
('04-04-2018', 6, 2, 5),
('04-05-2018', 2, 0, 2),
('04-05-2018', 1, 1, 4),
('04-06-2018', 7, 0, 3),
('04-06-2018', 8, 1, 2),
('04-07-2018', 3, 0, 1),
('04-07-2018', 4, 1, 6),
('04-08-2018', 1, 0, 5),
('04-08-2018', 2, 1, 1)

--Zakazivanje_pregleda.TERMIN_LEKARA
insert into Zakazivanje_pregleda.TERMIN_LEKARA (SIF_ZDR, SIF_KARTON, SIF_TERMIN, SIF_ODSUSTVO, DATUM_RADNIKAL, DATUM_ZAKAZIVANJA, VREME_ZAKAZIVANJA)
VALUES (1, 1, 0, 1, '04-01-2018', '03-30-2018', '17:28:00'),
(1, 2, 1, 5, '04-01-2018', '03-30-2018', '11:35:00'),
(3, 4, 2, 2, '04-01-2018', '03-31-2018', '09:20:15'),
(3, 5, 3, 6, '04-01-2018', '03-30-2018', '12:28:00'),
(1, 6, 4, 7, '04-01-2018', '03-29-2018', '13:02:00'),
(2, 3, 5, 1, '04-02-2018', '03-30-2018', '08:24:00'),
(4, 6, 6, 3, '04-02-2018', '03-30-2018', '09:01:00'),
(5, 1, 7, 4, '04-03-2018', '03-30-2018', '14:28:00'),
(1, 10, 9, 5, '04-03-2018', '03-29-2018', '17:51:00'),
(6, 9, 10, 3, '04-04-2018', '03-27-2018', '14:32:00')


     
--Pregled.PREGLED
DBCC CHECKIDENT ('Pregled.PREGLED', RESEED, 0);
insert into Pregled.PREGLED (JMBG_STR, SIF_TIPPREGLED, SIF_ZDR, DATUM_RADNIKAL, SIF_TERMIN, DATUMPOCETKA, TRAJANJE_BOLOVANJA, SIF_K_PREGLED, SIF_ZDR_POSTOJI, SIF_KARTON)
VALUES (null, 2, 1, '04-01-2018', 0, null, null, 12, null, 5),
(null, 0, 1, '04-01-2018', 1, null, null, 7, null, 6),
(null, 2, 3, '04-01-2018', 2, null, null, 1, null, 1),
(null, 4, 1, '04-01-2018', 4, null, null, 8, null, 2),
(null, 3, 3, '04-01-2018', 3, null, null, 5, null, 3),
(null, 2, 2, '04-02-2018', 5, null, null, 2, null, 4),
(null, 1, 4, '04-02-2018', 6, null, null, 11, null, 5),
(null, 7, 2, '04-02-2018', 5, null, null, 9, null, 6),
(null, 9, 4, '04-02-2018', 6, null, null, 10, null, 7),
(null, 12, 1, '04-03-2018', 9, null, null, 4, null, 1),
(null, 10, 5, '04-03-2018', 7, null, null, 3, null, 4),
(null, 11, 1, '04-03-2018', 9, null, null, 13, null, 7),
(null, 11, 5, '04-03-2018', 7, null, null, 14, null, 2),
(null, 3, 6, '04-04-2018', 10, null, null, 0, null, 11),
(null, 2, 6, '04-04-2018', 10, null, null, 6, null, 12)
 
--Otvaranje_kartona.UTVRDJUJE_SE
INSERT INTO Otvaranje_kartona.UTVRDJUJE_SE(SIF_PREGLED, SIF_DIJAGNOZA, SIF_KARTON)
VALUES
    (0,3,5),
    (1,4,6),
    (2,5,1),
    (3,3,2),
    (4,8,3), 
    (5,5,4),
    (6,3,5),
    (7,2,6),
    (8,2,7),
    (9,9,1),
    (10,1,4),
    (11,8,7),
    (12,6,2),
    (13,8,11),
    (14,9,12);
     
--INSERT Usluge_i_lekovi.SE_SALJE
INSERT INTO Usluge_i_lekovi.SE_SALJE(SIF_PREGLED, SIF_USLUGA, SIF_KARTON, KOLICINA)
VALUES
    (0,2,5,1),
    (1,1,6,2),
    (2,3,1,1),
    (3,4,2,1),
    (4,2,3,1),
    (5,3,4,1),
    (6,6,5,1),
    (7,9,6,1),
    (8,11,7,2),
    (9,2,1,1),
    (10,12,4,1),
    (11,2,7,1),
    (12,6,2,1),
    (13,7,11,1),
    (14,9,12,1);
     
--Usluge_i_lekovi.RECEPT
DBCC CHECKIDENT ('Usluge_i_lekovi.RECEPT', RESEED, 0);
insert into Usluge_i_lekovi.RECEPT(ROK_VAZENJA_RECEPT, BROJDANAKONZUMACIJE, BROJDNEVNOGKONZUMIRANJA, SIF_KARTON, SIF_LEK, SIF_PREGLED)
VALUES
    ('01-01-2018',7,2,5,1,0),
    ('01-02-2018',5,3,6,2,1),
    ('01-03-2018',3,4,1,3,2),
    ('01-04-2018',8,1,2,4,3),
    ('01-05-2018',9,2,3,5,4),
    ('01-06-2018',5,3,4,6,5),
    ('01-07-2018',4,4,5,7,6),
    ('01-08-2018',6,1,6,8,7),
    ('01-09-2018',5,2,7,9,8),
    ('01-10-2018',7,4,1,6,9),
    ('01-11-2018',6,3,4,1,10),
    ('02-05-2018',5,2,7,2,11),
    ('03-05-2018',3,1,2,3,12),
    ('04-05-2018',2,4,11,1,13),
    ('05-05-2018',7,2,12,8,14);
 
--Pregled.DODATNI_PARAMETAR
INSERT INTO Pregled.DODATNI_PARAMETAR(SIF_PREGLED, SIF_PARAMETAR, VREDNOST_DP, SIF_KARTON)
VALUES
    (1,1,'38',6),
    (2,2,'20',1),
    (3,3,'80',2),
    (4,4,'100',3),
    (5,5,'50',4),
    (6,1,'39',5),
    (7,3,'80',6),
    (8,4,'65',7),
    (9,8, '1,7',1),
    (10,1,'40',4),
    (11,2,'22',7),
    (12,9,'120', 2),
    (13,10, '1.2',11),
    (14,3,'62', 12),
    (0,7,'2.0',5);
     
--Pregled.REZULTAT
INSERT INTO Pregled.REZULTAT(SIF_KARTON, SIF_PREGLED, SIF_TIPPREGLED, SIF_PARAMETAR, VREDNOST)
VALUES
    (6,1,1,1,'39.2'),
    (1,2,1,1,'39.3'),
    (2,3,1,1,'37.1'),
    (3,4,1,1,'36.8'),
    (4,5,1,1,'41.0'),
    (6,7,1,1,'38.1'),
    (7,8,1,1,'36.6'),
    (1,9,1,1,'36.9'),
    (4,10,1,1,'36.2'),
    (7,11,1,1,'39.3'),
    (2,12,1,1,'39.1'),
    (11,13,1,1,'37.7'),
    (12,14,1,1,'38.2'),
    (5,0,1,1,'38.0');
 
--Uput.UPUT
DBCC CHECKIDENT ('Uput.UPUT', RESEED, 0);
insert into Uput.UPUT (SIF_KARTON, SIF_PREGLED, SIF_INSTITUCIJE, SIF_SPECIJALIZACIJE, OPIS, VAZENJE_UPUT)
VALUES (1, 2, 2, 3, 'Slanje profesoru medicine na pregled', '04-22-2018'),
(1, 2, 3, 6, 'Slanje na pregled zuba kod stomatologa', '04-21-2018'),
(2, 12, 1, 2, 'Slanje na pregled motorickih sposobnosti deteta', '04-22-2018'),
(1, 2, 3, 6, 'Slanje na pregled zuba kod stomatologa', '04-21-2018'), 
(2, 3, 2, 3, 'Slanje profesoru medicine na pregled', '04-27-2018'),
(6, 1, 3, 6, 'Slanje na pregled zuba kod stomatologa', '04-20-2018'), 
(6, 1, 5, 9, 'Slanje na pregled motorickih sposobnosti deteta', '04-25-2018'), 
(12, 14, 5, 9, 'Slanje na pregled motorickih sposobnosti deteta', '04-26-2018'), 
(2, 3, 3, 6, 'Slanje na pregled zuba kod stomatologa', '04-26-2018'), 
(4, 5, 0, 8, 'Slanje na pregled kod otorinolaringologa', '04-23-2018')

--Uput.TRAZE_SE
insert into Uput.TRAZE_SE (SIF_UPUT, SIF_PARAMETAR)
VALUES (3, 14),
(3, 15),
(7, 15),
(8, 10),
(2, 11),
(4, 11),
(6, 11),
(9, 11),
(1, 5),
(1, 8),
(9, 12)
 
 
--Edukacija.LEKAR
insert into Edukacija.LEKAR (SIF_ZDR, BRBODOVA_LEKAR, DAT_DIPL, DAT_SPEC, VRSTA_SPEC, SIF_K_PREGLED)
VALUES (1, 7, '02-06-1994', '06-07-1998', 'pedijatar', 1),
(2, 0, '06-06-1998', '11-12-2001', 'pedijatar', 2),
(3, 10, '07-06-1995', '06-14-1998', 'pedijatar', 3),
(4, 12, '09-06-1991', '05-06-1995', 'pedijatar', 4),
(5, 10, '07-06-1988', '02-12-1991', 'otorinolaringolog', 6),
(6, 9, '08-06-1994', '01-20-1998', 'pedijatar', 5),
(7, 0, '04-06-2001', '05-30-2005', 'lekar opste prakse', 7),
(8, 0, '02-06-2010', '08-12-2013', 'pedijatar', 8),
(9, 0, '06-06-1999', '01-06-2002', 'pedijatar', 9),
(10, 4, '02-06-1977', '08-04-1980', 'pedijatar', 10),
(11, 7, '07-06-1989', '01-07-1991', 'otorinolaringolog', 11)
     
--INSERT Edukacija.MEDICINSKI_TEHNICAR
insert into Edukacija.MEDICINSKI_TEHNICAR (SIF_ZDR, BRBODOVA_MEDTEH)
VALUES (12, 0),
(13, 10),
(14, 12),
(15, 11)
 
--Edukacija.LICENCA
DBCC CHECKIDENT ('Edukacija.LICENCA', RESEED, 0);
insert into Edukacija.LICENCA (BRLICENCE, VERZIJA_LICENCA, DATUMIZDAVANJA_LICENCA, DATUMISTEKA_LICENCA, MESTOIZDAVANJA_LICENCA, SIF_ZDR)
VALUES (1, 1, '01-01-2018', '01-07-2019', 'Novi Sad', 1),
(2, 1, '06-01-2017', '07-07-2018', 'Novi Sad', 2),
(3, 1, '06-01-2017', '06-01-2019', 'Novi Sad', 3),
(4, 1, '06-01-2017', '06-01-2021', 'Novi Sad', 4),
(5, 1, '03-01-2018', '03-01-2019', 'Novi Sad', 5),
(6, 1, '04-01-2018', '04-01-2019', 'Novi Sad', 6),
(7, 1, '05-01-2017', '05-01-2020', 'Novi Sad', 7),
(8, 1, '04-01-2018', '04-01-2020', 'Novi Sad', 8),
(9, 1, '04-01-2018', '04-01-2019', 'Novi Sad', 9),
(10, 1, '03-01-2017', '03-01-2019', 'Novi Sad', 10),
(11, 1, '11-01-2017', '11-01-2019', 'Novi Sad', 11),
(12, 1, '12-01-2017', '12-01-2019', 'Novi Sad', 12),
(13, 1, '11-01-2017', '11-01-2019', 'Novi Sad', 13),
(4, 1, '03-01-2017', '03-01-2019', 'Novi Sad', 14),
(15, 1, '03-01-2018', '03-01-2019', 'Novi Sad', 0)
 
--Edukacija.EDUKACIJA
DBCC CHECKIDENT ('Edukacija.EDUKACIJA', RESEED, 0);
INSERT INTO Edukacija.EDUKACIJA(MESTO_EDU, DATUM_EDU, BRDANA_EDU, BRBODOVASLUSAOCA_EDU, BRBODOVAPREDAVACA_EDU, NAZIV_EDU, SIF_TIPEDU, SIF_INST)
VALUES
    ('Beograd','01-01-2018',1,2, 5,'Prolece medicine' ,1,1),
    ('Beograd','01-02-2018',1,5, 6,'Kongres pedijatara specijalista',2,3),
    ('Beograd','01-03-2018',1,3, 3,'Knowledge for all ' ,2,1),
    ('Beograd','01-04-2018',1,2, 6,'Audioteraphy congress 2018' ,2,2),
    ('Beograd','01-05-2018',1,2, 4,'Milenko Marin 2018' ,1,1),
    ('Beograd','01-06-2018',1,4, 6,'Vojnomedicinski kongres 1389' ,3,1),
    ('Beograd','01-07-2018',1,5, 5,'Primena IT u medicini' ,1,6),
    ('Beograd','01-08-2018',1,6, 6,'Communications for professionals' ,2,1),
    ('Beograd','01-09-2018',1,4, 4,'Razumi me 2018' ,3,1),
    ('Beograd','01-10-2018',1,4, 4,'Biram zivot 1996' ,1,1),
    ('Beograd','01-11-2018',1,3, 5,'Bojana 2000' ,4,5),
    ('Beograd','02-03-2018',1,6, 6,'Medfox c2000' ,1,1),
    ('Beograd','03-04-2018',1,3, 5,'Dr.Steve Nash Annual Meetup' ,5,1),
    ('Beograd','05-06-2018',1,5, 6,'Japanska skola medicine dr.Kuromochi' ,1,3),
    ('Beograd','07-08-2018',1,2, 5,'Dr.Dragicevic specijalisticki kongres' ,6,1);
     
--Edukacija.POHADJA
insert into Edukacija.POHADJA (SIF_EDU, SIF_ZDR, PREDAVAC)
VALUES (1, 1, 1),
(1, 2, 0),
(1, 3, 0),
(2, 4, 0),
(2, 1, 0),
(3, 5, 0),
(4, 6, 1),
(5, 7, 0),
(7, 2, 0),
(9, 8, 0),
(10, 10, 1),
(10, 5, 0)

--Davanje_vakcina.SERIJA_VAKCINE
DBCC CHECKIDENT ('Davanje_vakcina.SERIJA_VAKCINE', RESEED, 0);
insert into Davanje_vakcina.SERIJA_VAKCINE (BR_SERIJA, DATUMNABAVKE_SERIJA, ROKTRAJANJA_SERIJA, SIF_TIPVAK, SIF_PROIZ, SIF_DOB)
VALUES (4, '05-25-2017', '09-25-2019', 1, 2, 2),
(10, '05-25-2017', '09-25-2021', 2, 2, 2),
(10, '05-25-2017', '05-25-2020', 3, 2, 2),
(5, '01-21-2017', '09-21-2020', 4, 1, 3),
(3, '01-21-2017', '09-21-2019', 2, 3, 3),
(20, '01-21-2017', '09-21-2020', 1, 1, 3),
(11, '08-22-2017', '08-22-2019', 7, 1, 4),
(14, '08-22-2017', '08-22-2022', 6, 5, 4),
(13, '07-12-2017', '07-12-2019', 2, 2, 8),
(5, '07-12-2017', '07-12-2019', 1, 3, 7)

-- Davanje_vakcina.VAKCINA
DBCC CHECKIDENT ('Davanje_vakcina.VAKCINA', RESEED, 0);
insert into Davanje_vakcina.VAKCINA (KOMPLIKACIJE_VAKCINA, PRENETA, DAT_DAVANJA_VAKCINE, MESTO_APLIKACIJE, SIF_KARTON, SIF_TIPVAK, SIF_ZDR, SIF_SERIJA)
VALUES(null, 1, '02-01-2016', 'Rame', 2, 3, 4, 1),
(null, 0, '01-01-2016', 'Rame', 3, 5, 4, 2),
(null, 0, '03-01-2016', 'Rame', 5, 5, 4, 3),
(null, 0, '03-02-2016', 'Rame', 2, 1, 4, 2),
(null, 0, '03-04-2016', 'Rame', 4, 2, 1, 2),
(null, 0, '04-05-2016', 'Rame', 1, 4, 7, 4),
(null, 0, '04-05-2016', 'Rame', 6, 3, 8, 5),
(null, 0, '06-01-2016', 'Rame', 7, 9, 2, 6),
(null, 0, '07-01-2016', 'Rame', 8, 10, 11, 1),
(null, 0, '01-01-2016', 'Rame', 1, 11, 4, 2),
(null, 1, '01-02-2016', 'Rame', 10, 3, 5, 4),
(null, 1, '01-02-2016', 'Rame', 9, 1, 6, 1)




-- QUERIES
--Izlistati ime i prezime lekara, njegove bodove, specijalizaciju koju je zavrsio i pocetak i kraj svih termina koji je odradio 01.04.2018. godine
select zr.IME_ZDR + ' ' + zr.PREZIME_ZDR as 'Ime lekara', l.BRBODOVA_LEKAR as 'Bodovi', l.VRSTA_SPEC 'Specijalizacija',
t.POCETAK_TERMINA as 'Pocetak termina', t.KRAJ_TERMINA as 'Kraj termina'
from Edukacija.ZDRAVSTVENI_RADNIK zr left join Zakazivanje_pregleda.TERMIN_LEKARA tl on zr.SIF_ZDR = tl.SIF_ZDR left join
	Edukacija.LEKAR l on l.SIF_ZDR = zr.SIF_ZDR left join Zakazivanje_pregleda.TERMIN t on t.SIF_TERMIN = tl.SIF_TERMIN
where DATUM_RADNIKAL = '04-01-2018';


--Izlistati ime i prezime pacijenta, datum izvrsenog pregleda nad pacijentom, pocetak termina pregleda, kraj termina pregleda, naziv leka
--koji mu je na tom pregledu prepisan, miligramazu leka i ime i prezime lekara koji je pregled odradio na kome je prepisan lek sa sifrom 4
select k.IME_KARTON + ' ' + k.PREZIME_KARTON as 'Pacijent', p.DATUM_RADNIKAL as 'Datum', t.POCETAK_TERMINA as 'Pocetak termina', t.KRAJ_TERMINA as 'Kraj termina', 
	l.NAZIV_LEK as 'Naziv leka', l.MILIGRAMAZA_LEK as 'Miligramaza', le.IME_ZDR + ' ' + le.PREZIME_ZDR as 'Lekar'
from Otvaranje_kartona.KARTON k left join Pregled.PREGLED p on k.SIF_KARTON = p.SIF_KARTON left join Zakazivanje_pregleda.TERMIN t on t.SIF_TERMIN = p.SIF_TERMIN
	left join Usluge_i_lekovi.RECEPT r on r.SIF_PREGLED = k.SIF_KARTON left join Usluge_i_lekovi.LEK l on r.SIF_LEK = l.SIF_LEK 
	left join Edukacija.ZDRAVSTVENI_RADNIK le on le.SIF_ZDR = p.SIF_ZDR
where l.SIF_LEK = 4


--Izlistati sifru i naziv edukacije, kao i broj zdravstvenih radnika koji su tu edukaciju pohaðali
select e.SIF_EDU, e.NAZIV_EDU, count(zr.SIF_ZDR)
from Edukacija.ZDRAVSTVENI_RADNIK zr left join Edukacija.POHADJA po on zr.SIF_ZDR = po.SIF_ZDR left join Edukacija.EDUKACIJA e on e.SIF_EDU = po.SIF_EDU
group by e.SIF_EDU, e.NAZIV_EDU


--Izlistati naziv tipa vakcine koja je najèešæe izdavana pacijentima
select top 1 tv.NAZIV_TIPVAK, count(v.SIF_KARTON)
from Davanje_vakcina.VAKCINA v left join Davanje_vakcina.TIP_VAKCINE tv on tv.SIF_TIPVAK = v.SIF_TIPVAK 
	left join Davanje_vakcina.SERIJA_VAKCINE sv on sv.SIF_SERIJA = v.SIF_SERIJA
group by tv.NAZIV_TIPVAK
order by count(v.SIF_KARTON)  desc


--Izlistati datum obavljanja pregleda, poèetak i kraj termina, datum do kad uput važi i naziv parametara koji su na tom pregledu izmereni
select p.DATUM_RADNIKAL as 'Datum', t.POCETAK_TERMINA as 'Pocetak', t.KRAJ_TERMINA as 'Kraj', u.VAZENJE_UPUT as 'Vazenje uputa',
	pa.NAZIV_PARAMETAR as 'Parametar'
from Pregled.PREGLED p join Uput.UPUT u on p.SIF_PREGLED = u.SIF_PREGLED 
	join Zakazivanje_pregleda.TERMIN_LEKARA tl on tl.DATUM_RADNIKAL = p.DATUM_RADNIKAL 
	join Zakazivanje_pregleda.TERMIN t on t.SIF_TERMIN = tl.SIF_TERMIN
	join Uput.TRAZE_SE se on se.SIF_UPUT = u.SIF_UPUT
	join Pregled.PARAMETAR pa on se.SIF_PARAMETAR = pa.SIF_PARAMETAR




-- DROPS
 --##################################################################################################
--Provera postojanja tabela

--Pregled.DODATNI_PARAMETAR
if object_id('Pregled.DODATNI_PARAMETAR','U') is not null
    drop table Pregled.DODATNI_PARAMETAR
go
--Davanje_vakcina.VAKCINA
if object_id('Davanje_vakcina.VAKCINA','U') is not null
    drop table Davanje_vakcina.VAKCINA
go
 
--Davanje_vakcina.SERIJA_VAKCINE
if object_id('Davanje_vakcina.SERIJA_VAKCINE','U') is not null
    drop table Davanje_vakcina.SERIJA_VAKCINE
go

--Edukacija.POHADJA
if object_id('Edukacija.POHADJA','U') is not null
    drop table Edukacija.POHADJA
go

--Edukacija.EDUKACIJA
if object_id('Edukacija.EDUKACIJA','U') is not null
    drop table Edukacija.EDUKACIJA
go

 --Edukacija.LICENCA
if object_id('Edukacija.LICENCA','U') is not null
    drop table Edukacija.LICENCA
go
 
--Edukacija.LEKAR
if object_id('Edukacija.LEKAR','U') is not null
    drop table Edukacija.LEKAR
go
 
--Edukacija.MEDICINSKI_TEHNICAR
if object_id('Edukacija.MEDICINSKI_TEHNICAR','U') is not null
    drop table Edukacija.MEDICINSKI_TEHNICAR
go

--Uput.TRAZE_SE
if object_id('Uput.TRAZE_SE','U') is not null
    drop table Uput.TRAZE_SE
gO

--Uput.UPUT
if object_id('Uput.UPUT','U') is not null
    drop table Uput.UPUT
go

 --Pregled.REZULTAT
if object_id('Pregled.REZULTAT','U') is not null
    drop table Pregled.REZULTAT
go

--Usluge_i_lekovi.RECEPT
if object_id('Usluge_i_lekovi.RECEPT','U') is not null
    drop table Usluge_i_lekovi.RECEPT
gO

--Usluge_i_lekovi.SE_SALJE
if object_id('Usluge_i_lekovi.SE_SALJE','U') is not null
    drop table Usluge_i_lekovi.SE_SALJE
go

--Otvaranje_kartona.UTVRDJUJE_SE
if object_id('Otvaranje_kartona.UTVRDJUJE_SE','U') is not null
    drop table Otvaranje_kartona.UTVRDJUJE_SE
go
 
--Pregled.PREGLED
if object_id('Pregled.PREGLED','U') is not null
    drop table Pregled.PREGLED
go

--Zakazivanje_pregleda.TERMIN_LEKARA
if object_id('Zakazivanje_pregleda.TERMIN_LEKARA','U') is not null
    drop table Zakazivanje_pregleda.TERMIN_LEKARA
go

if OBJECT_ID('Zakazivanje_pregleda.TERMIN_LEKARA', 'U') is not null
ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
    DROP CONSTRAINT FK_Termin_lekara_Lekarev_dan
         
if OBJECT_ID('Zakazivanje_pregleda.TERMIN_LEKARA', 'U') is not null
ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
    DROP CONSTRAINT FK_Termin_lekara_Karton
             
if OBJECT_ID('Zakazivanje_pregleda.TERMIN_LEKARA', 'U') is not null
ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
    DROP CONSTRAINT FK_Termin_lekara_Termin
                 
if OBJECT_ID('Zakazivanje_pregleda.TERMIN_LEKARA', 'U') is not null
ALTER TABLE Zakazivanje_pregleda.TERMIN_LEKARA
    DROP CONSTRAINT FK_Termin_lekara_Odsustvo
                    
--Zakazivanje_pregleda.LEKAREV_DAN
if object_id('Zakazivanje_pregleda.LEKAREV_DAN','U') is not null
    drop table Zakazivanje_pregleda.LEKAREV_DAN
go

--Zakazivanje_pregleda.RADNI_KALENDAR
if object_id('Zakazivanje_pregleda.RADNI_KALENDAR','U') is not null
    drop table Zakazivanje_pregleda.RADNI_KALENDAR
go

--Otvaranje_kartona.HRONICNA_BOLEST
if object_id('Otvaranje_kartona.HRONICNA_BOLEST','U') is not null
    drop table Otvaranje_kartona.HRONICNA_BOLEST
go
 
--Otvaranje_kartona.RIZIK_I_ALERGIJA
if object_id('Otvaranje_kartona.RIZIK_I_ALERGIJA','U') is not null
    drop table Otvaranje_kartona.RIZIK_I_ALERGIJA
go

--Otvaranje_kartona.ODGOVORAN
if object_id('Otvaranje_kartona.ODGOVORAN','U') is not null
    drop table Otvaranje_kartona.ODGOVORAN
go

--Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
if object_id('Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR','U') is not null
    drop table Otvaranje_kartona.ARHIVIRAN_IZABRANI_LEKAR
go

--Otvaranje_kartona.KARTON
if object_id('Otvaranje_kartona.KARTON','U') is not null
    drop table Otvaranje_kartona.KARTON
go

--Pregled.MERI
if object_id('Pregled.MERI','U') is not null
    drop table Pregled.MERI
go

--Zakazivanje_pregleda.SMENA
if object_id('Zakazivanje_pregleda.SMENA','U') is not null
    drop table Zakazivanje_pregleda.SMENA
go
 
--Zakazivanje_pregleda.ODSUSTVO
if object_id('Zakazivanje_pregleda.ODSUSTVO','U') is not null
    drop table Zakazivanje_pregleda.ODSUSTVO
go
 
--Zakazivanje_pregleda.TERMIN
if object_id('Zakazivanje_pregleda.TERMIN','U') is not null
    drop table Zakazivanje_pregleda.TERMIN
go

--Zakazivanje_pregleda.VRSTA_DANA
if object_id('Zakazivanje_pregleda.VRSTA_DANA','U') is not null
    drop table Zakazivanje_pregleda.VRSTA_DANA
go

--Davanje_vakcina.PROIZVODJAC
if object_id('Davanje_vakcina.PROIZVODJAC','U') is not null
    drop table Davanje_vakcina.PROIZVODJAC
go
 
--Davanje_vakcina.DOBAVLJAC
if object_id('Davanje_vakcina.DOBAVLJAC','U') is not null
    drop table Davanje_vakcina.DOBAVLJAC
go

--Davanje_vakcina.TIP_VAKCINE
if object_id('Davanje_vakcina.TIP_VAKCINE','U') is not null
    drop table Davanje_vakcina.TIP_VAKCINE
go

--Edukacija.INSTITUCIJA
if object_id('Edukacija.INSTITUCIJA','U') is not null
    drop table Edukacija.INSTITUCIJA
go

--Edukacija.TIP_EDUKACIJE
if object_id('Edukacija.TIP_EDUKACIJE','U') is not null
    drop table Edukacija.TIP_EDUKACIJE
go

--Edukacija.ZDRAVSTVENI_RADNIK
if object_id('Edukacija.ZDRAVSTVENI_RADNIK','U') is not null
	drop table Edukacija.ZDRAVSTVENI_RADNIK
go

--Uput.SIFARNIK_SPECIJALIZACIJE
if object_id('Uput.SIFARNIK_SPECIJALIZACIJE','U') is not null
    drop table Uput.SIFARNIK_SPECIJALIZACIJE
go
 
--Uput.SIFARNIK_INSTITUCIJE
if object_id('Uput.SIFARNIK_INSTITUCIJE','U') is not null
    drop table Uput.SIFARNIK_INSTITUCIJE
go

--Pregled.TIP_PREGLEDA
if object_id('Pregled.TIP_PREGLEDA','U') is not null
    drop table Pregled.TIP_PREGLEDA
go

--Pregled.PARAMETAR
if object_id('Pregled.PARAMETAR','U') is not null
    drop table Pregled.PARAMETAR
go

--Usluge_i_lekovi.LEK
if object_id('Usluge_i_lekovi.LEK','U') is not null
    drop table Usluge_i_lekovi.LEK
go

--Usluge_i_lekovi.USLUGA
if object_id('Usluge_i_lekovi.USLUGA','U') is not null
    drop table Usluge_i_lekovi.USLUGA
go

--Pregled.KNJIGA_PREGLEDA
if object_id('Pregled.KNJIGA_PREGLEDA','U') is not null
    drop table Pregled.KNJIGA_PREGLEDA
go

--Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST
if object_id('Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST','U') is not null
    drop table Otvaranje_kartona.DIJAGNOSTIKOVANA_BOLEST
go

--Otvaranje_kartona.ULOGA
if object_id('Otvaranje_kartona.ULOGA','U') is not null
    drop table Otvaranje_kartona.ULOGA
go
 
--Otvaranje_kartona.STARATELJ
if object_id('Otvaranje_kartona.STARATELJ','U') is not null
    drop table Otvaranje_kartona.STARATELJ
go

 

 

 --###############################################################################
 --DROP SEKVENCE
 IF OBJECT_ID('Otvaranje_kartona.ULOGA_SEQ') IS NOT NULL
	DROP SEQUENCE Otvaranje_kartona.ULOGA_SEQ
GO





 
--################################################################################
--PROVERA POSTOJANJA SCHEMA
if schema_id('Otvaranje_kartona') is not null
	drop schema Otvaranje_kartona;
go

if schema_id('Zakazivanje_pregleda') is not null
	drop schema Zakazivanje_pregleda;
go

if schema_id('Pregled') is not null
	drop schema Pregled;
go

if schema_id('Usluge_i_lekovi') is not null
	drop schema Usluge_i_lekovi;
go

if schema_id('Uput') is not null
	drop schema Uput;
go

if schema_id('Davanje_vakcina') is not null
	drop schema Davanje_vakcina;
go

if schema_id('Edukacija') is not null
	drop schema Edukacija;
go

if schema_id('Bolovanje') is not null
	drop schema Bolovanje;
go