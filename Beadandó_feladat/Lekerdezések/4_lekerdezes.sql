SELECT YEAR(eladas_datum) AS 'ÉV', 
	   AVG(ar) AS 'Átlagár'
FROM Ertekesites
GROUP BY YEAR(eladas_datum);