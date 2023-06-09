use [ELMA_DB]
------- параметры на вход
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
--поменять TCFA Врачи --
SET @TCFA_Rx_plan_5 = 5
SET @TCFA_Rx_plan_4 = 4
SET @TCFA_Rx_plan_3 = 3
SET @TCFA_Rx_plan_2 = 2
--поменять TCFA Аптеки--
SET @TCFA_Ph_plan_A = 3
SET @TCFA_Ph_plan_B = 3
SET @TCFA_Ph_plan_C = 3
--поменять даты--
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
---------сама выборка---------------------------------------------------------------------------------------------------------------------------
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
[Болезнь_CTD] as 'Болезнь CTD',
[Отпуск_CTD] as 'Отпуск CTD',
cast([Полевые_дни_за_цикл] as decimal(10,2)) as 'WD Cycle',
cast([Полевые_дни_за_месяц] as decimal(10,2)) as 'WD Month',
[Эквиваленты_за_цикл] as 'Экв Cycle',
[Эквиваленты_за_месяц] as 'Экв Month',
[Аптечные_визиты_за_цикл] as 'аптечные визиты Cycle',
[Эквиваленты_за_цикл] AS 'Визиты Cycle',
[Эквиваленты_за_месяц] AS 'Визиты Month',



[Круглые_столы_за_цикл] as 'Круглый стол',
[Фармкружки_за_цикл] AS 'Фармкружок',
[Таргетные_визиты_за_цикл] AS 'Таргет визиты',
[Таргетные_визиты_база_за_цикл] AS 'визиты_база_трг',

#AAV_User_Position_for_Report.[FD_Plan_CTD] AS 'План РД Cycle',  --полевые дни за цикл
#AAV_User_Position_for_Report.[FD_Plan_Month]  AS 'План РД Month',--полевые дни за месяц

#AAV_User_Position_for_Report.[FD_plan_final_CTD] AS 'План РД ФИНАЛ Cycle',  --полевые дни ФИНАЛ за цикл
#AAV_User_Position_for_Report.[FD_Plan_final_Month]  AS 'План РД ФИНАЛ Month',--полевые дни ФИНАЛ за месяц



#AAV_User_Position_for_Report.[Call_Plan_CTD] AS 'План Экв Cycle', --план визитов за цикл
#AAV_User_Position_for_Report.[Call_Plan_Month] AS 'План Экв Month', --план визитов за месяц

#AAV_User_Position_for_Report.[Call_plan_final_CTD] AS 'План Экв ФИНАЛ Cycle', --план визитов ФИНАЛ за цикл
#AAV_User_Position_for_Report.[Call_plan_final_Month] AS 'План Экв ФИНАЛ Month', --план визитов ФИНАЛ за месяц


#AAV_User_Position_for_Report.Vacation_plan_CTD AS 'План Отпуска Cycle', --план отпуска за цикл
#AAV_User_Position_for_Report.Sick_list_plan_CTD AS 'План Больничный Cycle', -- план больничных за цикл
#AAV_User_Position_for_Report.Vacation_Actual_CTD AS 'ФАКТ Отпуска Cycle', -- ФАКТ отпуска за цикл
#AAV_User_Position_for_Report.Sick_list_Actual_CTD AS 'ФАКТ Больничный Cycle', -- ФАКТ больничных за цикл



-- это новенькое

Target_5_qnt AS 'Врачи_5_таргет',   
PLAN_5_ACHIEV AS 'Врачи_5_ПланВып',   
Target_4_qnt AS 'Врачи_4_таргет',
PLAN_4_ACHIEV AS 'Врачи_4_ПланВып',
Target_3_qnt AS 'Врачи_3_таргет',   
PLAN_3_ACHIEV AS 'Врачи_3_ПланВып',   
Target_2_qnt AS 'Врачи_2_таргет',   
PLAN_2_ACHIEV AS 'Врачи_2_ПланВып',   

Target_Ph_A_qnt AS 'АПТЕКИ_A_таргет', 
PLAN_Ph_A_ACHIEV AS 'АПТЕКИ_A_ПланВып', 

Target_Ph_B_qnt AS 'АПТЕКИ_B_таргет', 
PLAN_Ph_B_ACHIEV AS 'АПТЕКИ_B_ПланВып', 

Target_Ph_C_qnt AS 'АПТЕКИ_C_таргет', 
PLAN_Ph_C_ACHIEV AS 'АПТЕКИ_C_ПланВып', 

case 
	when [APG_User_status__c] = 'Активный' then 'полный цикл'
	when [APG_User_status__c] in ('Новый', 'Уволился') then 'неполный цикл'
end AS 'Статус ставки',
[APG_User_status__c],
cast(LEFT(convert(varchar(20), APG_Work_start_date__c, 120), 10) as varchar(10)) as APG_Work_start_date__c,
cast(LEFT(convert(varchar(20), APG_Work_end_date__c, 120), 10) as varchar(10)) as APG_Work_end_date__c



into 
--select * from 
[ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
FROM

--------------НАЧАЛО ВЫБОРКА ПО МП----------------
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
isnull([Болезнь_CTD],0) as 'Болезнь_CTD',
isnull([Отпуск_CTD],0) as 'Отпуск_CTD',
isnull([эквиваленты за цикл],0) as 'Эквиваленты_за_цикл',
isnull([эквиваленты за месяц],0) as 'Эквиваленты_за_месяц',
isnull([аптечные визиты за цикл],0) as 'Аптечные_визиты_за_цикл',
isnull([круглые столы за цикл],0) as 'Круглые_столы_за_цикл',
isnull([фармкружки за цикл],0) as 'Фармкружки_за_цикл',
isnull([таргетные визиты за цикл],0) as 'Таргетные_визиты_за_цикл',
isnull([таргетные визиты база за цикл],0) as 'Таргетные_визиты_база_за_цикл',
isnull([полевые дни за цикл],0) as 'Полевые_дни_за_цикл',
isnull([полевые дни за месяц],0) as 'Полевые_дни_за_месяц',

[UserDetails_Status] as [APG_User_status__c],
[UserDetails_Work_start_date] as [APG_Work_start_date__c],
[UserDetails_Work_end_date] as [APG_Work_end_date__c]

from [dbo].[ELMA_VIEW_UsersStructDetails]

--------- выбираем больничные за цикл
left join 
(Select [Activity_createdBy] as CreatedById, count(*) as 'Болезнь_CTD' from [ELMA_VIEW_ActivityFull]
where	
[Activity_Status] = 'Завершен' and 
([Activity_SUB_type] = 'Болезнь')  and 
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) Болезнь_TABLE
on [Users_id] = [Болезнь_TABLE].CreatedById


-------- выбираем отпуска за цикл
left join 
(Select [Activity_createdBy] as CreatedById, count(*) as 'Отпуск_CTD' from [ELMA_VIEW_ActivityFull]
where	
[Activity_Status] = 'Завершен' and 
([Activity_SUB_type] = 'Отпуск')  and 
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) Отпуск_CTD_TABLE
on [Users_id] = Отпуск_CTD_TABLE.CreatedById

-------- выбираем эквиваленты за цикл
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'эквиваленты за цикл' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] in ('Визит в аптеку','Визит к врачу') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) эквиваленты_за_цикл_TABLE
on [Users_id] = эквиваленты_за_цикл_TABLE.CreatedById

-------- выбираем эквиваленты за месяц

left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'эквиваленты за месяц' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] in ('Визит в аптеку','Визит к врачу') and
[Activity_DayIdText] between @start_month_date and @end_month_date
group by [Activity_createdBy]) эквиваленты_за_месяц_TABLE
on [Users_id] = эквиваленты_за_месяц_TABLE.CreatedById

-------- выбираем аптечные визиты за цикл
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'аптечные визиты за цикл' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] = 'Визит в аптеку' and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) аптечные_визиты_за_цикл_TABLE
on [Users_id] = аптечные_визиты_за_цикл_TABLE.CreatedById

-------- выбираем круглые столы за цикл
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'круглые столы за цикл' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] = 'Круглый стол' and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) круглые_столы_за_цикл_TABLE
on [Users_id] = круглые_столы_за_цикл_TABLE.CreatedById

-------- выбираем фармкружки за цикл
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'фармкружки за цикл' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] = 'Фармкружок' and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) фармкружки_за_цикл_TABLE
on [Users_id] = фармкружки_за_цикл_TABLE.CreatedById

-------- выбираем таргетные визиты за цикл
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'таргетные визиты за цикл' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
--([Companies_APG_Division_Alpha_Account_Target] = 'true' or [Contacts_Division_General_Contact_Target] = 'true') and   -------------------------- ПРОВЕРИТЬ ----------------------------
([Companies_Division_Alpha_Account_Target_PrevCycle] = 'true' or [Contacts_DivisionAlphaTarget_PrevCycle] = 'true') and  -------------------------- ПРОВЕРИТЬ ----------------------------
[Activity_SUB_type] in ('Визит в аптеку','Визит к врачу') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) таргетные_визиты_за_цикл_TABLE
on [Users_id] = таргетные_визиты_за_цикл_TABLE.CreatedById

-------- выбираем таргетные визиты база за цикл
left join 
(Select [Activity_createdBy] as CreatedById,  count(*) as 'таргетные визиты база за цикл' from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] in ('Визит в аптеку','Визит к врачу') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_createdBy]) таргетные_визиты_база_за_цикл_TABLE
on [Users_id] = таргетные_визиты_база_за_цикл_TABLE.CreatedById


-------- выбираем полевые дни за цикл
left join
(select [Activity_createdBy],sum(day_EQV) as 'полевые дни за цикл' from
(select [Activity_createdBy],Day_day,visits_per_day, iif(visits_per_day>7,1,iif(visits_per_day>=1,0.5,0)) as day_EQV  from 
(Select [Activity_createdBy], [Activity_DayIdText] as Day_day, count (*) as visits_per_day from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] in ('Визит в аптеку','Визит к врачу') and
[Activity_DayIdText] between @start_cycle_date and @end_cycle_date
group by [Activity_DayIdText], [Activity_createdBy]) visits_per_day) EQV_per_day
group by [Activity_createdBy]) полевые_дни_за_цикл_TABLE
on [Users_id] = полевые_дни_за_цикл_TABLE.[Activity_createdBy]


-------- выбираем полевые дни за месяц
left join
(select [Activity_createdBy],sum(day_EQV) as 'полевые дни за месяц' from
(select [Activity_createdBy],Day_day,visits_per_day, iif(visits_per_day>7,1,iif(visits_per_day>=1,0.5,0)) as day_EQV  from 
(Select [Activity_createdBy], [Activity_DayIdText] as Day_day, count (*) as visits_per_day from [ELMA_VIEW_ActivityFull] 
where	
[Activity_Status] = 'Завершен' and 
[Activity_SUB_type] in ('Визит в аптеку','Визит к врачу') and
[Activity_DayIdText] between @start_month_date and @end_month_date
group by [Activity_DayIdText], [Activity_createdBy]) visits_per_day) EQV_per_day
group by [Activity_createdBy]) полевые_дни_за_месяц_TABLE
on [Users_id] = полевые_дни_за_месяц_TABLE.[Activity_createdBy]


) MR_DATA_TABLE

--------------JOIN c User Positions------------------
left join #AAV_User_Position_for_Report 
on MR_DATA_TABLE.[Users_id] = #AAV_User_Position_for_Report.User_position_plan_alloc__c
-----------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                     TCFA по ВРАЧАМ    -------------------------------------------------------------------------------------------------------
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
--------- ВЫБОРКА TCFA ПО ВРАЧАМ BEGIN -------------

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

--список таргетных врачей

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
--Contact.Contacts_Division_General_Contact_Target='true'  -------------------------- ПРОВЕРИТЬ ----------------------------
Contact.Contacts_DivisionAlphaTarget_PrevCycle='true'   -------------------------- ПРОВЕРИТЬ ----------------------------
) Doctor_Target

--список количества визитов врачебной линией с группировкой по контактам
left join

(
SELECT ELMA_DB..ELMA_TABLE_Activity_2.ContactId as Contact_Id, Count(ELMA_DB..ELMA_TABLE_Activity_2.Activity_Id) AS Call_Qnt
FROM ELMA_DB..ELMA_TABLE_Activity_2,[ELMA_VIEW_UsersStructDetails]
WHERE ELMA_DB..ELMA_TABLE_Activity_2.Activity_RecordType_name = 'Визит к врачу' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = 'Завершен' AND 
ELMA_DB..ELMA_TABLE_Activity_2.[Activity_DayIdText] between @start_cycle_date and @end_cycle_date AND
ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [ELMA_VIEW_UsersStructDetails].Users_id AND [ELMA_VIEW_UsersStructDetails].UserDetails_UserDivision = 'General'
GROUP BY ELMA_DB..ELMA_TABLE_Activity_2.ContactId
) Doctor_Call

on Doctor_Target.ContactId = Doctor_Call.Contact_Id) TCFA_DOCTOR_TABLE

GROUP BY 
Representative,
UserId)
MR_DOC_TCFA_TABLE
--------- КОНЕЦ ВЫБОРКА TCFA ПО ВРАЧАМ BEGIN -------------
ON MR_DATA_TABLE.[Users_id]  = MR_DOC_TCFA_TABLE.UserId

-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                     КОНЕЦ TCFA по ВРАЧАМ    -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                     TCFA по АПТЕКАМ    ------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------



left join

--------- ВЫБОРКА TCFA ПО АПТЕКАМ BEGIN -------------

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
--список таргетных аптек
(SELECT 
Account.Companies_id as AccountId,
Account.Companies_Division_General_Account_Category as APG_Division_Alpha_Account_Category,
[User].Users_id AS UserId,
[User].Users_Name as Representative
FROM [ELMA_VIEW_CompaniesAPGLocality] Account INNER JOIN [dbo].[ELMA_VIEW_UsersStructDetails]  [User] ON Account.Companies_APG_General_responsible_User = [User].Users_id

WHERE (Account.Companies_Division_General_Account_Category = 'A' Or Account.Companies_Division_General_Account_Category = 'B' Or Account.Companies_Division_General_Account_Category = 'C') AND 
Account.Companies_IsActive='true' AND 
--Account.Companies_APG_Division_Alpha_Account_Target = 'true' AND   -------------------------- ПРОВЕРИТЬ ----------------------------
Account.Companies_Division_Alpha_Account_Target_PrevCycle = 'true' AND  -------------------------- ПРОВЕРИТЬ ----------------------------
([User].UserDetails_Type = 'SUPERVISOR' Or [User].UserDetails_Type = 'REP' Or [User].UserDetails_Type = 'KAS' Or [User].UserDetails_Type = 'RSM' Or [User].UserDetails_Type = 'KAM' Or [User].UserDetails_Type = 'KAS_Ph') AND 
[User].UserDetails_UserDivision = 'General' AND
Account.RecordType_name = 'Pharmacy'
) Pharmacy_Target

--список количества визитов аптечной линией с группировкой по организациям
left join 

(
SELECT ELMA_DB..ELMA_TABLE_Activity_2.AccountId as Account_Id, Count(ELMA_DB..ELMA_TABLE_Activity_2.Activity_Id) AS Call_Qnt
FROM ELMA_DB..ELMA_TABLE_Activity_2,[ELMA_VIEW_UsersStructDetails]
WHERE ELMA_DB..ELMA_TABLE_Activity_2.Activity_RecordType_name = 'Визит в аптеку' AND 
ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = 'Завершен' AND 
ELMA_DB..ELMA_TABLE_Activity_2.[Activity_DayIdText] between @start_cycle_date and @end_cycle_date AND
ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [ELMA_VIEW_UsersStructDetails].Users_id AND [ELMA_VIEW_UsersStructDetails].UserDetails_UserDivision = 'General'
GROUP BY ELMA_DB..ELMA_TABLE_Activity_2.AccountId
) Pharmacy_Call

on Pharmacy_Target.AccountId = Pharmacy_Call.Account_Id ) TCFA_PHARMACY_TABLE

Group by 
UserId,
Representative ) 
MR_PHARMACY_TCFA_TABLE

---------ВЫБОРКА TCFA ПО АПТЕКАМ END -------------

on MR_DATA_TABLE.[Users_id] = MR_PHARMACY_TCFA_TABLE.UserId


-----------------------------------------------------------------------------------------------------------------------------------------------------
-------                    КОНЕЦ TCFA по АПТЕКАМ    -------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------


--- Всякие чистки финальной таблицы
---------------------------------------------------
delete from ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual
where User_Position_ID_text__c is null

delete from ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual
where TYPE in ('ASM', 'RSM','TEST')


update ELMA_REPORT.dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_5_таргет = 0 where Врачи_5_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_5_ПланВып = 0 where Врачи_5_ПланВып IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_4_таргет = 0 where Врачи_4_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_4_ПланВып = 0 where Врачи_4_ПланВып IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_3_таргет = 0 where Врачи_3_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_3_ПланВып = 0 where Врачи_3_ПланВып IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_2_таргет = 0 where Врачи_2_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET Врачи_2_ПланВып = 0 where Врачи_2_ПланВып IS NULL
-------------------------------
update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET АПТЕКИ_A_таргет = 0 where АПТЕКИ_A_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET АПТЕКИ_A_ПланВып = 0 where АПТЕКИ_A_ПланВып IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET АПТЕКИ_B_таргет = 0 where АПТЕКИ_B_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET АПТЕКИ_B_ПланВып = 0 where АПТЕКИ_B_ПланВып IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET АПТЕКИ_C_таргет = 0 where АПТЕКИ_C_таргет IS NULL

update [ELMA_REPORT].dbo.FULL_MONTHLY_REPORT_actual
SET АПТЕКИ_C_ПланВып = 0 where АПТЕКИ_C_ПланВып IS NULL



