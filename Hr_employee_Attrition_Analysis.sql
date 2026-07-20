create database Hr_Attrition;
use Hr_Attrition;
show tables;

RENAME TABLE `hr-employee-attrition`
TO hr_employee_attrition;
select count(*) as total_rows 
from hr_employee_attrition
;

ALTER TABLE hr_employee_attrition
RENAME COLUMN ï»¿Age TO Age;

SELECT 
Department,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_employee_attrition
GROUP BY Department;

SELECT 
JobRole,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY attrition DESC; 

SELECT 
OverTime,
COUNT(*) AS total_employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM hr_employee_attrition
GROUP BY OverTime; 

SELECT 
Department,
AVG(MonthlyIncome) AS avg_salary
FROM hr_employee_attrition
GROUP BY Department; 

SELECT 
CASE
WHEN Age < 30 THEN 'Young'
WHEN Age BETWEEN 30 AND 40 THEN 'Mid Age'
ELSE 'Senior'
END AS age_group,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition
FROM hr_employee_attrition
GROUP BY age_group; 

SELECT
JobSatisfaction,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition
FROM hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction; 

SELECT
WorkLifeBalance,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition
FROM hr_employee_attrition
GROUP BY WorkLifeBalance; 

SELECT 
EmployeeNumber,
MonthlyIncome
FROM hr_employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10; 

SELECT 
YearsAtCompany,
COUNT(*) AS total,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attrition
FROM hr_employee_attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;
