Select * from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] where 
APG_Locality_Name in (select APG_Locality_Name from ELMA_DB..ELMA_TABLE_APG_Locality where APG_Locality_User_allocated_4 = 'aecd2c42-3143-4aa8-9216-890ac20df53a')
and Contacts_APG_Specialty = 'Дерматология'


Select [Contacts_id],Contacts_APG_Specialty,[Contacts_Division_General_Contact_Target],[Contacts_Division_General_Contact_Category],[Contacts_APG_Responsible_General_Contact_User] from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] where 
[Contacts_APG_Responsible_General_Contact_User] in (select [Users_id] from  [dbo].[ELMA_VIEW_UsersStructDetails] where [UserDetails_Type] = 'KAM')
and Contacts_APG_Specialty = 'Дерматология' and [Contacts_Division_General_Contact_Target] = 'true' and [Contacts_Division_General_Contact_Category] <> '3'


Select Contacts_id,[Contacts_Division_General_Contact_Target],APG_Locality_Name from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] where 
APG_Locality_Name in ('Москва - Арбат','Москва - Пресненский','Москва - Хамовники','Москва - Якиманка')

Select Contacts_id,APG_Locality_Name from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] where 
[APG_Locality_Area] = 'Ростовская область' and Contacts_APG_Specialty = 'Педиатрия'



Select [Contacts_id],[Contacts_Division_General_Contact_Category],[APG_Locality_Business_Trip_City] from  [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] where  [Contacts_Division_General_Contact_Category] <> '3' and [APG_Locality_Business_Trip_City] = 'true'


select * from [dbo].[ELMA_VIEW_UsersStructDetails] order by Users_Name




select * from [dbo].[ELMA_VIEW_UsersStructDetails] order by Users_Name

select Users_Name,Users_Id from [dbo].[ELMA_VIEW_UsersStructDetails] order by Users_Name

select * from [dbo].[ELMA_TABLE_Users] order by Users_Name

Users_Name
Select * from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] where Contacts_APG_Responsible_General_Contact_User = '944eb9e9-6614-4567-84b9-f75a42469573'

Select Contacts_id,APG_Locality_Area from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality]
 where Contacts_APG_Responsible_General_Contact_User = '7abc9ee3-0320-4aad-9b20-4ed082f17a6f'

 Select Contacts_id,APG_Locality_Area from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality]
 where Contacts_APG_Responsible_General_Contact_User in ('7d0b373b-f404-4f6a-82d5-96bb19272627', 'b5a4e35b-c8d3-4c70-8247-9394059179dc')


and APG_Locality_Area = 'Калининградская область'

APG_Locality_Name
Иркутск - Октябрьский

APG_Locality_Area
Иркутская область

Contacts_id
ef37fc03-144f-4270-926a-46ab9edf2ad2

'7abc9ee3-0320-4aad-9b20-4ed082f17a6f', '7abc9ee3-0320-4aad-9b20-4ed082f17a6f'




Select Contacts_id,APG_Locality_Area from [dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality]
 where Contacts_APG_Responsible_General_Contact_User = '8b71a4dd-4028-494f-a5c3-f47298fd9f09'

 ContactId
9067C9CE-9671-435E-BEF6-4131192B4112
AccountId
739F7D3A-D475-499C-B930-697EC7C5264D

 Select * from ELMA_TABLE_Activity_2 where ContactId is null
--UPDATE ELMA_TABLE_Activity_2 set ContactId = 'NULL' where ContactId is null

 Select * from ELMA_TABLE_Activity_2 where AccountId is null
--UPDATE ELMA_TABLE_Activity_2 set AccountId = 'NULL' where AccountId is null
-------------------------------------------------------------------------------------------------------------------------------------------------------
select top 10 * from  [dbo].[ELMA_VIEW_ActivityFull]
drop table ##TT_double
drop table ##TT_activity

select [Activity_IDD],[Activity_Id],[Activity_name],[Activity_Status],[Activity_RecordType_name],[Activity_startAt],[Activity_endAt],[AccountId],[ContactId],[Users_Name] into  ##TT_activity  from  [dbo].[ELMA_VIEW_ActivityFull]
select *from ##TT_activity where [AccountId] is null
select *from ##TT_activity where [ContactId] is null
select *from ##TT_activity where [Activity_RecordType_name] is null
update ##TT_activity set [AccountId] = 'XXX' where [AccountId] is null
update ##TT_activity set [ContactId] = 'XXX' where [ContactId] is null
update ##TT_activity set [Activity_RecordType_name] = 'XXX' where [Activity_RecordType_name] is null



select [Activity_Status],[Activity_RecordType_name],[Activity_startAt],[Activity_endAt],[AccountId],[ContactId],[Users_Name],count(*) as qnt into ##TT_double  from  ##TT_activity
group by [Activity_Status],[Activity_RecordType_name],[Activity_startAt],[Activity_endAt],[AccountId],[ContactId],[Users_Name] having count(*) >1


select A.[Activity_IDD],A.[Activity_Id],A.[Activity_name],A.[Activity_Status],A.[Activity_RecordType_name],A.[Activity_startAt],A.[Activity_endAt],A.[AccountId],A.[ContactId],A.[Users_Name], qnt  from  ##TT_activity A,##TT_double T
where 
T.[Activity_startAt] = A.[Activity_startAt] and
T.[Activity_endAt] = A.[Activity_endAt] and
T.[AccountId] = A.[AccountId] and
T.[ContactId] = A.[ContactId] and
T.[Users_Name] = A.[Users_Name] and
T.[Activity_Status] = A.[Activity_Status] and
T.[Activity_RecordType_name] = A.[Activity_RecordType_name]


SELECT [to] FROM  ELMA_DB..ELMA_TABLE_ActivityData@ActivityId group by [to]

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------


select top 10 * from [SFDC_IMP_PROD].[dbo].[Contact]

select top 10 
APG_PD_Contact_agreement_status_TEXT__c
,APG_PD_Contact_agreement_Y_N__c
,APG_PD_Contact_agreement_load_date__c
,APG_PD_Contact_agreement_storage_info__c
,APG_PD_Contact_Phone_agreement_Y_N__c
,APG_PD_Contact_agreement_status__c
,APG_PD_Contact_agreement_reject_info__c
,APG_PD_Contact_agreement_Type__c
from [SFDC_IMP_PROD].[dbo].[Contact]

where APG_PD_Contact_agreement_Y_N__c = 'true'

select top 10 
APG_PD_Contact_agreement_status_TEXT__c
,APG_PD_Contact_agreement_Y_N__c
,APG_PD_Contact_agreement_load_date__c
,APG_PD_Contact_agreement_storage_info__c
,APG_PD_Contact_Phone_agreement_Y_N__c
,APG_PD_Contact_agreement_status__c
,APG_PD_Contact_agreement_reject_info__c
,APG_PD_Contact_agreement_Type__c
from [SFDC_IMP_PROD].[dbo].[Contact]

where APG_PD_Contact_agreement_Y_N__c = 'true'



select * FROM OPENQUERY([ELAMAODBC], 'select 
Id as IDD,
body->>''Date'' as Date,
body->>''__id'' as id,
body->>''Status'' as Status,
body->>''Operation'' as Operation,
body->>''__name'' as __name,
body->>''Full Sync'' as Full_Sync,
body->>''Description'' as Description,
body->>''__createdAt'' as __createdAt,
body->>''__createdBy'' as __createdBy

from head."mdm:SyncLog" LIMIT 10')


Select * from  [ELMA_VIEW_UsersStructDetails]


SELECT SyncLog_Status, count(*) FROM ELMA_DB..ELMA_TABLE_SyncLog group by SyncLog_Status

Activity_startAt
2023-03-03 10:35:22.000


JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Status'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Activity_Status,
SELECT top 10 * from [dbo].[ELMA_TABLE_Activity_2]

SELECT top 10 Activity_startAt, DATEPART(HOUR, Activity_startAt)  from [dbo].[ELMA_TABLE_Activity_2] where Activity_startAt > '2023-06-01'

SELECT DATEPART(HOUR, Activity_startAt) as hh, count(*)  from [dbo].[ELMA_TABLE_Activity_2] where Activity_startAt > '2023-06-01' group by DATEPART(HOUR, Activity_startAt)


SELECT top 1000 * from   ELMA_DB..ELMA_TABLE_Activity where Activity_DistanceBetweenAccountAndFinishActivity is not NULL order by Activity_DistanceBetweenAccountAndFinishActivity desc




Select top 10 * from [dbo].[ELMA_VIEW_ActivityFull] where  [Activity_DayIdText] between '2023-01-01' and '2023-03-31'
 
 
 where  APG_Locality_Area = 'Свердловская область'
Select * from [dbo].[ELMA_TABLE_Slide]
Select * from [dbo].[ELMA_TABLE_Application]
Select * from [dbo].[ELMA_VIEW_SlideApplication]


Select  
count([Activity_Id]),
[AccountId],
[ContactId],
[Contacts_Name],
[Companies_Name],
[Companies_APG_Address],
[Contacts_APG_Specialty],
[APG_Locality_Name],
[APG_Locality_Area],
[APG_Locality_bi_brick],
[UserDetails_UserDivision],
[UserDetails_ASM],
[UserDetails_RSM],
[UserDetails_Type],
[UserDetails_Position],
[UserDetails_Manager_TXT],
[Users_Name],
Activity_RecordType_name
from [dbo].[ELMA_VIEW_ActivityFull] 
where  [Activity_DayIdText] between '2023-01-01' and '2023-03-31' 
and [Activity_Status] = 'Завершен' 
and Activity_RecordType_name in ('Визит в аптеку', 'Визит к врачу')

group by

[AccountId],
[ContactId],
[Contacts_Name],
[Companies_Name],
[Companies_APG_Address],
[Contacts_APG_Specialty],
[APG_Locality_Name],
[APG_Locality_Area],
[APG_Locality_bi_brick],
[UserDetails_UserDivision],
[UserDetails_ASM],
[UserDetails_RSM],
[UserDetails_Type],
[UserDetails_Position],
[UserDetails_Manager_TXT],
[Users_Name],
Activity_RecordType_name

Свердловская область


----------------------------------------------------------------Аптеки

Select  [Companies_id],
[Companies_IsActive],
[APG_Locality_Area],
[APG_Locality_Name],
[Companies_Name],
[Companies_APG_Address],
[Companies_APG_Division_Alpha_Account_Target],
[RecordType_name]

from 
[dbo].[ELMA_VIEW_CompaniesAPGLocality]
where [APG_Locality_Area] = 'Свердловская область' and RecordType_name = 'Pharmacy'

----------------------------------------------------------------Врачи
Select  
[Contacts_id],
[Contacts_IsActive],
[Companies_IsActive],
[Contacts_Name],
[Contacts_APG_Specialty],
[Contacts_Division_General_Contact_Target],
[APG_Locality_Area],
[APG_Locality_Name],
[Companies_Name],
[Companies_APG_Address],
[RecordType_name]
from 
[dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality]
where [APG_Locality_Name] in ('Казань - Кировский','Зеленодольский р-н (Татарстан Республика)','Зеленодольск (Татарстан Республика)') and RecordType_name = 'Doctor'

----------------------------------------------------------------Врачи
Select  
[ELMA_VIEW_ContactsCompaniesAPGLocality].[Contacts_id],
[Contacts_IsActive],
[Companies_IsActive],
[Contacts_Name],
[Contacts_APG_Specialty],
[Contacts_Division_General_Contact_Target],
[APG_Locality_Area],
[APG_Locality_Name],
[Companies_Name],
[Companies_APG_Address],
[RecordType_name],
Calls
from 
[dbo].[ELMA_VIEW_ContactsCompaniesAPGLocality] left join ##TT on ##TT.[Contacts_id] = [ELMA_VIEW_ContactsCompaniesAPGLocality].[Contacts_id]
where [Contacts_APG_Specialty] = 'Пульмонология' and RecordType_name = 'Doctor'



Select [Contacts_id],
count([Activity_Id]) as Calls

into ##TT
from [dbo].[ELMA_VIEW_ActivityFull] 
where  [Activity_DayIdText] between '2023-01-01' and '2023-06-31' 
and [Activity_Status] = 'Завершен' 
and Activity_RecordType_name in ('Визит к врачу')

group by

[Contacts_id]


Select * from #AAV_User_Position_for_Report


Select top 10 * from [dbo].[Contact]

Select top 100 * from [dbo].[Account] where RecordTypeId = '01258000000EW9kAAG'


select Id,APG_Axioma_Account_Validation__c,Ax_ORG_CATEGORY__c,
count(*) from [Account]  where RecordTypeId = '01258000000EW9kAAG' group by APG_Axioma_Account_Validation__c,Ax_ORG_CATEGORY__c


select Id,APG_Axioma_Account_Validation__c,Ax_ORG_CATEGORY__c from [Account]  where RecordTypeId = '01258000000EW9kAAG' 

select Id,APG_Axioma_Account_Validation__c,Ax_ORG_CATEGORY__c from [Account]  where Id = '0014I00001kBv2MQAS'


Select * from [dbo].[ELMA_VIEW_SlideApplicationApplicationStat] where ApplicationStats_createdat between '2023-05-01' and '2023-06-01' order by ApplicationStats_createdat

Select Slide_brand, SUM(ApplicationStats_viewtime)  from [dbo].[ELMA_VIEW_SlideApplicationApplicationStat] where ApplicationStats_createdat between '2023-05-01' and '2023-06-01' group by Slide_brand

Slide_brand
NULL


