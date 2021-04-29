/* returns the record with highest price */
SELECT
  max(price)
FROM
  car;


/* returns the record with lowest price */
SELECT
  min(price)
FROM
  car;


/* returns the price average */
SELECT
  avg(price)
FROM
  car;


/* returns the price average as an integer */
SELECT
  round(avg(price))
FROM
  car;


/* returns the lowest price manufacturer and model */
SELECT
  make,
  model,
  min(price)
FROM
  car
GROUP BY
  make,
  model;


/* returns the total sum of prices */
SELECT
  sum(price)
FROM
  car;

/* returns the total sum of prices */
SELECT
  make,
  sum(price)
FROM
  car
GROUP BY
  make
ORDER BY
  make;

SELECT
  make,
  model,
  price,
  round(price *.10, 2),
  round(price - (price *.10), 2)
FROM
  car;

SELECT
  make,
  model,
  price AS original_price,
  round(price *.10, 2) AS ten_percent,
  round(price - (price *.10), 2) AS discount_price
FROM
  car;


/* coalesce adds data as fallback. in this case, if no email is available, 'no email' is returned  */
SELECT
  coalesce(email, 'no email')
FROM
  person;

