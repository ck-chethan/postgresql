CREATE TABLE dpts(
	first_name VARCHAR(50),
	department VARCHAR(50)
);


INSERT INTO dpts(first_name, department)
VALUES 
('Vinton', 'A'),
('Lauren', 'A'),
('Claire', 'B');

SELECT * FROM dpts;

SELECT 
CASE
	WHEN department = 'A' THEN 1
	ELSE 0
END
FROM dpts;

SELECT 
SUM(CASE
	WHEN department = 'A' THEN 1
	ELSE 0
END)
/
SUM(CASE
	WHEN department = 'B' THEN 1
	ELSE 0
END) repartment_ratio
FROM dpts;

DELETE FROM dpts WHERE department = 'B';

SELECT 
SUM(CASE
	WHEN department = 'A' THEN 1
	ELSE 0
END)
/
NULLIF(SUM(CASE
	WHEN department = 'B' THEN 1
	ELSE 0
END),0) repartment_ratio
FROM dpts;
