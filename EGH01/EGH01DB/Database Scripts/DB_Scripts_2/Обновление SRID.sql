-- Определение SRID
select geom, geom.ToString(), geom.STSrid
 from [EGH].[RegionMap]

 -- замена SRID
 update [EGH].[RegionMap] set geom.STSrid=4326;

 -- CitiesMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].CitiesMap

 update [EGH].CitiesMap set geom.STSrid=4326;

  -- EcoLocalPointMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].EcoLocalPointMap

 update [EGH].EcoLocalPointMap set geom.STSrid=4326;
  
  -- EcoLocalPolyMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].EcoLocalPolyMap

 update [EGH].EcoLocalPolyMap set geom.STSrid=4326;

 
  -- EcoNationalPointMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].EcoNationalPointMap

 update [EGH].EcoNationalPointMap set geom.STSrid=4326;
 
  -- EcoRepublicPointMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].EcoRepublicPointMap

 update [EGH].EcoRepublicPointMap set geom.STSrid=4326;

-- EcoRepublicPolyMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].EcoRepublicPolyMap

 update [EGH].EcoRepublicPolyMap set geom.STSrid=4326;
 


 
-- GroundSelfCleaningMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].GroundSelfCleaningMap

 update [EGH].GroundSelfCleaningMap set geom.STSrid=4326;


-- GroundWaterMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].GroundWaterMap

 update [EGH].GroundWaterMap set geom.STSrid=4326;


-- KoefMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].KoefMap

update [EGH].KoefMap set geom.STSrid=4326;

-- PondMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].PondMap

update [EGH].PondMap set geom.STSrid=4326;


-- RiversMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].RiversMap

update [EGH].RiversMap set geom.STSrid=4326;

-- SoilMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].SoilMap

update [EGH].SoilMap set geom.STSrid=4326;


-- TimeMigrationMap
select top (10) geom, geom.ToString(), geom.STSrid
 from [EGH].TimeMigrationMap

update [EGH].TimeMigrationMap set geom.STSrid=4326;

-- WaterIntakeZoneMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].WaterIntakeZoneMap

update [EGH].WaterIntakeZoneMap set geom.STSrid=4326;


-- WaterProtectionMap
select geom, geom.ToString(), geom.STSrid
 from [EGH].WaterProtectionMap

update [EGH].WaterProtectionMap set geom.STSrid=4326;


