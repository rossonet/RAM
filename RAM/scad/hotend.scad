module hotend() {
	color("silver"){
		difference(){
		//top mounting point
			union(){
				translate([0,0,9.1]) cylinder(3.9,8.1,8.1);
				cylinder(12,6.1,6.1);
				cylinder(3,8.1,8.1);
				//small thermal break
				translate([0,0,-6.6]) cylinder(6.6,4.575,4.575);
				translate([0,0,-2.5]) cylinder(1,8.2,8.2);
				//big thermal break
				translate([0,0,-30]) cylinder(30,4.575,4.575); //smallest inner shaft
				translate([0,0,-30]) cylinder(20,6.5,6.5); //medium inner shaft
				translate([0,0,-30]) cylinder(10,7.5,7.5); //large-bottom inner shaft
				for (z = [0:10]){
					translate([0,0,-5-((30-5)/10)*z]) cylinder(1,11.1,11.1);
				}
			} //heatsink fins
			//through and through hole
			union(){
				translate([0,0,12]) cylinder(2,1,4.465); //filament funnel - from ref. drawing
				translate([0,0,-39.1]) cylinder(60,1,1,$fn=20);
			}
		}
	} //filament hole
	
	//begin heater block (from ref. drawings and extrapolation, not measured)
	color("gray"){
		translate([0,0,-33]) cylinder(3.1,1.2,1.2);
		difference(){
			translate([-5,-7.5,-44.5]) cube([20,16,11.5]);
			union(){
				translate([7,9,-38]) rotate([90,0,0]) cylinder(20,2,2,$fn=20);
				translate([-3,9,-35]) rotate([90,0,0]) cylinder(3.1,.5,.5,$fn=20);
			}
		}
	}
	translate([0,0,-47.5]) cylinder(3,4,4,$fn=6);
	color("goldenrod") translate([0,0,-49.8]) cylinder(2.3,.4,3.5,$fn=20);
}
