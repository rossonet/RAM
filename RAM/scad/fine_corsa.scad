

// Rostock Motor End from Jcrocholl 
//    - Thanks to the excellent parametric setup 
//      no change ere necessary for this file the change 
//      made to bracket.scad where directely useable
//    - V1.1 Added stiffeners to better carry the load of the pulley
//      I hesitated with the boxed concept but I guess this will keep
//      the pulley accessible
//    - The switch holder is not usefull anymore
 
use <modulo.scad>

// Rostock Motor End from Jcrocholl modified by Kolergy to:
//    - Take 12x1000mm smooth rods and KB-12-WW Linear Bearings
//    - Increased base height to locate electronics below the base
//    - Stand on three feets


motor_end_height      =  64;  // Was 44
idler_end_height      =  35;
carriage_height       =  32; // Adapted to cover full length +2 of the Linear bearing
platform_thickness    =   8;
bed_thickness         =  12;
pcb_thickness         =   2;
smooth_rod_length     =1000;
platform_hinge_offset =  33;
carriage_hinge_offset =  22;
tower_radius          = 300;
rod_length            = tower_radius * 1.44;



h    = idler_end_height; // Total height.
tilt = 2; // Tilt bearings upward (the timing belt is pulling pretty hard).

module bearing_mount() {
  translate([0, 0, 2.3]) cylinder(r1=12, r2=9, h=1.1, center=true);
  translate([0, 0, -2.3]) cylinder(r1=9, r2=12, h=1.1, center=true);
}
/*
module stifener(l, w, z, a) {
	wz = sin(a)*w/2;
	wy = (1-cos(a))*w/2;
	hull() {
		cube([l, w  ,0.01], center=true);
		translate([0, wy, wz+z]) rotate([-a, 0, 0]) cube([l, w  ,0.01], center=true);
	}
}
*/
module passante(){
    difference(){
        //cylinder(r=9,h=80,center=true);
        cylinder(r=5,h=82,center=true);
    }
    
}
module passanti() {
    translate([0,90,0]){
         rotate([0,0,30])
         translate([0,-64,0])passante();
         rotate([0,0,-30])
         translate([0,-64,0])passante();
         rotate([0,0,30])
         translate([0,-84,0])passante();
         rotate([0,0,-30])
         translate([0,-84,0])passante();
         rotate([0,0,30])
         translate([0,-104,0])passante();
         rotate([0,0,-30])
         translate([0,-104,0])passante();
    }
    for (x = [30, -30]) {
      translate([x, 0, 0]) 
		cylinder(r=6.2, h=250, center=true);
    }
      
}


module idler_end() {
  translate([0, 0, h/2]) 
  difference() {
    union() {
      bracket(h);
      translate([0, 7.5, 0]) rotate([90 - tilt, 0, 0]) bearing_mount();
   	 translate([0, 15, -h/2]) stifener(50, 7, 2, 45);
	 translate([0, 15,  h/2]) rotate([0, 180, 0]) stifener(50, 7, 2, 45);
	 translate([0, 15,    0]) cube([78, 7, h], center=true);
	 translate([0, 15,    0]) rotate([90, 0, 0]) cylinder(r=8, h=7, center=true, $fn=24);
    }
    translate([0, 8, 0]) rotate([90 - tilt, 0, 0])
      cylinder(r=4, h=40, center=true,$fn=90);
    for (z = [-7, 7]) {
       translate([0, 0, z]) screws();
    }
  }
}

difference(){
    union(){
        idler_end();
        
        hull(){
        translate([24,17,0])cylinder(r=6,h=35);
        translate([42,17,0])cylinder(r=12,h=35);
        translate([32,35,0])cylinder(r=20,h=35);
        translate([51,2,0])cylinder(r=12,h=35);
        }
        
        
               hull(){
        translate([-24,17,0])cylinder(r=6,h=35);
        translate([-42,17,0])cylinder(r=12,h=35);
                translate([-32,35,0])cylinder(r=20,h=35);
                           translate([-51,2,0])cylinder(r=12,h=35);
               }
    }
passanti();
}
