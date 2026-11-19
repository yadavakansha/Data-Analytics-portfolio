CREATE DATABASE hr_project;
USE hr_project;

CREATE TABLE hr_1 (
    Age INT,
    Attrition VARCHAR(3),
    BusinessTravel VARCHAR(20),
    DailyRate INT,
    Department VARCHAR(30),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(30),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(40),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(15)
);
CREATE TABLE hr_2 (
    EmployeeID INT PRIMARY KEY,
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(1),
    OverTime VARCHAR(3),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);
SELECT h1.EmployeeNumber, h1.Department, h2.EmployeeID, h2.MonthlyIncome
FROM hr_1 h1
JOIN hr_2 h2 ON h1.EmployeeNumber = h2.EmployeeID
LIMIT 10;
CREATE VIEW hr_combined AS
SELECT h1.*, 
       h2.MonthlyIncome, 
       h2.TotalWorkingYears, 
       h2.WorkLifeBalance,
       h2.YearsSinceLastPromotion, 
       h2.YearsAtCompany, 
       h2.OverTime
FROM hr_1 h1
JOIN hr_2 h2 ON h1.EmployeeNumber = h2.EmployeeID;

-- KPI 1: Average Attrition Rate by Department
SELECT Department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attritions,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_1
GROUP BY Department
ORDER BY attrition_rate_pct DESC;


-- KPI 2: Average Hourly Rate of Male Research Scientists
SELECT AVG(HourlyRate) AS avg_hourly_rate
FROM hr_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';



-- KPI 3: Attrition Rate vs Monthly Income (Combined)
SELECT
  CASE
    WHEN MonthlyIncome < 5000 THEN '< 5K'
    WHEN MonthlyIncome BETWEEN 5000 AND 14999 THEN '5K-15K'
    WHEN MonthlyIncome BETWEEN 15000 AND 29999 THEN '15K-30K'
    ELSE '30K+'
  END AS income_band,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attritions,
  ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct,
  ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income,
  MIN(MonthlyIncome) AS min_income,
  MAX(MonthlyIncome) AS max_income
FROM hr_combined
GROUP BY income_band
ORDER BY MIN(MonthlyIncome);

-- KPI 4: Average Working Years by Department
SELECT Department, ROUND(AVG(TotalWorkingYears), 2) AS avg_working_years
FROM hr_combined
GROUP BY Department
ORDER BY avg_working_years DESC;


-- KPI 5: Job Role vs Work-Life Balance
SELECT JobRole,
       ROUND(AVG(WorkLifeBalance), 2) AS avg_work_life_balance,
       COUNT(*) AS employees
FROM hr_combined
GROUP BY JobRole
ORDER BY avg_work_life_balance DESC;


-- KPI 6: Attrition Rate vs Years Since Last Promotion
SELECT YearsSinceLastPromotion,
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS attritions,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_combined
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

