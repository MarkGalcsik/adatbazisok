SELECT 
    a.auto_id,
    a.kategoria,
    e.ar,
    RANK() OVER (PARTITION BY a.kategoria ORDER BY e.ar DESC) AS kategoria_rangsor
FROM Auto a
JOIN Ertekesites e ON a.auto_id = e.auto_id;