/*
 第10章 创建计算字段
 */

/*
 拼接(concatenate)
 MySQL用CONCAT()函数
 多数DBMS，用+或||操作符来拼接字符串。
 */

-- 查询并显示供应商的名称和国家信息
SELECT CONCAT(vend_name, ' (', vend_country, ')') -- 将供应商名称和国家信息合并为一个字符串
FROM vendors -- 从供应商表中选取数据
ORDER BY vend_name;
-- 按供应商名称对结果进行排序

/*
 RTRIM():删除右边多余的空格
 LTRIM():删除左边多余的空格
 TRIM():删除左右两边多余的空格
 */
-- 按照供应商名称（带国家信息）进行排序
-- 该查询将供应商名称与他们的国家信息结合起来，并在末尾加上括号，
-- 然后按照供应商名称排序。
SELECT CONCAT(RTRIM(vend_name), '(', vend_country, ')')
FROM vendors
ORDER BY vend_name;

-- 同前一个查询类似，但是为结果列起了一个别名
-- 这个查询与第一个查询相同，但它为最终结合了供应商名称和国家信息的那列起了一个别名“vend_title”。
SELECT CONCAT(RTRIM(vend_name), '(', vend_country, ')') AS vend_title
FROM vendors
ORDER BY vend_name;

-- 获取指定订单号的所有商品信息
-- 此查询返回订单号为20005的所有商品的ID、数量和单价。
SELECT prod_id, quantity, item_price
FROM orderitems
WHERE order_num = 20005;

-- 计算指定订单号中每个商品的扩展价格
-- 这个查询在原有商品信息的基础上，计算了每个商品的扩展价格（即数量乘以单价），
-- 仅限于订单号为20005的商品。
SELECT prod_id,
       quantity,
       item_price,
       quantity * item_price AS expanded_price -- 计算商品总价格
FROM orderitems
WHERE order_num = 20005;


/*
 SELECT可省略FROM，以处理表达式
 */
-- 简单的数学计算，返回两个数字3和2的乘积。
SELECT 3 * 2;

-- 使用TRIM函数去掉字符串'  ASD  '两端的空格。
SELECT TRIM('  ASD  ');
