
use <Write.scad>

// Rostock Motor End from Jcrocholl modified by Kolergy to:
//    - Take 12x1000mm smooth rods and KB-12-WW Linear Bearings
//    - Increased base height to locate electronics below the base
//    - Stand on three feets

q                     =  40;   // Curves quality



motor_end_height      =  64;  // Was 44
idler_end_height      =  28;
carriage_height       =  32; // Adapted to cover full length +2 of the Linear bearing
platform_thickness    =   7;
bed_thickness         =  12;
pcb_thickness         =   2;
smooth_rod_length     =1000;
smooth_rod_distance   =  60; // Smooth rod distance (center to center)
platform_hinge_offset =  27;
carriage_hinge_offset =  28;
tower_radius          = 300;
rod_length            = tower_radius * 1.44;

lateral_offset        =  27;     // lateral offset of the moving roads *2 = rod spacing
play                  =   0.3;   // Play required for tight adjustment

magnet_tilt           =  30;     // orientation of the magnetic joints
magnet_diam           =  13;     // Diameter of the magnet
magnet_height         =   6;     // Height of the magnet
magnet_play           =   play;  // Play required for tight adjustment of the magnet

echo("Diagonal Rod Length in mm");
echo(rod_length);


th = 2;    // Magnet holder thickness

mgnetholeD =   4.0;
rc = 3.5;  // Radius of center hole
chamfRad = 0.25; 

module magnetHolder() {
	ri = (magnet_diam + magnet_play) /2;
	translate([0, 0, -magnet_height-th]) cylinder(r=ri+th, h=magnet_height+2*th, center=false, $fn=4*q); // crée cylindre dans l'axe aimant
}

module magnetHole() {
	ri = (magnet_diam + magnet_play) /2;
	translate([0, 0,            0 ]) cylinder(r=rc, h=99, center=true,  $fn=4*q); // Holes in the axis of the magnet
	translate([0, 0,-magnet_height]) cylinder(r=ri, h=99, center=false, $fn=4*q); // Holes in the axis of the magnet
} 


module circChamfer(mainRad, chRad, side) {
	if(side == 1) {
		translate([ 0, 0, -chRad]) difference() {
			rotate_extrude(convexity=10, $fn=1*q) translate([mainRad-chRad, 0, 0]) square([chRad*2,chRad*2]);
			rotate_extrude(convexity=10, $fn=1*q) translate([mainRad-chRad, 0, 0]) circle(r=chRad, $fn=1*q);
		}
	} if(side == 2) {
		translate([ 0, 0, -chRad]) difference() {
			rotate_extrude(convexity=10, $fn=1*q) translate([mainRad-chRad, 0, 0]) square([chRad*2,chRad*2]);
			rotate_extrude(convexity=10, $fn=1*q) translate([mainRad+chRad, 0, 0]) circle(r=chRad, $fn=1*q);
		}
	} if(side == 3) {
		translate([ 0, 0, -chRad]) difference() {
			rotate_extrude(convexity=10, $fn=1*q) translate([mainRad-chRad, 0, 0]) square([chRad*2,chRad*2]);
			translate([0, 0, chRad*2])rotate_extrude(convexity=10, $fn=1*q) translate([mainRad-chRad, 0, chRad]) circle(r=chRad, $fn=1*q);
		}
	} if(side == 4) {
		translate([ 0, 0, -chRad]) difference() {
			rotate_extrude(convexity=10, $fn=1*q) translate([mainRad-chRad, 0, 0]) square([chRad*2,chRad*2]);
			translate([0, 0, chRad*2]) rotate_extrude(convexity=10, $fn=1*q) translate([mainRad+chRad, 0,    0]) circle(r=chRad, $fn=1*q);
		}
	}
}

module donutMagnet() {
	translate([ 0, 0, ]) difference() {
		cylinder(r=magnet_diam/2, h=magnet_height,   center=true, $fn=2*q);
		cylinder(r= mgnetholeD/2, h=magnet_height+1, center=true, $fn=2*q);
		translate([ 0, 0, magnet_height/2])  circChamfer(magnet_diam/2, chamfRad, 1);
		translate([ 0, 0, magnet_height/2])  circChamfer( mgnetholeD/2, chamfRad, 2);
		translate([ 0, 0,-magnet_height/2])  circChamfer(magnet_diam/2, chamfRad, 3);
		translate([ 0, 0,-magnet_height/2])  circChamfer( mgnetholeD/2, chamfRad, 4);
	}
}

module donutMagnetHolder() {
	translate([ 0, 0, -magnet_height/2]) difference() {
		cylinder(r=magnetDiam/2+1, h=magnetThic+1, $fn=50*detailLevel, center=true);
		cylinder(r=magnetDiam/2,   h=magnetThic,   $fn=50*detailLevel, center=true);
		translate([ 0, 0,  -contactZ])  scale(1.02) donutMagnet(); 
		translate([ 0, 0, 1-contactZ])  scale(0.98) donutMagnet(); 
		translate([ 0, 0, (magnetThic+1)/2])  circChamfer(magnetDiam/2+1, chamfRad, 1);
		translate([ 0, 0, (magnetThic+1)/2])  scale(0.98) circChamfer(magnetDiam/2,   chamfRad, 2);
	}

}


//difference() {
//	magnetHolder();
//	magnetHole();
//}

//donutMagnet();

module platform() {
	hmg = magnet_height + sin(magnet_tilt) * magnet_diam/2;
	color([ 70/255, 70/255,254/255,, 1])
	union() {
		difference() {
			union() {
				cylinder(r=platform_hinge_offset*1.46+magnet_diam/2, h=platform_thickness, center=false, $fn=8*q);
				translate([0, 0, platform_thickness]) cylinder(r1=platform_hinge_offset*1.70, r2=0, h=20, center=false, $fn=7*q);
				for (a = [0:120:240]) { 
					rotate([0, 0, a]) translate([ lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHolder();
					rotate([0, 0, a]) translate([-lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHolder();
				}
  			}
			for (a = [0:120:240]) { 
				rotate([0, 0, a]) translate([ lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHole();
				rotate([0, 0, a]) translate([-lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHole();
				rotate([0, 0, a]) translate([0, -platform_hinge_offset - magnet_diam-4, 0]) rotate([0,0,0]) cube([99, 10, 30], center=true); //Side cuts
			//	rotate([0, 0, a]) translate([ 0, 23, 0]) rotate([0,0,0]) cylinder(r=1.6, h=99, center=true, $fn=2*q);                        // Fixation hole
			};
			
			for (a = [0:30:360]) {
				rotate([0, 0, a]) translate([ 0, 23, 0]) rotate([0,0,0]) cylinder(r=1.6, h=99, center=true, $fn=2*q);                        // Fixation hole
}

			for (a = [0:60:360]) {
				rotate([0, 0, a]) translate([ 0, 23, 0]) rotate([0,0,0]) cylinder(r=2.5, h=99, center=true, $fn=2*q);                        // Fixation hole
}

			for (a = [0:120:360]) {
				rotate([0, 0, a]) translate([ 0, 23, 0]) rotate([0,0,0]) cylinder(r=4, h=99, center=true, $fn=2*q);                        // Fixation hole
}

			rotate([60, 0, 0]) translate([ -8, -9, 32]) write("Rossonet",h=4,t=10);


			//translate([-1.5, -70,  0]) cube(size = [3,50,40], center = false);	// groove for wiring
    	cylinder(r=16, h=20,  center=false, $fn=4*q); 		            	  // M10 fixation hole for Merlin hotend
			translate([0, 0, -20]) cylinder(r=99, h=20, center=false, $fn=q);     // Base Surfacing
			translate([0, 0,  14]) cylinder(r=99, h=20, center=false, $fn=q);     // Top  Surfacing
		}
	}
}

platform();



