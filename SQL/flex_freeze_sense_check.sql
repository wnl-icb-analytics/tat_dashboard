/* Processed */

-- Check by month/year
SELECT
dd.FiscalCalendarYearName
,dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.DataType
,COUNT(*) 'RowCount'
FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times] r
LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(DiagnosticTestDateTime as date) = dd.FullDate
WHERE ProviderTrustShort = 'GOSH'
GROUP BY
dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.DataType
,dd.FiscalCalendarYearName
ORDER BY
dd.FiscalCalendarYearName
,FiscalCalendarMonthNumber

-- where is april?

--DELETE FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times]
--WHERE 
--ProviderTrustShort = 'GOSH'
--AND CAST(DiagnosticTestDateTime as date) between '01-May-2025' AND '31-May-2025'
--AND DataType = 'Flex'

--DELETE FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times_raw] 
--WHERE trust_code = 'RP4' AND diagnostic_test_date_time >= '01-Feb-2025'
--select
--*
--FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times] r
--LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(DiagnosticTestDateTime as date) = dd.FullDate
--WHERE ProviderTrustShort = 'GOSH'
--and dd.CalendarMonthName = 'May'
--and DataType = 'Flex'



-- Check by provider - by month/year
SELECT
dd.FiscalCalendarYearName
,dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.DataType
,r.ProviderTrust
,COUNT(*) 'RowCount'
FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times] r
LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(DiagnosticTestDateTime as date) = dd.FullDate
GROUP BY
dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.DataType
,r.ProviderTrust
,dd.FiscalCalendarYearName
ORDER BY 
dd.FiscalCalendarYearName
,FiscalCalendarMonthNumber

/* Raw */
-- check by month/year
SELECT
dd.FiscalCalendarYearName
,dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.data_type
,COUNT(*) 'RowCount'
FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times_raw] r
LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(diagnostic_test_date_time as date) = dd.FullDate
--WHERE trust_code = 'RAN'
GROUP BY
dd.FiscalCalendarYearName
,dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.data_type
ORDER BY
dd.FiscalCalendarYearName
,FiscalCalendarMonthNumber
,r.data_type

-- Check by provider - by month/year
SELECT
dd.FiscalCalendarYearName
,dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.data_type
,r.trust_code
,COUNT(*) 'RowCount'
FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times_raw] r
LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(diagnostic_test_date_time as date) = dd.FullDate
GROUP BY
dd.FiscalCalendarYearName
,dd.CalendarMonthName
,FiscalCalendarMonthNumber
,r.data_type
,r.trust_code
ORDER BY 
dd.FiscalCalendarYearName
,FiscalCalendarMonthNumber
,r.data_type

-- NMUH check
select * 
from [Data_Lab_NCL_Dev].[PeterS].[turnaround_times] LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(DiagnosticTestDateTime as date) = dd.FullDate
where 
ProviderTrustShort = 'NMUH'
AND CalendarMonthName = 'August'

-- DELETE FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times]
-- DELETE FROM [Data_Lab_NCL_Dev].[PeterS].[turnaround_times_raw]

-- DROP TABLE [Data_Lab_NCL_Dev].[PeterS].[turnaround_times]
-- DROP TABLE [Data_Lab_NCL_Dev].[PeterS].[turnaround_times_raw]

-- gpda check
SELECT
dd.CalendarMonthName
,dd.CalendarMonthNumber
,r.data_type
--,r.ProviderTrust
,COUNT(*) 'RowCount'
FROM Data_Lab_NCL_Dev.PeterS.diagnostic_gpda r
LEFT JOIN [Dictionary].[dbo].[Dates] dd ON CAST(date_of_test as date) = dd.FullDate
GROUP BY
dd.CalendarMonthName
,dd.CalendarMonthNumber
,r.data_type
--,r.ProviderTrust
ORDER BY 
CalendarMonthNumber

