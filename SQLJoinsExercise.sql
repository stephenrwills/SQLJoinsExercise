/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

 SELECT products.name AS ProductName, categories.name AS CategoryName
 FROM products
 JOIN categories ON products.CategoryID = categories.CategoryID;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT *
 FROM products
 LEFT JOIN reviews ON reviews.ProductID = products.ProductID
 WHERE Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(Quantity) AS TotalQuantitySold
FROM employees
JOIN sales ON employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by SUM(Quantity) desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS DepartmentName, categories.Name CategoryName
FROM departments
JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.name, sum(sales.Quantity) AS TotalSold , SUM(sales.Quantity * sales.PricePerUnit) AS TotalPrice
 FROM products
 INNER JOIN sales ON sales.productID = products.productID
 WHERE products.name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name,  reviews.Reviewer, reviews.comment
FROM products
INNER JOIN reviews ON products.productID = reviews.ProductID
WHERE products.ProductID = 857 AND reviews.rating = 1;
