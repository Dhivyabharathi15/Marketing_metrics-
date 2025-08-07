**Marketing Metrics Automation: Regional Campaign Efficiency Tracking**

**Project Overview**

This project focuses on automating weekly marketing metrics reporting (WMR) for social campaign offers across regions like Mexico, Brazil, and ROLA. The goal is to eliminate manual dependency on Monday reporting, enable timely metric tracking, and generate insights using SQL queries to evaluate cohort performance and efficiency trends.

**Table of Contents**

Introduction

Techniques and Tools Used

Key Insights

Data Sources

Conclusion

**Introduction**
Weekly metric reporting was historically a manual and delayed process. This project automates the processing of WMR metrics using SQL and provides detailed comparisons between different campaign cohorts (PCGP_3F1 vs Ultimate) and regional performance. It also analyzes user behaviors, offer engagement, and re-engagement performance across various dimensions.

**Techniques and Tools Used**

SQL (MySQL Workbench): Used to automate metrics, filter cohorts, and calculate performance KPIs such as declines, payouts, checkouts, re-engagement, and WMR automation status

Dataset Size: Over 10,000 rows of cleaned campaign data from social offer campaigns

**Key Insights**

WMR Automation: The Ultimate cohort had a higher percentage of users with WMR automation enabled compared to PCGP_3F1. ROLA region had the lowest automation rate overall.

User Engagement: Users who accepted offers and had WMR automation enabled showed higher checkout activity and stronger overall engagement.

Checkout Efficiency: Ultimate users averaged more checkouts per user than PCGP_3F1, indicating better campaign responsiveness.

Game Age Trends: Automated users generally had older games, suggesting they were long-time or high-retention users.

ReRepair Performance: Ultimate users showed more stable and higher re-engagement performance over 7D, 30D, and 90D periods.

**Data Sources**

Table Name: matrics_data

Columns Used:

User_ID, Region, Cohort, Games_Played, Hours_Played, Days_Active, Active_Rate, Average_Games_Per_Day, Game_Age_Days

Payment_Method, Declines, Payouts, Checkouts

WMR_Automation_Flag, Offer_Taken, ReRepair_7D, ReRepair_30D, ReRepair_90D

Data_Refreshed_CSDW, Data_Refreshed_LENS

**Conclusion**

This project successfully automated WMR metric generation using SQL and highlighted performance trends across cohorts and regions. The Ultimate cohort consistently outperformed PCGP_3F1 in most key areas, including WMR adoption, offer engagement, and re-engagement behavior. These insights allow campaign teams to optimize cohort strategies and focus WMR automation efforts where needed most.
