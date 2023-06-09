USE [ELMA_DB]

------- параметры на вход
declare @start_week_date date
declare @end_week_date date

SET @start_week_date = '2023-04-01'
SET @end_week_date = '2023-06-30'

--------------------Сама выборка
SELECT
CROSS_USER_DATE.[Users_IDD],
CROSS_USER_DATE.[Users_id],
CROSS_USER_DATE.[Users_Name],
CROSS_USER_DATE.[UserDetails_ASM],
CROSS_USER_DATE.[UserDetails_RSM],
CROSS_USER_DATE.[UserDetails_Manager_TXT],
CROSS_USER_DATE.[UserDetails_Type],
CROSS_USER_DATE.[UserDetails_Status],
CROSS_USER_DATE.[Day_Name],
CROSS_USER_DATE.[Day_Work_Day_MR],
REPORT_Call.REPORT_TYPE,
REPORT_SUB_TYPE,
REPORT_Dimension
FROM 
--------------------CROSS_JOIN--------------------
(SELECT 
[Users_IDD],
[Users_id],
[Users_Name],
[UserDetails_ASM],
[UserDetails_RSM],
[UserDetails_Manager_TXT],
[UserDetails_Type],
[UserDetails_Status],
[Day_Name],
[Day_Work_Day_MR]
FROM
[dbo].[ELMA_VIEW_UsersStructDetails],[dbo].[ELMA_TABLE_Day] where [ELMA_VIEW_UsersStructDetails].[UserDetails_Type] in ('REP','KAM','KAS_Ph') and [Day_Name] between @start_week_date and @end_week_date) CROSS_USER_DATE

----------------------------------Визиты
left join

(SELECT
'Визиты' as REPORT_TYPE,
Count (*) as REPORT_Dimension,
[Activity_SUB_type] as REPORT_SUB_TYPE,
[Activity_DayIdText],
[Activity_Owner]
FROM [dbo].[ELMA_TABLE_Activity_2]
WHERE ELMA_DB..[ELMA_TABLE_Activity_2].Activity_RecordType_name in('Визит к врачу','Визит в аптеку') AND 
ELMA_DB..[ELMA_TABLE_Activity_2].Activity_Status = 'Завершен' AND 
ELMA_DB..[ELMA_TABLE_Activity_2].[Activity_DayIdText] between @start_week_date and @end_week_date
GROUP BY [Activity_SUB_type],[Activity_DayIdText],[Activity_Owner]


) REPORT_Call
on CROSS_USER_DATE.[Users_id] = REPORT_Call.[Activity_Owner] and REPORT_Call.[Activity_DayIdText] = CROSS_USER_DATE.[Day_Name]


----------------------------------Остальное
left join

(SELECT
'Другие активности' as REPORT_TYPE,
[Activity_duration_day] as REPORT_Dimension,
[Activity_SUB_type] as REPORT_SUB_TYPE
[Activity_name] as REPORT_Name,
[Activity_startAt] as REPORT_startAt,
[Activity_endAt] as REPORT_endAt,
[Activity_Owner]
FROM [dbo].[ELMA_TABLE_Activity_2]
WHERE ELMA_DB..[ELMA_TABLE_Activity_2].Activity_RecordType_name in('Мероприятие','Время вне территории') AND 
ELMA_DB..[ELMA_TABLE_Activity_2].Activity_Status = 'Завершен' AND 
ELMA_DB..[ELMA_TABLE_Activity_2].Activity_startAt between @start_week_date and @end_week_date) REPORT_Other_Activity
on [Users_id] = REPORT_Other_Activity.[Activity_Owner]


