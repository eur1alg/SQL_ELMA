
-----------------------------------------------------------------------------------
-------------------------------------------------  Первичная загрузка  ------------
-----------------------------------------------------------------------------------
USE [ELMA_DB]

IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_APG_Locality') begin drop table ELMA_DB..ELMA_LOAD_APG_Locality end
select * into ELMA_DB..ELMA_LOAD_APG_Locality FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:APG_Locality" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Users') begin drop table ELMA_DB..ELMA_LOAD_Users end
select * into ELMA_DB..ELMA_LOAD_Users FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."users" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_UserDetails') begin drop table ELMA_DB..ELMA_LOAD_UserDetails end
select * into ELMA_DB..ELMA_LOAD_UserDetails FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."mdm:UserDetails" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Companies') begin drop table ELMA_DB..ELMA_LOAD_Companies end
select * into ELMA_DB..ELMA_LOAD_Companies FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."_clients:_companies" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Contacts') begin drop table ELMA_DB..ELMA_LOAD_Contacts end
select * into ELMA_DB..ELMA_LOAD_Contacts FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."_clients:_contacts" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Activity') begin drop table ELMA_DB..ELMA_LOAD_Activity end
select * into ELMA_DB..ELMA_LOAD_Activity FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Activity" ')
GO
--------------
--IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_ActivityData') begin drop table ELMA_DB..ELMA_LOAD_ActivityData end
--select * into ELMA_DB..ELMA_LOAD_ActivityData FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:ActivityData" ')
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Orgstruct') begin drop table ELMA_DB..ELMA_LOAD_Orgstruct end
select * into ELMA_DB..ELMA_LOAD_Orgstruct FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."orgstruct" ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_RecordType') begin drop table ELMA_DB..ELMA_LOAD_RecordType end
select * INTO ELMA_DB..ELMA_LOAD_RecordType FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."mdm:RecordType"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Month') begin drop table ELMA_DB..ELMA_LOAD_Month end
select * INTO ELMA_DB..ELMA_LOAD_Month FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Month"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_UserPosition') begin drop table ELMA_DB..ELMA_LOAD_UserPosition end
select * INTO ELMA_DB..ELMA_LOAD_UserPosition FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:APG_User_Position"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_UserPositionPlan') begin drop table ELMA_DB..ELMA_LOAD_UserPositionPlan end
select * INTO ELMA_DB..ELMA_LOAD_UserPositionPlan FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:APG_User_Position_Plan"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_TargetFrequency') begin drop table ELMA_DB..ELMA_LOAD_TargetFrequency end
select * INTO ELMA_DB..ELMA_LOAD_TargetFrequency FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:TargetFrequency"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Day') begin drop table ELMA_DB..ELMA_LOAD_Day end
select * INTO ELMA_DB..ELMA_LOAD_Day FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Day"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Month') begin drop table ELMA_DB..ELMA_LOAD_Month end
select * INTO ELMA_DB..ELMA_LOAD_Month FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Month"  ')
GO

--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Application') begin drop table ELMA_DB..ELMA_LOAD_Application end
select * INTO ELMA_DB..ELMA_LOAD_Application FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."mdm:Application"  ')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_EmployeeWorkingDay') begin drop table ELMA_DB..ELMA_LOAD_EmployeeWorkingDay end
select * INTO ELMA_DB..ELMA_LOAD_EmployeeWorkingDay FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:EmployeeWorkingDay"  ')
GO

--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_SyncLog') begin drop table ELMA_DB..ELMA_LOAD_SyncLog end
select * into ELMA_DB..ELMA_LOAD_SyncLog FROM OPENQUERY([ELAMAODBC], 
'select
Id as IDD,
body->>''Date'' as Date,
body->>''__id'' as id,
body->>''Status'' as Status,
body->>''Operation'' as Operation,
body->>''__name'' as __name,
body->>''Duration'' as Duration,
body->>''Description'' as Description,
body->>''__createdAt'' as __createdAt,
body->>''__createdBy'' as __createdBy
from head."mdm:SyncLog"')
GO
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_Slide') begin drop table ELMA_DB..ELMA_LOAD_Slide end
select * into ELMA_DB..ELMA_LOAD_Slide FROM OPENQUERY([ELAMAODBC], 
'select
Id as IDD,
body->>''__id'' as id,
body->>''__name'' as __name,
body->>''Order'' as Order,
body->>''brand'' as brand,
body->>''Branch'' as Branch,
body->>''Category'' as Category,
body->>''IsActive'' as IsActive,
body->>''IsRequired'' as IsRequired
from head."mdm:Slide"')
GO
--------------



----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Companies@APG_Locality') begin drop table ELMA_DB..ELMA_TABLE_Companies@APG_Locality end
select * INTO ELMA_DB..ELMA_TABLE_Companies@APG_Locality FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."_clients:_companies@APG_Locality"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Companies@Contacts') begin drop table ELMA_DB..ELMA_TABLE_Companies@Contacts end
select * INTO ELMA_DB..ELMA_TABLE_Companies@Contacts FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."_clients:_companies@_contacts"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity@AccountId') begin drop table ELMA_DB..ELMA_TABLE_Activity@AccountId end
select * INTO ELMA_DB..ELMA_TABLE_Activity@AccountId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Activity@AccountId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity@ContactId') begin drop table ELMA_DB..ELMA_TABLE_Activity@ContactId end
select * INTO ELMA_DB..ELMA_TABLE_Activity@ContactId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Activity@ContactId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_ActivityData@ActivityId') begin drop table ELMA_DB..ELMA_TABLE_ActivityData@ActivityId end
select * INTO ELMA_DB..ELMA_TABLE_ActivityData@ActivityId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:ActivityData@ActivityId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_companies@RecordTypeId') begin drop table ELMA_DB..ELMA_TABLE_companies@RecordTypeId end
select * INTO ELMA_DB..ELMA_TABLE_companies@RecordTypeId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."_clients:_companies@RecordTypeId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_contacts@RecordTypeId') begin drop table ELMA_DB..ELMA_TABLE_contacts@RecordTypeId end
select * INTO ELMA_DB..ELMA_TABLE_contacts@RecordTypeId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."_clients:_contacts@RecordTypeId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Activity@RecordTypeId') begin drop table ELMA_DB..ELMA_TABLE_Activity@RecordTypeId end
select * INTO ELMA_DB..ELMA_TABLE_Activity@RecordTypeId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Activity@RecordTypeId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_APG_User_Position_Plan@user_positon') begin drop table ELMA_DB..ELMA_TABLE_APG_User_Position_Plan@user_positon end
select * INTO ELMA_DB..ELMA_TABLE_APG_User_Position_Plan@user_positon FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:APG_User_Position_Plan@user_positon"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_APG_User_Position_Plan@Position_Plan_Month') begin drop table ELMA_DB..ELMA_TABLE_APG_User_Position_Plan@Position_Plan_Month end
select * INTO ELMA_DB..ELMA_TABLE_APG_User_Position_Plan@Position_Plan_Month  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:APG_User_Position_Plan@Position_Plan_Month"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_TargetFrequency@AccountId') begin drop table ELMA_DB..ELMA_TABLE_TargetFrequency@AccountId end
select * INTO ELMA_DB..ELMA_TABLE_TargetFrequency@AccountId  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:TargetFrequency@AccountId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_TargetFrequency@ContactId') begin drop table ELMA_DB..ELMA_TABLE_TargetFrequency@ContactId end
select * INTO ELMA_DB..ELMA_TABLE_TargetFrequency@ContactId  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:TargetFrequency@ContactId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_TargetFrequency@MarketingCycleId') begin drop table ELMA_DB..ELMA_TABLE_TargetFrequency@MarketingCycleId end
select * INTO ELMA_DB..ELMA_TABLE_TargetFrequency@MarketingCycleId  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:TargetFrequency@MarketingCycleId"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Day@Month') begin drop table ELMA_DB..ELMA_TABLE_Day@Month end
select * INTO ELMA_DB..ELMA_TABLE_Day@Month  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:Day@Month"  ')
----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_ApplicationStats@SlideId') begin drop table ELMA_DB..ELMA_TABLE_ApplicationStats@SlideId end
select * INTO ELMA_DB..ELMA_TABLE_ApplicationStats@SlideId  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."mdm:ApplicationStats@SlideId"  ')
----------------------------

----------------------------

---------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------  Первичная загрузка END  ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
------------------------------------------------------------  EmployeeWorkingDay  -
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_EmployeeWorkingDay') begin drop table ELMA_DB..ELMA_TABLE_EmployeeWorkingDay end

SELECT id AS  EmployeeWorkingDay_IDD,
JSON_VALUE(body, '$.__id') AS EmployeeWorkingDay_id,
JSON_VALUE(body, '$.__name') AS EmployeeWorkingDay_Name,
REPLACE(REPLACE(JSON_QUERY(body, '$.Owner'), '["',''), '"]','') AS EmployeeWorkingDay_Owner,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.Date'),19)) AS EmployeeWorkingDay_Date,
left(JSON_VALUE(body, '$.Date'),10) as EmployeeWorkingDay_DateText,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.StartWorkingDay'),19)) AS EmployeeWorkingDay_StartWorkingDay,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.EndWorkingDay'),19)) AS EmployeeWorkingDay_EndWorkingDay,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.StartWorkingDayFact'),19)) AS EmployeeWorkingDay_StartWorkingDayFact,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.EndWorkingDayFact'),19)) AS EmployeeWorkingDay_EndWorkingDayFact,
CONVERT  ( time,SUBSTRING(JSON_VALUE(body, '$.TotalActivityDuration'),12,9)) AS EmployeeWorkingDay_TotalActivityDuration,
CONVERT  ( time,SUBSTRING(JSON_VALUE(body, '$.TotalActivityDurationFact'),12,9)) AS EmployeeWorkingDay_TotalActivityDurationFact,
CONVERT  ( time,SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationFact'),12,9)) AS EmployeeWorkingDay_WorkingDayDurationFact,
CONVERT  ( time,SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationPlan'),12,9)) AS EmployeeWorkingDay_WorkingDayDurationPlan,
(CONVERT  ( int,SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationPlan'),12,2))*60 + CONVERT  ( int, SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationPlan'),15,2))) * 0.000694444444444444 AS EmployeeWorkingDay_WorkingDayDurationPlanText

--SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationPlan'),12,2)+SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationPlan'),15,2)+SUBSTRING(JSON_VALUE(body, '$.WorkingDayDurationPlan'),18,2)



INTO ELMA_DB..ELMA_TABLE_EmployeeWorkingDay
-- DROP TABLE ELMA_DB..ELMA_TABLE_EmployeeWorkingDay
FROM ELMA_DB..ELMA_LOAD_EmployeeWorkingDay
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null

--SELECT * FROM ELMA_DB..ELMA_TABLE_EmployeeWorkingDay
--SELECT * FROM ELMA_DB..ELMA_LOAD_EmployeeWorkingDay

GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  EmployeeWorkingDay END  -------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------







-----------------------------------------------------------------------------------
------------------------------------------------------------  SyncLog  ------------
-----------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_SyncLog') begin drop table ELMA_DB..ELMA_TABLE_SyncLog end

SELECT idd AS  SyncLog_IDD,
id  AS SyncLog_Id,
CONVERT  ( datetime,left(date,19)) AS SyncLog_Date,
status  AS SyncLog_StatusRAW,
JSON_VALUE([status], '$[0].name') AS SyncLog_Status,
__name  AS SyncLog_Name,
Duration  AS SyncLog_Duration,
operation AS SyncLog_Operation, 
description  AS SyncLog_description,
CONVERT  ( datetime,left(__createdat,19)) AS SyncLog_CreatedAt,
__createdby  AS SyncLog_CreatedBy
INTO ELMA_DB..ELMA_TABLE_SyncLog
-- DROP TABLE ELMA_DB..ELMA_TABLE_SyncLog
FROM ELMA_DB..ELMA_LOAD_SyncLog
where operation in ('Fast Sync','Full Sync')
--SELECT top 10 * FROM ELMA_DB..ELMA_TABLE_SyncLog
--SELECT top 10 * FROM ELMA_DB..ELMA_LOAD_SyncLog
GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  SyncLog END  ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
----------------------------------------------------  Application  ----------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Application') begin drop table ELMA_DB..ELMA_TABLE_Application end

SELECT id AS  Application_IDD,
JSON_VALUE(body, '$.__id') AS Application_id,
JSON_VALUE(body, '$.__name') AS Application_Name,
JSON_VALUE(body, '$.IsActive') AS Application_IsActive,
JSON_VALUE(body, '$.IsAvailableForRD') AS Application_IsAvailableForRD,
JSON_VALUE(body, '$.IsAvailableOffline') AS Application_IsAvailableOffline,
JSON_VALUE(body, '$.IsSlideLikesTrackingEnabled') AS Application_IsSlideLikesTrackingEnabled,
JSON_VALUE(body, '$.IsSlideViewsTrackingEnabled') AS Application_IsSlideViewsTrackingEnabled,
JSON_VALUE(body, '$.IsSlideClicksTrackingEnabled') AS Application_IsSlideClicksTrackingEnabled,
JSON_VALUE(body, '$.IsSlideDurationTrackingEnabled') AS Application_IsSlideDurationTrackingEnabled,
JSON_VALUE(body, '$.IsTotalDurationTrackingEnabled') AS Application_IsTotalDurationTrackingEnabled,
JSON_VALUE(body, '$.IsSlideNavigationTrackingEnabled') AS Application_IsSlideNavigationTrackingEnabled,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.SwipeGestureType'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Application_SwipeGestureType,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.DeviceOrientation'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Application_DeviceOrientation,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__createdAt'),19)) AS Application_createdAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__updatedAt'),19)) AS Application_updatedAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.ForcedLoadDate'),19)) AS Application_ForcedLoadDate

INTO ELMA_DB..ELMA_TABLE_Application
FROM ELMA_DB..ELMA_LOAD_Application

--SELECT top 10 * FROM ELMA_DB..ELMA_LOAD_Application
--SELECT top 10 * FROM ELMA_DB..ELMA_TABLE_Application

---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  Application END  --------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
----------------------------------------------------  Slide  ----------------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Slide') begin drop table ELMA_DB..ELMA_TABLE_Slide end

SELECT idd AS  Slide_IDD,
id  AS Slide_Id,
__name AS Slide_Name,
[order]  AS Slide_order,
JSON_VALUE([brand], '$[0].name')  AS Slide_brand,
JSON_VALUE([branch], '$[0].name')  AS Slide_branch,
JSON_VALUE([category], '$[0].name')  AS Slide_category,
isactive  AS Slide_isactive,
isrequired  AS Slide_isrequired
INTO ELMA_DB..ELMA_TABLE_Slide
FROM ELMA_DB..ELMA_LOAD_Slide

--SELECT top 10 * FROM ELMA_DB..ELMA_LOAD_Slide
--SELECT top 10 * FROM ELMA_DB..ELMA_TABLE_Slide


---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  Slide END  --------------------------------------------------------------
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
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
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
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * FROM ELMA_DB..ELMA_TABLE_Users
GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  Users END  --------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
------------------------------------------------------------  Month  --------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Month') begin drop table ELMA_DB..ELMA_TABLE_Month end

SELECT id AS  Month_IDD,
JSON_VALUE(body, '$.__id') AS Month_id,
JSON_VALUE(body, '$.__name') AS Month_Name,
JSON_VALUE(body, '$.Name_RUS') AS Month_Name_RUS,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.Date'),19)) AS Month_Date

INTO ELMA_DB..ELMA_TABLE_Month
-- DROP TABLE ELMA_DB..ELMA_TABLE_Month
FROM ELMA_DB..ELMA_LOAD_Month
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * FROM ELMA_DB..ELMA_TABLE_Month
--SELECT * FROM ELMA_DB..ELMA_LOAD_Month
GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  Month END  --------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
------------------------------------------------------------  Day  ----------------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Day') begin drop table ELMA_DB..ELMA_TABLE_Day end

SELECT id AS  Day_IDD,
JSON_VALUE(body, '$.__id') AS Day_id,
JSON_VALUE(body, '$.__name') AS Day_Name,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.Date'),19)) AS Day_Date,
JSON_VALUE(body, '$.Work_Day_MR') AS Day_Work_Day_MR,
JSON_VALUE(body, '$.Work_Day_RSM') AS Day_Work_Day_RSM

INTO ELMA_DB..ELMA_TABLE_Day
-- DROP TABLE ELMA_DB..ELMA_TABLE_Day
FROM ELMA_DB..ELMA_LOAD_Day
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * FROM ELMA_DB..ELMA_TABLE_Day
--SELECT * FROM ELMA_DB..ELMA_LOAD_Day
GO



---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  Day END  ----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------
------------------------------------------------------------  UserPosition  -------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_UserPosition') begin drop table ELMA_DB..ELMA_TABLE_UserPosition end

SELECT id AS  UserPosition_IDD,
JSON_VALUE(body, '$.__id') AS UserPosition_id,
JSON_VALUE(body, '$.__name') AS UserPosition_Name,
JSON_VALUE(body, '$.Position_ASM') AS UserPosition_Position_ASM,
JSON_VALUE(body, '$.Position_RSM') AS UserPosition_Position_RSM,
JSON_VALUE(body, '$.Active_Position') AS UserPosition_Active_Position,
JSON_VALUE(body, '$.Position_User_Allocation') AS UserPosition_Position_User_Allocation,
IIF (REPLACE(REPLACE(JSON_QUERY(body, '$.Position_Manager'), '["',''), '"]','') = '[]',null,REPLACE(REPLACE(JSON_QUERY(body, '$.Position_Manager'), '["',''), '"]','')) AS UserPosition_Position_Manager,
IIF (REPLACE(REPLACE(JSON_QUERY(body, '$.position_allocated_user'), '["',''), '"]','') = '[]',null,REPLACE(REPLACE(JSON_QUERY(body, '$.position_allocated_user'), '["',''), '"]','')) AS UserPosition_position_allocated_user,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Position_User_Type'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS UserPosition_Position_User_Type

INTO ELMA_DB..ELMA_TABLE_UserPosition
-- DROP TABLE ELMA_DB..ELMA_TABLE_UserPosition
FROM ELMA_DB..ELMA_LOAD_UserPosition
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * FROM ELMA_DB..ELMA_TABLE_UserPosition
--SELECT * FROM ELMA_DB..ELMA_LOAD_UserPosition
GO

---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  UserPosition END  -------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
------------------------------------------------------------  UserPositionPlan  ---
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_UserPositionPlan') begin drop table ELMA_DB..ELMA_TABLE_UserPositionPlan end

SELECT id AS  UserPositionPlan_IDD,
JSON_VALUE(body, '$.__id') AS UserPositionPlan_id,
JSON_VALUE(body, '$.__name') AS UserPositionPlan_Name,
IIF (REPLACE(REPLACE(JSON_QUERY(body, '$.position_plan_allocated_user'), '["',''), '"]','') = '[]',null,REPLACE(REPLACE(JSON_QUERY(body, '$.position_plan_allocated_user'), '["',''), '"]','')) AS UserPositionPlan_allocated_user,
CONVERT ( float , JSON_VALUE(body, '$.FD_Plan')) AS UserPositionPlan_FD_Plan,
CONVERT ( float , JSON_VALUE(body, '$.Call_plan')) AS UserPositionPlan_Call_plan,
CONVERT ( float , JSON_VALUE(body, '$.FD_Actual')) AS UserPositionPlan_FD_Actual,
CONVERT ( float , JSON_VALUE(body, '$.Call_Actual')) AS UserPositionPlan_Call_Actual,
CONVERT ( float , JSON_VALUE(body, '$.Sick_list_Actual')) AS UserPositionPlan_Sick_list_Actual,
CONVERT ( float , JSON_VALUE(body, '$.Vacation_Actual')) AS UserPositionPlan_Vacation_Actual,
CONVERT ( float , JSON_VALUE(body, '$.Coaching_FD_Plan')) AS UserPositionPlan_Coaching_FD_Plan,
CONVERT ( float , JSON_VALUE(body, '$.DC_FD_Plan')) AS UserPositionPlan_DC_FD_Plan

INTO ELMA_DB..ELMA_TABLE_UserPositionPlan
-- DROP TABLE ELMA_DB..ELMA_TABLE_UserPositionPlan
FROM ELMA_DB..ELMA_LOAD_UserPositionPlan
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * FROM ELMA_DB..ELMA_TABLE_UserPositionPlan
--SELECT * FROM ELMA_DB..ELMA_LOAD_UserPositionPlan
GO

---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  UserPositionPlan END  ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
------------------------------------------------------------  UserDetails  --------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_UserDetails') begin drop table ELMA_DB..ELMA_TABLE_UserDetails end

SELECT id AS  UserDetails_IDD,
JSON_VALUE(body, '$.__id') AS UserDetails_id,
JSON_VALUE(body, '$.genesis_id') AS UserDetails_GenesisID,
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
CONVERT  ( datetime,left(JSON_VALUE(body, '$.Work_end_date'),19)) AS UserDetails_Work_end_date,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.FieldWork_start_date'),19)) AS UserDetails_FieldWork_start_date

INTO ELMA_DB..ELMA_TABLE_UserDetails
-- DROP TABLE ELMA_DB..ELMA_TABLE_UserDetails
FROM ELMA_DB..ELMA_LOAD_UserDetails
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
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
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * from ELMA_DB..ELMA_TABLE_Orgstruct
GO	
---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------  Orgstruct END  ------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
----------------------------------------------------------  TargetFrequency  ------
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_TargetFrequency') begin drop table ELMA_DB..ELMA_TABLE_TargetFrequency end

SELECT id AS RecordType_IDD,
JSON_VALUE(body, '$.__id') AS RecordType_id,
JSON_VALUE(body, '$.__name') AS RecordType_name,
JSON_VALUE(body, '$.IsActive') AS RecordType_IsActive,
JSON_VALUE(body, '$.Description') AS RecordType_Description,
JSON_VALUE(body, '$.SobjectType') AS RecordType_SobjectType,
JSON_VALUE(body, '$.DeveloperName') AS RecordType_DeveloperName,
JSON_VALUE(body, '$.NamespacePrefix') AS RecordType_NamespacePrefix

INTO ELMA_DB..ELMA_TABLE_TargetFrequency
-- DROP TABLE ELMA_DB..ELMA_TABLE_TargetFrequency
FROM ELMA_DB..ELMA_LOAD_TargetFrequency
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
--SELECT * from ELMA_DB..ELMA_TABLE_TargetFrequency
--SELECT * from ELMA_DB..ELMA_LOAD_TargetFrequency
GO	

---------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------  TargetFrequency END  ------------------------------------------------------
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
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
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
JSON_VALUE(body, '$.Division_Alpha_Account_Target_PrevCycle') AS Companies_Division_Alpha_Account_Target_PrevCycle,
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
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
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
JSON_VALUE(body, '$.DivisionAlphaTarget_PrevCycle') AS Contacts_DivisionAlphaTarget_PrevCycle,
REPLACE(REPLACE(JSON_QUERY(body, '$.APG_Responsible_General_Contact_User'), '["',''), '"]','') AS Contacts_APG_Responsible_General_Contact_User,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Division_General_Contact_Category'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Contacts_Division_General_Contact_Category,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Derma_Category'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Contacts_Derma_Category

INTO  ELMA_DB..ELMA_TABLE_Contacts
-- DROP TABLE ELMA_DB..ELMA_TABLE_Contacts
FROM ELMA_DB..ELMA_LOAD_Contacts
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
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
REPLACE(REPLACE(JSON_QUERY(body, '$.Owner'), '["',''), '"]','') AS Activity_Owner,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.Status'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Activity_Status,
JSON_VALUE(body, '$.__name') AS Activity_name,
left(JSON_VALUE(body, '$.__startAt'),10) as Activity_DayIdText,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__startAt'),19)) AS Activity_startAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) AS Activity_deletedAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__endAt'),19)) AS Activity_endAt,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__createdAt'),19)) AS Activity_createdAt,
REPLACE(REPLACE(JSON_QUERY(body, '$.Owner'), '["',''), '"]','') AS Activity_createdBy,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.__updatedAt'),19)) AS Activity_updatedAt,
JSON_VALUE(body, '$.__updatedBy') AS Activity_updatedBy,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.APG_Fact_Start_Date'),19)) AS Activity_APG_Fact_Start_Date,
CONVERT  ( datetime,left(JSON_VALUE(body, '$.APG_Fact_End_Date'),19)) AS Activity_APG_Fact_End_Date,
CONVERT ( float , JSON_VALUE(body, '$.GeolocationFinish__Latitude')) AS Activity_GeolocationFinish__Latitude,
CONVERT ( float , JSON_VALUE(body, '$.GeolocationFinish__Longitude')) AS Activity_GeolocationFinish__Longitude,
CONVERT ( float , JSON_VALUE(body, '$.APG_Call_Geolocation__Latitude')) AS Activity_APG_Call_Geolocation__Latitude,
CONVERT ( float , JSON_VALUE(body, '$.APG_Call_Geolocation__Longitude')) AS Activity_APG_Call_Geolocation__Longitude,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.TypeOfEvent'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS TypeOfEvent,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.TypeOfTimeOff'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS TypeOfTimeOff,
JSON_VALUE(body, '$.MobileId') AS Activity_MobileId,
JSON_VALUE(body, '$.IsExceedingDistance') AS Activity_IsExceedingDistance,
CONVERT(float,JSON_VALUE(body, '$.DistanceBetweenAccountAndFinishActivity')) AS Activity_DistanceBetweenAccountAndFinishActivity,
JSON_VALUE(body, '$.Call_in_pharmacy_day') AS Activity_CallInPharmacyDay,
JSON_VALUE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_QUERY(body, '$.CallSource'), '["',''), '"]',''), '[',''), ']',''),'$.name') AS Activity_CallSource

INTO  ELMA_DB..ELMA_TABLE_Activity
-- DROP TABLE ELMA_DB..ELMA_TABLE_Activity
FROM ELMA_DB..ELMA_LOAD_Activity
where CONVERT  ( datetime,left(JSON_VALUE(body, '$.__deletedAt'),19)) is null
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
Day_Work_Day_MR,
Day_Work_Day_RSM,

iif (Table_RecordType.RecordType_name = 'Мероприятие',TypeOfEvent,iif (Table_RecordType.RecordType_name = 'Время вне территории',TypeOfTimeOff,Table_RecordType.RecordType_name)) as Activity_SUB_type,

CASE iif (Table_RecordType.RecordType_name = 'Мероприятие',TypeOfEvent,iif (Table_RecordType.RecordType_name = 'Время вне территории',TypeOfTimeOff,Table_RecordType.RecordType_name))
WHEN  'Аудит визит' THEN 'Coaching'
WHEN  'Годовое/Полугодовое собеседование' THEN 'Coaching'
WHEN  'Двойной визит' THEN 'Coaching'
WHEN  'Индивидуальная работа RSM/MR' THEN 'Coaching'
WHEN  'Командное собрание' THEN 'Coaching'
WHEN  'Наставничество' THEN 'Coaching'
WHEN  'Рекрутмент' THEN 'Coaching'
WHEN  'Совместное мероприятие (Конф, КС)' THEN 'Coaching'
else 'Others' end as  Activity_RSM_CoachingType,

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
left join
  (select Day_Name,Day_Work_Day_MR,Day_Work_Day_RSM from ELMA_DB..ELMA_TABLE_Day) Table_Day
on ELMA_DB..ELMA_TABLE_Activity.Activity_DayIdText = Table_Day.Day_Name

GO
---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------  Acivity_2 END  -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------
--------♦------------♦------------♦------------♦------------♦------------♦------------♦------------♦------------♦------------♦--------
-------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦-------
------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦------
-----♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦-----
----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----♦♦♦♦♦♦♦♦♦----
-----♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦------♦♦♦♦♦♦♦-----
------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦--------♦♦♦♦♦------
-------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦----------♦♦♦-------
--------♦------------♦------------♦------------♦------------♦------------♦------------♦------------♦------------♦------------♦--------
--------------------------------------------------------------------------------------------------------------------------------------

-- ЭТИ ЗАПРОСЫ ДОЛГИЕ И НУЖНЫ РЕДКО (СТАТИСТИКА ПО ПРЕЗЕНТАЦИЯМ, ДЕТАЛИЗАЦИЯ ВИЗИТА) - ЛУЧШЕ ЗАПУСКАТЬ ИХ ОТДЕЛЬНО ПРИ НЕОБХОДИМОСТИ



----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_ActivityData@ActivityId') begin drop table ELMA_DB..ELMA_TABLE_ActivityData@ActivityId end
select * INTO ELMA_DB..ELMA_TABLE_ActivityData@ActivityId FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."glenmark:ActivityData@ActivityId"  ')
--------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_LOAD_ApplicationStats') begin drop table ELMA_DB..ELMA_LOAD_ApplicationStats end
select * into ELMA_DB..ELMA_LOAD_ApplicationStats FROM OPENQUERY([ELAMAODBC], 
'select
Id as IDD,
body->>''__id'' as id,
body->>''__name'' as __name,
body->>''Order'' as Order,
body->>''Views'' as Views,
body->>''Clicks'' as Clicks,
body->>''ViewTime'' as ViewTime,
body->>''StartTime'' as StartTime,
body->>''__createdAt'' as CreatedAt,
body->>''__createdBy'' as CreatedBy,
body->>''IsFinishedByTimeout'' as IsFinishedByTimeout
from head."mdm:ApplicationStats"')
GO

----------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_Slide@ApplicationId') begin drop table ELMA_DB..ELMA_TABLE_Slide@ApplicationId end
select * INTO ELMA_DB..ELMA_TABLE_Slide@ApplicationId  FROM OPENQUERY([ELAMAODBC], 'SELECT * FROM head."mdm:Slide@ApplicationId"  ')
----------------------------



-----------------------------------------------------------------------------------
------------------------------------------------------------  ApplicationStats  ---
-----------------------------------------------------------------------------------
IF EXISTS(SELECT * FROM ELMA_DB..sysobjects where name = 'ELMA_TABLE_ApplicationStats') begin drop table ELMA_DB..ELMA_TABLE_ApplicationStats end

SELECT idd AS  ApplicationStats_IDD,
id AS ApplicationStats_id,
__name AS ApplicationStats_Name,
CONVERT  ( datetime,left(createdat,19)) AS ApplicationStats_createdat,
createdby as ApplicationStats_createdby,
CONVERT  ( int,[order]) AS ApplicationStats_order,
CONVERT  ( int,[views]) AS ApplicationStats_views,
CONVERT  ( int,[clicks]) AS ApplicationStats_clicks,
CONVERT  ( float,[viewtime]) AS ApplicationStats_viewtime
INTO ELMA_DB..ELMA_TABLE_ApplicationStats
-- DROP TABLE ELMA_DB..ELMA_TABLE_ApplicationStats
FROM ELMA_DB..ELMA_LOAD_ApplicationStats

--SELECT * FROM ELMA_DB..ELMA_TABLE_ApplicationStats
--SELECT top 10 * FROM ELMA_DB..ELMA_LOAD_ApplicationStats
GO
---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  ApplicationStats END  ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

