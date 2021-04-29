SELECT
  *
FROM
  person
ORDER BY
  country_of_birth ASC;


/* shows only unique values */
SELECT DISTINCT
  country_of_birth
FROM
  person
ORDER BY
  country_of_birth;


/* adds a filter */
SELECT
  *
FROM
  person
WHERE
  gender = 'Male';


/* adds several nested filters */
SELECT
  *
FROM
  person
WHERE
  gender = 'Male'
  AND country_of_birth = 'Poland'
  OR country_of_birth = 'Germany'
ORDER BY
  country_of_birth;


/* limits results to 10 */
SELECT
  *
FROM
  person
LIMIT 10;


/* limits results to 5 and starts at the fifth result */
SELECT
  *
FROM
  person OFFSET 5
LIMIT 5;

-- FETCH MEANS THE NUMBER OF ROWS. WILL SELECT 5 AFTER OFFSET
/* same as above. FETCH means the number of rows that will be selected after the offset.  */
SELECT
  *
FROM
  person
ORDER BY
  id OFFSET 5 FETCH FIRST 5 ROW ONLY;


/* filter the values included in the list  */
SELECT
  *
FROM
  person
WHERE
  country_of_birth IN ('China', 'Brazil', 'France', 'Mexico')
ORDER BY
  country_of_birth;


/* filter the values between the dates  */
SELECT
  *
FROM
  person
WHERE
  date_of_birth BETWEEN DATE '2020-01-01'
  AND '2021-01-01';


/* LIKE works as a wild card. in this case the '%' represents any text before or after */
SELECT
  *
FROM
  person
WHERE
  email LIKE '%@google.%';


/* The underscore means to match a defined number of characters. so in this case we are looking for emails with exactly 7 chars before the "@" */
SELECT
  *
FROM
  person
WHERE
  email LIKE '_______@%';


/* ILIKE ignores case in words */
SELECT
  *
FROM
  person
WHERE
  country_of_birth ILIKE 'p%';

SELECT
  country_of_birth,
  count(*)
FROM
  person
GROUP BY
  country_of_birth
ORDER BY
  count DESC;


/* Adds a condition to count. */
SELECT
  country_of_birth,
  count(*)
FROM
  person
GROUP BY
  country_of_birth
HAVING
  COUNT(*) > 5
ORDER BY
  count DESC;


/* Adds a label to the calculated column */
SELECT
  *,
  age(now(), date_of_birth) AS age
FROM
  person;


/* Removes the primary key from person table */
ALTER TABLE person
  DROP CONSTRAINT person_pkey;


/* Adds primary id as key */
ALTER TABLE person
  ADD PRIMARY KEY (id);


/* Deletes the selected entries */
DELETE FROM person
WHERE id = 1;


/* selects emails which are repeated  */
SELECT
  email,
  count(*)
FROM
  person
GROUP BY
  email
HAVING
  count(*) > 1;


/* unique constraints define unique values per columns. "unique_email_address" is the name of the constraint */
ALTER TABLE person
  ADD CONSTRAINT unique_email_address UNIQUE (email);


/* it is also possible to add a constraint like this. Here the name is given automatically by postgres */
ALTER TABLE person
  ADD UNIQUE (email);


/* throws an error because the email must be unique, and there is already an entry */
INSERT INTO person (first_name, last_name, email, gender, date_of_birth, country_of_birth)
  VALUES ('Katee', 'Balden', 'kbalden0@smh.com.au', 'Female', '2021-02-24', 'China');


/* Deletes constraint */
ALTER TABLE person
  DROP CONSTRAINT unique_email_address;


/* It is also possible to add custom constraints */
ALTER TABLE person
  ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');


/* throws an error because gender is neither female nor male */
INSERT INTO person (first_name, last_name, email, gender, date_of_birth, country_of_birth)
  VALUES ('Katee', 'Balden', 'kbalden0@smh.com.au', 'Females', '2021-02-24', 'China');


/* Updates a single row */
UPDATE
  person
SET
  email = 'omar@gmail.com'
WHERE
  id = 2;


/* Updates the rows that match the query */
UPDATE
  person
SET
  first_name = 'Omar',
  last_name = 'Montana',
  gender = 'Male'
WHERE
  id = 2;


/* Throws an error because there is already an entry with id = 1 */
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
  VALUES (1, 'Katee', 'Balden', 'kbalden0@smh.com.au', 'Female', '2021-02-24', 'China');


/* with "on conflict" we can manage errors. Similar to a "catch" clause. For it to work, the column should have a unique or exclusion constraint  */
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
  VALUES (1, 'Katee', 'Balden', 'kbalden0@smh.com.au', 'Female', '2021-02-24', 'China')
ON CONFLICT (id)
  DO NOTHING;


/* Here we are update the email with the given value if the record already exists  */
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
  VALUES (1, 'Katee', 'Baldens', 'kbalden0@smh.com.aus', 'Female', '2021-02-24', 'China')
ON CONFLICT (id)
  DO UPDATE SET
    email = EXCLUDED.email, first_name = EXCLUDED.first_name, last_name = EXCLUDED.last_name;

