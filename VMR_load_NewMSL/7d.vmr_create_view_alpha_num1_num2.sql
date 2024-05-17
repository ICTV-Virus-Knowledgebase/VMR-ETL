ALTER view [vmr_alpha_num1_num2] as 
--
-- separate [isolate_name] (aka first entry in [alternative_name_csv]) 
-- into base alpha-sort string and numeric sort suffix
--
-- beware things ending in _1, .1, etc. 
--

select src3.*
from (
	select
		 src2.*
		, isolate_name_num1 = (case when isnumeric(isolate_name_num1_str)=1 then cast(isolate_name_num1_str as float) end)
		, isolate_name_num2 = (case when isnumeric(isolate_name_num2_str)=1 then cast(isolate_name_num2_str as float) end)
	from (
		select  
			src.*
			,isolate_name_alpha = isnull(left(isolate_name,isnull(isolate_start_num1_sort, isolatE_start_num2_sort)),isolate_name)
			,isolate_name_num1_str = (case
				when charindex(substring(isolate_name,isolate_start_num1_sort+1,1),'._-')>0 and  isolate_start_num2_sort > isolate_start_num1_sort+1   then
					-- remove leading . or _
					substring(isolate_name,isolate_start_num1_sort+2,isolate_start_num2_sort - isolate_start_num1_sort-2)
				when  charindex(substring(isolate_name,isolate_start_num1_sort+1,1),'._-')=0 and  isolate_start_num2_sort > isolate_start_num1_sort   then 
					substring(isolate_name,isolate_start_num1_sort+1,isolate_start_num2_sort - isolate_start_num1_sort-1)
				end)
			,isolate_name_num2_str = (case 
				when  charindex(substring(isolate_name,isolate_start_num2_sort+1,1),'._')>0 and  isolate_start_num2_sort+1 < len(isolate_name) then
					-- remove leading . or _
					substring(isolate_name,isolate_start_num2_sort+2,100)
				when  charindex(substring(isolate_name,isolate_start_num2_sort+1,1),'._')=0 and  isolate_start_num2_sort < len(isolate_name) then
					substring(isolate_name,isolate_start_num2_sort+1,100)
				end)
		from (
			select vmr.*,
				isolate_start_num1_sort =  len(isolate_name)-
					(case
						-- last 10 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							*charindex(left(right(isolate_name,5),1),'1234567890._-') 
							*charindex(left(right(isolate_name,6),1),'1234567890._-') 
							*charindex(left(right(isolate_name,7),1),'1234567890._-') 
							*charindex(left(right(isolate_name,8),1),'1234567890._-') 
							*charindex(left(right(isolate_name,9),1),'1234567890._-') 
							*charindex(left(right(isolate_name,10),1),'1234567890._-') 
							> 0
						then 10
						-- last 9 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							*charindex(left(right(isolate_name,5),1),'1234567890._-') 
							*charindex(left(right(isolate_name,6),1),'1234567890._-') 
							*charindex(left(right(isolate_name,7),1),'1234567890._-') 
							*charindex(left(right(isolate_name,8),1),'1234567890._-') 
							*charindex(left(right(isolate_name,9),1),'1234567890._-') 
							> 0
						then 9
						-- last 8 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							*charindex(left(right(isolate_name,5),1),'1234567890._-') 
							*charindex(left(right(isolate_name,6),1),'1234567890._-') 
							*charindex(left(right(isolate_name,7),1),'1234567890._-') 
							*charindex(left(right(isolate_name,8),1),'1234567890._-') 
							> 0
						then 8
						-- last 7 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							*charindex(left(right(isolate_name,5),1),'1234567890._-') 
							*charindex(left(right(isolate_name,6),1),'1234567890._-') 
							*charindex(left(right(isolate_name,7),1),'1234567890._-') 
							> 0
						then 7
						-- last 6 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							*charindex(left(right(isolate_name,5),1),'1234567890._-') 
							*charindex(left(right(isolate_name,6),1),'1234567890._-') 
							> 0
						then 6
						-- last 5 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							*charindex(left(right(isolate_name,5),1),'1234567890._-') 
							> 0
						then 5
					-- last 4 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							*charindex(left(right(isolate_name,4),1),'1234567890._-') 
							> 0
						then 4
						-- last 3 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-')
							*charindex(left(right(isolate_name,3),1),'1234567890._-')
							> 0
						then 3
						-- last 2 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-')
							*charindex(left(right(isolate_name,2),1),'1234567890._-') 
							> 0
						then 2
						-- last 1 chars are numeric
						when charindex(right(isolate_name,1),'1234567890._-') > 0
						then 1
						-- no trailing numerics
						else NULL
					end),
			 isolate_start_num2_sort =  len(isolate_name)-
					(case
						-- last 6 chars are numeric
						when charindex(right(isolate_name,1),'1234567890.')
							*charindex(left(right(isolate_name,2),1),'1234567890.')
							*charindex(left(right(isolate_name,3),1),'1234567890.')
							*charindex(left(right(isolate_name,4),1),'1234567890.') 
							*charindex(left(right(isolate_name,5),1),'1234567890.') 
							*charindex(left(right(isolate_name,6),1),'1234567890.') 
							> 0
						then 6
						-- last 5 chars are numeric
						when charindex(right(isolate_name,1),'1234567890.')
							*charindex(left(right(isolate_name,2),1),'1234567890.')
							*charindex(left(right(isolate_name,3),1),'1234567890.')
							*charindex(left(right(isolate_name,4),1),'1234567890.') 
							*charindex(left(right(isolate_name,5),1),'1234567890.') 
							> 0
						then 5
					-- last 4 chars are numeric
						when charindex(right(isolate_name,1),'1234567890.')
							*charindex(left(right(isolate_name,2),1),'1234567890.')
							*charindex(left(right(isolate_name,3),1),'1234567890.')
							*charindex(left(right(isolate_name,4),1),'1234567890.') 
							> 0
						then 4
						-- last 3 chars are numeric
						when charindex(right(isolate_name,1),'1234567890.')
							*charindex(left(right(isolate_name,2),1),'1234567890.')
							*charindex(left(right(isolate_name,3),1),'1234567890.')
							> 0
						then 3
						-- last 2 chars are numeric
						when charindex(right(isolate_name,1),'1234567890.')
							*charindex(left(right(isolate_name,2),1),'1234567890.') 
							> 0
						then 2
						-- last 1 chars are numeric
						when charindex(right(isolate_name,1),'1234567890.') > 0
						then 1
						-- no trailing numerics
						else NULL
					end)
			from vmr
		) as src
	) as src2
) as src3
/*
where 
(
isolate_name like '%[_]_'
 or  isolate_name like '%[.]_'
 or isolate_name like '%[_]__'
 or  isolate_name like '%[.]__'
  or  isolate_name like '%[.]___'
   or  isolate_name like '%[.]____'
)
--and isolate_name_alpha in ('uncultured phage cr')

order by species,  isolate_name_alpha, isolate_name_num1, isolate_name_num2

--
-- test
--
select * from vmr_alpha_num1_num2

*/
 
 