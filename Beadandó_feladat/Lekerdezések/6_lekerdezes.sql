SELECT auto_id, 
	   marka, 
       modell, 
       lista_ar
FROM Auto
WHERE lista_ar > (
    SELECT AVG(lista_ar) 
    FROM Auto
);