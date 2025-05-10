SELECT  CASE 
			WHEN GROUPING_ID(marka) = 1 THEN 'Összesen'
            ELSE marka
        END AS 'Márka',
		COUNT(*) AS 'Darabszám',
        SUM(lista_ar) AS 'Atók összértéke'
FROM Auto 
GROUP BY ROLLUP(marka)