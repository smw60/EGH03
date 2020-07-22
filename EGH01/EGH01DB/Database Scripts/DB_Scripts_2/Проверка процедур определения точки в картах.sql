-----------------------------------------------------------------------------------------------
---        �������� �������� �������� ��������� ����� � ������� �� �����                   ----
---     ���������� �������� ������� geom ��� ��������������� �����                         ----
---		���������� �������� 0, 0.0, ������ ������ ��� ��������������� ����� ������         ----
---		��� ���������� ������ �������											           ----
-----------------------------------------------------------------------------------------------


-- EGH.InCity -- ����� - ����������:27.4421796312367 53.9043260781941
declare @rc int; 
declare @OutId1 int = -1; 
declare @OutName1 varchar(160) = ''; 
exec @rc = EGH.InCity @point1='27.4422796312367', @point2='53.9033260781941', @OutId = @OutId1 output, @OutName = @OutName1 output;
select @rc;
select @OutId1;
select @OutName1;
go

-- EGH.InGroundSelfCleaningMap -- ����� - ����������:27.4421796312367 53.9043260781941
declare @rc int; 
declare @OutId1 int = -1; 
declare @OutType1 varchar(160) = ''; 
exec @rc = EGH.InGroundSelfCleaningMap @point1='27.4422796312367', @point2='53.9033260781941', @OutId = @OutId1 output, @OutType = @OutType1 output;
select @rc;
select @OutId1;
select @OutType1;
go

-- EGH.InGroundWaterMap -- ����� - ����������:27.4421796312367 53.9043260781941
declare @rc int; 
declare @OutId1 int = -1; 
declare @Outh1 varchar(160) = ''; 
exec @rc = EGH.InGroundWaterMap @point1='27.4422796312367', @point2='53.9033260781941', @OutId = @OutId1 output, @Outh = @Outh1 output;
select @rc;
select @OutId1;
select @Outh1;
go

-- EGH.InRegionMap -- ����� - ����������:27.4421796312367 53.9043260781941
declare @rc int; 

exec @rc = EGH.InRegionMap @point1='27.4422796312367', @point2='53.9033260781941';
select @rc;

go

-- EGH.InSoilMap -- ����� - ����������:27.4421796312367 53.9043260781941
declare @rc int; 

exec @rc = EGH.InSoilMap @point1='27.4422796312367', @point2='53.9033260781941';
select @rc;

go


