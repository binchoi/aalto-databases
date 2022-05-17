--ex-3
--q1. Find the average price of food products (rounded up to two decimals).

SELECT ROUND(AVG(price),2)
  FROM Product
 WHERE Product.type = "food";

--q2. Find the total amount of products in each product type. The query should output the product type and the amount of products in it.

SELECT Product.type,
       COUNT( * ) 
  FROM Product
 GROUP BY Product.type;

--q3. For each order, find the amount of different kinds of food products in it. The query should output the order ID and the 
--    amount of different kinds of food products.
-- test out inner join
SELECT *
  FROM OrderContent
       INNER JOIN
       Product ON OrderContent.product = Product.prodID
 WHERE type = "food"
 ORDER BY OrderContent.orderID;

-- using count
SELECT OrderContent.orderID,
       COUNT(DISTINCT prodID) 
  FROM OrderContent
       INNER JOIN
       Product ON OrderContent.product = Product.prodID
 WHERE type = "food"
 GROUP BY OrderContent.orderID;

--q4. Find the total price for each order. Note that same item can be included several times in single order (the attribute amount). 
--    The query should output the order ID and the total price of the order (rounded up to two decimals).

SELECT OrderContent.orderID,
       ROUND(SUM(Product.price * OrderContent.amount), 2) 
  FROM OrderContent
       INNER JOIN
       Product ON OrderContent.product = Product.prodID
 GROUP BY OrderContent.orderID;

--q5. Find the customers who have spent in total at least 40 € in the shop. "In total" means that the total spend can include many 
--    separate orders. The query should output the name of customer, the amount of orders he/she has made, and the total sum of the orders (rounded up to two decimals).

SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM OrderContent;

-- only those who bought more than 40 euros in total
SELECT customer,
       SUM(price) 
  FROM Orders
       INNER JOIN
       (
           SELECT OrderContent.orderID,
                  ROUND(SUM(Product.price * OrderContent.amount), 2) AS price
             FROM OrderContent
                  INNER JOIN
                  Product ON OrderContent.product = Product.prodID
            GROUP BY OrderContent.orderID
       )
       AS orderPrices ON Orders.orderID = orderPrices.orderID
 GROUP BY customer
 HAVING SUM(price)>=40;
          
-- solution
SELECT Customer.name,
       COUNT( * ),
       ROUND(SUM(price), 2) 
  FROM Customer,
       Orders
       NATURAL JOIN
       (
           SELECT OrderContent.orderID,
                  SUM(Product.price * OrderContent.amount) AS price
             FROM OrderContent
                  INNER JOIN
                  Product ON OrderContent.product = Product.prodID
            GROUP BY OrderContent.orderID
       )
 WHERE Customer.email = customer
 GROUP BY customer
HAVING SUM(price) >= 40;


--q5. For each product type, list the number of products which have been ordered more than 1 time (ie. the item is part 
--    of at least 2 different orders in the database).

-- products that have been ordered more than once
SELECT DISTINCT O1.product
  FROM OrderContent AS O1,
       OrderContent AS O2
 WHERE O1.product = O2.product AND 
       O1.orderID <> O2.orderID;

SELECT type,
       COUNT( * ) 
  FROM Product,
       (
           SELECT DISTINCT O1.product
             FROM OrderContent AS O1,
                  OrderContent AS O2
            WHERE O1.product = O2.product AND 
                  O1.orderID <> O2.orderID
       )
       AS PopularProduct
 WHERE Product.prodID IN (PopularProduct.product) 
 GROUP BY type;
