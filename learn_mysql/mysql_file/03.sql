/*
第3章 使用MySQL

*/

-- 展示所有的数据库
SHOW DATABASES;

-- 切换到名为crashcourse的数据库
USE crashcourse;

-- 显示当前数据库中的所有表
SHOW TABLES;

-- 显示表customers的列
SHOW COLUMNS FROM customers;

-- 显示当前MySQL服务器的状态信息，包括各种服务器变量的值和状态。
SHOW STATUS;

-- 显示创建指定数据库的SQL语句。
-- 参数：crashcourse（数据库名）
-- 返回值：创建数据库的SQL语句
SHOW CREATE DATABASE crashcourse;

-- 显示创建指定表的SQL语句。
-- 参数：customers（表名）
-- 返回值：创建表的SQL语句
SHOW CREATE TABLE customers;

-- 显示当前的错误信息。
SHOW ERRORS;

-- 显示当前的警告信息。
SHOW WARNINGS;
