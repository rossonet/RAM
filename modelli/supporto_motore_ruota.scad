$fn=950;


module pavimento() {
    translate([0,0,-760/2])cube([2000,2000,20],center=true);
}

module montante(){
    translate([0,0,860/2])cube([2000,200,70],center=true);
    }

module motore() {
    translate([0,0,-70]) rotate([75,0,0])cylinder(r=200,h=900,center=true);
}

module cinghia() {
    translate([0,0,10]) rotate([75,0,0])
    difference(){
    cylinder(r=290,h=200,center=true);
    cylinder(r=285,h=300,center=true);
    }
}

module aggancio() {
    translate([580,0,0])rotate([0,0,90])cylinder(r=30,h=10000,center=true);
    translate([-580,0,0])rotate([0,0,90])cylinder(r=30,h=10000,center=true);
    
}

module stringiMotore(){
        translate([580,0,-100])rotate([90,0,90])cylinder(r=30,h=10000,center=true);
    translate([0,0,-100])rotate([90,0,90])cylinder(r=60,h=500,center=true);
}

module corpo(){
    difference(){
        union(){
            translate([0,0,90])cube([950,200,610],center=true);
            translate([0,0,240])cube([1500,200,310],center=true);
        translate([0,0,-40]) rotate([75,0,0])translate([0,0,130])
           difference(){
               cylinder(r=280,h=600,center=true);        
            translate([0,0,-290])cube([2000,2000,180],center=true);
               }
                translate([0,-100,170])cube([400,400,450],center=true);
               
        }
        
        union() {
            //cinghia();
            aggancio();
            motore();
            stringiMotore();
        }
    }
    
}
//#cinghia();
//#montante();
//#pavimento();
//motore();
//#cinghia();
rotate([180,0,0])corpo();