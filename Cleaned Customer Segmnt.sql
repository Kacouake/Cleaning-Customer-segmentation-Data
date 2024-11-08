-- The goal here is to clean this data from all inconsistences
-- Common Issues: Missing values in customer demographics
-- Duplicate records
-- Inconsistent formats for categorical data, like "Gender" or "Country" fields.

SELECT *
FROM custy_seg;

-- Identify any duplicates in ID
SELECT ID, COUNT(*)
FROM custy_seg
GROUP BY ID
HAVING COUNT(*) > 1;

-- makes Gender column have the same format
SELECT DISTINCT Gender 
FROM custy_seg;

UPDATE custy_seg
SET Gender = UPPER(Gender);

SELECT *
FROM custy_seg;

-- standardize values in Ever_Married column
SELECT DISTINCT Ever_Married 
FROM custy_seg;

UPDATE custy_seg
SET Ever_Married = UPPER(Ever_Married);

SELECT Ever_Married
FROM custy_seg;

-- checking for outliers and missing values in age column
SELECT Age FROM custy_seg WHERE age IS NULL;
SELECT MIN(age), MAX(age), AVG(age) FROM custy_seg;
DELETE FROM  custy_seg WHERE Age > 100;
-- No no missing values or outliers

-- Format Graduated column
SELECT DISTINCT Graduated FROM custy_seg;
UPDATE custy_seg
SET Graduated = UPPER(Graduated);
SELECT Graduated FROM custy_seg;

SELECT * FROM custy_seg;

-- Dealing with empty slots in profession column
SELECT DISTINCT Profession FROM custy_seg;

UPDATE custy_seg
SET Profession = 'Undecided'
WHERE Profession = 'Unemployed';

SELECT* FROM custy_seg;

-- Dealing with empty slots in work experience column
SELECT DISTINCT Work_Experience FROM custy_seg;

UPDATE custy_seg
SET Work_Experience = 0
WHERE Work_Experience = '';

SELECT * FROM custy_seg;

-- Spending Score
SELECT DISTINCT Spending_Score FROM custy_seg;
UPDATE custy_seg
SET Spending_Score = UPPER(Spending_Score);

-- Family Size
SELECT DISTINCT Family_Size FROM custy_seg;

SELECT * FROM custy_seg;

-- Var_1
SELECT DISTINCT Var_1 FROM custy_seg;

-- Segmentation
 SELECT DISTINCT Segmentation FROM custy_seg;








