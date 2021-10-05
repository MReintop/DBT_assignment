{{
    config(materialized="table")
}}

SELECT orderdate, sum(netamount) from (select customerid, creditcard
from customers WHERE {{ luhn_verify(creditcard) }} cust
JOIN (select customerid,orderdate, netamount from orders) ord
ON cust.customerid = ord.customerid
GROUP BY orderdate
