include <configuration.scad>
use <bracket.scad>
//use <carriage_12t_t5.scad>
use <carriage.scad>

h = idler_end_height; // Total height.
tilt = 0; // Tilt bearings upward (the timing belt is pulling pretty hard).
x_offset = -2.8; // bearing offset from x origin to accomodate different pulley d

module bearing_mount() {
  translate([0, 0, 2.3]) cylinder(r1=12, r2=9, h=1.1, center=true);
  translate([0, 0, -2.3]) cylinder(r1=9, r2=12, h=1.1, center=true);
}

x = 17.7; // Micro switch center.
y = 16; // Micro switch center.

module idler_end() {
  translate([0, 0, h/2])
  difference() {
    union() {
      bracket(h);
     	//translate([x_offset, 7.5, 0]) rotate([90 - tilt, 0, 0]) bearing_mount();
      // Micro switch placeholder.
      % translate([x, y, -h/2+4]) rotate([0, 0, 15])
          cube([19.6, 6.34, 10.2], center=true);
      difference() {
        translate([20, 11.88, -h/2+5])
          cube([18, 8, 10], center=true);
        translate([x, y, -h/2+4]) rotate([0, 0, 15])
          cube([30, 6.34, 20], center=true);
        translate([30, 12, -h/2+5])
          cylinder(r=3, h=20, center=true);
      }
    }
    translate([x, y, -h/2+6]) rotate([0, 0, 15]) {
      translate([-9.5/2, 0, 0]) rotate([90, 0, 0])
cylinder(r=1.1, h=26, center=true, $fn=12);
      translate([9.5/2, 0, 0]) rotate([90, 0, 0])
cylinder(r=1.1, h=26, center=true, $fn=12);
    }
    for (z = [-7, 7]) {
      translate([0, 0, z]) screws();
    }
  }
}

module end_box() {

	difference() {
		translate([-27, -16, 0])
			minkowski() {
				cube([54, 5, h/2]);
				cylinder(r=2, h=h/2, $fs=0.5);
			}

		translate([-51/2, -14.5, -1])
			cylinder(r=1.9, h=h+2, $fs=0.5);

		translate([51/2, -14.5, -1])
			cylinder(r=1.9, h=h+2, $fs=0.5);

		translate([-60/2+10, -18+5+4, -1])
			cylinder(r=4, h=h+2, $fs=0.5);
		
		translate([60/2-10, -18+5+4, -1])
			cylinder(r=4, h=h+2, $fs=0.5);
	
		translate([-20, -13, -1])
			cube([40, 10, h+2]);
	
	}
}

difference() {
	union() {
		end_box();

		idler_end();
	}

	translate([x_offset, 0, h/2])
		rotate([90 - tilt, 0, 0])
			cylinder(r=4, h=40, center=true);
}

//carriage();

//translate([x_offset, 8, 4])
//	rotate([90, 0, 0])
//		cylinder(r=11, h=10);