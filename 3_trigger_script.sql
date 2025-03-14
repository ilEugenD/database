CREATE OR REPLACE FUNCTION notify_clients_changes()
RETURNS TRIGGER AS $$
BEGIN
    -- Если операция - DELETE
    IF (TG_OP = 'DELETE') THEN
        RAISE NOTICE 'Удален клиент: Client_ID=%, First_name=%, Second_name=%, Passport_number=%',
            OLD.Client_ID, OLD.First_name, OLD.Second_name, OLD.Passport_number;
    
    -- Если операция - INSERT
    ELSIF (TG_OP = 'INSERT') THEN
        RAISE NOTICE 'Добавлен новый клиент: Client_ID=%, First_name=%, Second_name=%, Passport_number=%',
            NEW.Client_ID, NEW.First_name, NEW.Second_name, NEW.Passport_number;
    
    -- Если операция - UPDATE
    ELSIF (TG_OP = 'UPDATE') THEN
        RAISE NOTICE 'Обновлен клиент: Client_ID=%, Старое имя=%, Новое имя=%, Старая фамилия=%, Новая фамилия=%',
            NEW.Client_ID, OLD.First_name, NEW.First_name, OLD.Second_name, NEW.Second_name;
    END IF;

    RETURN NEW;  -- Для INSERT и UPDATE возвращаем NEW, для DELETE возвращаем OLD
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER clients_notify_trigger
AFTER INSERT OR UPDATE OR DELETE ON Clients
FOR EACH ROW
EXECUTE FUNCTION notify_clients_changes();
