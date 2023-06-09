
use MDLP
--select top 100 * from [MDLP]..[MDLP_REESTR_BRANCHES_for_Elma]

drop table [APG].[dbo].[MDLP_NEW]


select --top 100
iif(short_pharmacy_chain is null,short_org_name, short_org_name + ' (' + short_pharmacy_chain + ')') as 'Name [__name]',
'вставить код БРИКА !!!' as 'Брик [APG_Locality]',
'Создать АДРЕС !!!' as 'Адрес [APG_Address]',
id as 'MDLP_Id [mdlp_id]',
org_name as 'MDLP_org_name [mdlp_org_name]',
inn as 'APG_ITN_Pharmacy [apg_itn_pharmacy]',
Адрес as 'dadata_value [dadata_value]',
Индекс as 'dadata_postal_code [dadata_postal_code]',
[КЛАДР-код] as 'dadata_kladr_id [dadata_kladr_id]',
[ФИАС-код] as 'dadata_fias_id [dadata_fias_id]',
[Код ОКАТО] as 'dadata_okato [dadata_okato]',
[Код ОКТМО] as 'dadata_oktmo [dadata_oktmo]',
Широта as 'location_Geolocation__Latitude__s [location_Geolocation__Latitude__s]',
Долгота as 'location_Geolocation__Longitude__s [location_Geolocation__Longitude__s]',
'[a954c23d-59a9-4d7a-87f0-3c64e735be84]' as 'Тип записи [RecordTypeId]',
'Да [true]' as 'Активно [IsActive]',
'B [b]' as 'Категория (Rx) [Division_General_Account_Category]',
'**********' as '*filler*',
APG_Locality_unique_name__c as 'Брик',
[Тип города],
[Город],
[Тип н/п],
[Н/п],
[Адм. округ],
[Район города],
[Тип улицы],
[Улица],
[Тип дома],
[Дом],
[Тип корпуса/строения],
[Корпус/строение]

INTO [APG].[dbo].[MDLP_NEW]

from [MDLP]..[MDLP_REESTR_BRANCHES_for_Elma]
where short_org_name is not null

-------------------
--select top 10 * from [172.21.114.201].[ELMA_DB]..[ELMA_TABLE_Companies]



--select top 100 * from [MDLP]..[MDLP_REESTR_BRANCHES_for_Elma] where id = '00000000158029'
