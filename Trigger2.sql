CREATE OR REPLACE FUNCTION pn.blokady_materialy()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
-- Zablokowanie dodania indeksu w kategorii "Materiały", jeśli w indeksie nie będzie uzupełniona jednostka miary
IF
	NEW.klasyfikacjatowaru = 3 and NEW.jm2 = ''
THEN
 	RAISE EXCEPTION 'Pole Domyślna Jm opak. jest puste.';
END IF;

-- Zablokowanie dodania indeksu w kategorii "Materiały", jeśli w indeksie nie będzie uzupełniony dostawca
IF
	NEW.klasyfikacjatowaru = 3 and (select count(*) from g.gm_indeksy_dostawcy where id_materialu = NEW.id_indeksu) = 0
	THEN
 	RAISE EXCEPTION 'Brak dostawcy.';
END IF;

-- Zablokowanie dodania indeksu w kategorii "Materiały", jeśli kwalifikacja zamówienia ustawiona jest na inną niż Stan minimalny
IF
	NEW.klasyfikacjatowaru = 3 and NEW.zamowienie_kwalifikacja <> 1
THEN
 	RAISE EXCEPTION 'Wybrano nieprawidłową kwalifikację zamówienia.';
END IF;

RETURN NEW;
END;
$BODY$;
ALTER FUNCTION pn.blokady_materialy()
    OWNER TO postgres;