use <Write.scad>
use <modulo.scad>
use <nema_17.scad>

//distanza barre
w=60;
wall_t=5;
hole_dia=3;
cut_in=1;
holder_h=16.5;
rod_distance=50;
rod_dia=11.5;
wall_w=rod_distance-(rod_dia/2);
$fn=240;

module vite() {
  for (x = [-w/2, w/2]) {
    translate([x, 0, 0]) {
	 // Push-through M3 screw hole.
      translate([0, -10, 0]) rotate([0, 90, 0]) cylinder(r=1.65, h=20, center=true, $fn=90); 
	 // M3 nut holder.
      translate([-x/3.8, -10, 0]) rotate([0, 90, 0]) cylinder(r=3.2, h=2.3, center=true, $fn=6);  //rotate([30, 0, 0]) 
    }
  }
}

module agganci() {
    m = 29;
    translate([0, 0, 0]) {
        rotate([90, 0, 0]) cylinder(r=13, h=40, center=true, $fn=48);
        cube([12, 40, 12], center=true);
        // Motor mounting screw slots
        translate([m/2, 0, m/2]) rotate([0, -45, 0])
        cube([9, 40, 3], center=true);
        translate([-m/2, 0, m/2]) rotate([0, 45, 0])
        cube([9, 40, 3], center=true);
        translate([m/2, 0, -m/2]) rotate([0, 45, 0])
        cube([9, 40, 3], center=true);
        translate([-m/2, 0, -m/2]) rotate([0, -45, 0])
        cube([9, 40, 3], center=true);
    }
    for (z = [-36,-24, -12, 0,50, 24]) {
      translate([0, 0, z]) vite();
    }
    
}

// Scasso pannello plexiglass
module plexiglass(){
    difference(){
        cylinder(r=80,h=58,center=true);
        union() {
            cylinder(r=60,h=60,center=true);
            translate([0, 34, 0])cube([200,100,60],center=true);
        }
    }
    for (altezza = [0,14,-14]) {
        for (angolo = [70,62,54,-70,-62,-54]) {
            rotate([90,0,angolo])
                translate([0,altezza,50])
                    cylinder(r=0.7,h=12);
        }
    }
    for (altezza = [27.5,-27.5]) {
        for (angolo = [70,62,54,-70,-62,-54,0,20,-20,40,-40]) {
            rotate([90,0,angolo])
                translate([0,altezza,50])
                    cylinder(r=0.7,h=12);
        }
    }
}

// passacavi switch fine corsa
module cavetti() {
    intersection() {
        cube([80,80,80]);
        difference(){
            cylinder(r=61,h=6);
            translate([0,0,-1])cylinder(r=56,h=8);
        }
    }
}

module blocco_motore() {
    difference(){
        // sfera base
        union(){
            sphere(r=65,center=true);
            //translate([0, 0, 6])sphere(r=66,center=true);
            //translate([0, 0, -6])sphere(r=66,center=true);
            struttura_esterna();
        }
        // SOTTRAZIONE
        union(){
            // scasso lineare
            translate([0,0,-75])scasso_lineare();
            // taglio frontale
            translate([0,-58.5,60])
            cube([200,80,150],center=true);
            // scasso bulloni barra
            translate([59,-15,25])
            difference(){
                cube([40,20,80],center=true);
                translate([-22,12,0])
                cylinder(r=4,h=100,center=true);
            }
            translate([-59,-15,25])
            difference(){
                cube([40,20,80],center=true);
                translate([22,12,0])
                cylinder(r=4,h=100,center=true);
            }
            // parte bassa
            translate([0,0,-65])
            cube([180,150,40],center=true);
            // parte alta
            translate([0,0,80])
            cube([120,150,40],center=true);
            // bullone aggancio piede (M8)
            translate([0,0,-40])
            cylinder(r=5,h=100,center=true);
            translate([0,0,-17])
            cylinder(r=9.5,h=8,center=true,$fn=6);
            translate([0,0,-44])
            cylinder(r=18,h=4,center=true);
            // struttura
            //struttura();
            // agganci piatto
            agganci_base();
            
        }
    }
}

module scasso_lineare() {
   h=200;
   for (x = [-w/2, w/2]) {
      translate([x, 0, 160]) {
		cylinder(r=6.2, h=h+1, center=true);
        // blocca olio
		translate([0, 0, -65])cylinder(r=7.7, h=10, center=true);
		translate([0, -10, 0]) cube([2, 20, h+1], center=true);
      }
    }
    // Belt path.
    translate([0, -5, 160]) cube([w-25, 20, h+1], center=true);
    translate([0, -9, 160]) cube([w-18, 20, h+1], center=true);
    translate([-w/2+13, 1, 160]) cylinder(r=4, h=h+1, center=true);
    translate([ w/2-13, 1, 160]) cylinder(r=4, h=h+1, center=true);
    
    // viti
    for (z = [70,82,94,106,118]) {
      translate([0, 0, z]) vite();
    }
}


module barre(){
    rotate([180,0,30])translate([42,250,0])cube([50,500,22],center=true);
    rotate([180,0,-30])translate([-42,250,0])cube([50,500,22],center=true);
}

module barre_esterno(){
    rotate([180,0,30])translate([21,50,0])cube([28,120,20],center=true);
    rotate([180,0,-30])translate([-21,50,0])cube([28,120,20],center=true);
}

module struttura(){
    //translate([0,40,50])barre();
    translate([0,32,0])barre();
}

module struttura_esterna(){
    difference(){
        union(){
            translate([0,40,15])barre_esterno();
            translate([0,40,-30])barre_esterno();
        }
        union(){
            struttura();
            
            translate([0,0,0])
            difference(){
                cube([400,200,200],center=true);
                union(){
                    translate([34,15,0])cylinder(r=35,h=300,center=true);
                    translate([-34,15,0])cylinder(r=35,h=300,center=true);
                }
                    
        
        }
        }
    }
}

module passante(){
    difference(){
        cylinder(r=9,h=80,center=true);
        cylinder(r=5,h=82,center=true);
    }
    
}

module agganci_base(){
    for (angolo = [0,30,-30]) {
        rotate([0,0,angolo])translate([0,-32,-80])cylinder(r=3,h=120);
    }
    for (angolo = [20,-20]) {
        rotate([0,0,angolo])translate([0,-45,-21])cylinder(r=8.5,h=6.3);
    }
}

module passanti() {
    translate([0,90,0]){
         rotate([0,0,30])
         translate([0,-64,0])passante();
         rotate([0,0,-30])
         translate([0,-64,0])passante();
         rotate([0,0,30])
         translate([0,-84,0])passante();
         rotate([0,0,-30])
         translate([0,-84,0])passante();
         rotate([0,0,30])
         translate([0,-104,0])passante();
         rotate([0,0,-30])
         translate([0,-104,0])passante();
    }
}

module fori_m8() {
        translate([0,90,0]){
        rotate([0,0,30])
        translate([0,-64,0])
            cylinder(r=5,h=86,center=true);
        rotate([0,0,-30])
        translate([0,-64,0])
            cylinder(r=5,h=86,center=true);
        rotate([0,0,30])
        translate([0,-84,0])
            cylinder(r=5,h=86,center=true);
        rotate([0,0,-30])
        translate([0,-84,0])
            cylinder(r=5,h=86,center=true);
        rotate([0,0,30])
        translate([0,-104,0])
            cylinder(r=5,h=86,center=true);
        rotate([0,0,-30])
        translate([0,-104,0])
            cylinder(r=5,h=86,center=true);
    }
}

module testa(){
    difference(){
        union(){
            blocco_motore();
            passanti();
            //rotate([180,180,0])translate([0,8,-45])wall();
        }
        union(){
            fori_m8();
            //struttura();
            //Carrello
            translate([0,0,75])cube([200,200,100],center=true);
            translate([0,0,-48])struttura();
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

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}


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
                translate([18,8.2,3]){
                    hole();	
                }
                translate([-1,8.2,3]){
                    hole();	
                }
                translate([-15.5,8.2,3]){
                    hole();	
                }
                translate([-15.5,8.2,14]){
                    hole();	
                }
			}
    }
}
  
// Struttura profilati quadrati 20mm
//#struttura();
// Blocco
difference(){
testa();
#translate([25,45,22]) rotate([0,0,180]) write("Rossonet RAM",h=6,t=3);
}