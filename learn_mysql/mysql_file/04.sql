/*
第4章 检索数据

*/
-- 查询所有产品的名称
SELECT prod_name FROM products;

-- 查询产品表中产品ID、产品名称和产品价格
SELECT prod_id,prod_name,prod_price FROM products;

-- 查询产品表中的所有列
SELECT * FROM products;

-- 查询产品表中的供应商ID
SELECT vend_id FROM products;

-- 查询产品表中不重复的供应商ID
SELECT DISTINCT vend_id FROM products;

-- 获取产品表中的前5个产品名称
SELECT prod_name FROM products LIMIT 5;

-- 下标从0开始
-- 获取产品表中从第6个开始的5个产品名称
SELECT prod_name FROM products LIMIT 5,5;

-- 查询产品表中的第4条到第8条的产品名称
-- 使用OFFSET关键字来指定开始行的位置
SELECT prod_name FROM products LIMIT 5 OFFSET 3;

-- 显示产品表中的产品名称，此查询省略了FROM关键字的表名前缀，是合法的但不推荐
SELECT products.prod_name FROM products;

-- 显示crashcourse schema下的产品表中的产品名称，明确指出了schema名
SELECT products.prod_name FROM crashcourse.products;

