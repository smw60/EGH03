---1 -- 0 ������
exec MAP.InRegionMap @point = 'Point(27.4421796312367 53.9043260781941)';

---2  -- 0 ������
exec MAP.InPondMap @point = 'Point(27.4421796312367 53.9043260781941)';

---3  -- 0 ������
exec MAP.InWaterIntakeZoneMap @point = 'Point(27.4421796312367 53.9043260781941)';

---4  --  1 �������
exec MAP.InWaterProtectionMap @point = 'Point(27.4421796312367 53.9043260781941)';

---5 -- 7 ������
exec MAP.InTimeMigrationMap @point = 'Point(27.4421796312367 53.9043260781941)';

---6 -- 0 ������
exec MAP.InGroundWaterMap @point = 'Point(27.4421796312367 53.9043260781941)';

---7 -- 0 ������
exec MAP.InRiverDensityMap @point = 'Point(27.4421796312367 53.9043260781941)';

---8 -- 0 ������
exec MAP.InProtectGroundWaterMap @point = 'Point(27.4421796312367 53.9043260781941)';

---9 -- 0 ������
exec MAP.InAerationrMap @point = 'Point(27.4421796312367 53.9043260781941)';

---10 -- 0 ������
exec MAP.InCityMap @point = 'Point(27.4421796312367 53.9043260781941)';

---11 -- 0 ������
exec MAP.InDownfallMap @point = 'Point(27.4421796312367 53.9043260781941)';

---12 -- 1 �������
exec MAP.InSoilMap @point = 'Point(27.4421796312367 53.9043260781941)';

---13 -- 1 �������
exec MAP.InVegetationMap @point = 'Point(27.4421796312367 53.9043260781941)';

---14 -- 23-28 ������
exec MAP.InTopographyMap @point = 'Point(27.4421796312367 53.9043260781941)';

---15 -- 2 �������
exec MAP.InGeologyMap @point = 'Point(27.4421796312367 53.9043260781941)';

---16 -- 2 �������
exec MAP.InGeologyMap @point = 'Point(27.4421796312367 53.9043260781941)';

---17 -- 0 ������
exec MAP.InSunRadiationMap @point = 'Point(27.4421796312367 53.9043260781941)';

---18 -- 0 ������
exec MAP.InMonthTempMap @point = 'Point(27.4421796312367 53.9043260781941)';

---19 -- 1 �������
exec MAP.QuatSedimentsMap @point = 'Point(27.4421796312367 53.9043260781941)';

---20 -- 0 ������
exec MAP.EcoObjectLocalPoint @point = 'Point(27.4421796312367 53.9043260781941)';

---21 -- 0 ������
exec MAP.EcoObjectLocalPoly @point = 'Point(27.4421796312367 53.9043260781941)';

---22 -- 0 ������
exec MAP.EcoObjectNational @point = 'Point(27.4421796312367 53.9043260781941)';

---23 -- 0 ������
exec MAP.EcoObjectRepublicPoint @point = 'Point(27.4421796312367 53.9043260781941)';

---24 -- 0 ������
exec MAP.EcoObjectRepublicPoly @point = 'Point(27.4421796312367 53.9043260781941)';

---25 -- 5 ������
exec MAP.InGroundProtectMap @point = 'Point(27.4421796312367 53.9043260781941)';

---26 -- 2 �������
exec MAP.InGroundCoefMap @point = 'Point(27.4421796312367 53.9043260781941)';

<<<<<<< HEAD
exec MAP.EcoObjectInBuffer @point = 'Point(27.4421796312367 53.9043260781941)', @buffer = 1520;
=======
---27 -- 5 ������
exec MAP.EcoRepublic @point = 'Point(27.4421796312367 53.9043260781941)';

---28 -- 2 �������
exec MAP.EcoLocal @point = 'Point(27.4421796312367 53.9043260781941)';
--29 buffer
exec [MAP].[EcoObjectInBuffer] @point = 'Point(27.4421796312367 53.9043260781941)', @buffer = 12000;

>>>>>>> 7d637de02f634c99531221ef8b82155da2e1c787







