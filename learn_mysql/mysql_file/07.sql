/*
第7章 数据过滤
WHERE
NOT IN
*/

/*
 * 查询指定供应商ID为1003，且产品价格不超过10的产品信息
 * 返回值包含产品ID，产品价格和产品名称
 */
SELECT prod_id, prod_price, prod_name
FROM products
WHERE vend_id = 1003
  AND prod_price <= 10;

/*
 * 查询供应商ID为1002或1003的所有产品信息，侧重于产品名称和价格
 * 返回值包含产品名称和产品价格
 */
SELECT prod_name, prod_price
FROM products
WHERE vend_id = 1002
   OR vend_id = 1003;


# AND比OR优先级高，先执行AND，再执行OR
-- 查询由特定供应商提供的产品信息，这些供应商的ID是1002或1003，且产品价格大于等于10。
-- 返回产品名称和价格。
SELECT prod_name, prod_price
FROM products
WHERE vend_id = 1002
   OR vend_id = 1003 AND prod_price >= 10;

-- 以更简洁的方式重构上述查询，使用括号明确分组条件。
-- 返回产品名称和价格。
SELECT prod_name, prod_price
FROM products
WHERE (vend_id = 1002 OR vend_id = 1003)
  AND prod_price >= 10;

-- 查询由供应商ID为1002或1003提供的所有产品信息，并按产品名称排序。
-- 返回产品名称和价格。
SELECT prod_name, prod_price
FROM products
WHERE vend_id IN (1002, 1003)
ORDER BY prod_name;


# IN与OR功能相同
-- 查询 vend_id 为 1002 或 1003 的产品名称和价格，并按产品名称排序
SELECT prod_name, prod_price
FROM products
WHERE vend_id = 1002
   OR vend_id = 1003
ORDER BY prod_name;

-- 查询 vend_id 不为 1002 或 1003 的产品名称和价格，并按产品名称排序
SELECT prod_name, prod_price
FROM products
WHERE vend_id NOT IN (1002, 1003)
ORDER BY prod_name;

# NOT常见搭配：NOT IN,NOT BETWEEN,NOT EXISTS,NOT LIKE,NOT REGEXP