/*
第5章 排序检索数据
SELECT

ORDER BY
    ASC,DESC
LIMIT
    5
    5,3
    3 OFFSET 5
*/


-- 查询所有产品的名称
SELECT prod_name FROM products;

-- 按产品名称排序查询所有产品的名称
SELECT prod_name FROM products ORDER BY prod_name;

-- 查询产品ID、价格和名称，并按价格和名称排序
SELECT prod_id,prod_price,prod_name
FROM products
ORDER BY prod_price,prod_name;

-- 查询产品ID、价格和名称，并按价格降序排序
SELECT prod_id,prod_price,prod_name
FROM products
ORDER BY prod_price DESC;

-- 先按价格降序，再按名称排序查询产品ID、价格和名称
SELECT prod_id,prod_price,prod_name
FROM products
ORDER BY prod_price DESC,prod_name;

-- DESC(descend),ASC(ascend)
-- 先按价格降序，再按名称升序排序查询产品ID、价格和名称
SELECT prod_id,prod_price,prod_name
FROM products
ORDER BY prod_price DESC,prod_name ASC;

-- A和a的排序，用ORDER BY子句做不到


-- 获取产品表中价格最高的产品价格
SELECT prod_price
FROM products
ORDER BY prod_price DESC -- 按产品价格降序排列
LIMIT 1; -- 只返回排列后的第一行，即最高价格的产品
