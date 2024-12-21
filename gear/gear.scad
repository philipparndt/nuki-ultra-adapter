// use <./gears/gears.scad>
use <./ub.scad>

// Parameters for the rectangle
rect_width = 10;  // Width of the rectangle
rect_height = 20; // Height of the rectangle
rect_depth = 15;  // Depth through the gear
rect_pos_x = 0;   // X position of the rectangle
rect_pos_y = 0;   // Y position of the rectangle

// spur_gear_mod(modul=0.4912, tooth_number=32, width=4.2, bore=0, pressure_angle=25, helix_angle=0, optimized=false);



/*[Hidden]*/
  useVersion=22.046;
  designVersion=1.0;

/*[Basics]*/
  vp=false;
  bed=false;
  pPos=[0,0];
  info=true;
  nozzle=.2;

/*[ Gears ]*/
z=32; // number teeth 
f=6; // teeth width divisior
modul=0.4912; // teeth size
h=1; // height
w=0; // helical teeth skew
achse=1;// arbor

function pitchcircle(z=z)=z*modul/f;

T(printPos){ 
//gear
  CyclGetriebe(h=h,z=z,f=f,modul=modul,linear=false,w=w,
//    grad=20, h2=0.1,
    grad=0,
    spiel=0,
    achse=0,
    help=true);
   
}

/*
difference() {
    // Gear
    // 0.48 = 16.43
    // 0.49 = 16.76
    
    // ? = 16.8
    
    //spur_gear_mod(modul=0.4912, tooth_number=32, width=4.2, bore=0, pressure_angle=25, helix_angle=0, optimized=false);
    
    
//    gear(tooth_number=20, radius_with_tooth=10, radius_without_tooth=9);
    
    // Rectangle (subtracted from the gear)
    //translate([rect_pos_x, rect_pos_y, -rect_depth/2]) 
    //    cube([rect_width, rect_height, rect_depth], center=true);
}
*/