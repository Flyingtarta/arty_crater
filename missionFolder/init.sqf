private ["_ent","_arty"];

_arty = [0,0,0] nearobjects ["landVehicle",999999999];                          //search for anything arty like

{
if ( count (getArtilleryAmmo [_x]) > 0 ) then {                                 //add the script if has arty ammo
  _x addEventHandler ["fired",{_this execvm "scripts\crater.sqf"}]};
} foreach _arty;


{
  _x addEventHandler ["CuratorObjectPlaced",{
    _ent = _this select 1;
    _ent addeventhandler ["fired",{_this execvm "scripts\crater.sqf"
      }];//eventhandler _ent
    }]; //eventhandler
}foreach allcurators;                                                           //adds the script to every arty or mortar placed by zeus
