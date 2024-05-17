--
-- output VMR, with 1-based sort numbers
--
exec refresh_views
go
ALTER --  CREATE
	procedure [vmr_update_sorts] as
begin
	print 'updating [vmr].[sort_species] and [sort]'
	DECLARE @species_name nvarchar(200)

	DECLARE @species_sort int; DECLARE @cur_species nvarchar(200)
	DECLARE @isolate_sort int

	DECLARE @vmr_uid int

	DECLARE @mesg nvarchar(4000)

	SET NOCOUNT ON 
	-- CURSOR
	DECLARE [VMR_SORT_ROWS] SCROLL CURSOR FOR 
		select vmr.vmr_uid, vmr.species  
		--select * 
		from vmr_alpha_num1_num2 vmr
		join taxonomy_node tn  on tn.taxnode_id = vmr.taxnode_id
		order by
			-- sort by species taxonomy 
			tn.left_idx 
			-- then E records before A
			, exemplar DESC  
			-- then by isolate name
			, isolate_name_alpha, isolate_name_num1, isolate_name_num2


	SET @species_sort = 0
	SET @isolate_sort = 1
	SET @cur_species = ''
	OPEN [VMR_SORT_ROWS]
	FETCH NEXT FROM [VMR_SORT_ROWS] INTO @vmr_uid,  @species_name
	WHILE @@FETCH_STATUS = 0 BEGIN
  		-- DO WORK HERE
		IF @cur_species <> @species_name BEGIN
			-- new species: reset isolate sort, incr species sort
			SET @species_sort = @species_sort +1
			SET @isolate_sort = 1
			SET @cur_species = @species_name
		END ELSE BEGIN
			-- same species, new isolate: incr isolate sort only
			SET @isolate_sort = @isolate_sort + 1
		END

		-- update sort fields in VMR
		UPDATE VMR SET
			[sort_species] = @species_sort,
			[sort] = @isolate_sort
		WHERE vmr_uid = @vmr_uid

		SET @mesg = 'UPDATE vmr SET species_sort='+rtrim(@species_sort)+', sort='+rtrim(@isolate_sort)+' where vmr_uid='+rtrim(@vmr_uid)
		--RAISERROR (@mesg, 1, 1)
		print @mesg
   		-- NEXT
		FETCH NEXT FROM [VMR_SORT_ROWS] INTO @vmr_uid,  @species_name
	END; CLOSE [VMR_SORT_ROWS]; DEALLOCATE [VMR_SORT_ROWS]

end
/*
--
-- test
--

exec [vmr_update_sorts]


select * from vmr order by vmr.sort_species, vmr.sort


select * from vmr where vmr.sort > 1 order by vmr.species, vmr.sort


select * from vmr
 where species in (select species from vmr where vmr.sort > 1 and species<>'abolished')
 order by vmr.sort_species, vmr.sort


select * from vmr_alpha_num1_num2 vmr where isolate_name_num1 is not null and isolate_name_num2 is not null order by vmr.species, vmr.sort

*/

