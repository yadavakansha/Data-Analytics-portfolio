CREATE DATABASE `Policy Data UPDATED`;
USE `Policy Data UPDATED`;
USE `policy data updated`;

SHOW TABLES;
SELECT COUNT(*) AS Total_Policies
FROM `policy details`;

SELECT 
    `Policy Type`,
    COUNT(*) AS Total_Policies
FROM `policy details`
GROUP BY `Policy Type`
ORDER BY Total_Policies DESC;

SELECT 
    `Policy Type`,
    COUNT(*) AS Total_Policies,
    SUM(`Coverage Amount`) AS Total_Coverage,
    SUM(`Premium Amount`) AS Total_Premium
FROM `policy details`
GROUP BY `Policy Type`
ORDER BY Total_Premium DESC;

SELECT 
    `Policy Type`,
    COUNT(*) AS Total_Policies,
    SUM(`Coverage Amount`) AS Total_Coverage,
    SUM(`Premium Amount`) AS Total_Premium
FROM `policy details`
GROUP BY `Policy Type`
ORDER BY Total_Premium DESC;

SELECT 
    `Status`,
    COUNT(*) AS Total_Policies
FROM `policy details`
GROUP BY `Status`
ORDER BY Total_Policies DESC;

SELECT 
    `Claim Status`,
    COUNT(*) AS Total_Claims,
    SUM(`Claim Amount`) AS Total_Claim_Amount
FROM `claims`
GROUP BY `Claim Status`
ORDER BY Total_Claims DESC;

SELECT 
    `Reason for Claim`,
    COUNT(*) AS Total_Claims,
    SUM(`Claim Amount`) AS Total_Claim_Amount
FROM `claims`
GROUP BY `Reason for Claim`
ORDER BY Total_Claim_Amount DESC;

SELECT 
    `Payment Status`,
    COUNT(*) AS Total_Payments,
    SUM(`Amount Paid`) AS Total_Amount_Paid
FROM `payment history`
GROUP BY `Payment Status`
ORDER BY Total_Amount_Paid DESC;

SELECT 
    `Renewal Status`,
    COUNT(*) AS Total_Policies
FROM `additional fields`
GROUP BY `Renewal Status`
ORDER BY Total_Policies DESC;

SELECT 
    `Gender`,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(`Age`), 2) AS Average_Age
FROM `customer information`
GROUP BY `Gender`;

SELECT 
    `Agent ID`,
    COUNT(*) AS Total_Policies,
    SUM(`Policy Discounts`) AS Total_Discounts,
    ROUND(AVG(`Risk Score`), 2) AS Average_Risk_Score
FROM `additional fields`
GROUP BY `Agent ID`
ORDER BY Total_Policies DESC;

SELECT
    p.`Policy ID`,
    p.`Policy Type`,
    p.`Coverage Amount`,
    p.`Premium Amount`,
    p.`Status`,
    c.`Name`,
    c.`Gender`,
    c.`Age`,
    cl.`Claim Amount`,
    cl.`Claim Status`
FROM `policy details` p
LEFT JOIN `customer information` c
    ON p.`Customer ID` = c.`Customer ID`
LEFT JOIN `claims` cl
    ON p.`Policy ID` = cl.`Policy ID`;