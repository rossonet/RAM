use <Write.scad>
use <hotend.scad>
use <ventola.scad>
use <9g_servo.scad>

q                     =  120;   // Curves quality
platform_thickness    =   7;
platform_hinge_offset =  27;
tower_radius          = 300;

lateral_offset        =  27;     // lateral offset of the moving roads *2 = rod spacing
play                  =   0.3;   // Play required for tight adjustment

magnet_tilt           =  30;     // orientation of the magnetic joints
magnet_diam           =  15;     // Diameter of the magnet
magnet_height         =   6.3;     // Height of the magnet
magnet_play           =   play;  // Play required for tight adjustment of the magnet

th = 2;    // Magnet holder thickness

mgnetholeD =   4.0;
rc = 5.5;  // Radius of center hole
chamfRad = 0.25; 

module parti_esterne() {
	translate([0,0,12]) hotend();
	rotate([90, 0, 120]) translate([ 0, -3, 20.1])fan(30, 10, 23);
	rotate([90, 0, 240]) translate([ 0, 4, 45.5])rotate([180, 0, 0]) 9g_motor();
	//rotate([90, 0, 0]) translate([ 0, 4, 45.5])rotate([180, 0, 0]) 9g_motor();
	ventola2();
}

module scasso_ventola() {
	rotate([90, 0, 120]) translate([ 0, -3, 16])cube([32, 50, 22],center=true);
	rotate([90, 0, 120]) translate([ -15, -18, -6])cube([30.5, 50, 20]);
	rotate([90, 0, 120]) translate([ 0, -3, 22])rotate([0, 90, 0])cylinder(r=15,h=30,center=true);
}

module tappo() {
color([0,254/255,0,0.2])
	difference() {
		intersection() {
			translate([0,0,14.2]) cylinder(r=30,h=10);
			translate([0,0,-125]) sphere(r=150,$fn=250);
		}
		union() {
			scassi_servo();
			parti_esterne();
			passacavi();
			cylinder(r=5,h=50);
			blocchi_testa();
			scasso_ventola2();
		}
	}
}

module blocchi_testa() {
	rotate([0,0,-7]) translate([0,25,0]) cylinder(r=1.65,h=100,center=true,$fn=120);
	rotate([0,0,90]) translate([0,23,0]) cylinder(r=1.65,h=100,center=true,$fn=120);
	rotate([0,0,120]) translate([0,23,0]) cylinder(r=1.65,h=100,center=true,$fn=120);
	rotate([0,0,-115]) translate([0,24,0]) cylinder(r=1.65,h=100,center=true,$fn=120);
	rotate([0,0,-7]) translate([0,25,0]) cylinder(r=3.2,h=10,center=true,$fn=6);
	rotate([0,0,90]) translate([0,23,0]) cylinder(r=3.2,h=10,center=true,$fn=6);
	rotate([0,0,120]) translate([0,23,0]) cylinder(r=3.2,h=10,center=true,$fn=6);
	rotate([0,0,-115]) translate([0,24,0]) cylinder(r=3.2,h=10,center=true,$fn=6);
	rotate([0,0,-7]) translate([0,25,26]) cylinder(r=3.2,h=10,center=true,$fn=20);
	rotate([0,0,90]) translate([0,23,26]) cylinder(r=3.2,h=10,center=true,$fn=20);
	rotate([0,0,120]) translate([0,23,26]) cylinder(r=3.2,h=10,center=true,$fn=20);
	rotate([0,0,-115]) translate([0,24,26]) cylinder(r=3.2,h=10,center=true,$fn=20);
}

module passacavi() {
	rotate([0, 0, 170]) translate([ 10, -22, 0]) cylinder(r=3.5,h=2000,center=true);
}

module tappoA() {
	intersection() {
		tappo();
		rotate([0,0,13]) translate([0,50.2,0]) cube([100,100,50],center=true);
	}
}

module tappoB() {
	intersection() {
		tappo();
		rotate([0,0,13]) translate([0,-50.2,0]) cube([100,100,50],center=true);
	}
}

module arm() {
	arm_servo=45;
    difference() {
      union() {
      		cylinder(r=6, h=4,center=true,$fn=32);
      		translate([-arm_servo/2,0,0]) cube([arm_servo,8,4],center=true);
      		translate([-arm_servo/1.4,0,3]) cube([arm_servo-30,2,4],center=true);
			difference() {
      			translate([-arm_servo,0,0]) rotate([0,90,0]) cylinder(r=2,h=14,center=true);				
				translate([0,0,-4.5])cube([120,20,5],center=true);	
			}
      	}

    	cylinder(r=3.8,h=10,center=true,$fn=32);
    	hull() {
      		translate([0,0,5.5]) cylinder(r=3.2,h=10,center=true,$fn=32);
      		translate([-14.7,0,5.5]) cylinder(r=2,h=10,center=true,$fn=32);
    	}  
    }
}

module scasso_servo() {
	translate([-12,-12,-17]) cube([24,24,26]);
	translate([-17,-7,-12]) cube([34,14,11]);
	translate([-18,-25,8]) cube([30,50,4]);
	translate([-6,-12,16]) rotate([90,0,0])cylinder(r=2,h=50,center=true,$fn=90);
	translate([-6,-12,16]) rotate([90,0,0])translate([0,0,-4])cylinder(r1=6,r2=18,h=40,$fn=90);
	translate([-14,0,0.2]) cylinder(r=1.1,h=10,center=true,$fn=120);
	translate([14,0,0.2]) cylinder(r=1.1,h=10,center=true,$fn=120);
}

module scassi_servo() {
		rotate([90, 0, 240]) translate([ 0, 4, 38])rotate([180, 0, 0]) scasso_servo();
		//rotate([90, 0, 0]) translate([ 0, 4, 38])rotate([180, 0, 0]) scasso_servo();
}

module ventola2() {
		rotate([90, 0, 0]) translate([ 0, 0, 50])rotate([-50, 0, 0])fan(40, 8, 34);
}

module scasso_ventola2() {
		rotate([90, 0, 0]) translate([ 0, 0, 50])rotate([-50, 0, 0])cube([40.2, 40.2, 8],center=true);
		rotate([90, 0, 0]) translate([ 0, 0, 50])rotate([-50, 0, 0])translate([ -20.1, -20.1, -4])cube([40.2, 40.2, 20]);
		rotate([90, 0, 0]) translate([ 0, 0, 50])rotate([-50, 0, 0])translate([ -15, -15, -30])cube([30, 30, 50]);

		rotate([90, 0, 0]) translate([ 0, 0, 50])rotate([-50, 0, 0])translate([ 17, 17, -10])cylinder(r=1.1,h=100,center=true,$fn=120);
		rotate([90, 0, 0]) translate([ 0, 0, 50])rotate([-50, 0, 0])translate([ -17, 17, -10])cylinder(r=1.1,h=100,center=true,$fn=120);
}

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

module platform() {
	hmg = magnet_height + sin(magnet_tilt) * magnet_diam/2;
	color([254/255,0,0,0.5])
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
				rotate([0, 0, a]) translate([0, -platform_hinge_offset - magnet_diam-4, 0]) rotate([0,0,0]) cube([99, 10, 30], center=true);
			};
			
			scasso_ventola();
			scasso_ventola2();
			scassi_servo();
			blocchi_testa();
			passacavi();

//			#for (a = [0:120:360]) {
//				rotate([0, 0, a]) translate([ 0, 23, 0]) rotate([0,0,0]) cylinder(r=4, h=99, center=true, $fn=2*q);                        // Fixation hole
//}

			//rotate([60, 0, 0]) translate([ -8, -9, 32]) write("Rossonet",h=4,t=10);


			//translate([-1.5, -70,  0]) cube(size = [3,50,40], center = false);	// groove for wiring
    		translate([0, 0, -5]) cylinder(r=18, h=22,  center=false, $fn=4*q); 		      // M10 fixation hole for Merlin hotend
			translate([0, 0, -20]) cylinder(r=99, h=20, center=false, $fn=q);     // Base Surfacing
			translate([0, 0,  14]) cylinder(r=99, h=20, center=false, $fn=q);     // Top  Surfacing
		}
	}
}

module esploso() {
	platform();
	tappoA();
	tappoB();
	zprobe();
	//donutMagnet();
	parti_esterne();
}

module stampo() {
	color([0,0,254/255,0.5])
	difference() {
		translate([-35,-40,-13.4]) cube([70,80,20]);
		union() {
			translate([0,5,-28])tappoA();
			translate([0,-5,-28])tappoB();
		}	
	}
}

module zprobe() {
	color([0,150/255,150/255,0.8]) {
		rotate([90, -90, 240]) translate([ 4, -5.5, 28])rotate([180,0, 0])arm();
	}
}

//esploso();
//platform();
//tappoA();
//tappoB();
//rotate([180,0,0])stampo();
arm();


