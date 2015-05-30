
difference() {
	cube([100,160, 5], center=true);
	translate([0, 42, 0]) cube([92,80, 6], center=true);
	translate([0, -42, 0]) cube([92,80, 6], center=true);
}