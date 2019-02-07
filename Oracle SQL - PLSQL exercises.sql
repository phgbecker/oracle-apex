/*
    1 - Create a query to display the first name, last name,  hire date, salary, and salary after a raise of 20%. Name the last column (salary after a raise) heading as “ANNUAL_SAL” (OEHR_EMPLOYEES table).
*/

SELECT
    first_name ,
    last_name  ,
    hire_date  ,
    salary * 1.2 AS 'Salary after raise'
FROM
    OEHR_EMPLOYEES;
    
/*
    2 - Create a query to display the customer last name concatenated with the first name, separated by space, and the telephone number concatenated with the email address(If no email address put 'No Email'), separated by hyphen. Name the column headings “FULL_NAME” and “CONTACT_DETAILS” respectively (demo_customers table).
*/

SELECT
    last_name    || ', ' || first_name FULL_NAME,
    phone_number || ' - '|| COALESCE(email, 'No Email') CONTACT_DETAILS
FROM
    OEHR_EMPLOYEES;

/*
    3 - Display the employee number, first name, job id and department number for all employees whose department number equals 20, 60 or 80 (OEHR_EMPLOYEES table).
*/

SELECT
    employee_id  , 
    first_name   ,
    job_id       ,
    department_id
FROM
    OEHR_EMPLOYEES
WHERE
    department_id IN (20, 60 80);

/*
    4 - Display the employee number, first name, job id and department number for all employees whose department number is not equal to 20, 60 and 80 (OEHR_EMPLOYEES table).
*/

SELECT
    employee_id  ,
    first_name   ,
    job_id       ,
    department_id
FROM
    OEHR_EMPLOYEES
WHERE
    department_id IS NOT IN (20, 60, 80);
 
/*
    5 - Display the first name and salary for all employees whose first name ends with an e (OEHR_EMPLOYEES table).
*/

SELECT
    first_name,
    salary
FROM
    OEHR_EMPLOYEES
WHERE
    first_name LIKE '%e';

/*
 6 - Display the last name and department number for all employees where the second letter in their last name is i (OEHR_EMPLOYEES table).
*/

SELECT
    last_name    ,
    department_id
FROM
    OEHR_EMPLOYEES
WHERE
    last_name LIKE '_i%';

/*
    7 - Display the first name, hire date, salary and department number for all employees whose first name doesn’t have the letter A. Sort the query in ascending order by department number (OEHR_EMPLOYEES table).
*/

SELECT
    first_name   ,
    hire_date    ,
    salary       ,
    department_id
FROM
    OEHR_EMPLOYEES
WHERE
    UPPER(last_name) NOT LIKE '%A%'
ORDER BY
    4 ASC;
 

/*
    8 - Display the first name concatenated with the last name, separated by comma, and salary, for all employees whose salary not in the range between 7000 and 15000. Sort the query in ascending order by the full name (first_name, last_name) (OEHR_EMPLOYEES table).
*/

SELECT
    first_name || ', ' || last_name full_name,
    salary
FROM
    OEHR_EMPLOYEES
WHERE
    salary NOT BETWEEN 7000 AND 15000
ORDER BY
    full_name ASC;

/*
    9 - Display all data from Employees table for all employees whose:
        - Salary is in the range of 6000 and 800 and their commission is not null OR
        - Department number is not equal to 80, 90 and 100 (OEHR_EMPLOYEES table)
*/

SELECT
    *
FROM
    OEHR_EMPLOYEES
WHERE
    (
        salary BETWEEN 6000 AND 8000
        AND commission_pct IS NOT NULL
    ) OR department_id NOT IN (80, 90, 100);

/*
    10 - Display the first name in lower case and last name in upper case, for all employees whose employee number is in the range between 80 and 150.(OEHR_EMPLOYEES table)
*/

SELECT
    LOWER(first_name),
    UPPER(last_name)
FROM
    OEHR_EMPLOYEES
WHERE
    employee_id BETWEEN 80 AND 150;
    
/*
    11 - For each employee, display the first name, last name, and email address. The email address will be composed from the first letter of first name, concatenated with the three first letters of last name, concatenated with @oracle.com.(OEHR_EMPLOYEES table)
*/

SELECT
    first_name,
    last_name ,
    LOWER((SUBSTR(first_name, 1 , 1) || SUBSTR(last_name, 1, 3) || '@oracle.com')) email
FROM
    OEHR_EMPLOYEES;

/*
    12 - For each employee, use the CONCAT function to display the first name concatenated with the last name, concatenated with hire date.(OEHR_EMPLOYEES table)
*/

SELECT
    CONCAT(CONCAT(first_name, last_name), hire_date)
FROM
    OEHR_EMPLOYEES;

/*
    13 - Display the last name for all employees where last name’s length is greater than 8 characters.(OEHR_EMPLOYEES table)
*/

SELECT
    last_name
FROM
    OEHR_EMPLOYEES
WHERE
    LENGTH(last_name) > 8;

/*
    14 - For each employee, display the first name, last name, phone number and a new phone number using the REPLACE function. in the new phone number replace all prefixes of 515 with 815.(OEHR_EMPLOYEES table)
*/

SELECT
    first_name      ,
    last_name       ,
    phone_number    ,
    REPLACE(phone_number, '515', '815') new_phone_number
FROM
    OEHR_EMPLOYEES;

/*
15 - For each employee, display:
     - first name
     - salary
     - salary after a raise of 12%
     - salary after a raise of 12%,  expressed as a whole number (ROUND).
     - salary after a raise of 12%, round down to the nearest whole number.
     - (OEHR_EMPLOYEES table)
*/

SELECT
    first_name          ,
    last_name           ,
    salary              ,
    salary * 1.12       ,
    TRUNC(salary * 1.12),
    FLOOR(salary * 1.12)
FROM
    OEHR_EMPLOYEES;

/*
    16 - For each employee, display the first name, hire date, hire date minus 10 days, hire date plus one month, and the day difference between current date and hire date.(OEHR_EMPLOYEES table)
*/

SELECT
    first_name              ,
    hire_date               ,
    hire_date - 10          ,
    ADD_MONTHS(hire_date, 1),
    SYSDATE - TO_DATE(TO_CHAR(hire_date, 'MM/DD/YYYY'))
FROM
    OEHR_EMPLOYEES;

/*
    17 - Display the last name in upper case, the salary in format model : ‘9,999.999’, and hire date in format model: ‘DD/MM/YYYY’, for all employees whose last name begins with the letter D or K.(OEHR_EMPLOYEES table)
*/

SELECT
    UPPER(last_name),
    TO_CHAR(salary, '9,999.999'),
    TO_CHAR(hire_date, 'DD/MM/YYYY')
FROM
    OEHR_EMPLOYEES;
    
/*
    18 - For each employee, display the first name, last name, salary and commission percentage. If an employee doesn’t earn a commission, display “No Commission” instead of NULL.(OEHR_EMPLOYEES table)
*/

SELECT
    first_name,
    last_name ,
    salary    ,
    COALESCE(TO_CHAR(commission_pct), 'No Commission')
FROM
    OEHR_EMPLOYEES;
    
/*
    19 - Case Function - For each employee, display the first name, last name, salary, and a salary grade based on these conditions :
         - if the salary is between 0 and 5000 – salary grade level is A
         - if the salary is between 5001 and 15000 – salary grade level is B
         - if the salary is between 15001 and 20000 – salary grade level is C
         - for any other range – salary grade level is D
         - (OEHR_EMPLOYEES table)
*/

SELECT
    first_name,
    last_name ,
    salary    ,
    CASE
        WHEN salary BETWEEN 0     AND 5000 THEN 'A'
        WHEN salary BETWEEN 5001  AND 5000 THEN 'B'
        WHEN salary BETWEEN 15001 AND 5000 THEN 'C'
        ELSE 'D'
    END salary_grade
FROM
    OEHR_EMPLOYEES;
    
/*
    20 - Display the department number, and the average salary for each department, for all departments whose number is in the range of 20 and 80, and their average salary is greater than 9000.(OEHR_EMPLOYEES table)
*/

SELECT
    department_id,
    AVG(salary)
FROM
    OEHR_EMPLOYEES
WHERE
    department_id BETWEEN 20 AND 80
GROUP BY
    department_id
HAVING
    AVG(salary) > 9000;

/*
    21 - Display the first name, last name, and department number for all employees who work in Sales department (OEHR_Employees and OEHR_Departments table).
*/

SELECT
    e.first_name   ,
    e.last_name    ,
    e.department_id
FROM
    OEHR_EMPLOYEES e
INNER JOIN OEHR_Departments d ON (
    e.department_id = d.department_id
)
WHERE
    d.department_name = 'Sales'

/*
    22 - Display the first name, salary and department number for all employees whose department is located Seattle (OEHR_Employees, OEHR_Departments and OEHR_Locations table).
*/

SELECT
    e.first_name   ,
    e.salary       ,
    e.department_id
FROM
    OEHR_EMPLOYEES e
INNER JOIN OEHR_Departments d ON (
    e.department_id = d.department_id
)
INNER JOIN OEHR_Locations l ON (
    d.location_id = l.location_id
)
WHERE
    l.city = 'Seattle';
    
/*
    23 - Display the first name, salary, and department number for all employees who earn less than the average salary, and also work at the same department as employee whose first name is Kevin.(OEHR_EMPLOYEES table)
*/

SELECT
    first_name,
    department_id
FROM
    OEHR_EMPLOYEES
WHERE
    salary < (
                SELECT  
                    AVG(salary)
                FROM
                    OEHR_EMPLOYEES 
             )
AND
    department_id = (
                        SELECT DISTINCT
                            department_id
                        FROM
                            OEHR_EMPLOYEES
                        WHERE
                            first_name = 'Kevin'
                    );

/*
    24 - Display the first name, last name, department number and department name, for all employees in departments 50 or 90. (OEHR_Employees & OEHR_Departments tables)
*/

SELECT
    e.first_name     ,
    e.last_name      ,
    e.department_id  ,
    d.department_name
FROM
    OEHR_EMPLOYEES e
INNER JOIN OEHR_Departments d ON (
    e.department_id = d.department_id
)
WHERE
    e.department_id IN (50, 90);

/*
    25 - Display the full name, department name, city, and state province, for all employees whose last name contains the letter a (OEHR_Departments, OEHR_Employees & OEHR_Locations tables)
*/

SELECT
    first_name || ' ' || last_name fullname,
    department_name ,
    city            ,
    state_province
FROM
    OEHR_EMPLOYEES e
INNER JOIN OEHR_Departments d ON (
    e.department_id = d.department_id
)
INNER JOIN OEHR_Locations l ON (
    d.location_id = l.location_id
)
WHERE
    UPPER(e.last_name) LIKE '%A%';    
    
/*
    26 - For each employee, display the first name, salary, and job title (OEHR_Employees & OEHR_Jobs tables)
*/

SELECT
    e.first_name,
    e.salary    ,
    j.job_title
FROM
    OEHR_EMPLOYEES e
INNER JOIN OEHR_Jobs j ON (
    e.job_id = j.job_id
);
    
/*
    27 - Display the first name, last name, department number and department name, for all employees including those without any department. (OEHR_Employees and OEHR_Departments table).
*/

SELECT
    e.first_name   ,
    e.last_name    ,
    e.department_id,
    d.department_name
FROM
    OEHR_EMPLOYEES e
LEFT JOIN OEHR_Departments d ON (
    e.department_id = d.department_id
);

/*
    28 - Modify your query to display all departments including departments without any employees.(OEHR_Employees and OEHR_Departments table).
*/

SELECT
    e.first_name   ,
    e.last_name    ,
    e.department_id,
    d.department_name
FROM
    OEHR_EMPLOYEES e
RIGHT JOIN OEHR_Departments d ON (
    e.department_id = d.department_id
);
  
/*
    29 - Display the first name, last name, and department number for all employees who work in the same department as employee whose last name is “King”.(OEHR_EMPLOYEES table)
*/

SELECT
    first_name,
    last_name ,
    department_id
FROM
    OEHR_EMPLOYEES
WHERE
    department_id IN (
                        SELECT
                            department_id
                        FROM
                            OEHR_EMPLOYEES
                        WHERE
                            last_name = 'King'
                    );

/*
    30 - Display the last name and salary for all employees who earn less than employee number 103.(OEHR_EMPLOYEES table)
*/
 
SELECT
    last_name,
    salary
FROM
    OEHR_EMPLOYEES
WHERE
    salary < (
                SELECT
                    salary
                FROM
                    OEHR_EMPLOYEES
                WHERE
                    employee_id = 103
             );


/* -------
    PL/SQL
   ------- */

/*
    1. Create a sequence
*/

CREATE SEQUENCE  seq_phgbecker
    START WITH   1
    INCREMENT BY 1
    CACHE 5;

/*
    2. Create a table. This table must have 3 columns: USER_ID(PK, NOT NULL), USER_NAME(NOT NULL), and USER_BIRTHDATE
*/

CREATE TABLE tb_phgbecker (
    user_id       NUMBER (10)  NOT NULL,
    user_name     VARCHAR2(60) NOT NULL,
    user_birthday DATE,
    CONSTRAINT tb_phgbecker_pk PRIMARY KEY (user_id)
);

/*
    3. Write a script to create a Package and a Package Body with 3 procedures: Insert, Update and Delete(CRUD). All the procedures must return a message and print as DBMS_output
*/

CREATE OR REPLACE PACKAGE package_phgbecker AS

    PROCEDURE create_user(
        employee_name     IN VARCHAR2,
        employee_birthday IN DATE
    );
    
    PROCEDURE update_user(
        employee_id       IN NUMBER ,
        employee_name     IN VARCHAR2,
        employee_birthday IN DATE
    );
    
    PROCEDURE delete_user(
        employee_id     IN NUMBER
    );

END;

CREATE OR REPLACE PACKAGE BODY package_phgbecker AS

    PROCEDURE create_user(
        employee_name     IN VARCHAR2,
        employee_birthday IN DATE
    ) AS

    BEGIN
    
        INSERT INTO
            tb_phgbecker (user_id, user_name, user_birthday)
        VALUES
            (seq_phgbecker.NEXTVAL, employee_name, employee_birthday);

        DBMS_OUTPUT.PUT_LINE(employee_name || ' created successfuly');
    
    END;
    
    
    PROCEDURE update_user(
        employee_id       IN NUMBER  ,
        employee_name     IN VARCHAR2,
        employee_birthday IN DATE
    ) AS
    
    BEGIN
    
        UPDATE
            tb_phgbecker
        SET
            user_name     = employee_name,
            user_birthday = employee_birthday
        WHERE
            user_id = employee_id;
            
        DBMS_OUTPUT.PUT_LINE(employee_name || ' updated successfuly');
    
    END;
    
    
    PROCEDURE delete_user(
        employee_id IN NUMBER
    ) AS
    
    BEGIN
    
        DELETE FROM
            tb_phgbecker
        WHERE
            user_id = employee_id;
            
        DBMS_OUTPUT.PUT_LINE('User deleted successfuly');
    
    END;

END;

/*
    4. Insert into the database 5 registers using the Insert from the previous package/procedure. Update and delete this USERs from DB
    using the USER_ID;
*/

BEGIN
    package_phgbecker.create_user('John'   ,  TO_DATE('01/01/2019'));
    package_phgbecker.create_user('Mary'   ,  TO_DATE('01/05/2019'));
    package_phgbecker.create_user('Dan'    ,  TO_DATE('01/10/2019'));
    package_phgbecker.create_user('Max'    ,  TO_DATE('01/15/2019'));
    package_phgbecker.create_user('Scarlet',  TO_DATE('01/20/2019'));
    
    package_phgbecker.update_user(1, 'John A.'   ,  TO_DATE('01/01/2020'));
    package_phgbecker.update_user(2, 'Mary B.'   ,  TO_DATE('02/05/2020'));
    package_phgbecker.update_user(3, 'Dan C.'    ,  TO_DATE('03/10/2020'));
    package_phgbecker.update_user(4, 'Max D.'    ,  TO_DATE('04/15/2020'));
    package_phgbecker.update_user(5, 'Scarlet E.',  TO_DATE('05/20/2020'));
    
    package_phgbecker.delete_user(1);
    package_phgbecker.delete_user(2);
    package_phgbecker.delete_user(3);
    package_phgbecker.delete_user(4);
    package_phgbecker.delete_user(5);
END;

/*
    EXTRA: Write a Function that prints a USER from DB using the ID (use a Cursor and FOR LOOP) and call the function to show messages on procedure UPDATE;
*/

CREATE OR REPLACE TYPE ty_phgbecker of tb_phgbecker;

CREATE OR REPLACE FUNCTION fn_phgbecker_findusers
RETURN ty_phgbecker
AS

DECLARE
    person tb_phgbecker%ROWTYPE;
    
BEGIN

    FOR p IN person
        
        SELECT * FROM tb_phgbecker;
        
    LOOP
    
        DBMS_OUTPUT.PUT_LINE('ID: ' || p.user_id || ' - Name: ' || p.user_name || ' - Birthday: ' || TO_CHAR(p.user_birthday, 'DD/MM/YYYY'));

    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An exception happened');
END;


SELECT 
    *
FROM
    fn_phgbecker_findusers();
