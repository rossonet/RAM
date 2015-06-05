$fn=120;
module finale() {
rotate([0,0,0])
difference() {
  union() {
    translate([0,0,0])
    cylinder(r=14/2, h=40);
    translate([0,0,40])
    cylinder(r2=16/2, r1=14/2,h=3);
	 translate([0,0,43])
    cylinder(r=16/2, h=3);
	 translate([0,0,46])
    cylinder(r2=2, r1=16/2,h=7);
 }

translate([0,0,-1])
cylinder(r=10.6/2,h=41);
translate([0,0,50])
sphere(12/2, $fn=100);
 }
}

finale();