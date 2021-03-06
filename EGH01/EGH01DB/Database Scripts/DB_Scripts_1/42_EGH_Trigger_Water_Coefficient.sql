create triGGER [dbo].[VolumeCheck] ON [dbo].[Разлив] instead of INSERT
AS 
BEGIN
	declare @t int;
	declare @v1 real;
	declare @v2 real;
	declare @ang1 real;
	declare @ang2 real;
	declare @k float;
	declare @tn int;

	declare @t1 table (min_vol real, max_vol real, min_ang real, max_ang real, tn int);
					
	declare @count1 int = -1;
	declare @count2 int = -1;
	declare @rc int = -1;
	set @t = (select ТипГрунта from inserted);
	set @v1 = (select МинПролива from inserted);
	set @v2 = (select МаксПролива from inserted);
	set @ang1 = (select МинУклона from inserted);
	set @ang2 = (select МаксУклона from inserted);
	set @k = (select КоэффициентРазлива from inserted);
	set @tn = (select КодТипаНефтепродукта from inserted);

	insert into @t1 select 
		МинПролива,
		МаксПролива,
		МинУклона,
		МаксУклона,
		КодТипаНефтепродукта
	from dbo.Разлив where ТипГрунта = @t ;
	
	set @count1 = (select count(*) from @t1);
	set @count2 =(select count(*) from @t1 where 
					(@v1 < min_vol and @v2 < min_vol) or 
					(@v1 > max_vol and @v2 > max_vol) or
					(@ang1 < min_ang and @ang2 < min_ang) or
					(@ang1 > max_ang and @ang2 > max_ang));
	set @rc = @count1 - @count2;
	if @rc = 0 insert into dbo.Разлив values (@t, @v1, @v2, @ang1, @ang2, @k, @tn) else print 'xoxo';
END;
