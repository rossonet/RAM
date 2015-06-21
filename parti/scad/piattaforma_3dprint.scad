include <hotend.scad>
include <ventola.scad>
use <Write.scad>

// Variabili iniziali
q                     	=40;   	// Curves quality
motor_end_height      	=64;  	// Was 44
idler_end_height      	=28;
carriage_height       	=32; 	// Adapted to cover full length +2 of the Linear bearing
platform_thickness    	=7;
bed_thickness         	=12;
pcb_thickness         	=2;
smooth_rod_length     	=1000;
smooth_rod_distance   	=60; 	// Smooth rod distance (center to center)
platform_hinge_offset 	=27;
carriage_hinge_offset 	=28;
tower_radius          	=300;
rod_length            	= tower_radius * 1.44;

lateral_offset        	=27; 	// lateral offset of the moving roads *2 = rod spacing
play                  	=0.3; 	// Play required for tight adjustment

magnet_tilt           	=30; 	// orientation of the magnetic joints
magnet_diam           	=13;  	// Diameter of the magnet
magnet_height         	=6;   	// Height of the magnet
magnet_play           	= play;	// Play required for tight adjustment of the magnet

th 						=2;   	// Magnet holder thickness

mgnetholeD 				=4.0;
rc 						=3.5;  	// Radius of center hole
chamfRad				=0.25; 


module zona_calda() {
	translate([0,0,10])cylinder(r1=14,r2=6,h=2);	
	translate([0,0,-20])cylinder(r=14,h=30);
	translate([0,0,-45])cylinder(r=35,h=29);
}

module finestra() {
	rotate([0, 0, 120]) translate([-30,1.5,12]) cube([60,27,15]);
}
module finestra_interna() {
	rotate([0, 0, 120]) translate([-29.9,1.6,12.1]) cube([59.8,26.3,14.8]);
}


module ventilazione(){

	rotate([28, 0, 120]) 
	hull(){
		translate([ 0, -18, 17])cube([23, 23, 1],center=true);
		translate([ 0, -21, 15])cube([19,4,6],center=true);
	}

	//ventola
	rotate([28, 0, 120]) translate([ 0, -18, 22])cube([30.4,30.4,10],center=true);

	// canale
	difference(){
		cylinder(r=29,h=4.8);
		union() {
			difference() {
				translate([0,0,-2])cylinder(r=23,h=10);
				rotate([0, 0, 120]) translate([ 100, -70, 0]) cylinder(r=103,h=4.8);
			}
			rotate([0, 0, 120]) translate([ 25.5, -15, 0]) cylinder(r=5,h=200,center=true);
		}
	}

	//verso il basso
	rotate ([0,0,0])translate ([-5,-27,-9]) cube([10,3,13]);
	//rotate ([0,0,60])translate ([-3,-27,-9]) cube([6,3,13]);
	rotate ([0,0,120])translate ([-1.5,-27,-9]) cube([3,3,13]);
	//rotate ([0,0,180])translate ([-3,-27,-9]) cube([6,3,13]);
	rotate ([0,0,240])translate ([-5,-27,-9]) cube([10,3,13]);
	rotate ([0,0,300])translate ([-6,-27,-9]) cube([12,3,13]);

	// laterali
	//rotate ([0,0,30])translate ([-2,-12,1]) rotate ([90,0,0]) cube([4,3,13]);
	rotate ([0,0,90])translate ([-2,-12,1]) rotate ([90,0,0]) cube([4,3,13]);
	rotate ([0,0,150])translate ([-2,-12,1]) rotate ([90,0,0]) cube([4,3,13]);
	//rotate ([0,0,210])translate ([-2,-12,1]) rotate ([90,0,0]) cube([4,3,13]);
	rotate ([0,0,270])translate ([-2,-12,1]) rotate ([90,0,0]) cube([4,3,13]);
	rotate ([0,0,330])translate ([-2,-12,1]) rotate ([90,0,0]) cube([4,3,13]);

	//viti
	rotate([28, 0, 120]) translate([ 12, -6, 17])cylinder(r=1,h=12,center=true);
	rotate([28, 0, 120]) translate([ 12, -30, 17])cylinder(r=1,h=9,center=true);
	rotate([28, 0, 120]) translate([ -12, -6, 17])cylinder(r=1,h=12,center=true);
	rotate([28, 0, 120]) translate([ -12, -30, 17])cylinder(r=1,h=9,center=true);
}

module magnetHolder() {
	ri = (magnet_diam + magnet_play) /2;
	translate([0, 0, -magnet_height-th]) cylinder(r=ri+th, h=magnet_height+2*th, center=false, $fn=4*q); // crée cylindre dans l'axe aimant
}

module magnetHole() {
	ri = (magnet_diam + magnet_play) /2;
	translate([0, 0,-magnet_height]) cylinder(r=ri, h=99, center=false, $fn=4*q); 
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

//	color([ 70/255, 70/255,254/255,, 1])

	union() {
		difference() {

			// pieni piattaforma
			union() {
				cylinder(r=platform_hinge_offset*1.46+magnet_diam/2, h=platform_thickness, center=false, $fn=8*q);
				translate([0, 0, platform_thickness]) cylinder(r1=platform_hinge_offset*1.70, r2=0, h=20, center=false, $fn=7*q);

				//aggancio hotend
				difference() {
					translate([0,0,18]) cylinder(r=8,h=5.5,center=true);
					translate([0,0,18]) cylinder(r=6,h=5.5,center=true);
				}

				//supporto
				intersection(){
					difference() {
					intersection(){
						translate([0,0,18]) cylinder(r=22,h=20,center=true);
						rotate([0, 0, 120])translate([0,9,0]) cube([50,40,60],center=true);
						}
						translate([0,0,18]) cylinder(r=12,h=50,center=true);
					}
					intersection(){
							translate([0,0,-30]) sphere(r=55,center=true);
							rotate([0, 0, 120])translate([0,22,-9]) sphere(r=45,center=true);
					}
				}

				for (a = [0:120:240]) { 
					rotate([0, 0, a]) translate([ lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHolder();
					rotate([0, 0, a]) translate([-lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHolder();
				}
  			}

			// vuoti piattaforma
			for (a = [0:120:240]) { 
				rotate([0, 0, a]) translate([ lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHole();
				rotate([0, 0, a]) translate([-lateral_offset, -platform_hinge_offset, hmg]) rotate([magnet_tilt,0,0]) magnetHole();

				rotate([0, 0, a]) translate([0, -platform_hinge_offset - magnet_diam-8, 0]) rotate([0,0,0]) cube([99, 10, 30], center=true); //Side cuts
			}
			
			rotate([32, 0, 0]) translate([ 0, -25, 31.5]) write("Rossonet",h=5,t=10,center=true);

			translate([0, 0, -20]) cylinder(r=99, h=20, center=false, $fn=q);     			// Base Surfacing
			translate([0, 0,  21]) cylinder(r=99, h=22, center=false, $fn=q);     			// Top  Surfacing

			// aereazione
			translate([0,0,4])ventilazione();
			
			// zona calda intorno a hotend
			zona_calda();

			// hotend
			translate([0,0,12]) hotend();
		}
	}
}

module percorso_hotend() {
	translate([0, 0, -4]) cylinder(r=11.5, h=30, center=true); 
	translate([0, 0, 15]) cylinder(r=8.5, h=21, center=true);   
}

module base() {
	difference() {
		platform();
		//finestra
		union() {
			finestra();
			// canale inserimento hotend
			rotate([-20, 0, 120]) percorso_hotend();
			bloccaggio();		
			passacavi();	
		}
	}
}

module aggancio() {
	difference() {
		intersection() {
			platform();
			//finestra
			finestra_interna();
		}
	bloccaggio();
	}
}

module bloccaggio() {
	rotate([-32, 0, 120]) translate([ -20, -2, 18]) cylinder(r=1.65,h=100,center=true);
	rotate([-32, 0, 120]) translate([ 20, -2, 18]) cylinder(r=1.65,h=100,center=true);
	rotate([-32, 0, 120]) translate([ 20, -2, -3]) cylinder(r=3.2, h=8, center=true, $fn=6);
	rotate([-32, 0, 120]) translate([ -20, -2, -3]) cylinder(r=3.2, h=8, center=true, $fn=6);
	rotate([-32, 0, 120]) translate([ -20, -2, 23]) cylinder(r=3.8, h=8, center=true, $fn=40);
	rotate([-32, 0, 120]) translate([ 20, -2, 23]) cylinder(r=3.8, h=8, center=true, $fn=40);
}

module passacavi() {
	rotate([0, 0, 120]) translate([ 25.5, -15, 0]) cylinder(r=3,h=2000,center=true);

}


$fn=220;

base();
translate([-20,20,20]) aggancio();

//zona_calda();
//translate([0,0,4])ventilazione();
//finestra();
//rotate([-20, 0, 120]) percorso_hotend();
//bloccaggio();
//passacavi();

// parti esterne
translate([0,0,12]) hotend();
rotate([28, 0, 120]) translate([ 0, -16, 26])fan(30, 10, 23);




