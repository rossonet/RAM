

// Rostock Motor End from Jcrocholl 
//    - Thanks to the excellent parametric setup 
//      no change ere necessary for this file the change 
//      made to bracket.scad where directely useable
//    - V1.1 Added stiffeners to better carry the load of the pulley
//      I hesitated with the boxed concept but I guess this will keep
//      the pulley accessible
//    - The switch holder is not usefull anymore
 

include <configuration.scad>
use <bracket.scad>

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

module idler_end() {
  translate([0, 0, h/2]) 
  difference() {
    union() {
      bracket(h);
      translate([0, 7.5, 0]) rotate([90 - tilt, 0, 0]) bearing_mount();
   	 translate([0, 15, -h/2]) stifener(50, 7, 2, 45);
	 translate([0, 15,  h/2]) rotate([0, 180, 0]) stifener(50, 7, 2, 45);
	 translate([0, 15,    0]) cube([22, 7, h-3], center=true);
	 translate([0, 15,    0]) rotate([90, 0, 0]) cylinder(r=8, h=7, center=true, $fn=24);
    }
    translate([0, 8, 0]) rotate([90 - tilt, 0, 0])
      cylinder(r=4, h=40, center=true);
    for (z = [-7, 7]) {
       translate([0, 0, z]) screws();
    }
  }
}

idler_end();
