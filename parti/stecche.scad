$fn=160;
module finale() {
rotate([0,0,0])
difference() {
  union() {
    translate([0,0,0])
    cylinder(r=14/2, h=20);
    translate([0,0,20])
    cylinder(r2=16/2, r1=14/2,h=3);
	 translate([0,0,23])
    cylinder(r=16/2, h=3);
	 translate([0,0,26])
    cylinder(r2=2, r1=16/2,h=7);
 }

translate([0,0,-1])
cylinder(r=10.6/2,h=20);
translate([0,0,30])
sphere(12/2,center=true);
 }
}

finale();