use [ELMA_DB]
------- ��������� �� ����
declare @start_month_date date
declare @end_month_date date
declare @start_cycle_date date
declare @end_cycle_date date
declare @start_cycle_date_TCFA date
declare @TCFA_Ph_plan_A int
declare @TCFA_Ph_plan_B int
declare @TCFA_Ph_plan_C int
declare @TCFA_Rx_plan_5 int
declare @TCFA_Rx_plan_4 int
declare @TCFA_Rx_plan_3 int
declare @TCFA_Rx_plan_2 int
--�������� TCFA ����� --
SET @TCFA_Rx_plan_5 = 5
SET @TCFA_Rx_plan_4 = 4
SET @TCFA_Rx_plan_3 = 3
SET @TCFA_Rx_plan_2 = 2
--�������� TCFA ������--
SET @TCFA_Ph_plan_A = 3
SET @TCFA_Ph_plan_B = 3
SET @TCFA_Ph_plan_C = 3
--�������� ����--
SET @start_month_date = '2023-03-01'
SET @end_month_date = '2023-03-31'

SET @start_cycle_date = '2023-01-01'
SET @end_cycle_date = '2023-03-31'

SET @start_cycle_date_TCFA = '2023-01-01'


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

IF EXISTS(SELECT * FROM ELMA_REPORT..sysobjects where name = 'FULL_MONTHLY_REPORT_actual') begin drop table ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual end

drop table #AAV_User_Position_for_Report

---------------------------------------------------
---------USER POSITIONS---BEGIN--------------------
---------------------------------------------------


select User_position_Name
 --, User_Position_plan__c 
 , User_position_plan_alloc__c
 , User_Position_Division__c
 , User_Position_type__c
 , User_position_plan_alloc__Name

 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then Call_plan__c else 0 end) as Call_plan_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then Call_plan__c else 0 end) as Call_plan_CTD

 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then Call_plan_final__c else 0 end) as Call_plan_final_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then Call_plan_final__c else 0 end) as Call_plan_final_CTD


 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then DC_FD_Plan__c else 0 end) as DC_FD_Plan_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then DC_FD_Plan__c else 0 end) as DC_FD_plan_CTD

 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then FD_Plan__c else 0 end) as FD_Plan_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then FD_Plan__c else 0 end) as FD_plan_CTD

 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then FD_Plan_final__c else 0 end) as FD_Plan_final_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then FD_Plan_final__c else 0 end) as FD_plan_final_CTD


 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then Sick_list_Plan__c else 0 end) as Sick_list_Plan_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then Sick_list_Plan__c else 0 end) as Sick_list_plan_CTD
 
 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then Vacation_Plan__c else 0 end) as Vacation_Plan_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then Vacation_Plan__c else 0 end) as Vacation_plan_CTD

 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then Vacation_Actual__c else 0 end) as Vacation_Actual_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then Vacation_Actual__c else 0 end) as Vacation_Actual_CTD

 , sum (case when Month_Position_Plan__c = left (@start_month_date,7) then Sick_list_Actual__c else 0 end) as Sick_list_Actual_Month
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then Sick_list_Actual__c else 0 end) as Sick_list_Actual_CTD

 
 INTO 
 --select * from
#AAV_User_Position_for_Report

from (
select 
[UserPositionPlan_id]
, [UserPositionPlan_Name]
, case when [UserPositionPlan_Call_Actual] is NULL then 0 else [UserPositionPlan_Call_Actual] end as Call_plan_final__c
, case when [UserPositionPlan_Call_plan] is NULL then 0 else [UserPositionPlan_Call_plan] end as Call_plan__c

, case when [UserPositionPlan_DC_FD_Plan] is NULL then 0 else [UserPositionPlan_DC_FD_Plan] end as DC_FD_Plan__c
, case when [UserPositionPlan_FD_Actual] is NULL then 0 else [UserPositionPlan_FD_Actual] end as FD_Plan_final__c
, case when [UserPositionPlan_FD_Plan] is NULL then 0 else [UserPositionPlan_FD_Plan] end as FD_Plan__c

, case when [UserPositionPlan_Sick_list_Actual] is NULL then 0 else [UserPositionPlan_Sick_list_Actual] end as Sick_list_Plan__c
, case when [UserPositionPlan_Vacation_Actual] is NULL then 0 else [UserPositionPlan_Vacation_Actual] end as Vacation_Plan__c
, case when [UserPositionPlan_Vacation_Actual] is NULL then 0 else [UserPositionPlan_Vacation_Actual] end as Vacation_Actual__c
, case when [UserPositionPlan_Sick_list_Actual] is NULL then 0 else [UserPositionPlan_Sick_list_Actual] end as Sick_list_Actual__c

, [UserPosition_Name] as User_position_Name
,[UserPositionPlan_id] as User_Position_plan__c 
, [UserPosition_position_allocated_user] as User_position_plan_alloc__c
, 'General' as User_Position_Division__c
, [UserPosition_Active_Position] as Active_Position__c
, [UserPosition_Position_User_Type] as User_Position_type__c
, [Month_Name] as Month_Position_Plan__c
, [UserPositionPlan_allocated_user] as User_position_plan_alloc__Name

from [dbo].[ELMA_VIEW_UserPosition_UserPositionPlan_Month]

where [Month_Name] >= left(@start_cycle_date, 7) and [Month_Name] <= left(@end_cycle_date, 7)
) a

group by User_position_Name
 --, User_Position_plan__c 
 , User_position_plan_alloc__c
 , User_Position_Division__c
 , User_Position_type__c
 , User_position_plan_alloc__Name
 
 
---------USER POSITIONS---END--------------------


------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
---------���� �������---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

Select 
[APG_User_Position__c] as 'User Position',
[User_Position_ID_text__c],
APG_Representative__c AS 'Representative alloc',
APG_Representative__c as Representative,
MR_DATA_TABLE.[Users_id] as 'Full Name',
[APG_Manager_txt__c] as 'Manager (txt)',
case 
	when [IsActive] = 'true' then 1
	else 0 
end as 'ISACTIVE',
case
	when APG_Active_User__c = 'true' then 1
	else 0
end as 'APG_ACTIVE_USER__C',
APG_User_Type__c as TYPE,
case 
	when [CTPHARMA__UserDivision__c] = 'General' then 'Rx'
	--when [CTPHARMA__UserDivision__c] = 'Pharmacy' then 'Ph'
	when [CTPHARMA__UserDivision__c] = 'Universal D' then 'KAM_Ph'
	when [CTPHARMA__UserDivision__c] = 'Derma' then 'Kw'
end as 'Line',
APG_ASM__c as 'ASM',
APG_RSM__c as 'RSM', 
[�������_CTD] as '������� CTD',
[������_CTD] as '������ CTD',
cast([�������_���_��_����] as decimal(10,2)) as 'WD Cycle',
cast([�������_���_��_�����] as decimal(10,2)) as 'WD Month',
[�����������_��_����] as '��� Cycle',
[�����������_��_�����] as '��� Month',
[��������_������_��_����] as '�������� ������ Cycle',
[�����������_��_����] AS '������ Cycle',
[�����������_��_�����] AS '������ Month',



[�������_�����_��_����] as '������� ����',
[����������_��_����] AS '����������',
[���������_������_��_����] AS '������ ������',
[���������_������_����_��_����] AS '������_����_���',

#AAV_User_Position_for_Report.[FD_Plan_CTD] AS '���� �� Cycle',  --������� ��� �� ����
#AAV_User_Position_for_Report.[FD_Plan_Month]  AS '���� �� Month',--������� ��� �� �����

#AAV_User_Position_for_Report.[FD_plan_final_CTD] AS '���� �� ����� Cycle',  --������� ��� ����� �� ����
#AAV_User_Position_for_Report.[FD_Plan_final_Month]  AS '���� �� ����� Month',--������� ��� ����� �� �����



#AAV_User_Position_for_Report.[Call_Plan_CTD] AS '���� ��� Cycle', --���� ������� �� ����
#AAV_User_Position_for_Report.[Call_Plan_Month] AS '���� ��� Month', --���� ������� �� �����

#AAV_User_Position_for_Report.[Call_plan_final_CTD] AS '���� ��� ����� Cycle', --���� ������� ����� �� ����
#AAV_User_Position_for_Report.[Call_plan_final_Month] AS '���� ��� ����� Month', --���� ������� ����� �� �����


#AAV_User_Position_for_Report.Vacation_plan_CTD AS '���� ������� Cycle', --���� ������� �� ����
#AAV_User_Position_for_Report.Sick_list_plan_CTD AS '���� ���������� Cycle', -- ���� ���������� �� ����
#AAV_User_Position_for_Report.Vacation_Actual_CTD AS '���� ������� Cycle', -- ���� ������� �� ����
#AAV_User_Position_for_Report.Sick_list_Actual_CTD AS '���� ���������� Cycle', -- ���� ���������� �� ����



-- ��� ���������

Target_5_qnt AS '�����_5_������',   
PLAN_5_ACHIEV AS '�����_5_�������',   
Target_4_qnt AS '�����_4_������',
PLAN_4_ACHIEV AS '�����_4_�������',
Target_3_qnt AS '�����_3_������',   
PLAN_3_ACHIEV AS '�����_3_�������',   
Target_2_qnt AS '�����_2_������',   
PLAN_2_ACHIEV AS '�����_2_�������',   

Target_Ph_A_qnt AS '������_A_������', 
PLAN_Ph_A_ACHIEV AS '������_A_�������', 

Target_Ph_B_qnt AS '������_B_������', 
PLAN_Ph_B_ACHIEV AS '������_B_�������', 

Target_Ph_C_qnt AS '������_C_������', 
PLAN_Ph_C_ACHIEV AS '������_C_�������', 

case 
	when [APG_User_status__c] = '��������' then '������ ����'
	when [APG_User_status__c] in ('�����', '��������') then '�������� ����'
end AS '������ ������',
[APG_User_status__c],
cast(LEFT(convert(varchar(20), APG_Work_start_date__c, 120), 10) as varchar(10)) as APG_Work_start_date__c,
cast(LEFT(convert(varchar(20), APG_Work_end_date__c, 120), 10) as varchar(10)) as APG_Work_end_date__c



into 
--select * from 
[ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
FROM

--------------������ ������� �� ��----------------
(Select 
[Users_id],
[UserDetails_Position] as [APG_User_Position__c],
[UserDetails_Position] as [User_Position_ID_text__c],
[Users_Name] as APG_Representative__c,
[UserDetails_Manager_TXT] as [APG_Manager_txt__c],
[UserDetails_IsActive] as [IsActive],
[UserDetails_IsActive] as APG_Active_User__c,
[UserDetails_Type] as APG_User_Type__c,
[UserDetails_UserDivision] as [CTPHARMA__UserDivision__c],
[UserDetails_ASM] as APG_ASM__c,
[UserDetails_RSM] as APG_RSM__c, 
isnull([�������_CTD],0) as '�������_CTD',
isnull([������_CTD],0) as '������_CTD',
isnull([����������� �� ����],0) as '�����������_��_����',
isnull([����������� �� �����],0) as '�����������_��_�����',
isnull([�������� ������ �� ����],0) as '��������_������_��_����',
isnull([������� ����� �� ����],0) as '�������_�����_��_����',
isnull([���������� �� ����],0) as '����������_��_����',
isnull([��������� ������ �� ����],0) as '���������_������_��_����',
isnull([��������� ������ ���� �� ����],0) as '���������_������_����_��_����',
isnull([������� ��� �� ����],0) as '�������_���_��_����',
isnull([������� ��� �� �����],0) as '�������_���_��_�����',

[UserDetails_Status] as [APG_User_status__c],
[UserDetails_Work_start_date] as [APG_Work_start_date__c],
[UserDetails_Work_end_date] as [APG_Work_end_date__c]

from [dbo].[ELMA_VIEW_UsersStructDetails]

--------- �������� ���������� �� ����
left join 
(Select [Activity_createdBy] as CreatedById, count(*) as '�������_CTD' from [ELMA_VIEW_ActivityFull]
where	
[Activity_Status] = '��������' and 
([Activity_SUB_type] = '�������')  and 
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) �������_TABLE
on [Users_id] = [�������_TABLE].CreatedById


-------- �������� ������� �� ����
left join 
(Select [Activity_createdBy] as CreatedById, count(*) as '������_CTD' from [ELMA_VIEW_ActivityFull]
where	
[Activity_Status] = '��������' and 
([Activity_SUB_type] = '������')  and 
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) ������_CTD_TABLE
on [Users_id] = ������_CTD_TABLE.CreatedById

-------- �������� ����������� �� ����
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '����������� �� ����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] in ('����� � ������','����� � �����') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) �����������_��_����_TABLE
on [Users_id] = �����������_��_����_TABLE.CreatedById

-------- �������� ����������� �� �����

left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '����������� �� �����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] in ('����� � ������','����� � �����') and
[Activity_DayIdText] between @start_month_date and @end_month_date
group by [Activity_createdBy]) �����������_��_�����_TABLE
on [Users_id] = �����������_��_�����_TABLE.CreatedById

-------- �������� �������� ������ �� ����
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '�������� ������ �� ����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] = '����� � ������' and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) ��������_������_��_����_TABLE
on [Users_id] = ��������_������_��_����_TABLE.CreatedById

-------- �������� ������� ����� �� ����
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '������� ����� �� ����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] = '������� ����' and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) �������_�����_��_����_TABLE
on [Users_id] = �������_�����_��_����_TABLE.CreatedById

-------- �������� ���������� �� ����
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '���������� �� ����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] = '����������' and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) ����������_��_����_TABLE
on [Users_id] = ����������_��_����_TABLE.CreatedById

-------- �������� ��������� ������ �� ����
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '��������� ������ �� ����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
--([Companies_APG_Division_Alpha_Account_Target] = 'true' or [Contacts_Division_General_Contact_Target] = 'true') and   -------------------------- ��������� ----------------------------
([Companies_Division_Alpha_Account_Target_PrevCycle] = 'true' or [Contacts_DivisionAlphaTarget_PrevCycle] = 'true') and  -------------------------- ��������� ----------------------------
[Activity_SUB_type] in ('����� � ������','����� � �����') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) ���������_������_��_����_TABLE
on [Users_id] = ���������_������_��_����_TABLE.CreatedById

-------- �������� ��������� ������ ���� �� ����
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as '��������� ������ ���� �� ����' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] in ('����� � ������','����� � �����') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) ���������_������_����_��_����_TABLE
on [Users_id] = ���������_������_����_��_����_TABLE.CreatedById


-------- �������� ������� ��� �� ����
left join
(select [Activity_createdBy],sum(day_EQV) as '������� ��� �� ����' from
(select [Activity_createdBy],Day_day,visits_per_day, iif(visits_per_day>7,1,iif(visits_per_day>=1,0.5,0)) as day_EQV  from 
(Select [Activity_createdBy], [Activity_DayIdText] as Day_day, count (*) as visits_per_day from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] in ('����� � ������','����� � �����') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_DayIdText], [Activity_createdBy]) visits_per_day) EQV_per_day
group by [Activity_createdBy]) �������_���_��_����_TABLE
on [Users_id] = �������_���_��_����_TABLE.[Activity_createdBy]


-------- �������� ������� ��� �� �����
left join
(select [Activity_createdBy],sum(day_EQV) as '������� ��� �� �����' from
(select [Activity_createdBy],Day_day,visits_per_day, iif(visits_per_day>7,1,iif(visits_per_day>=1,0.5,0)) as day_EQV  from 
(Select [Activity_createdBy], [Activity_DayIdText] as Day_day, count (*) as visits_per_day from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = '��������' and 
[Activity_SUB_type] in ('����� � ������','����� � �����') and
[Activity_DayIdText] between @start_month_date and @end_month_date
group by [Activity_DayIdText], [Activity_createdBy]) visits_per_day) EQV_per_day
group by [Activity_createdBy]) �������_���_��_�����_TABLE
on [Users_id] = �������_���_��_�����_TABLE.[Activity_createdBy]


) MR_DATA_TABLE

--------------JOIN c User Positions------------------
left join #AAV_User_Position_for_Report 
on MR_DATA_TABLE.[Users_id] = #AAV_User_Position_for_Report.User_position_plan_alloc__c
-----------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                     TCFA �� ������    -------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
left join

(SELECT
Representative,
UserId,
SUM(iif (Category_group = '5',Target_qnt,0)) AS Target_5_qnt,   
SUM(iif (Category_group = '5',PLAN_ACHIEV,0)) AS PLAN_5_ACHIEV,   

SUM(iif (Category_group = '4',Target_qnt,0)) AS Target_4_qnt,   
SUM(iif (Category_group = '4',PLAN_ACHIEV,0)) AS PLAN_4_ACHIEV,   


SUM(iif (Category_group = '3',Target_qnt,0)) AS Target_3_qnt,
SUM(iif (Category_group = '3',PLAN_ACHIEV,0)) AS PLAN_3_ACHIEV,


SUM(iif (Category_group = '2',Target_qnt,0)) AS Target_2_qnt,
SUM(iif (Category_group = '2',PLAN_ACHIEV,0)) AS PLAN_2_ACHIEV

FROM

(
--------- ������� TCFA �� ������ BEGIN -------------

Select 
Line,
ASM,
Manager_txt,
Representative,
Account_Name,
Brick,
Account_Address,
Doc_Name,
Speciality,
Division_Alpha_Contact_Category as Category,
iif(Division_Alpha_Contact_Category = '5','5',iif(Division_Alpha_Contact_Category = '4','4',iif(Division_Alpha_Contact_Category = '3','3',iif(Division_Alpha_Contact_Category = '2','2',Division_Alpha_Contact_Category)))) as Category_group,
isnull(Call_Qnt,0) as Call_Qnt, 
iif(Division_Alpha_Contact_Category = '5' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_5,1,
iif(Division_Alpha_Contact_Category = '4' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_4,1,
iif(Division_Alpha_Contact_Category = '3' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_3,1,
iif(Division_Alpha_Contact_Category = '2' and  isnull(Call_Qnt,0)>=@TCFA_Rx_plan_2,1,0)))) as PLAN_ACHIEV,
1 as Target_qnt,
UserId,
Doctor_Target.ContactId as ClientId

--������ ��������� ������

FROM

(SELECT 
'Rx' AS Line,
[User].[UserDetails_ASM] as ASM,
Contact.Contacts_id as ContactId,
[User].UserDetails_Manager_TXT as Manager_txt,
[User].Users_Name as Representative,
Contact.Companies_Name as Account_Name, 
Contact.Companies_APG_Address as Account_Address, 
Contact.APG_Locality_Name as Brick, 
Contact.Contacts_Division_General_Contact_Category as Division_Alpha_Contact_Category, 
Contact.Contacts_Name as Doc_Name, 
Contact.Contacts_APG_Specialty as Speciality, 
[User].Users_id AS UserId,
Contact.Contacts_IsActive
FROM 
[ELMA_VIEW_ContactsCompaniesAPGLocality] Contact INNER JOIN [ELMA_VIEW_UsersStructDetails]  [User] ON Contact.Contacts_APG_Responsible_General_Contact_User = [User].Users_id
WHERE 
(Contact.Contacts_Division_General_Contact_Category='5' Or Contact.Contacts_Division_General_Contact_Category='4' Or Contact.Contacts_Division_General_Contact_Category='3' Or Contact.Contacts_Division_General_Contact_Category='2') AND 
Contact.Contacts_IsActive='true' AND 
Contact.RecordType_name = 'Doctor' AND 
([User].UserDetails_Type = 'SUPERVISOR' Or [User].UserDetails_Type = 'REP' Or [User].UserDetails_Type = 'KAS' Or [User].UserDetails_Type = 'RSM' Or [User].UserDetails_Type = 'KAM' Or [User].UserDetails_Type = 'KAS_Ph') AND 
[User].UserDetails_UserDivision = 'General' AND
--Contact.Contacts_Division_General_Contact_Target='true'  -------------------------- ��������� ----------------------------
Contact.Contacts_DivisionAlphaTarget_PrevCycle='true'   -------------------------- ��������� ----------------------------
) Doctor_Target

--������ ���������� ������� ��������� ������ � ������������ �� ���������
left join

(
SELECT ELMA_DB..ELMA_TABLE_Activity_2.ContactId as Contact_Id, Count(ELMA_DB..ELMA_TABLE_Activity_2.Activity_Id) AS Call_Qnt
FROM ELMA_DB..ELMA_TABLE_Activity_2,[ELMA_VIEW_UsersStructDetails]
WHERE ELMA_DB..ELMA_TABLE_Activity_2.Activity_RecordType_name = '����� � �����' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = '��������' AND 
ELMA_DB..ELMA_TABLE_Activity_2.[Activity_DayIdText] between @start_cycle_date and @end_cycle_date AND
ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [ELMA_VIEW_UsersStructDetails].Users_id AND [ELMA_VIEW_UsersStructDetails].UserDetails_UserDivision = 'General'
GROUP BY ELMA_DB..ELMA_TABLE_Activity_2.ContactId
) Doctor_Call

on Doctor_Target.ContactId = Doctor_Call.Contact_Id) TCFA_DOCTOR_TABLE

GROUP BY 
Representative,
UserId)
MR_DOC_TCFA_TABLE
--------- ����� ������� TCFA �� ������ BEGIN -------------
ON MR_DATA_TABLE.[Users_id]  = MR_DOC_TCFA_TABLE.UserId

-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                     ����� TCFA �� ������    -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                     TCFA �� �������    ------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------



left join

--------- ������� TCFA �� ������� BEGIN -------------

(Select 
UserId,
Representative,
sum(Target_A_qnt) as Target_Ph_A_qnt,
SUM(PLAN_A_ACHIEV) as PLAN_Ph_A_ACHIEV,
sum(Target_qnt) as Target_Ph_B_qnt,
SUM(PLAN_ACHIEV) as PLAN_Ph_B_ACHIEV,
sum(Target_C_qnt) as Target_Ph_C_qnt,
SUM(PLAN_C_ACHIEV) as PLAN_Ph_C_ACHIEV


from 

(Select 
UserId,
Representative,
iif(APG_Division_Alpha_Account_Category = 'A' and  isnull(Call_Qnt,0)>=@TCFA_Ph_plan_A,1,0) as PLAN_A_ACHIEV,
iif(APG_Division_Alpha_Account_Category = 'A',1,0) as Target_A_qnt,

iif(APG_Division_Alpha_Account_Category = 'B' and  isnull(Call_Qnt,0)>=@TCFA_Ph_plan_B,1,0) as PLAN_ACHIEV,
iif(APG_Division_Alpha_Account_Category = 'B',1,0) as Target_qnt,

iif(APG_Division_Alpha_Account_Category = 'C' and  isnull(Call_Qnt,0)>=@TCFA_Ph_plan_C,1,0) as PLAN_C_ACHIEV,
iif(APG_Division_Alpha_Account_Category = 'C',1,0) as Target_C_qnt

from
--������ ��������� �����
(SELECT 
Account.Companies_id as AccountId,
Account.Companies_Division_General_Account_Category as APG_Division_Alpha_Account_Category,
[User].Users_id AS UserId,
[User].Users_Name as Representative
FROM [ELMA_VIEW_CompaniesAPGLocality] Account INNER JOIN [dbo].[ELMA_VIEW_UsersStructDetails]  [User] ON Account.Companies_APG_General_responsible_User = [User].Users_id

WHERE (Account.Companies_Division_General_Account_Category = 'A' Or Account.Companies_Division_General_Account_Category = 'B' Or Account.Companies_Division_General_Account_Category = 'C') AND 
Account.Companies_IsActive='true' AND 
--Account.Companies_APG_Division_Alpha_Account_Target = 'true' AND   -------------------------- ��������� ----------------------------
Account.Companies_Division_Alpha_Account_Target_PrevCycle = 'true' AND  -------------------------- ��������� ----------------------------
([User].UserDetails_Type = 'SUPERVISOR' Or [User].UserDetails_Type = 'REP' Or [User].UserDetails_Type = 'KAS' Or [User].UserDetails_Type = 'RSM' Or [User].UserDetails_Type = 'KAM' Or [User].UserDetails_Type = 'KAS_Ph') AND 
[User].UserDetails_UserDivision = 'General' AND
Account.RecordType_name = 'Pharmacy'
) Pharmacy_Target

--������ ���������� ������� �������� ������ � ������������ �� ������������
left join 

(
SELECT ELMA_DB..ELMA_TABLE_Activity_2.AccountId as Account_Id, Count(ELMA_DB..ELMA_TABLE_Activity_2.Activity_Id) AS Call_Qnt
FROM ELMA_DB..ELMA_TABLE_Activity_2,[ELMA_VIEW_UsersStructDetails]
WHERE ELMA_DB..ELMA_TABLE_Activity_2.Activity_RecordType_name = '����� � ������' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = '��������' AND 
ELMA_DB..ELMA_TABLE_Activity_2.[Activity_DayIdText] between @start_cycle_date and @end_cycle_date AND
ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [ELMA_VIEW_UsersStructDetails].Users_id AND [ELMA_VIEW_UsersStructDetails].UserDetails_UserDivision = 'General'
GROUP BY ELMA_DB..ELMA_TABLE_Activity_2.AccountId
) Pharmacy_Call

on Pharmacy_Target.AccountId = Pharmacy_Call.Account_Id ) TCFA_PHARMACY_TABLE

Group by 
UserId,
Representative ) 
MR_PHARMACY_TCFA_TABLE

---------������� TCFA �� ������� END -------------

on MR_DATA_TABLE.[Users_id] = MR_PHARMACY_TCFA_TABLE.UserId


-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                    ����� TCFA �� �������    -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------


--- ������ ������ ��������� �������
---------------------------------------------------
delete from ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual
where User_Position_ID_text__c is null

delete from ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual
where TYPE in ('ASM', 'RSM','TEST')


update ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual
SET �����_5_������ = 0 where �����_5_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_5_������� = 0 where �����_5_������� IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_4_������ = 0 where �����_4_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_4_������� = 0 where �����_4_������� IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_3_������ = 0 where �����_3_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_3_������� = 0 where �����_3_������� IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_2_������ = 0 where �����_2_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET �����_2_������� = 0 where �����_2_������� IS NULL
-------------------------------
update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET ������_A_������ = 0 where ������_A_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET ������_A_������� = 0 where ������_A_������� IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET ������_B_������ = 0 where ������_B_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET ������_B_������� = 0 where ������_B_������� IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET ������_C_������ = 0 where ������_C_������ IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET ������_C_������� = 0 where ������_C_������� IS NULL



