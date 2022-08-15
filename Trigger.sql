CREATE OR REPLACE FUNCTION pn.blokady_kontrahenci()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
-- Zablokowanie dodania kontrahenta w kategorii "Dostawcy", jeśli nie będzie uzupełniony handlowiec
IF
	NEW.czy_dostawca = 1 and  (select count(*) from TABELA where id_kontrahenta = NEW.id_kontrahenta) = 0
THEN
 	RAISE EXCEPTION 'Brak dodanego handlowca.';
END IF;

RETURN NEW;
END;
$BODY$;
ALTER FUNCTION pn.blokady_kontrahenci()
    OWNER TO postgres;
