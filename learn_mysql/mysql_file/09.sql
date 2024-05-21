/*
第9章 正则表达式
regexp: regular expression
*/

-- 查询产品表中产品名称含有'1000'字样的产品名称，并按产品名称排序。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000'
ORDER BY prod_name;


-- 查询产品表中产品名称以任意字符开头，后跟三个0的产品名称，并按产品名称排序。
-- 注：'.000'正则表达式中，'.'表示任意单个字符。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '.000'
ORDER BY prod_name;


# 默认不区分大小写
# 若想大小写，用BSELECT prod_name
-- 查询产品名中包含"JetPack .000"的产品，其中'.'表示任意字符
SELECT prod_name
FROM products
WHERE prod_name REGEXP BINARY 'JetPack .000'
ORDER BY prod_name;

-- 查询产品名中包含"1000"、"2000"或"3000"的产品
SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000|2000|3000' -- "1000"、"2000"或"3000"
ORDER BY prod_name;

-- 查询产品名中以"1"、"2"或"3"开头且紧接着是" Ton"的产品
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[123] Ton' -- "1 Ton"、"2 Ton"或"3 Ton"
ORDER BY prod_name;

-- 查询产品名中包含"1 Ton"、"2 Ton"或"3 Ton"的产品
SELECT prod_name
FROM products
WHERE prod_name REGEXP '1|2|3 Ton' -- "1"、"2"或"3 Ton"
ORDER BY prod_name;



-- 查询产品表中产品名称含有"Ton"但不以数字1、2、3开头的产品名称，
-- 并按产品名称排序的结果集。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[^123] Ton' -- 筛选条件：产品名称中包含"Ton"，但开头不是1、2、3的记录
ORDER BY prod_name; -- 结果按照产品名称进行排序


-- 查询产品表中产品名称含有"1 Ton"到"5 Ton"之间字符的产品名称，并按产品名称排序。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[1-5] Ton'
ORDER BY prod_name;

-- 查询供应商表中供应商名称含有任意字符的供应商名称，并按供应商名称排序。
SELECT vend_name
FROM vendors
WHERE vend_name REGEXP '.'
ORDER BY vend_name;


/*转义字符，用\\（MySQL用一个，正则表达式库用一个）
\\f  换页
\\n  换行
\\r  回车
\\t  制表
\\v  纵向制表
*/
-- 查询vendors表中名称包含点号（.）的所有vendor
SELECT vend_name
FROM vendors
-- 使用REGEXP匹配包含点号的vend_name
WHERE vend_name REGEXP '\\.'
-- 对结果按vend_name升序排序
ORDER BY vend_name;


/*字符类（character class）
  [:alnum:]  任意数字和字母，同[a-zA-Z0-9]
  [:alpha:]  任意字母，同[a-zA-Z]
  [:blank:]  任意空格，同[ \t]
  [:cntrl:]  任意控制字符，同[\x00-\x1F\x7F]
  [:digit:]  任意数字，同[0-9]
  [:graph:]  任意可打印字符，同[!-~]
  [:lower:]  任意小写字母，同[a-z]
  [:print:]  任意可打印字符，同[ -~]
  [:punct:]  任意标点符号，同[!-/:-@[-`{-~]
  [:space:]  任意空白字符，同[\t\n\v\f\r ]
  [:upper:]  任意大写字母，同[A-Z]
  [:xdigit:]  任意16进制数字，同[0-9A-Fa-f]
  [:word:]  任意单词字符，同[A-Za-z0-9_]
  [:^alnum:]  任意非数字和字母
*/

/* 匹配多个实例
   *  0个或多个匹配
   +  1个或多个匹配，等价于{1,}
   ?  0个或1个匹配，等价于{0,1}
   {n}  n个匹配
   {n,}  n个或多个匹配
   {n,m}  n到m个匹配
 */

-- 查询产品名称中包含特定格式数字信息的产品。
-- 该查询会返回产品表中，产品名称里包含形如"(数字个数 sticks)"字符串的所有产品名称，并按名称排序。
-- 其中，数字个数可以是1到9之间的任意数字，sticks可以是stick的单数或复数形式。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '\\([0-9] sticks?\\)'
ORDER BY prod_name;

-- 查询产品名称中包含连续四位数字的产品。
-- 该查询返回产品表中，产品名称包含连续四个数字的所有产品名称，并按名称排序。
-- 使用正则表达式'[[:digit:]]{4}'来匹配连续的四位数字。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[[:digit:]]{4}'
ORDER BY prod_name;

-- 查询产品名称中包含四位数字的产品。
-- 与上一个查询类似，但此处使用'[0-9][0-9][0-9][0-9]'的正则表达式，显式指明匹配的数字范围。
-- 返回结果为产品表中，产品名称包含具体四位数字的所有产品名称，并按名称排序。
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[0-9][0-9][0-9][0-9]'
ORDER BY prod_name;


/* 匹配特定位置的文本--定位符
   ^  文本的开始（与取反符号相同）
   $  文本的结束
   [[:<:]]  词的开始
   [[:>:]]  词的结束
 */

-- 查询产品表中以数字或小数点开头的产品名称
SELECT prod_name
FROM products
WHERE prod_name REGEXP '^[0-9\\.]' -- 筛选以数字或小数点开头的prod_name
ORDER BY prod_name; -- 对结果进行名称排序
