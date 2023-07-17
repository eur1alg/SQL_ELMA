USE ELMA_DB

------- параметры на вход
declare @start_cycle_date date
declare @end_cycle_date date

SET @start_cycle_date = '2023-06-01'
SET @end_cycle_date = '2023-06-30'

------------------------------------------------------------------------

SELECT 

UserDetails_Type,Users_Name,[Activity_DayIdText],Activity_SUB_type,count(*) as Visit_qnt

from [ELMA_VIEW_ActivityFull]

where UserDetails_Type in ('KAM','KAS_Ph','REP')
and UserDetails_Status = 'Активный'
and Activity_Status = 'Завершен' 
and Activity_DayIdText between @start_cycle_date and @end_cycle_date
--and Day_Work_Day_MR = 'true'
and RecordTypeId in ('4DCFE292-AE9D-4142-926A-9131C67CBB97','BA664160-EB85-4953-ACF1-B482E5D26070')

group by 
UserDetails_Type,Users_Name,[Activity_DayIdText],Activity_SUB_type


