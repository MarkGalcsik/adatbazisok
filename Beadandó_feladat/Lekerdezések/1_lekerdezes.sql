SELECT *
FROM Auto
WHERE auto_id NOT IN (
    SELECT auto_id
    FROM Ertekesites
)