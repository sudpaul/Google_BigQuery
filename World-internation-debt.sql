/* International debt of country 2016 */ 
SELECT
  id.country_name,
  id.value AS debt 
FROM (
  SELECT
    country_code,
    region
  FROM
    `bigquery-public-data.world_bank_intl_debt.country_summary`
  WHERE
    region != "" ) cs --aggregated countries do not have a region
INNER JOIN (
  SELECT
    country_code,
    country_name,
    value,
    year
  FROM
    `bigquery-public-data.world_bank_intl_debt.international_debt`
  WHERE
    indicator_code = "DT.DOD.PVLX.CD"
    AND year = 2016 ) id
ON
  cs.country_code = id.country_code
ORDER BY
  id.value DESC;
