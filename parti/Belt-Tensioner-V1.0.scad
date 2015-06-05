// Enlarged Rostock Belt tensioner
//    - T2.5 self locking belt geometry based on belt_coupler_v6 from Okatake


// Rostock Motor End from Jcrocholl modified by Kolergy to:
//    - Take 12x1000mm smooth rods and KB-12-WW Linear Bearings
//    - Increased base height to locate electronics below the base
//    - Stand on three feets
use <belt_coupler_v6_Mod.scad>
use <carrello.scad>

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

H  = carriage_height;
th = 4;

//%carriage();

	difference() {
union(){
	translate([7.5, 5., 0]) cube([15, 5., 12], center=true);
		translate([7.5, 1, 0]) cube([15, 7, 12], center=true);
}
		translate([8, 0, 7.5]) rotate([-45, 0,  0]) cube([17, 5, 15], center=true);
		translate([ 7.5, 3.5, -(H+th)/2+0.5]) rotate([90, -90, 0]) belt();
		translate([ 8.0, 3.5, -(H+th)/2+0.6]) rotate([90, -90, 0]) belt(); // Slightly enlarge the gap of the belt
		translate([12, 0, 0]) cylinder(r=1.6, h=H+th+2, center=true, $fn=12);
		translate([ 3.5, 0, 0]) cylinder(r=1.6, h=H+th+2, center=true, $fn=12);
		translate([12, 0, -7]) cylinder(r=3.3, h=4, center=true, $fn=6);
		translate([ 3.5, 0, -7]) cylinder(r=3.3, h=4, center=true, $fn=6);
	
}

