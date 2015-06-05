$fn=150;
module screws() {
  for (x = [-w/2, w/2]) {
    translate([x, 0, 0]) {
	 // Push-through M3 screw hole.

	 // M3 nut holder.
       //rotate([30, 0, 0]) 
    }
  }
}

difference(){
union(){
	cube([16,16,25],center=true);
	translate([0,0,21]) cylinder(r=7.7,h=23,center=true);
	translate([0,0,-10]) cylinder(r=16,h=12,center=true);
	}
union(){
	translate([0,0,-20])cylinder(r=4.75,h=60);
	translate([0,0,-9])cube([40,3,16],center=true);
	translate([10, 0, -10]) rotate([0, 90, 90]) cylinder(r=1.65, h=30, center=true);
	translate([10, 11, -10]) rotate([0, 90, 90]) cylinder(r=3.2, h=10, center=true, $fn=6);
	translate([-10, 0, -10]) rotate([0, 90, 90]) cylinder(r=1.65, h=30, center=true);
	translate([-10, -11, -10]) rotate([0, 90, 90]) cylinder(r=3.2, h=10, center=true, $fn=6);
	}
} 

