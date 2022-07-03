/*Ospedale*/
CREATE TABLE Ospedale(
    Nome VARCHAR(20) PRIMARY KEY,
    Codice SERIAL UNIQUE NOT NULL,
    Via VARCHAR(30) NOT NULL,
    Citta VARCHAR(20) NOT NULL,
    CAP NUMERIC(5) NOT NULL
);

INSERT INTO Ospedale VALUES('Papa Giovanni XXIII', DEFAULT, 'Via Cadorna', 'Bergamo', 24100);
INSERT INTO Ospedale VALUES('Ospedale dei bambini', DEFAULT, 'Via Di Vittorio', 'Brescia', 25121);
INSERT INTO Ospedale VALUES('Ospedale Oglio Po', DEFAULT, 'Via Dante', 'Casalmaggiore', 26041);
INSERT INTO Ospedale VALUES('Ospedale Valduce', DEFAULT, 'Via Gesu', 'Como', 22100);
INSERT INTO Ospedale VALUES('Ospedale di Cremona', DEFAULT, 'Via Dandolo', 'Cremona', 26100);
INSERT INTO Ospedale VALUES('Anni Azzurri', DEFAULT, 'Via Dante', 'Opera', 20073);
INSERT INTO Ospedale VALUES('San Raffaele', DEFAULT, 'Via Venezian', 'Milano', 20019);
INSERT INTO Ospedale VALUES('San Carlo Borromeo', DEFAULT, 'Via Bartolomeo', 'Milano', 20019);
INSERT INTO Ospedale VALUES('Fatebenefratelli', DEFAULT, 'Via Turri', 'Milano', 20019);
INSERT INTO Ospedale VALUES('Humanitas', DEFAULT, 'Via Carducci', 'Rozzano', 20089);
INSERT INTO Ospedale VALUES('Monzino', DEFAULT, 'Via Cadorna', 'Milano', 24100);

/* Personale */
CREATE TABLE Personale(
CF VARCHAR(16) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Cognome VARCHAR(20) NOT NULL,
DataN date NOT NULL
);

INSERT INTO Personale VALUES('AAAAAAAAAAAAAAAA', 'Gabriele', 'Biffi', '1987-03-23');
INSERT INTO Personale VALUES('BBBBBBBBBBBBBBBB', 'Sara', 'Cicci', '1967-09-12');
INSERT INTO Personale VALUES('CCCCCCCCCCCCCCCC', 'Filippo', 'Camerieri', '2002-12-02');
INSERT INTO Personale VALUES('DDDDDDDDDDDDDDDD', 'Fabiana', 'Biffi', '1935-11-11');
INSERT INTO Personale VALUES('EEEEEEEEEEEEEEEE', 'Giorgia', 'Vinicius', '2015-08-17');
INSERT INTO Personale VALUES('FFFFFFFFFFFFFFFF', 'Pino', 'Daniele', '1987-03-23');
INSERT INTO Personale VALUES('GGGGGGGGGGGGGGGG', 'Filippa', 'Postrillo', '1964-09-02');
INSERT INTO Personale VALUES('HHHHHHHHHHHHHHHH', 'Valentina', 'Russo', '1999-07-16');
INSERT INTO Personale VALUES('IIIIIIIIIIIIIIII', 'Fabiana', 'Biffi', '1935-11-11');
INSERT INTO Personale VALUES('LLLLLLLLLLLLLLLL', 'Francesco', 'Cangemi', '2000-10-05');
INSERT INTO Personale VALUES('MMMMMMMMMMMMMMMM', 'Gabriele', 'Ricci', '1973-03-23');
INSERT INTO Personale VALUES('NNNNNNNNNNNNNNNN', 'Vincenzo', 'Mollica', '1985-05-29');
INSERT INTO Personale VALUES('OOOOOOOOOOOOOOOO', 'Filippo', 'Giardina', '2001-03-02');
INSERT INTO Personale VALUES('PPPPPPPPPPPPPPPP', 'Samuele', 'Silva', '1982-11-11');
INSERT INTO Personale VALUES('QQQQQQQQQQQQQQQQ', 'Alice', 'Biffi', '1993-10-26');

/* Esame */
CREATE TABLE Esame(
Nome VARCHAR(20)PRIMARY KEY,
Codice SERIAL UNIQUE NOT NULL,
Costo INTEGER NOT NULL,
Descrizione TEXT NOT NULL
);

INSERT INTO Esame VALUES('Lastra', DEFAULT,  50, 'Descirizone per il primo esame');
INSERT INTO Esame VALUES('Prelievo', DEFAULT,  50, 'Descirizone per il secondo esame');
INSERT INTO Esame VALUES('Esame Oculistico', DEFAULT, 100, 'Descirizone per il terzo esame');
INSERT INTO Esame VALUES('Tampone Covid', DEFAULT, 20, 'Descirizone per il quarto esame');
INSERT INTO Esame VALUES('Crociato', DEFAULT, 500, 'Descirizone per il quinto esame');

/* Laboratorio */
CREATE TABLE Laboratorio(
Codice SERIAL PRIMARY KEY
);

INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);
INSERT INTO Laboratorio VALUES(DEFAULT);


/* Paziente */
CREATE TABLE Paziente(
TesseraSanitaria NUMERIC(5) PRIMARY KEY,
Nome VARCHAR(20) NOT NULL,
Cognome VARCHAR(20) NOT NULL,
CF VARCHAR(16) NOT NULL,
DataN date NOT NULL
);

INSERT INTO Paziente VALUES(11111, 'Simone', 'Petta', 'ZZZZZZZZZZZZZZZZ', '1998-06-24');
INSERT INTO Paziente VALUES(22222, 'Samuele', 'Petta','YYYYYYYYYYYYYYYY', '1965-11-04');
INSERT INTO Paziente VALUES(33333, 'Francesco', 'Piso','XXXXXXXXXXXXXXXX', '1965-11-04');
INSERT INTO Paziente VALUES(44444, 'Giuliana', 'Biffi','VVVVVVVVVVVVVVVV', '1968-07-21');
INSERT INTO Paziente VALUES(55555, 'Eleonora', 'Lanzi','UUUUUUUUUUUUUUUU', '1876-10-26');


/* Reparto */
CREATE TABLE Reparto(
Nome VARCHAR(20),
Ospedale VARCHAR(20) REFERENCES Ospedale(Nome)  ON DELETE SET NULL ON UPDATE CASCADE,
Telefono NUMERIC(10) UNIQUE NOT NULL,
oraVisitaInizio time,
oraVisitaFine time CHECK (oraVisitaFine > oraVisitaInizio),
PRIMARY KEY(Nome, Ospedale)
);

INSERT INTO Reparto VALUES('Cardiologia', 'Humanitas', 0257605732, '15:00', '18:00');
INSERT INTO Reparto VALUES('Radiologia', 'Humanitas', 0257605735);
INSERT INTO Reparto VALUES('Anestesia', 'Humanitas', 0257605736);
INSERT INTO Reparto VALUES('Chirurgia Toracica', 'Humanitas', 0257605737);
INSERT INTO Reparto VALUES('Pediatria', 'Humanitas', 0257605738, '10:00', '21:00');
INSERT INTO Reparto VALUES('Cardiologia', 'Fatebenefratelli', 0257605742, '15:00', '18:00');
INSERT INTO Reparto VALUES('Radiologia', 'Fatebenefratelli', 0257605745);
INSERT INTO Reparto VALUES('Anestesia', 'Fatebenefratelli', 0257605746);
INSERT INTO Reparto VALUES('Chirurgia Toracica', 'Fatebenefratelli', 0257605747);
INSERT INTO Reparto VALUES('Pediatria', 'Fatebenefratelli', 0257605748, '13:00', '20:00');
INSERT INTO Reparto VALUES('Cardiologia', 'Ospedale Valduce', 0257605752, '15:00', '18:00');
INSERT INTO Reparto VALUES('Radiologia', 'Ospedale Valduce', 0257605755);
INSERT INTO Reparto VALUES('Anestesia', 'Ospedale Valduce', 0257605756);
INSERT INTO Reparto VALUES('Chirurgia Toracica', 'Ospedale Valduce', 0257605757);
INSERT INTO Reparto VALUES('Pediatria', 'Ospedale Valduce', 0257605758, '10:00', '21:00');



/* Sala operatoria */
CREATE TABLE SalaOperatoria(
Codice SERIAL PRIMARY KEY,
Reparto VARCHAR(29) NOT NULL,
Ospedale VARCHAR(20) NOT NULL,
FOREIGN KEY(Reparto, Ospedale) REFERENCES Reparto(Nome, Ospedale) ON DELETE SET NULL ON UPDATE CASCADE 
);

INSERT INTO SalaOperatoria VALUES(DEFAULT, 'Cardiologia', 'Humanitas');
INSERT INTO SalaOperatoria VALUES(DEFAULT, 'Anestesia', 'Humanitas');
INSERT INTO SalaOperatoria VALUES(DEFAULT, 'Cardiologia', 'Fatebenefratelli');
INSERT INTO SalaOperatoria VALUES(DEFAULT, 'Anestesia', 'Fatebenefratelli');
INSERT INTO SalaOperatoria VALUES(DEFAULT, 'Cardiologia', 'Ospedale Valduce');
INSERT INTO SalaOperatoria VALUES(DEFAULT, 'Anestesia', 'Ospedale Valduce');

/* Stanza, nell'inserimento mettere il controllo che il piano dev'essere uguale per reparto ed ospedale */
CREATE TABLE Stanza(
Codice SERIAL PRIMARY KEY,
Piano NUMERIC(2) NOT NULL,
Reparto VARCHAR(29),
Ospedale VARCHAR(20),
FOREIGN KEY(Reparto, Ospedale) REFERENCES Reparto(Nome, Ospedale) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO Stanza VALUES(DEFAULT, 1, 'Cardiologia', 'Humanitas');
INSERT INTO Stanza VALUES(DEFAULT, 5, 'Chirurgia Toracica', 'Humanitas');
INSERT INTO Stanza VALUES(DEFAULT, 1, 'Cardiologia', 'Humanitas');
INSERT INTO Stanza VALUES(DEFAULT, 5, 'Chirurgia Toracica', 'Humanitas');
INSERT INTO Stanza VALUES(DEFAULT, 1, 'Cardiologia', 'Humanitas');
INSERT INTO Stanza VALUES(DEFAULT, 5, 'Chirurgia Toracica', 'Humanitas');
INSERT INTO Stanza VALUES(DEFAULT, 7, 'Pediatria', 'Fatebenefratelli');
INSERT INTO Stanza VALUES(DEFAULT, 7, 'Pediatria', 'Fatebenefratelli');
INSERT INTO Stanza VALUES(DEFAULT, 10, 'Radiologia', 'Fatebenefratelli');
INSERT INTO Stanza VALUES(DEFAULT, 10, 'Radiologia', 'Fatebenefratelli');

/* Letto */
CREATE TABLE Letto(
Codice SERIAL PRIMARY KEY,
Stato Boolean DEFAULT FALSE NOT NULL,
Stanza INTEGER REFERENCES Stanza(codice) ON DELETE SET NULL ON UPDATE CASCADE NOT NULL
);

INSERT INTO Letto VALUES(DEFAULT, true, 1);
INSERT INTO Letto VALUES(DEFAULT, true, 2);
INSERT INTO Letto VALUES(DEFAULT, FALSE, 1);
INSERT INTO Letto VALUES(DEFAULT, true, 2);
INSERT INTO Letto VALUES(DEFAULT, true, 2);
INSERT INTO Letto VALUES(DEFAULT, true, 2);
INSERT INTO Letto VALUES(DEFAULT, true, 6);
INSERT INTO Letto VALUES(DEFAULT, true, 6);

/* Vincolo della generalizzazione TE, non posso fare più lavori nell'ospedale */
/* Infermieri */
CREATE TABLE Infermieri(
CF VARCHAR(16) REFERENCES Personale(CF) ON DELETE SET NULL ON UPDATE CASCADE,
PRIMARY KEY(CF)
);

INSERT INTO Infermieri VALUES('AAAAAAAAAAAAAAAA');
INSERT INTO Infermieri VALUES('BBBBBBBBBBBBBBBB');

/* pAmm */
CREATE TABLE pAmm(
CF VARCHAR(16) REFERENCES Personale(CF) ON DELETE SET NULL ON UPDATE CASCADE,
PRIMARY KEY(CF)
);

INSERT INTO pAmm VALUES('CCCCCCCCCCCCCCCC');
INSERT INTO pAmm VALUES('DDDDDDDDDDDDDDDD');

/* PMedico */
CREATE TABLE pMedico(
CF VARCHAR(16) REFERENCES Personale(CF) ON DELETE SET NULL ON UPDATE CASCADE,
PRIMARY KEY(CF)
);

INSERT INTO pMedico VALUES('EEEEEEEEEEEEEEEE');
INSERT INTO pMedico VALUES('FFFFFFFFFFFFFFFF');
INSERT INTO pMedico VALUES('GGGGGGGGGGGGGGGG');
INSERT INTO pMedico VALUES('HHHHHHHHHHHHHHHH');
INSERT INTO pMedico VALUES('IIIIIIIIIIIIIIII');
INSERT INTO pMedico VALUES('LLLLLLLLLLLLLLLL');
INSERT INTO pMedico VALUES('MMMMMMMMMMMMMMMM');
INSERT INTO pMedico VALUES('NNNNNNNNNNNNNNNN');
INSERT INTO pMedico VALUES('OOOOOOOOOOOOOOOO');
INSERT INTO pMedico VALUES('PPPPPPPPPPPPPPPP');
INSERT INTO pMedico VALUES('QQQQQQQQQQQQQQQQ');

/*Nell'inserimento controllare che la data dell'incarico dev'essere maggiore della data di nascita*/
/* VicePrimario */
CREATE TABLE VicePrimario(
CF VARCHAR(16) REFERENCES pMedico(CF) ON DELETE SET NULL ON UPDATE CASCADE,
DataIncarico date NOT NULL CHECK (DataIncarico <= CURRENT_DATE),
PRIMARY KEY(CF)
);

INSERT INTO VicePrimario VALUES('EEEEEEEEEEEEEEEE', '2001-10-07');
INSERT INTO VicePrimario VALUES('FFFFFFFFFFFFFFFF', '1999-01-01');
INSERT INTO VicePrimario VALUES('GGGGGGGGGGGGGGGG', '2010-07-07');
INSERT INTO VicePrimario VALUES('HHHHHHHHHHHHHHHH', '2018-10-07');
INSERT INTO VicePrimario VALUES('IIIIIIIIIIIIIIII', '2007-08-26');
INSERT INTO VicePrimario VALUES('LLLLLLLLLLLLLLLL', '2020-02-18');
INSERT INTO VicePrimario VALUES('MMMMMMMMMMMMMMMM', '2020-10-07');

/* Primario */
CREATE TABLE Primario(
CF VARCHAR(16) REFERENCES pMedico(CF) ON DELETE SET NULL ON UPDATE CASCADE,
Reparto VARCHAR(29) NOT NULL,
Ospedale VARCHAR(20) NOT NULL,
FOREIGN KEY(Reparto, Ospedale) REFERENCES Reparto(Nome, Ospedale) ON DELETE SET NULL ON UPDATE CASCADE,
UNIQUE(Reparto, Ospedale),
PRIMARY KEY(CF)
);

INSERT INTO Primario VALUES('NNNNNNNNNNNNNNNN', 'Cardiologia', 'Humanitas');
INSERT INTO Primario VALUES('OOOOOOOOOOOOOOOO', 'Anestesia', 'Fatebenefratelli');
INSERT INTO Primario VALUES('PPPPPPPPPPPPPPPP', 'Radiologia', 'Ospedale Valduce');
INSERT INTO Primario VALUES('QQQQQQQQQQQQQQQQ', 'Anestesia', 'Humanitas');

/* SpecPrimario */
CREATE TABLE Specializzazione(
Primario VARCHAR(16) REFERENCES Primario(CF) ON DELETE SET NULL ON UPDATE CASCADE,
Spec VARCHAR(20) NOT NULL UNIQUE,
PRIMARY KEY(Primario, Spec)
);

INSERT INTO Specializzazione VALUES('NNNNNNNNNNNNNNNN', 'Neurochirurgia');
INSERT INTO Specializzazione VALUES('NNNNNNNNNNNNNNNN', 'Torace');
INSERT INTO Specializzazione VALUES('OOOOOOOOOOOOOOOO', 'Oncologia');
INSERT INTO Specializzazione VALUES('OOOOOOOOOOOOOOOO', 'Medicina interna');
INSERT INTO Specializzazione VALUES('PPPPPPPPPPPPPPPP', 'Allergologia');
INSERT INTO Specializzazione VALUES('QQQQQQQQQQQQQQQQ', 'Medicina Termale');

/*Verificare che la data di inizio sostituzione sia minore della data in cui il viceprimario ha assunto l'incarico.
Togliere la data di fine sostituzione dalla chiave primaria, tanto non serve*/
/* Sostituzione */
CREATE TABLE Sostituzione(
Primario VARCHAR(16) REFERENCES Primario(CF) ON DELETE SET NULL ON UPDATE CASCADE,
VicePrimario VARCHAR(16) REFERENCES VicePrimario(CF)  ON DELETE SET NULL ON UPDATE CASCADE,
DataInizio date NOT NULL DEFAULT CURRENT_DATE,
DataFine date NOT NULL CHECK(DataFine >= DataInizio),
PRIMARY KEY (Primario, VicePrimario, DataInizio)
);

INSERT INTO Sostituzione VALUES('NNNNNNNNNNNNNNNN', 'EEEEEEEEEEEEEEEE', '2020-07-01', '2020-07-15');
INSERT INTO Sostituzione VALUES('NNNNNNNNNNNNNNNN', 'EEEEEEEEEEEEEEEE', '2000-08-10', '2000-08-20');
INSERT INTO Sostituzione VALUES('OOOOOOOOOOOOOOOO', 'FFFFFFFFFFFFFFFF', '2010-11-20', '2011-01-26');
INSERT INTO Sostituzione VALUES('OOOOOOOOOOOOOOOO', 'FFFFFFFFFFFFFFFF', '2020-07-01', '2020-07-15');
INSERT INTO Sostituzione VALUES('NNNNNNNNNNNNNNNN', 'EEEEEEEEEEEEEEEE', '2005-07-01', '2005-07-15');
INSERT INTO Sostituzione VALUES('PPPPPPPPPPPPPPPP', 'GGGGGGGGGGGGGGGG', '2020-07-01', '2020-07-15');
INSERT INTO Sostituzione VALUES('QQQQQQQQQQQQQQQQ', 'HHHHHHHHHHHHHHHH', '2020-07-01', '2020-07-15');

/* Pronto Soccorso */
CREATE TABLE PS(
Codice SERIAL UNIQUE NOT NULL,
Ospedale VARCHAR(20) REFERENCES Ospedale(Nome)  ON DELETE SET NULL ON UPDATE CASCADE,
UNIQUE(Codice, Ospedale),
PRIMARY KEY(Codice)
);

INSERT INTO PS VALUES(DEFAULT, 'Humanitas');
INSERT INTO PS VALUES(DEFAULT, 'Monzino');
INSERT INTO PS VALUES(DEFAULT, 'San Raffaele');

/* Turno */
CREATE TABLE Turno(
Codice SERIAL PRIMARY KEY,
DataT date NOT NULL,
oraInizioT time NOT NULL,
oraFineT time NOT NULL CHECK(oraFIneT > oraInizioT),
Personale VARCHAR(16) REFERENCES Personale (CF) ON DELETE SET NULL ON UPDATE CASCADE NOT NULL,
PS INTEGER NOT NULL,
Ospedale VARCHAR(20) NOT NULL,
FOREIGN KEY(PS, Ospedale) REFERENCES PS(Codice, Ospedale) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO Turno VALUES(DEFAULT, '2022-01-01', '10:30:00', '18:00:00', 'AAAAAAAAAAAAAAAA', 1, 'Humanitas');
INSERT INTO Turno VALUES(DEFAULT, '2022-01-01', '10:30:00', '18:00:00', 'NNNNNNNNNNNNNNNN', 1, 'Humanitas');
INSERT INTO Turno VALUES(DEFAULT, '2022-01-01', '10:30:00', '18:00:00', 'LLLLLLLLLLLLLLLL', 1, 'Humanitas');
INSERT INTO Turno VALUES(DEFAULT, '2022-10-10', '06:30:00', '15:00:00', 'EEEEEEEEEEEEEEEE', 2, 'Monzino');
INSERT INTO Turno VALUES(DEFAULT, '2022-10-10', '09:30:00', '18:00:00', 'NNNNNNNNNNNNNNNN', 2, 'Monzino');
INSERT INTO Turno VALUES (DEFAULT, '2022-10-10', '15:30:00', '24:00:00', 'LLLLLLLLLLLLLLLL', 2, 'Monzino');

/* Interno */
CREATE TABLE Interno(
    Codice INTEGER REFERENCES Laboratorio(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
    Stanza INTEGER REFERENCES Stanza(Codice) ON DELETE SET NULL ON UPDATE CASCADE NOT NULL,
    PRIMARY KEY(Codice)
);

INSERT INTO Interno VALUES(1, 6);
INSERT INTO Interno VALUES(2, 9);
INSERT INTO Interno VALUES(6, 1);
INSERT INTO Interno VALUES(7, 2);
INSERT INTO Interno VALUES(8, 3);

/* Esterno */
CREATE TABLE Esterno(
    Codice INTEGER REFERENCES Laboratorio(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
    Telefono NUMERIC(10) NOT NULL UNIQUE,
    Apertura time NOT NULL,
    Via VARCHAR(20) NOT NULL,
    Citta VARCHAR(20) NOT NULL,
    CAP VARCHAR(5) NOT NULL,
    PRIMARY KEY(Codice)
);

INSERT INTO Esterno VALUES(3, 1234567856, '07:45:00', 'Via Orefici', 'Monza', 12345);
INSERT INTO Esterno VALUES(4, 1234531244, '08:30:00', 'Via Dante', 'Rozzano', 45693);
INSERT INTO Esterno VALUES(5, 2355732973, '07:30:00', 'Via Cadorna', 'Milano', 34510);
INSERT INTO Esterno VALUES(9, 1234567890, '09:00:00', 'Via Giovanni', 'Milano', 20098);
INSERT INTO Esterno VALUES(10, 1234567899, '07:30:00', 'Via Hornet', 'Pavia', 20075);

/*Nell'inserimento controllare che esame e laboratorio compaiano anche in Esegue*/
/* Prenotazione */
CREATE TABLE Prenotazione (
    Codice SERIAL PRIMARY KEY,
    DataEsame date,
	Laboratorio INTEGER,
    Esame VARCHAR(20),
    Paziente NUMERIC(5) REFERENCES Paziente(TesseraSanitaria) ON DELETE SET NULL ON UPDATE CASCADE,
    Urgenza VARCHAR(6) NOT NULL,
    Regime VARCHAR(20) NOT NULL,
    DataPrenotazione date NOT NULL CHECK(DataPrenotazione < DataEsame),
	FOREIGN KEY(Laboratorio) REFERENCES Laboratorio(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(Esame) REFERENCES Esame(Nome) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE (DataEsame, Esame, Laboratorio, Paziente)
);

INSERT INTO Prenotazione VALUES(DEFAULT, '2022-09-01',1, 'Lastra',  11111, 'verde', 'sanitaria', '2021-12-07');
INSERT INTO Prenotazione VALUES(DEFAULT, '2012-09-01',1, 'Crociato' , 11111, 'verde', 'privato', '2012-05-07');
INSERT INTO Prenotazione VALUES(DEFAULT, '2009-03-23',5, 'Prelievo', 11111, 'rosso', 'privato', '2009-01-07');
INSERT INTO Prenotazione VALUES(DEFAULT, '2007-11-11', 3, 'Esame Oculistico' , 22222, 'giallo', 'sanitaria', '2005-12-07');
INSERT INTO Prenotazione VALUES(DEFAULT, '1998-05-29', 4, 'Tampone Covid',  33333, 'verde', 'privato', '1998-03-07');
INSERT INTO Prenotazione VALUES(DEFAULT, '2009-03-23', 5,'Prelievo',  22222, 'rosso', 'privato', '2009-01-07');


/* Esame Specialistico */
CREATE TABLE EsameSpec(
    Esame VARCHAR(20) PRIMARY KEY REFERENCES Esame(Nome) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO EsameSpec VALUES('Crociato');
INSERT INTO EsameSpec VALUES('Esame Oculistico');

/* Avvertenza */
CREATE TABLE Avvertenza(
    Esame VARCHAR(20) REFERENCES EsameSpec(Esame) ON DELETE SET NULL ON UPDATE CASCADE,
    Testo TEXT NOT NULL,
    PRIMARY KEY(Esame, Testo)
);

INSERT INTO Avvertenza VALUES('Crociato', 'Presentarsi a digiuno');
INSERT INTO Avvertenza VALUES('Esame Oculistico', 'Scrivo avvertenza per esame 3');

/*Prescrizione*/
CREATE TABLE Prescrizione(
    Codice SERIAL PRIMARY KEY,
    DataPresc DATE NOT NULL,
    EsameSpec VARCHAR(20) REFERENCES EsameSpec(Esame) ON DELETE SET NULL ON UPDATE CASCADE,
    Medico VARCHAR(16) REFERENCES pMedico(CF) ON DELETE SET NULL ON UPDATE CASCADE,
    Paziente NUMERIC(5) REFERENCES Paziente(TesseraSanitaria) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE(DataPresc, EsameSpec, Medico, Paziente)
);

INSERT INTO Prescrizione VALUES(DEFAULT, '2022-02-14', 'Crociato', 'MMMMMMMMMMMMMMMM', 11111);
INSERT INTO Prescrizione VALUES(DEFAULT, '2020-01-25', 'Esame Oculistico', 'NNNNNNNNNNNNNNNN', 22222);

/* Ricovero, data e paziente unique */
CREATE TABLE Ricovero(
    Codice SERIAL PRIMARY KEY,
    DataR date UNIQUE NOT NULL,
    Letto INTEGER REFERENCES Letto(Codice) ON DELETE SET NULL ON UPDATE CASCADE NOT NULL,
    Paziente NUMERIC(5) NOT NULL,
    UNIQUE(DataR, Letto, Paziente)
);

INSERT INTO Ricovero VALUES(1, '2022-09-01', 1, 11111);
INSERT INTO Ricovero VALUES(2, '2019-08-23', 6, 22222);
INSERT INTO Ricovero VALUES(3, '2018-09-01', 5, 33333);

/* Patologia */
CREATE TABLE Patologia(
Ricovero INTEGER REFERENCES Ricovero(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
Patologia VARCHAR(20) NOT NULL,
PRIMARY KEY(Ricovero, Patologia)
);

INSERT INTO Patologia VALUES(1, 'trombosi');
INSERT INTO Patologia VALUES(1, 'scogliosi');
INSERT INTO Patologia VALUES(2, 'acufene');
INSERT INTO Patologia VALUES(3, 'infarto');

/* Dimissione */
CREATE TABLE Dimissione(
    Codice SERIAL PRIMARY KEY,
    DataD date,
    Letto INTEGER REFERENCES Letto(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
    Paziente NUMERIC(5) REFERENCES Paziente(TesseraSanitaria),
    UNIQUE(DataD, Letto, Paziente)
);

INSERT INTO Dimissione VALUES(1, '2018-09-15', 1, 11111);

/* Usa*/ 
CREATE TABLE Usa(
    LabEsterno INTEGER REFERENCES Esterno(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
    Ospedale VARCHAR(20) REFERENCES Ospedale(Nome) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY(LabEsterno, Ospedale)
);



/* Lavora */
CREATE TABLE Lavora(
    Personale VARCHAR(16) REFERENCES Personale(CF) ON DELETE SET NULL ON UPDATE CASCADE,
    Reparto VARCHAR(20) NOT NULL,
	Ospedale VARCHAR(20) NOT NULL,
	FOREIGN KEY(Reparto, Ospedale) REFERENCES Reparto(Nome, Ospedale) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY(Personale, Reparto, Ospedale)
);

INSERT INTO Lavora VALUES('AAAAAAAAAAAAAAAA', 'Cardiologia', 'Humanitas');
INSERT INTO Lavora VALUES('BBBBBBBBBBBBBBBB','Pediatria', 'Humanitas');
INSERT INTO Lavora VALUES('CCCCCCCCCCCCCCCC', 'Radiologia', 'Humanitas');
INSERT INTO Lavora VALUES('DDDDDDDDDDDDDDDD', 'Cardiologia', 'Humanitas');
INSERT INTO Lavora VALUES('EEEEEEEEEEEEEEEE', 'Cardiologia', 'Humanitas');
INSERT INTO Lavora VALUES('FFFFFFFFFFFFFFFF','Pediatria', 'Fatebenefratelli');
INSERT INTO Lavora VALUES('GGGGGGGGGGGGGGGG', 'Radiologia', 'Fatebenefratelli');
INSERT INTO Lavora VALUES('HHHHHHHHHHHHHHHH', 'Cardiologia', 'Fatebenefratelli');
INSERT INTO Lavora VALUES('IIIIIIIIIIIIIIII', 'Cardiologia', 'Fatebenefratelli');
INSERT INTO Lavora VALUES('LLLLLLLLLLLLLLLL','Pediatria', 'Fatebenefratelli');
INSERT INTO Lavora VALUES('MMMMMMMMMMMMMMMM', 'Radiologia', 'Fatebenefratelli');
INSERT INTO Lavora VALUES('NNNNNNNNNNNNNNNN', 'Cardiologia', 'Ospedale Valduce');
INSERT INTO Lavora VALUES('OOOOOOOOOOOOOOOO', 'Cardiologia', 'Ospedale Valduce');
INSERT INTO Lavora VALUES('PPPPPPPPPPPPPPPP','Pediatria', 'Ospedale Valduce');
INSERT INTO Lavora VALUES('QQQQQQQQQQQQQQQQ', 'Radiologia', 'Ospedale Valduce');

CREATE TABLE Esegue(
    Laboratorio INTEGER REFERENCES Laboratorio(Codice) ON DELETE SET NULL ON UPDATE CASCADE,
    Esame VARCHAR(20) REFERENCES Esame(Nome) ON DELETE SET NULL ON UPDATE CASCADE,
    PRIMARY KEY(Laboratorio, Esame)
);

INSERT INTO Esegue VALUES(1, 'Lastra');
INSERT INTO Esegue VALUES(1, 'Crociato');
INSERT INTO Esegue VALUES(2, 'Tampone Covid');
INSERT INTO Esegue VALUES(3, 'Lastra');
INSERT INTO Esegue VALUES(3, 'Esame Oculistico');
INSERT INTO Esegue VALUES(2, 'Prelievo');
INSERT INTO Esegue VALUES(4, 'Prelievo');
INSERT INTO Esegue VALUES(4, 'Tampone Covid');
INSERT INTO Esegue VALUES(5, 'Prelievo');