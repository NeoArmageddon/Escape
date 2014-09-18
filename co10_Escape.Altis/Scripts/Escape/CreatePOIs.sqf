if (!isServer) exitWith {};


_playergroup = _this select 0;
_enemyMinSkill = _this select 1;
_enemyMaxSkill = _this select 2;
_enemySpawnDistance = _this select 3;
_enemyFrequency = _this select 4;
//A3E_InstallFound = [];

////////////////////////////////////
/// create comm centers (sic) :P ///
////////////////////////////////////

private ["_comCenNo","_comCenMarkerNames","_markerCoreName","_markerName","_instanceNo","_marker","_chosenComCenIndexes","_comCenPositions","_distanceBetween","_pos","_occupiedPositions","_i","_j","_tooCloseAnotherPos","_maxDistance","_countNW","_countNE","_countSE","_countSW","_isOk","_regionCount","_commCentreMarkers", "_index","_chosenComCenIndexes","_commCentreMarkers"];

["Creating Communication Centers"] call drn_fnc_CL_ShowTitleTextAllClients;
	
drn_var_Escape_communicationCenterPositions = [A3E_ComCenterCount] call A3E_fnc_findInstallPos;

 _instanceNo = 0;
{
    private ["_index"];
    private ["_pos", "_dir"];

    _pos = _x;
    _dir = random 360;

    [_pos, _dir, drn_arr_ComCenStaticWeapons,drn_arr_ComCenParkedVehicles] call a3e_fnc_BuildComCenter;

    _marker = createMarker ["drn_CommunicationCenterMapMarker" + str _instanceNo, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "mil_unknown";

    _marker = createMarkerLocal ["drn_CommunicationCenterPatrolMarker" + str _instanceNo, _pos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerAlpha 0;
    _marker setMarkerSizeLocal [50, 50];
	
	
    _instanceNo = _instanceNo + 1;
} foreach drn_var_Escape_communicationCenterPositions;

publicVariable "drn_var_Escape_communicationCenterPositions";


_EnemyCount = [3] call A3E_fnc_GetEnemyCount;

_scriptHandle = [_playerGroup, "drn_CommunicationCenterPatrolMarker", east, "INS", 4, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, "drn_CommunicationCenterMapMarker", true, 30] spawn drn_fnc_InitGuardedLocations;
waitUntil {scriptDone _scriptHandle};

[_playerGroup, drn_var_Escape_communicationCenterPositions, _enemySpawnDistance, _enemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;


//////////////////////////
/// create ammo depots ///
//////////////////////////

private ["_occupiedPositions"];
private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_maxDistance", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

["Creating Ammo Depots"] call drn_fnc_CL_ShowTitleTextAllClients;

drn_var_Escape_ammoDepotPositions = [A3E_AmmoDepotCount] call A3E_fnc_findInstallPos;

{
    [_x,drn_arr_Escape_AmmoDepot_StaticWeaponClasses,drn_arr_Escape_AmmoDepot_ParkedVehicleClasses] call A3E_fnc_AmmoDepot;
	

	
} foreach drn_var_Escape_ammoDepotPositions;

publicVariable "drn_var_Escape_ammoDepotPositions";


_EnemyCount = [2] call A3E_fnc_GetEnemyCount;

[_playerGroup, "drn_AmmoDepotPatrolMarker", east, "INS", 3, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, "drn_AmmoDepotMapMarker", true, 12] spawn drn_fnc_InitGuardedLocations;


/////////////////////////
/// create heli bases ///
/////////////////////////

private ["_occupiedPositions"];
private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_maxDistance", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount"];

["Creating Helicopter Bases"] call drn_fnc_CL_ShowTitleTextAllClients;

A3E_HeliBaseCount = round (A3E_AmmoDepotCount / 2);

drn_var_Escape_HeliBasePositions = [A3E_HeliBaseCount] call A3E_fnc_findInstallPos;
{
    [_x,drn_arr_Escape_AmmoDepot_StaticWeaponClasses,drn_arr_Escape_AmmoDepot_ParkedVehicleClasses] call A3E_fnc_HeliBase;
	
	
} foreach drn_var_Escape_HeliBasePositions;

publicVariable "drn_var_Escape_HeliBasePositions";

_EnemyCount = [3] call A3E_fnc_GetEnemyCount;

_scriptHandle = [_playerGroup, "drn_HeliBasePatrolMarker", east, "INS", 4, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, "drn_HeliBaseMapMarker", true, 25] spawn drn_fnc_InitGuardedLocations;
waitUntil {scriptDone _scriptHandle};

//[_playerGroup, drn_var_Escape_communicationCenterPositions, _enemySpawnDistance, _enemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;	





////////////////////////
/// create artillery ///
////////////////////////

private ["_occupiedPositions"];
private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_pos", "_maxDistance", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_regionCount","_artNumber"];


["Creating Mobile Artillery"] call drn_fnc_CL_ShowTitleTextAllClients;

a3e_var_artillery_units  = [];
_artPositions = [];
A3E_ArtilleryCount = 8;

_artPositions = [A3E_ArtilleryCount, 400] call A3E_fnc_findInstallPos;

_artNumber = 1;

{
    [_x,_artNumber, _playergroup] call A3E_fnc_Artillery;
	_artNumber = _artNumber + 2;
} foreach _artPositions;

drn_var_Escape_ArtilleryPositions = _artPositions;
publicVariable "drn_var_Escape_ArtilleryPositions";
//publicVariable "a3e_var_artillery_units";

["Escape has started!"] call drn_fnc_CL_ShowTitleTextAllClients;