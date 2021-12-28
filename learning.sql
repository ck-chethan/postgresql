CREATE TABLE account (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(200) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

CREATE TABLE job (
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);


SELECT * FROM account;
SELECT * FROM job;
SELECT * FROM account_job;

INSERT INTO account(username, password, email, created_on)
VALUES('ABC', 'password', 'abc@gmail.com', CURRENT_TIMESTAMP);

INSERT INTO job(job_name)
VALUES('Doctor');

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES (1, 3, CURRENT_TIMESTAMP);

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = created_on;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login;

DELETE FROM account_job where job_id = 3;
DELETE FROM job where job_id = 3
RETURNING job_id, job_name;

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM information;

ALTER TABLE information
RENAME TO new_info;

SELECT * FROM new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people;

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info(title)
VALUES('abcdef');

ALTER TABLE new_info
DROP COLUMN people;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

CREATE TABLE employee(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
);

INSERT INTO employee(
	first_name, last_name, birthdate, hire_date, salary
)
VALUES(
	'Jeff', 'Bezos', '1965-10-15', '1986-01-01', 2000
);

SELECT * FROM employee;

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50), 
	homeroom_number INTEGER NOT NULL, 
	phone INTEGER UNIQUE,
	email VARCHAR(200) UNIQUE, 
	graduation_year VARCHAR(10)
);

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50), 
	homeroom_number INTEGER NOT NULL,
	graduation_year VARCHAR(200) NOT NULL,
	phone INTEGER UNIQUE,
	email VARCHAR(200) UNIQUE
);

