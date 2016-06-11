// universal endstop holder for rostock delta printer
// by zeus - zeus@ctdo.de - 2014-09-21
//
// edit "module wall" for your needs if not using "sainsmart mechaical endstop pcb"
// for further instructions look at the comments above the "wall"-module in this code.
//
use <Write.scad>
// ===================================================================
//
//rod-diameter, set a bit thicker than the rod really is
	rod_dia=11.5; // old 8.5

//center-to-center distance of the rods; set a bit smaller than the original 60 to keep the bearings smooth
	rod_distance=59.7; 

// overall thickness
	material_t=2.0;

// mounting-wall thickness
	wall_t=5;

//overall height
	holder_h=16.5;

//diameter of the holes
	hole_dia=3;

//cone cut-in of the holes for easier screw insertion; set to "0" if not needed
	cut_in=1;	
	
//wall_w=rod_distance-material_t*2+rod_dia/2-1;
wall_w=rod_distance-(rod_dia/2);
$fn=30;

// ===================================================================

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}


module hex_standoff(){
	rotate([90,0,0]){
		translate([-rod_dia*0.66,holder_h/2,0]){
			difference(){
				cylinder(r=holder_h/1.75,h=rod_dia+material_t,center=true,$fn=6);
				cube([rod_dia/1.5,rod_dia/1.5,rod_dia+material_t],center=true);
			}
		}
	}
}


module clip(){
	difference(){

		union(){
			//outer cylinder
			cylinder(r=rod_dia/2+material_t,h=holder_h);
			//outer hex standoffs
			hex_standoff();
		}

		//inner cylinder
		cylinder(r=rod_dia/2,h=holder_h);
		//cutout
		translate([-rod_dia,0,holder_h/2]){
			cube([rod_dia*2,rod_dia/1.25,holder_h],center=true);
		}
	}
}

module hole(){
	rotate([90,0,0]){
		cylinder(r=hole_dia/2,h=wall_t*2, center=true);
		if (cut_in==1) {
			cylinder(r1=0,r2=hole_dia*0.6,h=wall_t*1.01,center=true);
		}
	}
}

// ===================================================================
// Edit the module below to add the holes you want to appear in the center-part.
// should be mostly self-explaining
//
// 			translate([-22,0,3]){
//				hole();	
//			}
//
// this example code creates a hole, which is moved by -22mm(x), 0mm(y), and 3mm(z) 
// measured from the absolute center of the coordinate-system (enable under "View -> Show Axes"). 
// ===================================================================

module wall(){
	difference(){
		translate([0,8.2,holder_h/2]){
				difference(){
				cube([wall_w+12,wall_t,holder_h],center=true);
				translate([(wall_w+12)/2,3,0]){
					rotate([0,0,180]) {
						fillet(5,holder_h+2);
					}
				};
				translate([-(wall_w+12)/2,3,0]){
					rotate([0,0,270]) {
						fillet(5,holder_h+2);
					}
				}
				}
		}
		union(){
	//		translate([-22,0,3]){
			translate([18,8.2,3]){
				hole();	
			}
	//		translate([-3,0,3]){
			translate([-1,8.2,3]){
				hole();	
			}
	//		translate([11.5,0,3]){
			translate([-15.5,8.2,3]){
				hole();	
			}
	//		translate([11.5,0,14]){
			translate([-15.5,8.2,14]){
				hole();	
			}
			translate([-12,9.19,9]){
				rotate([90,0,0]){
					write("Rossonet RAM",h=4,t=3.5);
				}
			}
		}
	}
}

//left clip
translate([-rod_distance/2,0,0]){
	rotate([0,0,90]){
		clip();
	}
}

//right clip
translate([rod_distance/2,0,0]){
	rotate([0,0,90]){
		clip();
	}
}


//wall
wall();