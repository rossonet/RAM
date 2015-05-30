
// Rostock Motor End from Jcrocholl modified by Kolergy to:
//    - Take 12x1000mm smooth rods and KB-12-WW Linear Bearings
//    - Increased base height to locate electronics below the base
//    - Stand on three feets
//    - Enlarged bed size to be able to print roughly 400x400 mm



include <configuration.scad>;


offset        = 6;
radius        = tower_radius-offset;  //(tower_radius-8/2)/cos(30)
d             = 2*radius;
ratioH        = 0.83;
plywood_sizeV = d*0.96;
plywood_sizeH = d*ratioH;

echo(plywood_sizeV);
echo(plywood_sizeH);

module plywood() {
	difference() {
		intersection() {
			translate([0, d*(1-ratioH)/2, 0]) cube([plywood_sizeV, plywood_sizeH, bed_thickness], center=true);
			translate([0, 0, 0]) rotate([0, 0, 30]) cylinder(r=2*radius, h=20, center=true, $fn=3);
			translate([0, -radius/1.5, 0]) rotate([0, 0,-30]) cylinder(r=2*radius, h=20, center=true, $fn=3);
			//translate([0, 2*radius*0.05/2+radius/5, 0]) cube([plywood_sizeV, plywood_sizeH, bed_thickness], center=true);

		}
		cylinder(r=5, h=bed_thickness+1, center=true, $fn=12);

		for (a = [0, 120, 240]) {
			translate([0, 0, 0]) rotate([0, 0, a]) {
				translate([-30, tower_radius-13, 0]) cylinder(r=2.2, h=bed_thickness+1, center=true, $fn=12);
				translate([ 30, tower_radius-13, 0]) cylinder(r=2.2, h=bed_thickness+1, center=true, $fn=12);
				translate([-30, tower_radius-71, 0]) cylinder(r=2.2, h=bed_thickness+1, center=true, $fn=12);
				translate([ 30, tower_radius-71, 0]) cylinder(r=2.2, h=bed_thickness+1, center=true, $fn=12);

				translate([  0, tower_radius-40, 0]) cylinder(r=20, h=bed_thickness+1, center=true, $fn=24);

				for (b = [0, 30, 60, 90]) {
					rotate([0, 0, b]) translate([  0, radius/2.3, 0]) hull() {
						translate([  0, -30, 0]) cylinder(r=2.1, h=bed_thickness+1, center=true, $fn=12);
						translate([  0,  30, 0]) cylinder(r=2.1, h=bed_thickness+1, center=true, $fn=12);
					}
				}
			}
		}
	}
}



translate([0, 0, thickness/2]) plywood();
//projection(cut = false) plywood();

//% translate([0, 0, 0]) cylinder(r=radius/cos(30), h=bed_thickness, center=true, $fn=6);

//HEATED_BED = 400;

//%  translate([0, 0, bed_thickness]) cube([HEATED_BED, HEATED_BED, 2], center=true);

