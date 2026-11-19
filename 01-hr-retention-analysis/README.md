# HR Retention Analysis

Analysis of 50,000 employee records to understand attrition and what it relates to, using SQL, Excel, Tableau and Power BI.

## Objective
Measure attrition across departments, income bands, tenure, promotions and work-life balance, and identify where retention risk sits.

## Tools
- **SQL (MySQL):** two tables joined into a combined view, then 6 KPI queries
- **Excel:** data preparation and dashboard
- **Tableau:** interactive dashboard
- **Power BI:** interactive dashboard

## Data
50,000 employees split across two tables: `HR1` (employee profile, role, attrition) and `HR2` (income, tenure, promotions, work-life balance), joined on employee ID.

## KPIs analysed
1. Attrition rate by department
2. Average hourly rate of male Research Scientists
3. Attrition rate by monthly income band
4. Average total working years by department
5. Job role vs work-life balance
6. Attrition rate vs years since last promotion

## Key findings
- **Overall attrition is about 50%** (25,105 of 50,000 employees).
- **It is evenly spread:** every department falls between 49% and 52%, and every income band is at about 50%.
- **Promotion gap shows no clear pattern:** attrition stays between about 49% and 51% for employees 1 to 10 years since their last promotion.
- **Average hourly rate for male Research Scientists:** $114.45
- **Work-life balance is nearly identical across job roles** (about 2.5 on average).

**Takeaway:** attrition is evenly spread across all segments, indicating a company-wide retention issue rather than one concentrated in a single group.

## Files
| File | Description |
|---|---|
| `HR_KPIs.sql` | Table creation, combined view and all KPI queries |
| `HR_Analysis.xlsx` | Data and Excel dashboard |
| `HR_Tableau_Dashboard.twbx` | Tableau workbook |
| `HR_PowerBI_Dashboard.pbix` | Power BI report |
