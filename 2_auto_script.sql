--
INSERT INTO Clients (Client_ID, First_name, Second_name, Middle_name, Passport_number, Birth_date)
SELECT
    generate_series(1, 100) AS Client_ID,
    (ARRAY['Иван', 'Петр', 'Алексей', 'Сергей', 'Дмитрий', 'Андрей', 'Михаил', 'Николай', 'Владимир', 'Александр'])[floor(random() * 10 + 1)] AS First_name,
    (ARRAY['Иванов', 'Петров', 'Сидоров', 'Смирнов', 'Кузнецов', 'Васильев', 'Попов', 'Новиков', 'Федоров', 'Морозов'])[floor(random() * 10 + 1)] AS Second_name,
    (ARRAY['Иванович', 'Петрович', 'Алексеевич', 'Сергеевич', 'Дмитриевич', 'Андреевич', 'Михайлович', 'Николаевич', 'Владимирович', 'Александрович'])[floor(random() * 10 + 1)] AS Middle_name,
    '2202' || lpad((floor(random() * 1000000))::text, 6, '0') AS Passport_number,
    DATE '1950-01-01' + (random() * (DATE '2000-01-01' - DATE '1950-01-01'))::INT AS Birth_date;
--
INSERT INTO Addresses (Address_ID, Client_ID, Address)
SELECT
    generate_series(1, 100) AS Address_ID,
    generate_series(1, 100) AS Client_ID,
    (ARRAY['ул. Ленина, д. 10', 'ул. Пушкина, д. 5', 'ул. Гагарина, д. 15', 'ул. Садовая, д. 20', 'ул. Мира, д. 30'])[floor(random() * 5 + 1)] AS Address;
--
INSERT INTO Contracts (Contract_number, Date_of_singing, Client_ID)
SELECT
    generate_series(1, 100) AS Contract_number,
    DATE '2020-01-01' + (random() * (DATE '2023-01-01' - DATE '2020-01-01'))::INT AS Date_of_singing,
    generate_series(1, 100) AS Client_ID;
--
INSERT INTO Accounts (Account_number, Client_ID)
SELECT
    generate_series(1, 100) AS Account_number,
    generate_series(1, 100) AS Client_ID;
