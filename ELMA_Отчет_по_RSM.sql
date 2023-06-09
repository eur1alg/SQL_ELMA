USE ELMA_DB


------- ��������� �� ����
declare @start_cycle_date date
declare @end_cycle_date date
declare @RSM_WD_PLAN int


SET @start_cycle_date = '2023-01-01'
SET @end_cycle_date = '2023-03-31'


---------�������� ���������� ������� ���� �� ����!------------
SET @RSM_WD_PLAN = 17+18+22
------------------------------------------

IF EXISTS(SELECT * FROM ELMA_REPORT..sysobjects where name = 'RSM_REPORT_DATA_actual') begin drop table ELMA_REPORT.dbo.RSM_REPORT_DATA_actual end


SELECT
[ELMA_TABLE_Activity_2].[Activity_Id] as ActivityId, 
[User].Users_id as 'Id',
'' as '������',
[User].UserDetails_ASM as 'ASM',
[User].UserDetails_RSM as 'RSM',
[User].Users_Name as '���������',
[User].UserDetails_Type as '���',
iif([User].UserDetails_UserDivision = 'General','Rx',iif([User].UserDetails_UserDivision = 'Pharmacy','Ph','Unknown' )) as '�������',
[User].UserDetails_Status,
'Rx' as APG_User_Team__c,
[User].Users_id as 'Id_Long',
UserDetails_UserDivision as CTPHARMA__UserDivision__c,
UserDetails_UserDivision as CTPHARMA__CalendarUserDivision__c,
'����' as 'Data type',
[User].[UserDetails_IsActive] as IsActive,
[User].UserDetails_Manager_TXT as '������������',
Activity_RSM_CoachingType as '��� ����������',
ELMA_DB..ELMA_TABLE_Activity_2.Activity_SUB_type as '������ ����������',
ELMA_DB..ELMA_TABLE_Activity_2.Activity_duration_day as '������������',
ELMA_DB..ELMA_TABLE_Activity_2.[Activity_startAt] as Activity_startAt,
ELMA_DB..ELMA_TABLE_Activity_2.[Activity_endAt] as Activity_endAt

INTO [ELMA_REPORT]..RSM_REPORT_DATA_actual

from [ELMA_DB]..[ELMA_VIEW_UsersStructDetails] [User]
inner join 
ELMA_DB..ELMA_TABLE_Activity_2

on ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [User].Users_id 

where [User].UserDetails_Type in ('ASM','RSM','SUPERVISOR')
and ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = '��������' 
and ELMA_DB..ELMA_TABLE_Activity_2.Activity_DayIdText between @start_cycle_date and @end_cycle_date

--------------------------- ���������� 2 ������� (���� � ���������) ---------------------------------------
UNION ALL
--------------------------- ���������� 2 ������� (���� � ���������) ---------------------------------------


Select 
'xxx' as ActivityId, 
Id,
������,
ASM,
RSM,
���������,
���,
�������,
APG_User_status__c,
APG_User_Team__c,
Id_Long,
CTPHARMA__UserDivision__c,
CTPHARMA__CalendarUserDivision__c,
'����' as 'Data type',
IsActive,
������������,
'Unaccounted' as [��� ����������],
'��������' as [������ ����������],
iif (������������ >= @RSM_WD_PLAN,0,@RSM_WD_PLAN-������������) as '������������',
null as Activity_startAt,
null as Activity_endAt

from 

(SELECT
[User].Users_id as 'Id',
'' as '������',
[User].UserDetails_ASM as 'ASM',
[User].UserDetails_RSM as 'RSM',
[User].Users_Name as '���������',
[User].UserDetails_Type as '���',
iif([User].UserDetails_UserDivision = 'General','Rx',iif([User].UserDetails_UserDivision = 'Pharmacy','Ph','Unknown' )) as '�������',
[User].UserDetails_Status as APG_User_status__c,
'Rx' as APG_User_Team__c,
[User].Users_id as 'Id_Long',
[User].UserDetails_UserDivision as CTPHARMA__UserDivision__c,
[User].UserDetails_UserDivision as CTPHARMA__CalendarUserDivision__c,
[User].[UserDetails_IsActive] as IsActive,
[User].UserDetails_Manager_TXT as '������������',
SUM (ELMA_DB..ELMA_TABLE_Activity_2.Activity_duration_day) as '������������'

--INTO RSM_REPORT_DATA_2017_08

from [ELMA_DB]..[ELMA_VIEW_UsersStructDetails] [User]
inner join 
ELMA_DB..ELMA_TABLE_Activity_2

on ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [User].Users_id 

where [User].UserDetails_Type in ('ASM','RSM','SUPERVISOR')
and ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = '��������' 
and ELMA_DB..ELMA_TABLE_Activity_2.Activity_DayIdText between @start_cycle_date and @end_cycle_date

GROUP BY 

[User].Users_id,
[User].UserDetails_ASM,
[User].UserDetails_RSM,
[User].Users_Name,
[User].UserDetails_Type,
iif([User].UserDetails_UserDivision = 'General','Rx',iif([User].UserDetails_UserDivision = 'Pharmacy','Ph','Unknown' )),
[User].UserDetails_Status,
[User].Users_id,
[User].UserDetails_UserDivision,
[User].UserDetails_UserDivision,
[User].[UserDetails_IsActive],
[User].UserDetails_Manager_TXT) Unaccounted_TABLE_1


--------------------------- ���������� ������� (���� � ����) ---------------------------------------
UNION ALL
--------------------------- ���������� ������� (���� � ����) ---------------------------------------
(
SELECT
'xxx' as ActivityId, 
[User].Users_id as 'Id',
'' as '������',
[User].UserDetails_ASM as 'ASM',
[User].UserDetails_RSM as 'RSM',
[User].Users_Name as '���������',
[User].UserDetails_Type as '���',
iif([User].UserDetails_UserDivision = 'General','Rx',iif([User].UserDetails_UserDivision = 'Pharmacy','Ph','Unknown' )) as '�������',
[User].UserDetails_Status,
'Rx' as APG_User_Team__c,
[User].Users_id as 'Id_Long',
UserDetails_UserDivision as CTPHARMA__UserDivision__c,
UserDetails_UserDivision as CTPHARMA__CalendarUserDivision__c,
'����' as 'Data type',
[User].[UserDetails_IsActive] as IsActive,
[User].UserDetails_Manager_TXT as '������������',
'Coaching' as '��� ����������',
'������� �����' as '������ ����������',
UserPositionPlan_DC_FD_Plan as '������������',
null as Activity_startAt,
null as Activity_endAt

from [ELMA_DB]..[ELMA_VIEW_UsersStructDetails] [User]
left join [ELMA_VIEW_UserPosition_UserPositionPlan_Month] on [User].Users_id = UserPosition_position_allocated_user

where [User].UserDetails_Type in ('ASM','RSM')
and [User].[UserDetails_IsActive] = 'true'
and Month_Name between left(@start_cycle_date,7) and left(@end_cycle_date,7)  --workday
) 


--select *  from [ELMA_REPORT]..RSM_REPORT_DATA_actual


