["Initialize"] call BIS_fnc_dynamicGroups;					// Dynamic Groups by Bohimia

//------------------- Tags above player heads

onEachFrame   
{   
  { 
 if (cursorObject == _x) then 
 { 
  drawIcon3D ["", [1, 1, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1,(visiblePosition _x select 2)+2.2], 0.15, 0.15, 45, (format [name _x]), 2, 0.035, "PuristaMedium"];   
 }; 
  } foreach playableUnits; 
  {   
    if ((side _x == west) && (_x != player) && ((player distance _x) < 15)) then   
    {   
      drawIcon3D ["", [1, 1, 1, 1], [visiblePosition _x select 0, visiblePosition _x select 1,(visiblePosition _x select 2)+2.2], 0.15, 0.15, 45, (format [name _x]), 2, 0.035, "PuristaMedium"];   
    };   
  } foreach playableUnits;   
};

//------------------ Adds player names next to the markers they place on the map

[] spawn
{
	while{true} do
	{
		waitUntil {visibleMap};
		waitUntil {!isNull findDisplay 54 || !visibleMap};
		if(visibleMap) then {
			findDisplay 54 displayCtrl 1 buttonSetAction
			"
				if(currentChannel in [0,1]) then {
					_ctrl = findDisplay 54 displayCtrl 101;
					_text = ctrlText _ctrl;
					if (_text == '') then {
						_text = format ['%1', name player];
					} else {
						_text = format ['%1: %2', name player, _text];
					};
					_ctrl ctrlSetText _text;
				};
			";
			waitUntil{isNull findDisplay 54};
		};
	};
};


