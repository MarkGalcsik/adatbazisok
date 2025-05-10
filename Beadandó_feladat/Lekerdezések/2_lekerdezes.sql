SELECT 
    CASE 
    	WHEN GROUPING_ID(k.nev) = 1 THEN 'Összesen'
        ELSE k.nev
    END AS 'Kereskedő',
    CASE 
    	WHEN GROUPING_ID(YEAR(e.eladas_datum)) = 1 THEN 'Összesen'
        ELSE CAST(YEAR(e.eladas_datum) AS nvarchar(20))
    END AS 'Év',
    COUNT(*) AS 'eladas_db',
    SUM(e.ar) AS 'osszes_ertek'
FROM Ertekesites e JOIN Kereskedo k ON e.kereskedo_id = k.kereskedo_id
GROUP BY ROLLUP (k.nev, YEAR(e.eladas_datum))