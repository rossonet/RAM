//Replacement wheel for the table belonging to a vintage Husqvarna pedal-powered sewing machine.
//NOTE: Wheel is FUNCTIONALLY the same as the original, not identical.
//For use on a real table, it's HIGHLY adviced to mill it out of HDPE or similar, not printing it with ABS or PLA as the table+sewing machine is a heavy load.
//Design was used to learn the 'Circular extrude' function in OpenSCAD
//Wheel diameter is 33mm (approximated from the deformed remains of old wheel)
//Axle diameter is 8mm, which explains the 4mm translate of the first part of the design. (The C_E command rotates everything around X=0, so a 4mm offset gives an 8mm hole)
//No parameterisation has been done to this wheel, but it should be pretty easy to adapt anyway.
//The $fn used is to specify the number of edges along a circle, and can be set lower to speed up modelling, but should be set high when doing a final rendering for a smooth surface.
//Unless you actually WANT an octagon wheel, in which case, change $fn=200 to $fn=8... ;-)

rotate_extrude(convexity=10, $fn=400)
{
//Hub
translate([6,0,0])
    square([4.5, 25]);
translate([6,2.5,0])
    #square([56, 20]);
//prettying up the transition from the hub.
difference()
{ translate([10,0])
    square([5,25]);
    translate([18,-1])
        circle(r=4, $fn=50);
    translate([18,26])
        circle(r=4, $fn=50);
}
//rim is a rectangle and two circles.
 translate([56,0,0])
    square([6, 25]);
 translate([59,0])
    circle(r=3, $fn=50);
 translate([59,25])
    circle(r=3, $fn=50);
}