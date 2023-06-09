
-----------------------------------------------------------------------------------
-------------------------------------------------  Первичная загрузка  ------------
-----------------------------------------------------------------------------------
USE [ELMA_DB]

IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_APG_Locality') begin drop table ELMA_DB..ELMA_LOAD_APG_Locality end
select * into ELMA_DB..ELMA_LOAD_APG_Locality FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:APG_Locality" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Users') begin drop table ELMA_DB..ELMA_LOAD_Users end
select * into ELMA_DB..ELMA_LOAD_Users FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."users" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_UserDetails') begin drop table ELMA_DB..ELMA_LOAD_UserDetails end
select * into ELMA_DB..ELMA_LOAD_UserDetails FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."mdm:UserDetails" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Companies') begin drop table ELMA_DB..ELMA_LOAD_Companies end
select * into ELMA_DB..ELMA_LOAD_Companies FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."_clients:_companies" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Contacts') begin drop table ELMA_DB..ELMA_LOAD_Contacts end
select * into ELMA_DB..ELMA_LOAD_Contacts FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."_clients:_contacts" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Activity') begin drop table ELMA_DB..ELMA_LOAD_Activity end
select * into ELMA_DB..ELMA_LOAD_Activity FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:Activity" ')
GO
--------------
--IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_ActivityData') begin drop table ELMA_DB..ELMA_LOAD_ActivityData end
--select * into ELMA_DB..ELMA_LOAD_ActivityData FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:ActivityData" ')
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Orgstruct') begin drop table ELMA_DB..ELMA_LOAD_Orgstruct end
select * into ELMA_DB..ELMA_LOAD_Orgstruct FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."orgstruct" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_RecordType') begin drop table ELMA_DB..ELMA_LOAD_RecordType end
select * INTO ELMA_DB..ELMA_LOAD_RecordType FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."mdm:RecordType"  ')
GO
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Companies@APG_Locality') begin drop table ELMA_DB..ELMA_TABLE_Companies@APG_Locality end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Companies@Contacts') begin drop table ELMA_DB..ELMA_TABLE_Companies@Contacts end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity@AccountId') begin drop table ELMA_DB..ELMA_TABLE_Activity@AccountId end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity@ContactId') begin drop table ELMA_DB..ELMA_TABLE_Activity@ContactId end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_ActivityData@ActivityId') begin drop table ELMA_DB..ELMA_TABLE_ActivityData@ActivityId end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_companies@RecordTypeId') begin drop table ELMA_DB..ELMA_TABLE_companies@RecordTypeId end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_contacts@RecordTypeId') begin drop table ELMA_DB..ELMA_TABLE_contacts@RecordTypeId end
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity@RecordTypeId') begin drop table ELMA_DB..ELMA_TABLE_Activity@RecordTypeId end
--IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_ActivityData@ActivityId') begin drop table ELMA_DB..ELMA_TABLE_ActivityData@ActivityId end
GO

select * INTO ELMA_DB..ELMA_TABLE_Companies@APG_Locality FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."_clients:_companies@APG_Locality"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_Companies@Contacts FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."_clients:_companies@_contacts"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_Activity@AccountId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:Activity@AccountId"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_Activity@ContactId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:Activity@ContactId"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_ActivityData@ActivityId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:ActivityData@ActivityId"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_companies@RecordTypeId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."_clients:_companies@RecordTypeId"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_contacts@RecordTypeId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."_clients:_contacts@RecordTypeId"  ')
GO
select * INTO ELMA_DB..ELMA_TABLE_Activity@RecordTypeId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:Activity@RecordTypeId"  ')
GO
--select * INTO ELMA_DB..ELMA_TABLE_ActivityData@ActivityId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:ActivityData@ActivityId"  ')
GO
----------------------------

---------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------  Первичная загрузка END  ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
----------------------------------------------------  APG_Locality  ---------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_APG_Locality') begin drop table ELMA_DB..ELMA_TABLE_APG_Locality end

SELECT id as APG_Locality_IDD,
JSON_VALUE(body, '$.__id') AS APG_Locality___id,
JSON_VALUE(body, '$.__name') AS APG_Locality_Name,
JSON_VALUE(body, '$.APG_Area') AS APG_Locality_Area,
JSON_VALUE(body, '$.APG_City') AS APG_Locality_APG_City,
JSON_VALUE(body, '$.bi_brick') AS APG_Locality_bi_brick,
JSON_VALUE(body, '$.APG_Region') AS APG_Locality_APG_Region,
JSON_VALUE(body, '$.SalesforceId') AS APG_Locality_SalesforceId,
JSON_VALUE(body, '$.APG_Area_City') AS APG_Locality_APG_Area_City,
JSON_VALUE(body, '$.__createdAt') AS APG_Locality___createdAt,
REPLACE(REPLACE(JSON_QUERY(body, '$.User_allocated_1'), '["',''), '"]','') AS APG_Locality_User_allocated_1,
REPLACE(REPLACE(JSON_QUERY(body, '$.User_allocated_2'), '["',''), '"]','') AS APG_Locality_User_allocated_2,
REPLACE(REPLACE(JSON_QUERY(body, '$.User_allocated_3'), '["',''), '"]','') AS APG_Locality_User_allocated_3,
REPLACE(REPLACE(JSON_QUERY(body, '$.User_allocated_4'), '["',''), '"]','') AS APG_Locality_User_allocated_4,
REPLACE(REPLACE(JSON_QUERY(body, '$.User_allocated_5'), '["',''), '"]','') AS APG_Locality_User_allocated_5,
JSON_VALUE(body, '$.Business_Trip_City') AS APG_Locality_Business_Trip_City

INTO ELMA_DB..ELMA_TABLE_APG_Locality 
-- DROP TABLE ELMA_DB..ELMA_TABLE_APG_Locality 
FROM ELMA_DB..ELMA_LOAD_APG_Locality
GO
  
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------  APG_Locality END  ---------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
------------------------------------------------------------  Users  --------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Users') begin drop table ELMA_DB..ELMA_TABLE_Users end

SELECT id AS  Users_IDD,
JSON_VALUE(body, '$.__id') AS Users_id,
JSON_VALUE(body, '$.email') AS Users_email,
JSON_VALUE(body, '$.__name') AS Users_Name,
IIF (REPLACE(REPLACE(JSON_QUERY(body, '$.osIds'), '["',''), '"]','') = '[]',null,REPLACE(REPLACE(JSON_QUERY(body, '$.osIds'), '["',''), '"]','')) AS Users_osIds

INTO ELMA_DB..ELMA_TABLE_Users
-- DROP TABLE ELMA_DB..ELMA_TABLE_Users
FROM ELMA_DB..ELMA_LOAD_Users

--SELECT * FROM ELMA_DB..ELMA_TABLE_Users
GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  Users END  --------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
------------------------------------------------------------  UserDetails  --------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_UserDetails') begin drop table ELMA_DB..ELMA_TABLE_UserDetails end

SELECT id AS  UserDetails_IDD,
JSON_VALUE(body, '$.__id') AS UserDetails_id,
JSON_VALUE(body, '$.__name') AS UserDetails_Name,
JSON_VALUE(body, '$.__debug') AS UserDetails_debug,
JSON_VALUE(body, '$.__index') AS UserDetails_index,
JSON_VALUE(body, '$.MobileMAC') AS UserDetails_MobileMAC,
JSON_VALUE(body, '$.__version') AS UserDetails_version,
JSON_VALUE(body, '$.DeviceModel') AS UserDetails_DeviceModel,
JSON_VALUE(body, '$.MobileVersion') AS UserDetails_MobileVersion,
JSON_VALUE(body, '$.DeviceOSVersion') AS UserDetails_DeviceOSVersion,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.LastSyncDate'),19)) AS UserDetails_LastSyncDate,
JSON_VALUE(body, '$.IsActive') AS UserDetails_IsActive,
IIF (REPLACE(REPLACE(JSON_QUERY(body, '$.OwnerId'), '["',''), '"]','') = '[]',null,REPLACE(REPLACE(JSON_QUERY(body, '$.OwnerId'), '["',''), '"]','')) AS UserDetails_OwnerId,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.ProfileName'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS UserDetails_ProfileName,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.UserDivision'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS UserDetails_UserDivision,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__createdAt'),19)) AS AUserDetails_createdAt,
JSON_VALUE(body, '$.ASM') AS UserDetails_ASM,
JSON_VALUE(body, '$.RSM') AS UserDetails_RSM,
IIF (REPLACE(REPLACE(JSON_QUERY(body, '$.Manager'), '["',''), '"]','') = '[]',null,REPLACE(REPLACE(JSON_QUERY(body, '$.Manager'), '["',''), '"]','')) AS UserDetails_Manager,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Type'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS UserDetails_Type,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Status'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS UserDetails_Status,
JSON_VALUE(body, '$.Position') AS UserDetails_Position,
JSON_VALUE(body, '$.Allocation') AS UserDetails_Allocation,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.Work_start_date'),19)) AS UserDetails_Work_start_date,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.Work_end_date'),19)) AS UserDetails_Work_end_date

INTO ELMA_DB..ELMA_TABLE_UserDetails
-- DROP TABLE ELMA_DB..ELMA_TABLE_UserDetails
FROM ELMA_DB..ELMA_LOAD_UserDetails

--SELECT * from ELMA_DB..ELMA_TABLE_UserDetails
GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  UserDetails END  --------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
----------------------------------------------------------  Orgstruct  ------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Orgstruct') begin drop table ELMA_DB..ELMA_TABLE_Orgstruct end

SELECT id AS Orgstruct_IDD,
JSON_VALUE(body, '$.__id') AS Orgstruct_id,
JSON_VALUE(body, '$.name') AS Orgstruct_name,
JSON_VALUE(body, '$.sort') AS Orgstruct_sort,
JSON_VALUE(body, '$.type') AS Orgstruct_type,
JSON_VALUE(body, '$."parent"') AS Orgstruct_parent

INTO  ELMA_DB..ELMA_TABLE_Orgstruct
-- DROP TABLE ELMA_DB..ELMA_TABLE_Orgstruct
FROM ELMA_DB..ELMA_LOAD_Orgstruct

--SELECT * from ELMA_DB..ELMA_TABLE_Orgstruct
GO	
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------  Orgstruct END  ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
----------------------------------------------------------  RecordType  -----------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_RecordType') begin drop table ELMA_DB..ELMA_TABLE_RecordType end

SELECT id AS RecordType_IDD,
JSON_VALUE(body, '$.__id') AS RecordType_id,
JSON_VALUE(body, '$.__name') AS RecordType_name,
JSON_VALUE(body, '$.IsActive') AS RecordType_IsActive,
JSON_VALUE(body, '$.Description') AS RecordType_Description,
JSON_VALUE(body, '$.SobjectType') AS RecordType_SobjectType,
JSON_VALUE(body, '$.DeveloperName') AS RecordType_DeveloperName,
JSON_VALUE(body, '$.NamespacePrefix') AS RecordType_NamespacePrefix

INTO ELMA_DB..ELMA_TABLE_RecordType
-- DROP TABLE ELMA_DB..ELMA_TABLE_RecordType
FROM ELMA_DB..ELMA_LOAD_RecordType

--SELECT * from ELMA_DB..ELMA_TABLE_RecordType
GO	
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------  RecordType END  -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
----------------------------------------------------------  Companies  ------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Companies') begin drop table ELMA_DB..ELMA_TABLE_Companies end

SELECT id AS Companies_IDD,
JSON_VALUE(body, '$.__id') AS Companies_id,
JSON_VALUE(body, '$.__name') AS Companies_Name,
JSON_VALUE(body, '$.APG_Address') AS Companies_APG_Address,
JSON_VALUE(body, '$.IsActive') AS Companies_IsActive,
JSON_VALUE(body, '$.SalesforceId') AS Companies_SalesforceId,
JSON_VALUE(body, '$.APG_Account_deleted') AS Companies_APG_Account_deleted,
REPLACE(REPLACE(JSON_QUERY(body, '$.APG_General_responsible_User'), '["',''), '"]','') AS Companies_APG_General_responsible_User,
JSON_VALUE(body, '$.APG_Division_Alpha_Account_Target') AS Companies_APG_Division_Alpha_Account_Target,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Division_General_Account_Category'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Companies_Division_General_Account_Category,
JSON_VALUE(body, '$.location_Geolocation__Latitude__s') AS Companies_location_Geolocation__Latitude__s,
JSON_VALUE(body, '$.location_Geolocation__Longitude__s') AS Companies_location_Geolocation__Longitude__s,
JSON_VALUE(body, '$.bitrix_account_id') AS Companies_bitrix_account_id,
JSON_VALUE(body, '$.mdlp_id') AS Companies_mdlp_id,
JSON_VALUE(body, '$.mdlp_org_name') AS Companies_mdlp_org_name,
JSON_VALUE(body, '$.dadata_okato') AS Companies_dadata_okato,
JSON_VALUE(body, '$.dadata_oktmo') AS Companies_dadata_oktmo,
JSON_VALUE(body, '$.dadata_value') AS Companies_dadata_value,
JSON_VALUE(body, '$.dadata_fias_id') AS Companies_dadata_fias_id,
JSON_VALUE(body, '$.dadata_kladr_id') AS Companies_dadata_kladr_id,
JSON_VALUE(body, '$.dadata_postal_code') AS Companies_dadata_postal_code,
JSON_VALUE(body, '$.Division_General_last_activity_date') AS Companies_Division_General_last_activity_date

INTO ELMA_DB..ELMA_TABLE_Companies
-- DROP TABLE ELMA_DB..ELMA_TABLE_Companies

FROM ELMA_DB..ELMA_LOAD_Companies
GO
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------  Companies END  ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
-----------------------------------------------------------  Contacts  ------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Contacts') begin drop table ELMA_DB..ELMA_TABLE_Contacts end

SELECT id AS Contacts_IDD,
JSON_VALUE(body, '$.__id') AS Contacts_id,
JSON_VALUE(body, '$.__name') AS Contacts_Name,
JSON_VALUE(body, '$.IsActive') AS Contacts_IsActive,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.APG_Specialty'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Contacts_APG_Specialty,
JSON_VALUE(body, '$.bitrix_contact_id') AS Contacts_bitrix_contact_id,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.APG_Doctor_work_format'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Contacts_APG_Doctor_work_format,
JSON_VALUE(body, '$.Division_General_Contact_Target') AS Contacts_Division_General_Contact_Target,
REPLACE(REPLACE(JSON_QUERY(body, '$.APG_Responsible_General_Contact_User'), '["',''), '"]','') AS Contacts_APG_Responsible_General_Contact_User,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Division_General_Contact_Category'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Contacts_Division_General_Contact_Category,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Derma_Category'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Contacts_Derma_Category

INTO  ELMA_DB..ELMA_TABLE_Contacts
-- DROP TABLE ELMA_DB..ELMA_TABLE_Contacts
FROM ELMA_DB..ELMA_LOAD_Contacts
GO
---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------  Contacts  END  -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-----------------------------------------------------------  Activity  ------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity') begin drop table ELMA_DB..ELMA_TABLE_Activity end

SELECT 
id AS Activity_IDD,
JSON_VALUE(body, '$.__id') AS Activity_Id,
JSON_VALUE(body, '$.IsActive') AS Activity_IsActive,
REPLACE(REPLACE(JSON_QUERY(body, '$.Owner'), '["',''), '"]','') AS Owner,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Status'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Activity_Status,
JSON_VALUE(body, '$.__name') AS Activity_name,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__startAt'),19)) AS Activity_startAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__endAt'),19)) AS Activity_endAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__createdAt'),19)) AS Activity_createdAt,
JSON_VALUE(body, '$.__createdBy') AS Activity_createdBy,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__updatedAt'),19)) AS Activity_updatedAt,
JSON_VALUE(body, '$.__updatedBy') AS Activity_updatedBy,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.APG_Fact_Start_Date'),19)) AS Activity_APG_Fact_Start_Date,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.APG_Fact_End_Date'),19)) AS Activity_APG_Fact_End_Date,
CONVERT ( float , JSON_VALUE(body, '$.GeolocationFinish__Latitude')) AS Activity_GeolocationFinish__Latitude,
CONVERT ( float , JSON_VALUE(body, '$.GeolocationFinish__Longitude')) AS Activity_GeolocationFinish__Longitude,
CONVERT ( float , JSON_VALUE(body, '$.APG_Call_Geolocation__Latitude')) AS Activity_APG_Call_Geolocation__Latitude,
CONVERT ( float , JSON_VALUE(body, '$.APG_Call_Geolocation__Longitude')) AS Activity_APG_Call_Geolocation__Longitude,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.TypeOfEvent'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS TypeOfEvent,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.TypeOfTimeOff'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS TypeOfTimeOff



INTO  ELMA_DB..ELMA_TABLE_Activity
-- DROP TABLE ELMA_DB..ELMA_TABLE_Activity
FROM ELMA_DB..ELMA_LOAD_Activity
GO
---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------  Acivity END  -------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
-----------------------------------------------------------  Activity_2  ----------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity_2') begin drop table ELMA_DB..ELMA_TABLE_Activity_2 end

SELECT 
ELMA_TABLE_Activity.*,
left(Activity@AccountId.[to],36) as AccountId ,
left(Activity@ContactId.[to],36) as ContactId,
Activity@RecordTypeId.[to] as RecordTypeId,
Table_RecordType.RecordType_name as Activity_RecordType_name,
iif (Table_RecordType.RecordType_name = 'Мероприятие',TypeOfEvent,iif (Table_RecordType.RecordType_name = 'Время вне территории',TypeOfTimeOff,Table_RecordType.RecordType_name)) as Activity_SUB_type,
CONVERT ( float , (Activity_endAt - Activity_startAt)) as Activity_duration_float,
CONVERT ( float , (Activity_endAt - Activity_startAt))*2.66666666666667 as Activity_duration_day

INTO  ELMA_DB..ELMA_TABLE_Activity_2

FROM ELMA_DB..ELMA_TABLE_Activity 
left join
  (select [from], [to] from ELMA_DB..ELMA_TABLE_Activity@AccountId) Activity@AccountId
on ELMA_DB..ELMA_TABLE_Activity.Activity_Id = Activity@AccountId.[from]  
left join
  (select [from], [to] from ELMA_DB..ELMA_TABLE_Activity@ContactId) Activity@ContactId
on ELMA_DB..ELMA_TABLE_Activity.Activity_Id = Activity@ContactId.[from]  
left join
  (select [from], [to] from ELMA_DB..ELMA_TABLE_Activity@RecordTypeId) Activity@RecordTypeId
on ELMA_DB..ELMA_TABLE_Activity.Activity_Id = Activity@RecordTypeId.[from]  
left join
  (select RecordType_name,RecordType_id from ELMA_DB..ELMA_TABLE_RecordType) Table_RecordType
on Table_RecordType.RecordType_id = Activity@RecordTypeId.[to]  

GO
---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------  Acivity_2 END  -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
/*
select top 10 * from ELMA_LOAD_ActivityData

{"NTZ": null, 
"NSPV": null, 
"SPVA": null, 
"__id": "ecaff23b-bf69-4c02-a9ce-94f54e4dca4f", 
"__name": "AD - 774700 | 2023-02-27", 
"__debug": false, 
"__index": 774700, "__version": 1677543452, "__createdAt": "2023-02-27T13:01:23Z", "__createdBy": "d0c9c2b0-f289-4e12-854e-3f5ad1c53b92", "__updatedAt": "2023-02-28T00:17:32Z", "__updatedBy": "f179b068-cda8-4920-bc2c-0b4f039e5fed", "UsersSharing": ["d0c9c2b0-f289-4e12-854e-3f5ad1c53b92", "d1383efc-021f-43c1-a2b7-ee51c138de70", "7f27ace8-d43e-4458-a9d7-343c8ecb2491", "bad3eb13-2128-4613-ad55-41ba23dfe420"], "__externalId": null, "__subscribers": ["d0c9c2b0-f289-4e12-854e-3f5ad1c53b92"], 
"APG_MSL_Check_Y_N": false, 
"APG_OverStock_Y_N": false, 
"APG_Product_Order": null, 
"APG_Product_Facing": false, 
"NumberOfDistributed": null, 
"__externalProcessMeta": null, 
"APG_Product_Availability": null}

{"text":"head.\"glenmark:ActivityData@ProductId\"","objUrl":"/browser/table/obj/1/1/22677/22868/37257","nodeType":"table","cur":{"from":38,"to":38}}
{"text":"head.\"glenmark:Product\"","objUrl":"/browser/table/obj/1/1/22677/22868/36715","nodeType":"table","cur":{"from":23,"to":23}}

select * INTO ELMA_DB..ELMA_TABLE_Activity@RecordTypeId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."glenmark:Activity@RecordTypeId"  ')


ELMA_DB..ELMA_LOAD_Contacts

select * INTO ELMA_DB..ELMA_LOAD_ApplicationStats FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."mdm:ApplicationStats"  ')
select * INTO ELMA_DB..ELMA_TABLE_ApplicationStats@ActivityId FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."mdm:ApplicationStats@ActivityId"  ')


select  * 
INTO ELMA_DB..ELMA_LOAD_ApplicationStats 
FROM OPENQUERY([ELMAODBC], 'SELECT * FROM head."mdm:ApplicationStats" ')


select  count(*) 
--INTO ELMA_DB..ELMA_LOAD_ApplicationStats 
FROM OPENQUERY([ELMAODBC], 'SELECT body FROM head."mdm:ApplicationStats"')


select  * 
INTO ELMA_DB..ELMA_LOAD_ApplicationStats 
FROM OPENQUERY([ELMAODBC], '''select body->>'ViewTime' from head."mdm:ApplicationStats"''')
*/