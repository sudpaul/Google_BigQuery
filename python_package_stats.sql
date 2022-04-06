/* Pypi top 25 download packages for last 7 days */
SELECT file.project AS Package_name,
    COUNT(*) AS Total_downloads
    FROM `bigquery-public-data.pypi.file_downloads`
  -- Only query the last 7 days of history
    WHERE DATE(timestamp)
    BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
    AND CURRENT_DATE()
    GROUP BY file.project
    ORDER BY Total_downloads DESC
    LIMIT 25;

/*Python versions over time for last 3 months
Extract the Python version from the details.python column */
SELECT
  REGEXP_EXTRACT(details.python, r"[0-9]+\.[0-9]+") AS python_version,
  COUNT(*) AS num_downloads,
    FROM `bigquery-public-data.pypi.file_downloads`
    WHERE
  -- Only query the last 3 months of history
    DATE(timestamp)
    BETWEEN DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH), MONTH)
    AND CURRENT_DATE()
    GROUP BY `python_version`
    ORDER BY `num_downloads` DESC;