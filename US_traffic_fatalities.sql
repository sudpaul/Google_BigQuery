/* Daily accident Stats */

SELECT day_of_crash AS day,
            COUNT(consecutive_number) AS Total
            FROM `bigquery-public-data.nhtsa_traffic_fatalities.accident_2016`
            GROUP BY 1
            ORDER BY COUNT(consecutive_number) DESC

/* Monthly accident stats for 2016 */

SELECT  month_of_crash AS month,
            COUNT(consecutive_number) AS Monthly_accidents 
            FROM `bigquery-public-data.nhtsa_traffic_fatalities.accident_2016`
            GROUP BY 1
            ORDER BY Monthly_accidents DESC

/* the number of accidents which happen on each day of the week */

SELECT day_of_week AS week_day, month_of_crash AS Month,
            COUNT(consecutive_number) AS Accidents_number 
            FROM `bigquery-public-data.nhtsa_traffic_fatalities.accident_2016`
            GROUP BY 1, 2
            ORDER BY COUNT(consecutive_number) DESC
/* Hit and run accident */

SELECT registration_state_name, COUNT(hit_and_run)
                  FROM `bigquery-public-data.nhtsa_traffic_fatalities.vehicle_2016`
                  WHERE hit_and_run = 'Yes'
                  GROUP BY registration_state_name
                  ORDER BY COUNT(hit_and_run) DESC