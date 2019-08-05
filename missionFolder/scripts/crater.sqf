if!(isserver) exitwith {};//only in server
private ["_bullet","_fondo","_arty","_mag","_a","_z","_c","_crat","_pos","_dir","_vec"];

_bullet   = _this select 6;//shell
_arty     = _this select 0;//mortar
_mag      = _this select 5;//ammo used
_a = typeof _arty; //get the class name
_z = sizeOf _a;//gun size
_c = "Land_ShellCrater_02_large_F";
if (_z < 8) then {_c = "Land_ShellCrater_02_small_F";};                     //changes the crater size if its an mortar

_he = (((magazinesammo _arty) select 0)select 0);                           //select He Proyectile
if !(_mag == _he )exitwith{};                                               //cheks the proyectile is HE
_pos = 0;                                                                   //creates the variable out of the scope
_dir = 0;                                                                   //creates the variable out of the scope
waitUntil {                                                                 //saves the last position before the bullet disapear
  if (isnull _bullet) exitwith {true};
  _pos = getPosATL _bullet;
  _dir = getdir _bullet;
  false
};
_vec = surfacenormal _pos;                                                  //get the normal vector of the position
if (_pos select 2 > 1) exitwith {};                                         //if hits a building it doesnt do anything
sleep 0.5;
_crat = createVehicle [ _c ,_pos,[],0,"CAN_COLLIDE"];                       //creates the crater
_crat setdir (_dir - 90);                                                   //set the direction of the crater
_crat setvectorup _vec;                                                     //the crater matches the ground
_posF = [(_pos select 0)+1 ,_pos select 1 , _pos select 2];
//_fondo = createVehicle [ "Land_ShellCrater_02_decal_F" ,_posF,[],0,"CAN_COLLIDE"];
//_fondo setdir (_dir + 45);
//_fondo setvectorup _vec;
//by tarta
//thank you u/commy2 dor help <3
