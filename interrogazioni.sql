/*Determinare i vice primari che hanno sostituito esattamente una volta il proprio primario*/
SELECT s.vicePrimario, p.nome, p.cognome
FROM Sostituzione s JOIN personale p ON s.vicePrimario LIKE p.CF
GROUP BY s.vicePrimario, p.nome, p.cognome
HAVING COUNT(*) = 1;

/*Determinare i vice primari che hanno sostituito almeno due volte il proprio primario*/
SELECT s.vicePrimario, p.nome, p.cognome
FROM Sostituzione s JOIN personale p ON s.vicePrimario LIKE p.CF
GROUP BY s.vicePrimario, p.nome, p.cognome
HAVING COUNT(*) >= 2;

/*Determinare i vice primari che non hanno mai sostituito il proprio primario*/
SELECT CF, Nome, Cognome
FROM vicePrimario NATURAL JOIN Personale
EXCEPT
SELECT DISTINCT vicePrimario, Nome, Cognome
FROM Sostituzione NATURAL JOIN Personale