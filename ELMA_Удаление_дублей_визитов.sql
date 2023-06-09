select top 10 * from  [dbo].[ELMA_VIEW_ActivityFull]
drop table ##TT_double
drop table ##TT_activity

select [Activity_IDD],[Activity_Id],[Activity_name],[Activity_Status],[Activity_RecordType_name],[Activity_startAt],[Activity_endAt],[Companies_id],[Contacts_id],[Users_Name] into  ##TT_activity  from  [dbo].[ELMA_VIEW_ActivityFull]
select *from ##TT_activity where [Companies_id] is null
select *from ##TT_activity where [Contacts_id] is null
select *from ##TT_activity where [Activity_RecordType_name] is null
update ##TT_activity set [Companies_id] = 'XXX' where [Companies_id] is null
update ##TT_activity set [Contacts_id] = 'XXX' where [Contacts_id] is null
update ##TT_activity set [Activity_RecordType_name] = 'XXX' where [Activity_RecordType_name] is null



select [Activity_Status],[Activity_RecordType_name],[Activity_startAt],[Activity_endAt],[Companies_id],[Contacts_id],[Users_Name],count(*) as qnt into ##TT_double  from  ##TT_activity
group by [Activity_Status],[Activity_RecordType_name],[Activity_startAt],[Activity_endAt],[Companies_id],[Contacts_id],[Users_Name] having count(*) >1


select A.[Activity_IDD],A.[Activity_Id],A.[Activity_name],A.[Activity_Status],A.[Activity_RecordType_name],A.[Activity_startAt],A.[Activity_endAt],A.[Companies_id],A.[Contacts_id],A.[Users_Name], qnt  from  ##TT_activity A,##TT_double T
where 
T.[Activity_startAt] = A.[Activity_startAt] and
T.[Activity_endAt] = A.[Activity_endAt] and
T.[Companies_id] = A.[Companies_id] and
T.[Contacts_id] = A.[Contacts_id] and
T.[Users_Name] = A.[Users_Name] and
T.[Activity_Status] = A.[Activity_Status] and
T.[Activity_RecordType_name] = A.[Activity_RecordType_name] and
A.Activity_Status = 'Завершен'

SELECT [to] FROM  ELMA_DB..ELMA_TABLE_ActivityData@ActivityId group by [to]


Companies_id
0c63a259-90a1-47af-9486-242619a18ab9

Contacts_id
bdb9bb65-2b25-439e-ba7b-0c9e75136eae