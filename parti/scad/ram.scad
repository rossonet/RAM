//Rossonet RAM assemblata

use <blocco_motore.scad>
use <fine_corsa.scad>
use <carrello.scad>
use <piattaforma_3dprint_v2.scad>

module asse(){
	color("red"){
		idler_end();
	}
	color("green"){
		translate([0,0,880]) motor_end();
	}
	color("silver"){
		translate([30,0,470])cylinder(r=6,h=1000,center=true,$fn=100);
		translate([-30,0,470])cylinder(r=6,h=1000,center=true,$fn=100);
	}
	color("yellow"){
			rotate([0,180,0]) translate([0,0,-650]) carrello();
	}
}

module assi(){
	rotate([0,0,0]) translate([0,250,0])asse();
	rotate([0,0,120]) translate([0,250,0])asse();
	rotate([0,0,240]) translate([0,250,0])asse();
	//rotate([0,0,95]) translate([0,250,470]) cube([20,20,1000],center=true);
}

module blocco_stampante(){
	assi();
	translate([0,0,300])esploso();
}

blocco_stampante();