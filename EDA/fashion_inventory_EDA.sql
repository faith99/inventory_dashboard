CREATE TABLE fashion_inventory_clean (
    ID INT,
    Date DATE,
    Month VARCHAR(10),
    Time TIME,
    Product_ID INT,
    Size VARCHAR(20),
    Brand VARCHAR(100),
    Dominant_Material VARCHAR(50),
    Dominant_Color VARCHAR(50),
    Product_Type VARCHAR(100),
    Variant_Price DECIMAL(10,2),
    Variant_Compare_At_Price DECIMAL(10,2),
    On_Sale VARCHAR(10),
    Ideal_For VARCHAR(20),
    Is_In_Stock VARCHAR(20)
);

SELECT *
FROM fashion_inventory_clean;

-- EDA

-- BRANDS
-- Top 5 most popular brands (General)
SELECT Brand, COUNT(Brand) as count_brand
FROM fashion_inventory_clean
GROUP BY Brand
ORDER BY count_brand DESC
LIMIT 5;

-- Top 5 most popular brands (Women)
SELECT Brand, COUNT(Brand) as count_brand
FROM fashion_inventory_clean
WHERE Ideal_For = 'Women'
GROUP BY Brand
ORDER BY count_brand DESC
LIMIT 5;

-- Top 5 most popular brands (Men)
SELECT Brand, COUNT(Brand) as count_brand
FROM fashion_inventory_clean
WHERE Ideal_For = 'Men'
GROUP BY Brand
ORDER BY count_brand DESC
LIMIT 5;

-- Top 5 most popular brands (Boys)
SELECT Brand, COUNT(Brand) as count_brand
FROM fashion_inventory_clean
WHERE Ideal_For = 'Boys'
GROUP BY Brand
ORDER BY count_brand DESC
LIMIT 5;

-- Top 5 most popular brands (Girls)
SELECT Brand, COUNT(Brand) as count_brand
FROM fashion_inventory_clean
WHERE Ideal_For = 'Girls'
GROUP BY Brand
ORDER BY count_brand DESC
LIMIT 5;

-- Top 5 most popular brands (Unisex)
SELECT Brand, COUNT(Brand) as count_brand
FROM fashion_inventory_clean
WHERE Ideal_For = 'Unisex'
GROUP BY Brand
ORDER BY count_brand DESC
LIMIT 5;



-- PRODUCT TYPES
-- Top 5 most popular product type (General)
SELECT Product_Type, COUNT(Product_Type) as count_product_type
FROM fashion_inventory_clean
GROUP BY Product_Type
ORDER BY count_product_type DESC
LIMIT 5;

-- Top 5 most popular product type (Women)
SELECT Product_Type, COUNT(Product_Type) as count_product_type
FROM fashion_inventory_clean
WHERE Ideal_For = 'Women'
GROUP BY Product_Type
ORDER BY count_product_type DESC
LIMIT 5;

-- Top 5 most popular product type (Men)
SELECT Product_Type, COUNT(Product_Type) as count_product_type
FROM fashion_inventory_clean
WHERE Ideal_For = 'Men'
GROUP BY Product_Type
ORDER BY count_product_type DESC
LIMIT 5;

-- Top 5 most popular product type (Boys)
SELECT Product_Type, COUNT(Product_Type) as count_product_type
FROM fashion_inventory_clean
WHERE Ideal_For = 'Boys'
GROUP BY Product_Type
ORDER BY count_product_type DESC
LIMIT 5;

-- Top 5 most popular product type (Girls)
SELECT Product_Type, COUNT(Product_Type) as count_product_type
FROM fashion_inventory_clean
WHERE Ideal_For = 'Girls'
GROUP BY Product_Type
ORDER BY count_product_type DESC
LIMIT 5;

-- Top 5 most popular product type (Unisex)
SELECT Product_Type, COUNT(Product_Type) as count_product_type
FROM fashion_inventory_clean
WHERE Ideal_For = 'Unisex'
GROUP BY Product_Type
ORDER BY count_product_type DESC
LIMIT 5;


-- GENDER
-- percentage of clothing for each gender
WITH women_no as (
SELECT COUNT(*) as women_count
FROM fashion_inventory_clean
WHERE Ideal_For = 'Women'
),
men_no as(
SELECT COUNT(*) as men_count
FROM fashion_inventory_clean
WHERE Ideal_For = 'Men'
),
boys_no as(
SELECT COUNT(*) as boys_count
FROM fashion_inventory_clean
WHERE Ideal_For = 'Boys'
),
girls_no as(
SELECT COUNT(*) as girls_count
FROM fashion_inventory_clean
WHERE Ideal_For = 'Girls'
),
unisex_no as(
SELECT COUNT(*) as unisex_count
FROM fashion_inventory_clean
WHERE Ideal_For = 'Unisex'
)
SELECT ROUND(((women_count *100)/15000),1) as women_percent, ROUND(((men_count *100)/15000),1) as men_percent,
 ROUND(((boys_count *100)/15000),1) as boys_percent, ROUND(((girls_count *100)/15000),1) as girls_percent,
 ROUND(((unisex_count *100)/15000),1) as unisex_percent
 FROM women_no, men_no, boys_no, girls_no, unisex_no;

-- most discounted products
SELECT Product_Type, ROUND(AVG(((Variant_Compare_At_Price - Variant_Price)*100)/Variant_Compare_At_Price), 2) as discount_percent
FROM fashion_inventory_clean
WHERE Variant_Price < Variant_Compare_At_Price
GROUP BY Product_Type
ORDER BY discount_percent DESC
LIMIT 1;

-- most stocked product
SELECT Product_Type, COUNT(*) as no_in_inventory
FROM fashion_inventory_clean
WHERE Is_In_Stock = 'In Stock'
GROUP BY Product_Type
ORDER BY no_in_inventory DESC
LIMIT 1;

-- BUSINESS PROBLEMS
-- Which products are often out of stock?
SELECT Product_Type, Count(*) as outofstock_count
FROM fashion_inventory_clean
WHERE Is_In_Stock = 'Out Of Stock'
GROUP BY Product_Type
ORDER BY outofstock_count DESC;

-- Which brands are often out of stock?
SELECT Brand, Count(*) as outofstock_count
FROM fashion_inventory_clean
WHERE Is_In_Stock = 'Out Of Stock'
GROUP BY Brand
ORDER BY outofstock_count DESC;

-- Which products are often out of stock?
SELECT Product_Type, Count(*) as outofstock_count
FROM fashion_inventory_clean
WHERE Is_In_Stock = 'Out Of Stock'
GROUP BY Product_Type
ORDER BY outofstock_count DESC;

-- Whether discounted items are still being ignored by buyers
-- Distribution of stock status for items on sale
SELECT On_Sale, Is_In_Stock, COUNT(*) AS Item_Count
FROM fashion_inventory_clean
GROUP BY On_Sale, Is_In_Stock
ORDER BY On_Sale, Is_In_Stock;

-- How features like size, color, and "ideal for" affect product availability
-- Stock status by size
SELECT Size, Is_In_Stock, COUNT(*) AS Item_Count
FROM fashion_inventory_clean
GROUP BY Size, Is_In_Stock
ORDER BY Item_Count DESC;

-- Stock status by color
SELECT Dominant_Color, Is_In_Stock, COUNT(*) AS Item_Count
FROM fashion_inventory_clean
GROUP BY Dominant_Color, Is_In_Stock
ORDER BY Dominant_Color, Is_In_Stock;

SELECT Dominant_Color, COUNT(Dominant_Color)
FROM fashion_inventory_clean
GROUP BY Dominant_Color
ORDER BY COUNT(Dominant_Color) DESC;

-- Stock status by Ideal_For (Women, Girls, etc.)
SELECT Ideal_For, Is_In_Stock, COUNT(*) AS Item_Count
FROM fashion_inventory_clean
GROUP BY Ideal_For, Is_In_Stock
ORDER BY Ideal_For, Is_In_Stock;

SELECT COUNT(DISTINCT Product_Type)
FROM fashion_inventory_clean;

SELECT AVG(Variant_Price)
FROM fashion_inventory_clean
WHERE Ideal_For = "Women";

SELECT AVG(Variant_Price)
FROM fashion_inventory_clean
WHERE Ideal_For = "Men";

SELECT STDDEV(Variant_Price)
FROM fashion_inventory_clean
WHERE Ideal_For = "Women";

SELECT STDDEV(Variant_Price)
FROM fashion_inventory_clean
WHERE Ideal_For = "Men";



