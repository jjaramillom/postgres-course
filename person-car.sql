-- CREATE DATA
CREATE TABLE car (
  id bigserial NOT NULL PRIMARY KEY,
  make varchar(100) NOT NULL,
  model varchar(100) NOT NULL,
  price numeric(19, 2) NOT NULL CHECK (price > 0)
);

CREATE TABLE person (
  id bigserial NOT NULL PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  gender varchar(7) NOT NULL,
  email varchar(100),
  date_of_birth date NOT NULL,
  country_of_birth varchar(50) NOT NULL,
  car_id bigint REFERENCES car (id),
  UNIQUE (car_id)
);

-- INSERT INTO PERSON
INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
  VALUES ('Fernanda', 'Beardon', 'Female', 'fernandab@is.gd', '1953-10-28', 'Comoros');

INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
  VALUES ('Omar', 'Colmore', 'Male', NULL, '1921-04-03', 'Finland');

INSERT INTO person (first_name, last_name, gender, email, date_of_birth, country_of_birth)
  VALUES ('Adriana', 'Matuschek', 'Female', 'amatuschek2@feedburner.com', '1965-02-28', 'Cameroon');

-- INSERT INTO CAR
INSERT INTO car (make, model, price)
  VALUES ('Land Rover', 'Sterling', '87665.38');

INSERT INTO car (make, model, price)
  VALUES ('GMC', 'Acadia', '17662.69');


/* Updates the records */
UPDATE
  person
SET
  car_id = 2
WHERE
  id = 1;


/* inner join includes only records that are common for both tables. In this case show only persons who have a car, and cars that are owned by a person  */
SELECT
  *
FROM
  person
  JOIN car ON person.car_id = car.id;

SELECT
  person.first_name,
  car.make,
  car.model,
  car.price
FROM
  person
  JOIN car ON person.car_id = car.id;


/* left join includes all the records of the left table  */
SELECT
  *
FROM
  person
  LEFT JOIN car ON person.car_id = car.id;


/* "car.* IS NULL" means that every column in car should be null  */
SELECT
  *
FROM
  person
  LEFT JOIN car ON person.car_id = car.id
WHERE
  car.* IS NULL;

