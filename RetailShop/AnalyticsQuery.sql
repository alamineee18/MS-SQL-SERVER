USE RetailShop;

BACKUP DATABASE RetailShop
TO DISK = 'D:\MS-SQL-SERVER\RetailShop\RetailShop.bak'
WITH DIFFERENTIAL;

SELECT DISTINCT Position FROM retail.Employees;