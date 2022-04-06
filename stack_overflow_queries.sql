/* Last 5 years number of questions and percentange answers in the stack overflow */

SELECT
  EXTRACT(YEAR FROM creation_date) AS Year,
  COUNT(*) AS Number_of_Questions,
  ROUND(100 * SUM(IF(answer_count > 0, 1, 0)) / COUNT(*), 1) AS Percent_Questions_with_Answers
    FROM `bigquery-public-data.stackoverflow.posts_questions`
    GROUP BY Year
    HAVING
       Year >= 2016 AND Year < 2022
    ORDER BY
       Year;

/*The number of questions about python for last 5 years */
SELECT 
    REGEXP_EXTRACT(tags, "python") AS Tag, 
    EXTRACT(YEAR FROM creation_date) AS Year, 
    COUNT(*) AS Number_python_Questions
    FROM `bigquery-public-data.stackoverflow.posts_questions`
    GROUP BY Tag, Year
    HAVING
        Year >= 2016 AND Year <= 2022 AND Tag IS NOT NULL
    ORDER BY
        Year;
/* Get Number of questions asked on the selected tags set and ordering the result*/

SELECT tags AS Tags, 
       COUNT(*) AS Num
      FROM `bigquery-public-data.stackoverflow.posts_questions`
      WHERE tags 
      IN ('javascript', 'java', 'c#', 'python', 'php','android', 'c++', 'sql')
      AND 
      date(creation_date)>"2016-01-01" AND date(creation_date)<="2022-01-04"
      GROUP BY tags
      ORDER BY Num DESC;