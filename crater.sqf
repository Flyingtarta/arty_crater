////////////////////////////////////////////////////////////////////////////////
//______________________________________v.0.2_________________________________//
/*
/* put this on the arty init:
this addeventhandler ["fired",{_this execVM "crater.sqf"}];
*/////////////////////////////////////////////////////////////////////////////////

if!(isserver) exitwith {};//only in server

    _bullet   = _this select 6;//shell
    _arty     = _this select 0;//mortar
    _mag      = _this select 5;//ammo used

    _a = typeof _arty; //get the class name
    _z = sizeOf _a;//gun size
    _c = "Land_ShellCrater_02_large_F";
    if (_z > 5) then {};

    _he = (((magazinesammo _arty) select 0)select 0);                           //select He Proyectile
    if !(_mag == _he )exitwith{};                                               //cheks the proyectile is HE
    waituntil {((getposatl _bullet) select 2 ) > 1};
    sleep 1;
    _pos = 0;
    _dir = 0;
    waitUntil {
      if (isnull _bullet) exitwith {true};
      _pos = getPosATL _bullet;
      _dir = getdir _bullet;
      false
    };

    _vec = surfacenormal _pos;                                                  //get the normal vector of the position
    if (_pos select 2 > 1) exitwith {};                                         //if hits a building it doesnt do anything
    sleep 1;
    if (_z < 5) then { _c = "Land_ShellCrater_02_small_F";};
    _crat = createVehicle [ _c ,_pos];                                         //creates the crater
    _crat setdir (_dir - 90);                                                   //set the direction of the crater
    _crat setvectorup _vec;                                                     //the crater matches the ground
    
//by tarta
//thank you u/commy2
