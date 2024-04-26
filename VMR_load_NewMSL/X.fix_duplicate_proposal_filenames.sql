--
-- 
-- fix duplicate proposal names created by proposalProcessor for MSL39
--
select *, 'replace(proposal,'''+pL+';'+pL+''','''')'
 from (
select proposal, ct=count(*)
	,part_ct=len(proposal)-len(replace(proposal,';',''))+1
	,pL = trim( left(replace(proposal,';','                                                                      '), 80))
	,pM = trim( right( left(replace(proposal,';','                                                                      '),200),80))
	,pR = trim( right(replace(proposal,';','                                                                      '), 80))
from taxonomy_node_delta 
where msl =39 and proposal like '%;%'
group by proposal
) as src
where  part_ct =2 and pL = pR

select *, sql_delta=
	'update taxonomy_node_delta set proposal=replace(proposal,'''+pL+';'+pL+''','''+pl+''') from taxonomy_node_delta where msl=39 and proposal like ''%'+pL+';'+pL+'%'''
	+';update taxonomy_node_delta set proposal=replace(proposal,'''+pR+';'+pR+''','''+pR+''') from taxonomy_node_delta where msl=39 and proposal like ''%'+pR+';'+pR+'%'''
 from (
select proposal, ct=count(*)
	,part_ct=len(proposal)-len(replace(proposal,';',''))+1
	,pL = trim( left(replace(proposal,';','                                                                      '), 80))
	,pM = trim( right( left(replace(proposal,';','                                                                      '),200),80))
	,pR = trim( right(replace(proposal,';','                                                                      '), 80))
from taxonomy_node_delta 
where msl =39 and proposal like '%;%'
group by proposal
) as src
where  part_ct > 1


select *, sql_infile=
	'update taxonomy_node set in_filename=replace(in_filename,'''+pL+';'+pL+''','''+pl+''') from taxonomy_node where msl_release_num=39 and in_filename like ''%'+pL+';'+pL+'%'''
	+';update taxonomy_node set in_filename=replace(in_filename,'''+pR+';'+pR+''','''+pR+''') from taxonomy_node_delta where msl_release_num=39 and in_filename like ''%'+pR+';'+pR+'%'''

 from (
select in_filename, ct=count(*)
	,part_ct=len(in_filename)-len(replace(in_filename,';',''))+1
	,pL = trim( left(replace(in_filename,';','                                                                      '), 80))
	,pM = trim( right( left(replace(in_filename,';','                                                                      '),200),80))
	,pR = trim( right(replace(in_filename,';','                                                                      '), 80))
from taxonomy_node 
where msl_release_num =39 and in_filename like '%;%'
group by in_filename
) as src
where  part_ct > 1


select *, sql_outfile=
	'update taxonomy_node set out_filename=replace(out_filename,'''+pL+';'+pL+''','''+pl+''') from taxonomy_node where msl_release_num=39 and out_filename like ''%'+pL+';'+pL+'%'''
	+';update taxonomy_node set out_filename=replace(out_filename,'''+pR+';'+pR+''','''+pR+''') from taxonomy_node_delta where msl_release_num=39 and out_filename like ''%'+pR+';'+pR+'%'''

 from (
select out_filename, ct=count(*)
	,part_ct=len(out_filename)-len(replace(out_filename,';',''))+1
	,pL = trim( left(replace(out_filename,';','                                                                      '), 80))
	,pM = trim( right( left(replace(out_filename,';','                                                                      '),200),80))
	,pR = trim( right(replace(out_filename,';','                                                                      '), 80))
from taxonomy_node 
where msl_release_num =38 and out_filename like '%;%'
group by out_filename
) as src
where  part_ct > 1



select *, sql_vmr=
	'update vmr set change_proposal=replace(change_proposal,'''+pL+';'+pL+''','''+pl+''') from vmr where change_proposal like ''%'+pL+';'+pL+'%'''
	+';update vmr set change_proposal=replace(change_proposal,'''+pR+';'+pR+''','''+pR+''') from vmr where change_proposal like ''%'+pR+';'+pR+'%'''

 from (
select change_proposal, ct=count(*)
	,part_ct=len(change_proposal)-len(replace(change_proposal,';',''))+1
	,pL = trim( left(replace(change_proposal,';','                                                                      '), 80))
	,pM = trim( right( left(replace(change_proposal,';','                                                                      '),200),80))
	,pR = trim( right(replace(change_proposal,';','                                                                      '), 80))
from vmr 
where change_proposal like '%;%'
group by change_proposal
) as src
where  part_ct > 1

