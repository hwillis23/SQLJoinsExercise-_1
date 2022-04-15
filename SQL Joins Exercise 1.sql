-- /* joins: select all the computers from the products table:
-- using the products table and the categories table, return the product name and the category name */
 SELECT products.Name, categories.Name FROM products INNER JOIN categories 
 ON products.CategoryID = categories.CategoryID
 WHERE categories.NAME = "Computers";
 
-- /* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating FROM products 
 JOIN reviews ON products.ProductID = reviews.ProductID WHERE reviews.Rating = 5;  
 
-- /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */*****
SELECT employees.FirstName, employees.LastName, sum(Quantity) AS Total FROM sales
 INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID GROUP BY employees.EmployeeID 
 ORDER BY Total DESC Limit 2; 

-- /* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name FROM departments 
INNER JOIN categories ON categories.DepartmentID = departments.DepartmentID 
WHERE categories.Name = "Appliance" OR Categories.Name = "Games"; 


-- /* joins: find the product name, total # sold, and total price sold,
 -- for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, sum(sales.PricePerUnit * sales.Quantity) as "Total Price Sold", sum(sales.Quantity) as "Total Sold" 
 FROM products JOIN sales ON products.ProductID = sales.ProductID WHERE products.name LIKE "%Hotel California%"
 GROUP BY products.Name, products.Price;

-- /* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM reviews 
 JOIN products ON products.ProductID = reviews.ProductID 
WHERE products.name LIKE "%Visio TV" AND reviews.Rating =1;
-- ------------------------------------------ Extra - May be difficult
-- /* Your goal is to write a query that serves as an employee sales report.
-- This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold (quantity) */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, sum(sales.Quantity) as "Total Sold" 
FROM sales JOIN products ON products.ProductID = sales.ProductID 
 JOIN employees ON employees.EmployeeID = sales.EmployeeID 
GROUP BY employees.EmployeeID, products.ProductID ORDER BY sum(sales.Quantity) DESC; 


