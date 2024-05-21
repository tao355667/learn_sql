/*
第8章 用通配符进行过滤

*/
/*
%通配符
要配置是否区分大小写
注意首尾的空格
*/
-- 查询产品表中产品名称以"jet"开头的所有产品ID和名称，不区分大小写
SELECT prod_id,prod_name
FROM products
WHERE prod_name LIKE 'jet%';

-- 查询产品表中产品名称包含"anvil"的所有产品ID和名称
SELECT prod_id,prod_name
FROM products
WHERE prod_name LIKE '%anvil%';

-- 查询产品表中产品名称以"s"开头且以"e"结尾的所有产品名称
SELECT prod_name
FROM products
WHERE prod_name LIKE 's%e';

/*
_通配符
*/
-- 查找产品名称中包含" _ ton anvil "模式的所有产品ID和名称。
-- 此查询特别寻找产品名中以一个任意字符开头，后跟" ton anvil "的字符串。
SELECT prod_id,prod_name
FROM products
WHERE prod_name LIKE '_ ton anvil';

-- 查找产品名称中以任意字符开头和结尾，中间包含" ton anvil "的所有产品ID和名称。
-- 这个查询比第一个更宽松，因为它在" ton anvil "模式的前后都可以接受任意字符。
SELECT prod_id,prod_name
FROM products
WHERE prod_name LIKE '% ton anvil';


