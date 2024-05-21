/*
第6章 过滤数据
SELECT

WHERE 操作符
=，等于
<>，不等于
!=，不等于
<，小于
<=，小于等于
>，大于
>=，大于等于
BETWEEN,两个值之间

*/
/*
6.2.1 检查单个值
*/

-- 查询价格为2.5的产品名称和价格
SELECT prod_name, prod_price
FROM products
WHERE prod_price = 2.5;

-- 查询产品名称为'fuses'的产品名称和价格，不区分大小写
SELECT prod_name, prod_price
FROM products
WHERE prod_name = 'fuses';

-- 查询价格小于10的产品名称和价格
SELECT prod_name, prod_price
FROM products
WHERE prod_price < 10;

-- 查询价格小于等于10的产品名称和价格
SELECT prod_name, prod_price
FROM products
WHERE prod_price <= 10;

/*
6.2.2 不匹配检查
*/
-- 查询除 vend_id 为 1003 之外的所有产品的 vend_id 和 prod_name。
SELECT vend_id,prod_name
FROM products
WHERE vend_id <> 1003;


-- 与上面的查询相同，只是使用了不同的不等号（!=）来排除 vend_id 为 1003 的产品。
SELECT vend_id,prod_name
FROM products
WHERE vend_id != 1003;


/*
6.2.3 范围值检查
*/

-- 查询产品表中价格在5到10之间的产品名称和价格
SELECT prod_name,prod_price
FROM products
WHERE prod_price BETWEEN 5 AND 10;

/*
6.2.3 空值检查
*/

-- 查询产品表中价格为空的所有产品名称
SELECT prod_name
FROM products
WHERE prod_price IS NULL;

-- 查询客户表中电子邮件为空的所有客户ID
SELECT cust_id
FROM customers
WHERE cust_email IS NULL;
