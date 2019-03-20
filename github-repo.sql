--Most watched github repos limit to 1000 for big-query processing

SELECT repo_name, watch_count
    FROM `bigquery-public-data.github_repos.sample_repos`
        ORDER BY watch_count DESC 
        LIMIT 1000;


-- Most number of committed repos in Python

SELECT sf.repo_name AS Repo_name, COUNT(sc.commit) AS Python_commits_number 
    FROM `bigquery-public-data.github_repos.sample_files` AS sf JOIN 
        `bigquery-public-data.github_repos.sample_commits` AS sc 
            ON sf.repo_name = sc.repo_name
                WHERE sf.path LIKE '%.py'
                GROUP BY sf.repo_name  
                ORDER BY Python_commits_number DESC;
