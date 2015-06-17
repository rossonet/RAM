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
	//cube([18,18,25],center=true);
	translate([0,0,8]) cylinder(r=15,h=10,center=true);
	intersection(){
	translate([0,0,16]) cylinder(r=15,h=15,center=true);
	translate([0,0,5]) sphere(r=20,center=true);
	}
	translate([0,0,0]) cylinder(r=18,h=12,center=true);
	}
union(){
	translate([0,0,-10])cylinder(r=4,h=80);
	translate([0,0,1])cube([40,3,16],center=true);
	translate([10, 0, 0]) rotate([0, 90, 90]) cylinder(r=1.65, h=35, center=true);
	translate([10, 11, 0]) rotate([0, 90, 90]) cylinder(r=3.2, h=20, center=true, $fn=6);
	translate([-10, 0, 0]) rotate([0, 90, 90]) cylinder(r=1.65, h=35, center=true);
	translate([-10, -11, 0]) rotate([0, 90, 90]) cylinder(r=3.2, h=20, center=true, $fn=6);
	}
} 

