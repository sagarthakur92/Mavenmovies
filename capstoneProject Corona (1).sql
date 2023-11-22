-- 1. Find the number of corona patients who faced shortness of breath.
select COUNT(corona="positive") as corona_patients from cleaned_data where Shortness_of_breath="TRUE";

-- 2. Find the number of negative corona patients who have fever and sore_throat. 
select count(corona) from cleaned_data where corona ="negative" and fever="TRUE" and sore_throat="TRUE";

-- 3. Find the female negative corona patients who faced cough and headache.
select count(sex) from cleaned_data where sex="FEMALE" and Cough_symptoms="TRUE" and Headache="TRUE";

-- 4. How many elderly corona patients have faced breathing problems?
select count(age_60_above) from cleaned_data where corona="positive" and Age_60_above="YES" and Shortness_of_breath="TRUE";

-- 5. Group the data by month and rank the number of positive cases.
select 
DATE_FORMAT(test_date, '%d-%m-%y') AS month,
    SUM(corona) AS total_positive_cases,
    DENSE_RANK() OVER (ORDER BY SUM(corona) DESC) AS ranked
FROM
    cleaned_data where corona="positive"
GROUP BY
    DATE_FORMAT(test_date, '%d-%m-%y')
ORDER BY
    month;

