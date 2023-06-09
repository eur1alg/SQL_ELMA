USE ELMA_DB


------- ïàðàìåòðû íà âõîä
declare @start_cycle_date date
declare @end_cycle_date date

SET @start_cycle_date = '2023-01-01'
SET @end_cycle_date = '2023-03-31'

------------------------------------------


IF EXISTS(SELECT * FROM ELMA_REPORT..sysobjects where name = 'RSM_REPORT_DATA_60_80_actual') begin drop table ELMA_REPORT.dbo.RSM_REPORT_DATA_60_80_actual end

Select * 

INTO [ELMA_REPORT].dbo.RSM_REPORT_DATA_60_80_actual

from

(SELECT
[User].Users_id as 'Id',
[User].UserDetails_ASM as 'ASM',
[User].UserDetails_RSM as 'RSM',
[User].Users_Name as 'Ñîòðóäíèê',
[User].UserDetails_Type as 'Òèï',
[User].UserDetails_UserDivision  as 'Êîìàíäà',
[User].UserDetails_Status,
UserDetails_UserDivision as CTPHARMA__UserDivision__c,
'ÔÀÊÒ' as 'Data type',
UserDetails_Manager_TXT as 'Ðóêîâîäèòåëü',
SUM(iif(Activity_RSM_CoachingType='Coaching',Activity_duration_day,0)) as Äëèòåëüíîñòü_Êîó÷èíãà,
SUM(iif(Activity_RSM_CoachingType='Coaching' and Activity_SUB_type = 'Äâîéíîé âèçèò',Activity_duration_day,0)) as Äëèòåëüíîñòü_ÄÂ,
SUM(Activity_duration_day) as 'Äëèòåëüíîñòü ÂÑÅÃÎ'



from [ELMA_DB]..[ELMA_VIEW_UsersStructDetails] [User]
inner join 
ELMA_DB..ELMA_TABLE_Activity_2

on ELMA_DB..ELMA_TABLE_Activity_2.Activity_createdBy = [User].Users_id 

where [User].UserDetails_Type in ('ASM','RSM','SUPERVISOR')
and [UserDetails_Status] = 'Àêòèâíûé'
and ELMA_DB..ELMA_TABLE_Activity_2.Activity_Status = 'Çàâåðøåí' 
and ELMA_DB..ELMA_TABLE_Activity_2.Activity_DayIdText between @start_cycle_date and @end_cycle_date

group by 
[User].Users_id,
[User].UserDetails_ASM,
[User].UserDetails_RSM,
[User].Users_Name,
[User].UserDetails_Type,
UserDetails_UserDivision,
[UserDetails_Status],
UserDetails_Manager_TXT) TABLE_CALL

--------------------------- ÎÁÚÅÄÈÍßÅÌ 2 ÒÀÁËÈÖÛ (ÔÀÊÒ È ÏËÀÍÛ) ---------------------------------------
left join 
--------------------------- ÎÁÚÅÄÈÍßÅÌ 2 ÒÀÁËÈÖÛ (ÔÀÊÒ È ÏËÀÍÛ) ---------------------------------------

(


select User_long_Id
, [UserPosition_Name]
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then [UserPositionPlan_FD_Plan]  else 0 end) as FD_Plan__CTD
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then [UserPositionPlan_Vacation_Actual] else 0 end) as Vacation_Actual__CTD
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then [UserPositionPlan_Sick_list_Actual] else 0 end) as Sick_list_Actual__CTD
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then [UserPositionPlan_FD_Actual] else 0 end) as RSM_Work_Day_Actual__CTD
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then [UserPositionPlan_Coaching_FD_Plan] else 0 end) as Coaching_FD_Plan__CTD
 , sum (case when Month_Position_Plan__c >= left(@start_cycle_date,7) and Month_Position_Plan__c <= left(@end_cycle_date,7) then [UserPositionPlan_DC_FD_Plan] else 0 end) as DC_FD_Plan__CTD

 --INTO 
 --select * from
--#AAV_User_Position_for_Report

from (
select 
[UserPosition_id]
, [UserPosition_position_allocated_user] as User_long_Id
, [UserPosition_Name]
, [UserPosition_Position_User_Type]
, case when [UserPositionPlan_FD_Plan] is NULL then 0 else [UserPositionPlan_FD_Plan] end as [UserPositionPlan_FD_Plan]
, case when [UserPositionPlan_Vacation_Actual] is NULL then 0 else [UserPositionPlan_Vacation_Actual] end as [UserPositionPlan_Vacation_Actual]
, case when [UserPositionPlan_Sick_list_Actual] is NULL then 0 else [UserPositionPlan_Sick_list_Actual] end as [UserPositionPlan_Sick_list_Actual]
, case when [UserPositionPlan_FD_Actual] is NULL then 0 else [UserPositionPlan_FD_Actual] end as [UserPositionPlan_FD_Actual]
, case when [UserPositionPlan_Coaching_FD_Plan] is NULL then 0 else [UserPositionPlan_Coaching_FD_Plan] end as [UserPositionPlan_Coaching_FD_Plan]
, case when [UserPositionPlan_DC_FD_Plan] is NULL then 0 else [UserPositionPlan_DC_FD_Plan] end as [UserPositionPlan_DC_FD_Plan]
, [Month_Name] as Month_Position_Plan__c
, [UserPosition_position_allocated_user_NAME] as User_position_plan_alloc__Name

from 
[ELMA_VIEW_UserPosition_UserPositionPlan_Month]

where [Month_Name] >= left(@start_cycle_date, 7) and [Month_Name] <= left(@end_cycle_date, 7) and [UserPosition_Position_User_Type] in ('ASM','RSM')
) a

group by [UserPosition_id]
 , User_long_Id
 ,[UserPosition_Name]

 , [UserPosition_Position_User_Type]
 , User_position_plan_alloc__Name
 
 
 
 ) TABLE_PLANS 

 on TABLE_PLANS.User_long_Id = TABLE_CALL.Id 
 
 
---------USER POSITIONS---END--------------------

