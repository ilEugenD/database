-- 1. Получение списка клиентов с их адресами
SELECT c.Client_ID, c.First_name, c.Second_name, 
       addr.Address
FROM Clients c
LEFT JOIN Addresses addr ON c.Client_ID = addr.Client_ID;

-- 2. Получение списка клиентов с их счетами
SELECT c.Client_ID, c.First_name, c.Second_name, 
       acc.Account_number
FROM Clients c
LEFT JOIN Accounts acc ON c.Client_ID = acc.Client_ID;

-- 3. Получение списка клиентов с их контрактами за последний месяц
SELECT c.Client_ID, c.First_name, c.Second_name, 
       MAX(con.Date_of_singing) AS Last_contract_date
FROM Clients c
LEFT JOIN Contracts con ON c.Client_ID = con.Client_ID
WHERE con.Date_of_singing >= NOW() - INTERVAL '1 month'
GROUP BY c.Client_ID, c.First_name, c.Second_name;
