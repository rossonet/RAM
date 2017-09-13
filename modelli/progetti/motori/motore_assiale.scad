//rotore();
//avvolgicavo();
statore();

//parametri
raggio=50;
spessore_rotore=6;
spessore_statore=8;
$fn=100;
magneti=8;
fasi=2;
moltiplicatore=1;
diametro_calamita=15;
diametro_buco_calamita=5;
altezza_calamita=5;
diametro_albero=8;
diametro_vincoli=6;
altezza_cuscinetto=8;
diametro_cuscinetto=22.4;
//parametri avvolgicavo
altezza_avvolgicavo=30;


module avvolgicavo(){
    difference(){
        union(){
        translate([0,0,-1*((        altezza_avvolgicavo/2)-(spessore_rotore/2))]){
           
        cylinder(r=raggio/4,h=altezza_avvolgicavo,center=true,$fn=600);
             hull(){
      translate([0,0,-altezza_avvolgicavo/2+spessore_rotore*2])cylinder(r=raggio/5,h=altezza_avvolgicavo/5,center=true,$fn=600);
        translate([0,0,-altezza_avvolgicavo/2+spessore_rotore/2])cylinder(r=raggio/3,h=altezza_avvolgicavo/5,center=true,$fn=600);
            }
            }
    }
    union(){
        cuscinetto();
        cylinder(r=diametro_albero*4/5,h=6000,center=true);
        translate([0,0,-altezza_avvolgicavo+spessore_rotore])cuscinetto();
        translate([0,raggio/6,-spessore_rotore*1.2])rotate([0,90,0])cylinder(r=1.5,h=1000,center=true);
    }
    }
}

module rotore(){
    difference(){
        hull(){
        cylinder(r=raggio,h=spessore_rotore/2,center=false);
        cylinder(r=raggio*0.8,h=spessore_rotore,center=true);
        }   
        union(){
        cuscinetto();
        angolo_magneti=360/magneti;
        for(magnete=[1:magneti])rotate([0,0,angolo_magneti*magnete])translate([raggio*3/4,0,spessore_rotore-altezza_calamita])calamita();
            }
     }
}

module statore(){
    difference(){
        cylinder(r=raggio,h=spessore_statore,center=true);
        union(){
        cylinder(r=diametro_albero/2,h=1000,center=true);
        angolo_bobine=360/(magneti*fasi*moltiplicatore);
        for(bobina=[1:(magneti*fasi*moltiplicatore)])rotate([0,0,angolo_bobine*bobina])translate([raggio*3/4,0,0])
            bobina();
            fissaggio();
            passaggio_cavi();
            }      
     }
 
    //coperchio();
     
}

module fissaggio(){
angolo_vincoli=360/3;
for (fiss=[1:3])
    rotate([0,0,angolo_vincoli*fiss])translate([raggio*2/7,0,0])union(){cylinder(r=diametro_vincoli,h=1000,center=false);
        translate([0,0,-500])cylinder(r=diametro_vincoli/2,h=1000,center=false);
    }
}

module coperchio(){
    angolo_bobine=360/(magneti*fasi*moltiplicatore);
    for(giro=[1:(magneti*fasi*moltiplicatore)])
    intersection_for(coperchio=[0,2])rotate([0,0,angolo_bobine*(coperchio+giro)])translate([raggio*4/5,0,spessore_statore/2-1.5])cylinder(r=18,h=1.5,center=false);
}

module passaggio_cavi(){
    angolo_bobine=360/(magneti*fasi*moltiplicatore);
    for(cavo=[1:fasi])rotate([0,0,angolo_bobine*cavo])union(){translate([raggio*4/5+diametro_calamita/4,diametro_calamita/3,-500])cylinder(r=2,h=1000,center=false);
    translate([raggio*4/5+diametro_calamita/4,-diametro_calamita/3,-500])cylinder(r=2,h=1000,center=false);
    }
}

module bobina(){
    difference(){
    cylinder(r=diametro_calamita/2,h=spessore_statore*3,center=false);
    cylinder(r=diametro_calamita/3,h=spessore_statore*3,center=false);
    }
}

module cuscinetto(){
cylinder(r=diametro_cuscinetto/2,h=altezza_cuscinetto,center=true,$fn=100);
}

module calamita(){
    difference(){
cylinder(r=diametro_calamita/2,h=altezza_calamita,center=true);
cylinder(r=diametro_buco_calamita/2,h=altezza_calamita*2,center=true);
    }
}