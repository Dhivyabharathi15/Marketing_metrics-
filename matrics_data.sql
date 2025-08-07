use market2;
show tables;

-- Check and Clean the Data
SELECT * FROM metrics_data LIMIT 10;
SELECT DISTINCT Region FROM metrics_data;
SELECT DISTINCT Cohort FROM metrics_data;
SELECT DISTINCT Payment_Method FROM metrics_data;

-- Filter Campaigns by Date and Offer
SELECT *
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate');

-- Calculate Weekly Metrics per Region
SELECT Region,
       SUM(Declines) AS Total_Declines,
       SUM(Payouts) AS Total_Payouts,
       SUM(Checkouts) AS Total_Checkouts,
       COUNT(DISTINCT User_ID) AS Total_Users
FROM metrics_data
GROUP BY Region;

-- Efficiency Metrics
SELECT Region,
       ROUND(AVG(Active_Rate), 2) AS Avg_Active_Rate,
       ROUND(AVG(Average_Games_Per_Day), 2) AS Avg_Games_Per_Day,
       ROUND(AVG(Game_Age_Days), 2) AS Avg_Game_Age
FROM metrics_data
GROUP BY Region;

-- WMR Automation Status by Region
SELECT Region,
       SUM(CASE WHEN WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) AS WMR_Auto_Count,
       COUNT(*) AS Total_Users,
       ROUND(SUM(CASE WHEN WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS WMR_Auto_Percentage
FROM metrics_data
GROUP BY Region;

-- ReRepair Performance Metrics
SELECT Region,
       ROUND(AVG(ReRepair_7D), 2) AS Avg_ReRepair_7D,
       ROUND(AVG(ReRepair_30D), 2) AS Avg_ReRepair_30D,
       ROUND(AVG(ReRepair_90D), 2) AS Avg_ReRepair_90D
FROM metrics_data
GROUP BY Region;

-- Most Used Payment Methods
SELECT Payment_Method, COUNT(*) AS Usage_Count
FROM metrics_data
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;

-- Users Without Offer
SELECT COUNT(*) AS No_Offer_Users
FROM metrics_data
WHERE Offer_Taken = 'No';

-- Compare Average Weekly Metrics by Cohort
SELECT Cohort,
       ROUND(AVG(Declines), 2) AS Avg_Declines,
       ROUND(AVG(Payouts), 2) AS Avg_Payouts,
       ROUND(AVG(Checkouts), 2) AS Avg_Checkouts
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- Engagement Metrics Comparison (Games Played, Hours, Active Rate)
SELECT Cohort,
       ROUND(AVG(Games_Played), 2) AS Avg_Games_Played,
       ROUND(AVG(Hours_Played), 2) AS Avg_Hours_Played,
       ROUND(AVG(Active_Rate), 2) AS Avg_Active_Rate
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- Compare Offer_Taken Rates Between Cohorts
SELECT Cohort,
       SUM(CASE WHEN Offer_Taken = 'Yes' THEN 1 ELSE 0 END) AS Offer_Taken_Count,
       COUNT(*) AS Total_Users,
       ROUND(SUM(CASE WHEN Offer_Taken = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Offer_Taken_Percentage
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- ReRepair Metrics Comparison Between Cohorts
SELECT Cohort,
       ROUND(AVG(ReRepair_7D), 2) AS Avg_ReRepair_7D,
       ROUND(AVG(ReRepair_30D), 2) AS Avg_ReRepair_30D,
       ROUND(AVG(ReRepair_90D), 2) AS Avg_ReRepair_90D
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- Top 3 Regions by Checkout in Each Cohort
SELECT Cohort, Region, SUM(Checkouts) AS Total_Checkouts
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort, Region
ORDER BY Cohort, Total_Checkouts DESC
LIMIT 6;

-- % WMR Automated per Cohort
SELECT Cohort,
       SUM(CASE WHEN WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) AS WMR_Auto_Users,
       COUNT(*) AS Total_Users,
       ROUND(SUM(CASE WHEN WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS WMR_Automated_Percentage
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- WMR Automated vs Manual Breakdown by Cohort & Region
SELECT Cohort, Region,
       SUM(CASE WHEN WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) AS Automated,
       SUM(CASE WHEN WMR_Automation_Flag = 'No' THEN 1 ELSE 0 END) AS Manual
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort, Region
ORDER BY Cohort, Region;

-- Checkout Efficiency per Cohort (Checkouts per User)
SELECT Cohort,
       ROUND(SUM(Checkouts) / COUNT(DISTINCT User_ID), 2) AS Avg_Checkouts_Per_User
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- Users with Offer Taken + WMR Automated
SELECT Cohort,
       COUNT(*) AS Total_Users,
       SUM(CASE WHEN Offer_Taken = 'Yes' AND WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) AS Engaged_Auto_Users,
       ROUND(SUM(CASE WHEN Offer_Taken = 'Yes' AND WMR_Automation_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Engagement_Rate
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort;

-- Cohort-Wise Average Game Age for Manual vs Automated Users
SELECT Cohort, WMR_Automation_Flag,
       ROUND(AVG(Game_Age_Days), 2) AS Avg_Game_Age
FROM metrics_data
WHERE Cohort IN ('PCGP_3F1', 'Ultimate')
GROUP BY Cohort, WMR_Automation_Flag;

