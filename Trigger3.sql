CREATE OR REPLACE FUNCTION statuspodmiotuvat_zcrm()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
IF
	(select trim(nip_ue) from TABELA_KONTRAHENCI where id_kontrahenta = NEW.id_kontrahenta) <> ''
	and NEW.rodzaj = -1
	and OLD.status = 0
	and NEW.status = 1
	and g.ifnull(
		(select max(kw.data)
		 from TABELAWEZWANIA kw 
		 where kw.id_kontrahenta = (select case when 
                                  NEW.id_kontrahenta in (select id_kontrahenta from TABELA_CRM where id_kontrahenta = NEW.id_kontrahenta)
									              then 
									 	              (select id from TABELA_CRM
										              where id_kontrahenta = NEW.id_kontrahenta)
									              else
										              NEW.id_kontrahenta
									              end) 
		 							and kw.informacjadodatkowa = 'Poprawny')
	 , 0) <> sqldata(current_date)
then
	raise exception 'Sprawdź status podmiotu VAT UE';
END IF;

RETURN NEW;
END;
$BODY$;
