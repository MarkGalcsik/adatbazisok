SELECT a.allapot, 
	   AVG(a.km_ora) AS atlag_km,
       AVG(e.ar) AS 'Átlag eladási ár',
	   AVG(au.lista_ar) AS 'Átlag lista ár'
FROM Allapot a JOIN Auto au ON a.auto_id = au.auto_id
			   JOIN Ertekesites e ON au.auto_id = e.auto_id
GROUP BY allapot;