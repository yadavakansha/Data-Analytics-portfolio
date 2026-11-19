# Insurance Policy and Branch Analysis

Analysis of 5,000 insurance policies and 7 branches of an insurance brokerage, using SQL, Excel, Tableau and Power BI.

## Objective
Understand policy portfolio health, claims, payments and renewals, and compare branch and account executive performance.

## Tools
- **SQL (MySQL):** policy and branch queries
- **Excel:** pivot tables and dashboards
- **Tableau:** interactive dashboards
- **Power BI:** interactive dashboards

## Part 1: Policy analysis
Data covers 5,000 policies across customer, policy, claims, payment and renewal tables.

**Questions analysed:** policies and premium by policy type, policy status, claim status and reasons, payment status, renewal status, and agent performance.

**Key findings**
- **Payments:** about half fail: 2,484 failed vs. 2,516 successful (49.7% failed).
- **Policy status:** policies are split almost evenly between Active (1,682), Terminated (1,678) and Lapsed (1,640).
- **Renewals:** only 1,668 of 5,000 policies were renewed; 1,685 were not renewed and 1,647 are pending.
- **Claims:** 1,712 approved, 1,650 pending and 1,638 denied.
- **Policy mix:** Health, Property, Life and Auto are all within a similar range (1,214 to 1,316 policies each), with Health the largest by policy count and premium.

## Part 2: Branch analysis
Data covers 7 branches, 45 account executives, and brokerage, fees, invoices, meetings and sales opportunities.

**Questions analysed:** revenue by branch, fees and invoices by branch, opportunity pipeline, account executives per branch and meetings per branch.

**Key findings**
- **Brokerage is led by Ahmedabad (about 21% of total)**, followed by Mumbai, Delhi and Bangalore.
- **The top 3 branches (Ahmedabad, Mumbai, Delhi) bring in about 53% of brokerage revenue.**
- **Ahmedabad has the lowest fee income** of all branches despite leading brokerage.

## Files
| File | Description |
|---|---|
| `Policy_Queries.sql` | Policy queries |
| `Policy_Analysis.xlsx` | Policy data and Excel dashboards |
| `Policy_Tableau_Dashboard` | Tableau workbook (policy) |
| `Policy_PowerBI_Dashboard` | Power BI report (policy) |
| `Branch_queries.sql` | Branch queries |
| `Branch_Analysis.xlsx` | Branch data and Excel dashboards |
| `Branch_Tableau_Dashboard.twb` | Tableau workbook (branch) |
| `Branch_PowerBI_Dashboard` | Power BI report (branch) |
| `Policy_Branch_Analytics_Project.pptx` | Project presentation |
