/*
 第11章 使用数据处理函数
 */

/* 常用的文本处理函数
LEFT(),返回串左边的字符
RIGHT(),返回串右边的字符
LEHGTH(),返回串的长度
LOCAT(),返回串中子串的位置
LOWER(),返回串的小写形式
UPPER(),返回串的大写形式
TRIM(),删除串两端的空格
LTRIM(),删除串左边的空格
RTRIM(),删除串右边的空格
SOUNDEX(),返回串的音译形式
SUBSTRING(),返回串中子串
*/

-- 该SQL查询从"vendors"表中选择供应商名称，并将其与大写形式的名称一起显示
SELECT vend_name,
       UPPER(vend_name) AS vend_name_upcase-- 使用UPPER函数将vend_name转换为大写
FROM vendors
ORDER BY vend_name;-- 按照供应商名称排序结果

-- 查询客户表中联系人为'Y Lie'的客户名称和联系信息
SELECT cust_name, cust_contact
FROM customers
WHERE cust_contact = 'Y Lie';

-- 使用SOUNDEX声音匹配方法查询客户表中联系人与'Y Lie'声音相似的客户名称和联系信息
SELECT cust_name, cust_contact
FROM customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Y Lie');

-- 查询2005年9月1日当天订单表中的客户ID和订单号
SELECT cust_id, order_num
FROM orders
WHERE order_date = '2005-09-01';

-- 查询2005年9月份（包括9月1日和9月30日）订单表中的客户ID和订单号
SELECT cust_id, order_num
FROM orders
WHERE order_date BETWEEN '2005-09-01' AND '2005-09-30';


/*
DATE():获取日期
TIME():获取时间
YEAR():获取年份
MONTH():获取月份
HOUR():获取小时
MINUTE():获取分钟
SECOND():获取秒
*/
-- 查询2005年9月份的客户订单信息
SELECT cust_id, order_num
FROM orders
WHERE YEAR(order_date) = 2005 -- 筛选订单日期为2005年的记录
  AND MONTH(order_date) = 9;
-- 限定月份为9月


/* 常用数值处理函数
ABS():返回一个数的绝对值
COS():返回一个数的余弦值
EXP():返回计算自然对数的底数 e (约2.718281828) 的指数幂。
MOD():返回两个数的余数
PI():返回π (约3.141592654)
RAND():返回0.0到1.0之间的随机数
SIN():返回一个数的正弦值
SQRT():返回一个数的平方根
TAN():返回一个数的正切值
*/

