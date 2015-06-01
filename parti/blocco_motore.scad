
// Rostock Motor End from Jcrocholl modified to take 12mm smooth rods by Kolergy
//    - Stronger diagonal fins
//    - Increased number of screws
//    - M4 center screw for feet installation


use <Write.scad>
use <modulo.scad>

// Rostock Motor End from Jcrocholl modified by Kolergy to:
//    - Take 12x1000mm smooth rods and KB-12-WW Linear Bearings
//    - Increased base height to locate electronics below the base
//    - Stand on three feets


motor_end_height      =  64;  // Was 44
idler_end_height      =  28;
carriage_height       =  32; // Adapted to cover full length +2 of the Linear bearing
platform_thickness    =   8;
bed_thickness         =  12;
pcb_thickness         =   2;
smooth_rod_length     =1000;
platform_hinge_offset =  33;
carriage_hinge_offset =  22;
tower_radius          = 300;
rod_length            = tower_radius * 1.44;

h = motor_end_height; // Total height.
m = 29; // Motor mounting screws distance (center to center)

module motor_end() {
    translate([0, 0, h/2]) 
    difference() {
    union() {
      bracket(h);
/*
      for (x = [-30, 30]) {
        // Diagonal fins.    // Increased fin size
        translate([x, 43, 0]) intersection() {
          cube([7, 45, h], center=true);
          rotate([45, 0, 0]) translate([0, -50, 0]) cube([20, 100, 100], center=true);
        }
        // Extra mounting screw holes.
        translate([x, 70, 5-h/2]) difference() {
          cylinder(r=6, h=10, center=true, $fn=24);
          translate([0, 1, 0]) cylinder(r=1.9, h=12, center=true, $fn=12);
        }

      }
*/
    }
    // Motor shaft (RepRap logo)
    translate([0, 0, -8]) {
    rotate([90, 0, 0]) cylinder(r=12, h=40, center=true, $fn=48);
    //translate([0, 0, sin(45)*12]) rotate([0, 45, 0])
      cube([12, 40, 12], center=true);
    // Motor mounting screw slots
    translate([m/2, 0, m/2]) rotate([0, -45, 0])
      cube([9, 40, 3], center=true);
    translate([-m/2, 0, m/2]) rotate([0, 45, 0])
      cube([9, 40, 3], center=true);
    translate([m/2, 0, -m/2]) rotate([0, 45, 0])
      cube([9, 40, 3], center=true);
    translate([-m/2, 0, -m/2]) rotate([0, -45, 0])
      cube([9, 40, 3], center=true);
    }
    for (z = [-24, -12, 0, 12, 24]) {
      translate([0, 0, z]) screws();
    }
    // Position for M4 Screw for feet mount
	 rotate([90, 270, 90]) translate([-20, -3, 38])write("Rossonet RAM",h=5,t=3);
    //translate([0, 9.5, 25]) cylinder(r=1.85, h=40, center=true, $fn=24);
    
  }
}

motor_end();
