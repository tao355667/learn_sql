/*
 第12章 汇总数据
 关键词：聚集函数（aggregate function）
 */

/* SQL聚集函数
AVG():返回某列的平均值
COUNT():返回某列中的行数
MAX():返回某列中的最大值
MIN():返回某列中的最小值
SUM():返回某列中的和
*/
-- 计算产品表中所有产品的平均价格
SELECT AVG(prod_price) AS avg_price
FROM products;

-- 计算产品表中供应商ID为1003的产品的平均价格
SELECT AVG(prod_price) AS avg_price
FROM products
WHERE vend_id = 1003;

-- 计算客户表中的客户总数
SELECT COUNT(*) AS num_cust
FROM customers;

-- 计算客户表中具有电子邮件地址的客户数量
SELECT COUNT(cust_email) AS num_cust
FROM customers;

-- 计算产品表中最高产品价格
SELECT MAX(prod_price) AS max_price
FROM products;

-- 计算产品表中最低产品价格
SELECT MIN(prod_price) AS min_price
FROM products;

-- 计算订单号为20005的订单中的商品总数
SELECT SUM(quantity) AS items_ordered
FROM orderitems
WHERE order_num = 20005;

-- 计算订单号为20005的订单的总价格
SELECT SUM(item_price*quantity) AS total_price
FROM orderitems
WHERE order_num = 20005;

-- 计算产品表中供应商ID为1003的不同产品的平均价格
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id = 1003;

-- 计算产品表中的产品总数，最低价格，最高价格和平均价格
SELECT COUNT(*) AS num_items,
       MIN(prod_price) AS price_min,
       MAX(prod_price) AS price_max,
       AVG(prod_price) AS price_avg
FROM products;







