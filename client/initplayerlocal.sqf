/*
	@file 		initPlayerLocal.sqf
	@author		JediNarwals [TG]
				Bornasm [TG]
	@description
		Initializes the player at Start-up. Does not need to be called by any file.

*/

if(isDedicated) exitWith {/*Go away Server*/};
waitUntil {!isNull player && player == player};

//=========================== HUD

[] spawn jedi_fnc_hudSetup;

//=========================== MISC

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;				// BIS dynamic groups
player switchCamera "EXTERNAL";											// Check your 6'
enableRadio false;														// That will clear the voices from my head...
enableSentences FALSE;													// Stop talking to myself
enableSaving [FALSE,FALSE];												// "Everything Not saved will be lost." - Nintendo 'Quit Screen' message
player enableFatigue false;												// Disables fatigue

//=========================== client executions

{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;				// Adds players to Zeus

[] execVM "scripts\icons.sqf";													// blufor map tracker ~Quicksilver
[] execVM "scripts\diary.sqf";													// diary tabs

