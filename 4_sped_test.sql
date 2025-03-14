EXPLAIN ANALYZE
INSERT INTO Clients (Client_ID, First_name, Second_name, Middle_name, Passport_number, Birth_date)
SELECT
    generate_series(1, 5000) AS Client_ID,
    (ARRAY['Иван', 'Петр', 'Алексей', 'Сергей', 'Дмитрий', 'Андрей', 'Михаил', 'Николай', 'Владимир', 'Александр'])[floor(random() * 10 + 1)] AS First_name,
    (ARRAY['Иванов', 'Петров', 'Сидоров', 'Смирнов', 'Кузнецов', 'Васильев', 'Попов', 'Новиков', 'Федоров', 'Морозов'])[floor(random() * 10 + 1)] AS Second_name,
    (ARRAY['Иванович', 'Петрович', 'Алексеевич', 'Сергеевич', 'Дмитриевич', 'Андреевич', 'Михайлович', 'Николаевич', 'Владимирович', 'Александрович'])[floor(random() * 10 + 1)] AS Middle_name,
    'AB' || lpad((floor(random() * 1000000))::text, 6, '0') AS Passport_number,
    DATE '1950-01-01' + (random() * (DATE '2000-01-01' - DATE '1950-01-01'))::INT AS Birth_date;
