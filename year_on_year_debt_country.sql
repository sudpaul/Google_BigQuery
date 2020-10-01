SELECT country_name AS Country, country_code AS Code, 

year AS Year, SUM(value) AS Total_International_debt

FROM `bigquery-public-data.world_bank_intl_debt.international_debt` 

GROUP BY country_code, year, country_name

ORDER BY SUM(value) AS DESC;