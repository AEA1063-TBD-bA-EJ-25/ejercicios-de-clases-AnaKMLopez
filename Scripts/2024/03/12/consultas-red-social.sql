USE SOCIAL

SELECT * FROM Highschooler
SELECT * FROM Friend
SELECT * FROM Likes

SELECT H1.NAME, H2.NAME FROM Highschooler H1
    JOIN Friend F ON H1.ID = F.ID1
    JOIN Highschooler H2 ON H2.ID = F.ID2
    WHERE H1.NAME = 'GABRIEL'

--PERSONA QUE LE GUSTA ALGUIEN DOS AÑOS MENOR (NO MUTUO)
SELECT * FROM Highschooler H1
    JOIN LIKES L ON L.ID1 = H1.ID
    JOIN Highschooler H2 ON L.ID2 = H2.ID
    WHERE H1.grade -2 >= H2.grade


--PERSONAS QUE SE GUSTAN MUTUAMENTE
SELECT H1.NAME, H1.grade, H2.name, H2.grade FROM Likes L1
    JOIN LIKES L2 ON L1.ID2 = L2.ID1
    JOIN Highschooler H1 ON H1.ID = L1.ID1
    JOIN Highschooler H2 ON H2.ID = L1.ID2
    WHERE L1.ID1 = L2.ID2

--cada situacion donde el estudiante A le gusta un esstudiante B, pero el estudiante B le gusta el C, dar los 3 nombres