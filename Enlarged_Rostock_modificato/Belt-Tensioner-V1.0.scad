// Enlarged Rostock Belt tensioner
//    - T2.5 self locking belt geometry based on belt_coupler_v6 from Okatake

include <configuration.scad>
use <belt_coupler_v6_Mod.scad>
use <carriage-V1.2.scad>

H  = carriage_height;
th = 4;

%carriage();

union(){
	translate([8, 5, 0]) cube([15, 5., 12], center=true);
	difference() {
		translate([8, 0, 0]) cube([15, 5, 12], center=true);
		translate([8, 0, 7.5]) rotate([-45, 0,  0]) cube([17, 5, 15], center=true);
		translate([ 8, 14., -(H+th)/2+0.5]) rotate([90, -90, 0]) belt();
		translate([ 8.2, 14.0, -(H+th)/2+0.6]) rotate([90, -90, 0]) belt(); // Slightly enlarge the gap of the belt

		translate([12, 0, 0]) cylinder(r=1.6, h=H+th+2, center=true, $fn=12);
		translate([ 3.5, 0, 0]) cylinder(r=1.6, h=H+th+2, center=true, $fn=12);
		translate([12, 0, -7]) cylinder(r=3.3, h=4, center=true, $fn=6);
		translate([ 3.5, 0, -7]) cylinder(r=3.3, h=4, center=true, $fn=6);
	}
}

