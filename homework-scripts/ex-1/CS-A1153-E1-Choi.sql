-- Scratch Work for Assignment 1

/*Customer (email, name, address, birthday)
Product (prodID, description, price, weight, type)
Orders (orderID, customer, date, payment)
OrderContent (orderID, product, amount)*/

/*The relation Customers contains information about customers, each tuple with a unique email. The relation Product includes product 
information. The attribute type can be food, hygiene, hobbies, or kitchen. The relation Orders keeps track of the orders of the 
customers, with a unique orderID. The attribute customer contains the email of the customer making the order. The attribute payment 
is credit, paypal, or mobilepay. The relation OrderContent tells which products belong to which order, and the amount of the products 
in the order.*/

-- Find the IDs of orders containing some food item or some hobby item. List each ID only once.
-- 1. Find all the products that are food or hobby
SELECT *
  FROM Product
 WHERE type IN ("food", "hobbies");
-- 2. OrderContent that has the above
-- 3. Solution 
SELECT DISTINCT orderID
  FROM OrderContent
 WHERE OrderContent.product IN (
           SELECT prodID
             FROM Product
            WHERE type IN ("food", "hobbies") 
       );

-- Find the IDs of orders containing some food item AND some hygiene item.
SELECT DISTINCT orderID
  FROM OrderContent
 WHERE OrderContent.product IN (
           SELECT prodID
             FROM Product
            WHERE type IN ("food") 
       )
INTERSECT
SELECT DISTINCT orderID
  FROM OrderContent
 WHERE OrderContent.product IN (
           SELECT prodID
             FROM Product
            WHERE type IN ("hygiene") 
       );

-- Find all the descriptions of the products the user with the email wiley123@yahoo.com has ever ordered, ordered alphabetically. List each item only once.
-- 1. all the orderID from interested customer
SELECT orderID FROM Orders WHERE customer="wiley123@yahoo.com";
-- 2. all the distinct productID bought by the customer
SELECT DISTINCT product
  FROM OrderContent
 WHERE orderID IN (
           SELECT orderID
             FROM Orders
            WHERE customer = "wiley123@yahoo.com"
       );
-- 3. solution
SELECT description
  FROM Product
 WHERE prodID IN (
           SELECT DISTINCT product
             FROM OrderContent
            WHERE orderID IN (
                      SELECT orderID
                        FROM Orders
                       WHERE customer = "wiley123@yahoo.com"
                  )
       )
 ORDER BY description;

-- Find the emails and names of customers who have made at least two orders with different payment methods. List each customer only once.
-- reminder: Orders (orderID, customer, date, payment)
-- 1. find the interested customers
SELECT DISTINCT O1.customer 
FROM Orders AS O1, Orders AS O2
WHERE O1.customer=O2.customer AND O1.payment<>O2.payment;
-- 2. Solution: Find their email and names
SELECT email,
       name
  FROM Customer
 WHERE email IN (
           SELECT DISTINCT O1.customer
             FROM Orders AS O1,
                  Orders AS O2
            WHERE O1.customer = O2.customer AND 
                  O1.payment <> O2.payment
       );

