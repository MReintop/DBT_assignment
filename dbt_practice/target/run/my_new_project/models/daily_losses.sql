

  create  table "dellstore"."public"."daily_losses__dbt_tmp"
  as (
    

SELECT orderdate, sum(netamount) from (select customerid, creditcard
from customers WHERE 

CREATE OR REPLACE FUNCTION luhn_verify(int8) RETURNS boolean AS $$
SELECT
         MOD(SUM(doubled_digit / INT8 '10' + doubled_digit % INT8 '10'), 10) = 0
FROM
(SELECT
         MOD( ( $1::int8 / (10^n)::int8 ), 10::int8)
         * (MOD(n,2) + 1)
         AS doubled_digit
         FROM generate_series(0, floor(log( $1 ))::integer) AS n
) AS doubled_digits;

$$ LANGUAGE sql
IMMUTABLE
STRICT;

 cust
JOIN (select customerid,orderdate, netamount from orders) ord
ON cust.customerid = ord.customerid
GROUP BY orderdate
  );