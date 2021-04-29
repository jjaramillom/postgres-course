/* 1 / NULL = NULL */
SELECT
  coalesce(10 / 0, 0);


/* NULLIF returns null if both arguments are equal. Otherwise returns first argument */
SELECT
  coalesce(10 / nullif (0, 0), 0);


/* now() returns the current date */
SELECT
  now();


/* It's possible to cast it to date-only with now()::date or time-only with now()::time*/
SELECT
  now()::date;

SELECT
  now() - interval '1 YEAR';

SELECT
  now() - interval '10 months';

SELECT
  (now() - interval '10 months')::date;

SELECT
  extract(year FROM now())
