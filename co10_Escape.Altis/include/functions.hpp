class CfgFunctions
{
	class A3E
	{
		class Common
		{
			class addHijackAction {};
			class addHealAtMedicalBuildingAction {};
			class RandomMarkerPos {};
			class GetSideColor {};
			class RandomSpawnPos {};
			class KeyDown {};
			class RandomPatrolPos {};
			class WriteParamBriefing {};
            class findFlatArea{};
			class RotatePosition{};
			class GetEnemyCount{};
			class paramWeather{};
			class paramDaytime{};
			class systemChat {};
			class groupChat {};
		};
		class AI
		{
			class RandomPatrolRoute {};
			class EngageReportedGroup {};
			class InCombat {};
			class Move {};
			class Search {};
			class Patrol {};
			class Flee {};
			class FireArtillery {};
			class OrderSearch {};
			class SetTaskState {};
			class GetTaskState {};
			//class AquaticPatrol {};
			class RoyDropChopper {};
			class RoyCreateDropChopper {};
			class villageSquads {};
		};
		class Debug
		{
			class unit_debug_marker {};
			class drawMapLine {};
			class TrackGroup {};
            class debugChat {};
			class rptLog {};
		};
		class Server
		{
			class watchKnownPosition {};
			class initServer {
                    preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                    postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                    recompile = 1; // 1 to recompile the function upon mission start
            };			
			class parameterInit {}; 
            class createComCenters {};
            class createAmmoDepots {};
			class createHeliBases {};
			class createAirstrip {};
			class handleJIP {};
			class createArtillery {};
			class randomBoats {};
		};
		class Surprises
		{
			class runSurprise {};
			class russianChopper {}; 
            class motorSearch {};
            class dropChopper {};
			class civEnemy {};
			class reinforcementTruck {};
			class fastMover {};
			class stolenA164 {};
			class megaDrop {};
		};
		class Templates
		{
            class BuildPrison {};
            class BuildComCenter {};
            class AmmoDepot {};
			class Artillery {};	
			class HeliBase {};			
		};
	};
	class drn
	{
		class DRN
		{
			class AmbientInfantry {}; 
			class MoveInfantryGroup {}; 
			class MonitorEmptyGroups {};
			class PopulateLocation {};
			class DepopulateLocation {};
			class InitGuardedLocations {};
			class DynamicWeatherEffects {};
			class InsertionTruck {};
			class MilitaryTraffic {};
			class MoveVehicle {};
			class MotorizedSearchGroup {};
			class RoadBlocks {};	
			class SearchChopper {};
			class SearchGroup {};
			//class InitVillageMarkers{};
			//class PopulateVillage {};
			//class DepopulateVillage {};
			//class InitVillagePatrols {};
			//class InitAquaticPatrols {};
			//class PopulateAquaticPatrol {};
			//class DepopulateAquaticPatrol {};
			//class InitAquaticPatrolMarkers {};
		};
	};
	class AT
	{
	};
	
	
};