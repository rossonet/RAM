use <Write.scad>
difference(){
union() {
import("/home/andrea/Scrivania/POLAR_DRAWBOT/da_stampare/2xBraccia.STL");
    translate([20,21,0])cylinder(r=12,h=1.5);
}
translate([13,12,-1])rotate([0,0,45])write("Rossonet",h=4,t=4);
}