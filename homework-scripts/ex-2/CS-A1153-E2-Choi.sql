--ex2
--problem 1
    --Find the appointments (with date, patient name, and doctor name) from year 2021, ordered by date (latest first), 
    --then by patient name (from A to Z), and last by doctor name (from A to Z).


/*SELECT date, patient FROM Appointment*/;
--SELECT * FROM Patient; -> connects ssno to name
SELECT date,
       Patient.name,
       Doctor.name
  FROM Appointment,
       Patient,
       Doctor
 WHERE Appointment.patient = Patient.ssNo AND 
       Appointment.doctor = Doctor.id AND 
       date >= '2021-01-01' AND 
       date <= '2021-12-31'
 ORDER BY date DESC,
          Patient.name,
          Doctor.name;

--problem 2
    --Find the name and BMI value of top 20 patients with the lowest BMI value. BMI value is calculated as 
    --(weight / ((heights / 100) * (heights / 100))).


SELECT name,
       (weight / ( (heights / 100) * (heights / 100) ) ) AS BMI
  FROM Patient
 ORDER BY BMI
 LIMIT 20;

--problem 3
    --Find all the names of patients who have visited doctor Dr. Nova Shanahan during year 2021. List each patient only once.
SELECT DISTINCT Patient.name
  FROM Patient,
       Appointment
 WHERE date >= '2021-01-01' AND 
       date <= '2021-12-31' AND 
       Patient.ssNo = Appointment.patient AND 
       Appointment.doctor IN (
           SELECT id
             FROM Doctor
            WHERE name = 'Dr. Nova Shanahan'
       );

--problem 4
    --Find the IDs of the items that have never been loaned. You should use at least one subquery and operator EXISTS and/or IN in 
    --your query. Set operators like INTERSECT, UNION, EXCEPT are not allowed in this exercise. Think about using a relation where 
    --you can find all itemID's in one place.

SELECT ID
  FROM LibraryItem
 WHERE NOT EXISTS (
               SELECT 1
                 FROM Loan
                WHERE Loan.itemID = ID
           );

--problems 5-10 : view pdf



