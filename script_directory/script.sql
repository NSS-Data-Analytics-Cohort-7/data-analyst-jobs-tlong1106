--Q1 Answer: 1793
SELECT COUNT(*) FROM data_analyst_jobs;

--Q2 Answer: ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--Q3 Answer: Tennessee = 21; Tennessee OR Kentucky = 27
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location IN ('TN','KY');

--Q4 Answer: 3
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--Q5 Answer: 151
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Q6 Answer: Nebraska (4.199)
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

--Q7 Answer: 881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

--Q8 Answer: 231
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE location = 'CA';

--Q9 Answer: 40
SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;

--Q10 Answer: American Express, 4.199
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC, company;

--Q11 Answer: 774
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE UPPER(title) LIKE UPPER('%nalyst%');

--Q12 Answer: 4, all have Tableau
SELECT title
FROM data_analyst_jobs
WHERE UPPER(title) NOT LIKE ('%ANALYST%')
AND UPPER(title) NOT LIKE ('%ANALYTICS%');

/*Bonus Answer:
    Internet and Software
    Banks and Financial Services
    Consulting and Business Services
    Health Care
    
    Total 232 more than 3 weeks
*/
SELECT COUNT(title), domain
FROM data_analyst_jobs
WHERE
     skill LIKE '%SQL%'
     AND days_since_posting > 21
     AND domain IS NOT NULL
GROUP BY domain
ORDER BY count DESC
LIMIT 4;