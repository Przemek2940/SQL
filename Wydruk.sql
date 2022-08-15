select distinct k.opis, ir3.nazwa_rodzaju,
(select sum(dp.cena-dp.korekta_ceny) as eksport
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELA ind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 4 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3),

(select sum(dp.cena-dp.korekta_ceny) as pozkontr
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELA ind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 7 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3),

(select sum(dp.cena-dp.korekta_ceny) as region1
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELA ind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 1 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3),

(select sum(dp.cena-dp.korekta_ceny) as region2
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELA ind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 2 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3),

(select sum(dp.cena-dp.korekta_ceny) as region3
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELAind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 3 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3),

(select sum(dp.cena-dp.korekta_ceny) as region4
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELA ind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 10 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3),

(select sum(dp.cena-dp.korekta_ceny) as region5
	from TABELA dn
		left join TABELA dp on dp.id_naglowka = dn.id
		left join TABELA kon on dn.kontrahent = kon.id_kontrahenta
		left join TABELA ind on dp.id_indeksu = ind.id_indeksu
		left join TABELA kkr on ind.id_indeksu = kkr.id_towaru
		left join TABELA kk on kkr.id_naglowka = kk.id
	where dn.symbol = 'Wz' and dn.rok = dnn.rok and dn.miesiac = dnn.miesiac
		and kon.id_rodzaju2 = 11 and kon.id_rodzaju1 = kont.id_rodzaju1
		and kkr.id_naglowka = kr.id_naglowka and ind.rodzaj_materialu3 = i.rodzaj_materialu3)

from TABELA i
	left join TABELA kr on i.id_indeksu = kr.id_towaru
	left join TABELA k on kr.id_naglowka = k.id
	left join TABELA dpp on i.id_indeksu = dpp.id_indeksu
	left join TABELA dnn on dpp.id_naglowka = dnn.id
	left join TABELA kont on dnn.kontrahent = kont.id_kontrahenta
	left join TABELA  ir3 on ir3.id_rodzaju = i.rodzaj_materialu3
where dnn.symbol = 'Wz'
	and dnn.rok = @PARAMETR1@
	and dnn.miesiac =  @PARAMETR2@
	and kont.id_rodzaju1 = $ADM_SQL:POLE1$
