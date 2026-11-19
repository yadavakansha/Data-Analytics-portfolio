CREATE DATABASE branch_analysis;
USE branch_analysis;
DESCRIBE `Tables_in_branch_analysis`;
SHOW TABLES;
DESC `brokerage`;
DESC `fees`;
DESC `individual_budgets`;
DESC `invoice`;
DESC `meeting`;
DESC `opportunity`;
DESC `dim_account_exe`;
DESC `dim_branch`;
DESC `dim_client`;
DESC `dim_policy`;



SELECT *
FROM `dim_branch`;

SELECT 
    Region,
    COUNT(*) AS Total_Branches
FROM `dim_branch`
GROUP BY Region
ORDER BY Total_Branches DESC;

SELECT 
    `Branch Name`,
    State,
    Region,
    `Target FY (? Lakh)` AS Target
FROM `dim_branch`
ORDER BY Target DESC;


SELECT 
    branch_name,
    SUM(Amount) AS Total_Brokerage
FROM `brokerage`
GROUP BY branch_name
ORDER BY Total_Brokerage DESC;


SELECT 
    branch_name,
    SUM(Amount) AS Total_Fees
FROM `fees`
GROUP BY branch_name
ORDER BY Total_Fees DESC;


SELECT 
    branch_name,
    SUM(Amount) AS Total_Invoice_Revenue
FROM `invoice`
GROUP BY branch_name
ORDER BY Total_Invoice_Revenue DESC;


SELECT 
    branch,
    SUM(revenue_amount) AS Total_Revenue,
    SUM(premium_amount) AS Total_Premium
FROM `opportunity`
GROUP BY branch
ORDER BY Total_Revenue DESC;


SELECT 
    branch,
    COUNT(DISTINCT opportunity_id) AS Total_Opportunities
FROM `opportunity`
GROUP BY branch
ORDER BY Total_Opportunities DESC;


SELECT 
    Branch,
    COUNT(DISTINCT `Account Exe ID`) AS Total_Account_Executives
FROM `dim_account_exe`
GROUP BY Branch
ORDER BY Total_Account_Executives DESC;


SELECT 
    branch_name,
    COUNT(*) AS Total_Meetings
FROM `meeting`
GROUP BY branch_name
ORDER BY Total_Meetings DESC;