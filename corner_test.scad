//include<cutout.scad>

// This sets the height of the screw hole support and the screw hole itself.
//It'll add two layers of the first support, and two layers for the second support before the screw hole itself.
layer_height=0.2;

// I got sick of changing all constants, so I made it a variable.
screw_w=3.6;

// Turn off supports if you just want to use slicer-generated supports.
supports="yes"; //[yes:Yes,no:No]

// This allows you to print up to certain points on each of the corners for better diagnostics.
variable_height="no"; //[yes:Yes,no:No]

// Cones are awesome. I love cones. This variable adds tapered (conical) screw holes at the top for better screw insertion.
cones="yes"; //[yes:Yes,no:No]

$fn=50;
difference(){
    union(){
for(X=10*[1,-1], Y=10*[1,-1]){
difference(){
    union(){
    // Corners
    translate([0,0,0]) linear_extrude(27-15)  translate([X,Y,-1])  circle(d=11);
    }
        // Screw holes
    translate([0,0,14-15]) linear_extrude(20)  translate([X,Y,0])  circle(d=screw_w);
            // Screw holes
if(cones=="yes"){
        translate([0,0,23.5+(layer_height*4)-15])  translate([X,Y,0])  cylinder(d1=screw_w,d2=screw_w+1.6,h=5);
}
else{
//    translate([0,0,23.5+(layer_height*4)-15]) linear_extrude(6)  translate([X,Y,0])  circle(d=screw_w);
}

// This is the new support for the screw hole. I might do something similar with the other screw holes where I've used cones/cylinders in the past.
//translate([X,Y,23.5-15]){
//    linear_extrude(layer_height*2) square([screw_w,6], center =true);
//    linear_extrude(layer_height*4) square([screw_w,screw_w], center=true);
//}
//    // Nut housing
//    translate([0,0,20-15]) linear_extrude(3.5) for(X=13.75*[-1,1], Y=10*[-1,1]) translate([X,Y]) square([4.5,6], center=true);
//            translate([0,0,20-15]) linear_extrude(3.5)  translate([X,Y]) circle(d=6.93, $fn=6);

//for(y=10*[1,-1]){
//translate([-14,y+1,20-15]) translate([0,0,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
//translate([-14,y-1,20-15]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
//translate([14,y+1,20-15]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
//translate([14,y-1,20-15]) translate([0,0,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);


    // Cura likes to put a seam at the front of the nut traps, which makes inserting and removing nuts quite difficult, so I decided to taper the edged. This conflicted with the tapered roof, so I made the cutout as a solid in a different file (cutout.scad) and call upon it here.
    for(y=10*[1,-1]){
        translate([10,y,4]) corner_cutout();
        translate([-10,y,4]) rotate([0,0,180]) corner_cutout();
    }
//}
//translate([10,10,20-15]) rotate([0,0,12]) linear_extrude(3.5) square([4.5,4], center=true);

    // Quick and dirty idea for printing without supports
//    if(supports=="yes"){}
//    else{
//        translate([32.5-33+10+5,Y,21-15]) rotate([0,45,0]) linear_extrude(5) square([5,6], center=true);
//        translate([-(32.5-33+10+5),Y,21-15]) rotate([0,-45,0]) linear_extrude(5) square([5,6], center=true);
//    }
    }
    
    // The supports are currently in four pairs: two pairs for left (-X), and two pairs for right (+X). This ensures that all walls are supported when printing (with 3 walls at 0.4mm). I'm sure there are better ways to do this, but this is the quick and sloppy way. I might refine the code for this if I can be bothered.

if(supports=="yes"){    
    // Left (-X) supports
    // Front
translate([-(32.5-33+10),Y,20-15]){
    for (r=150){
        rotate([0,0,r]){
pathRadius=5.5;
num=3;
for (i=[1:num]){
	translate([pathRadius*cos(i*(45/num)),pathRadius*sin(i*(45/num)),0]) linear_extrude(3.5) circle(d=0.8);
}
}
}
}
    // Back
translate([-(32.5-33+10),Y,20-15]){
    for (r=150){
        rotate([0,0,r]){
pathRadius=5.2;
num=3;
for (i=[1:num]){
	translate([pathRadius*cos(i*(45/num)),pathRadius*sin(i*(45/num)),0]) linear_extrude(3.5) circle(d=0.8);
}
}
}
}

    // Right (+X) supports
    // Front
translate([32.5-33+10,Y,20-15]){
    for (r=330){
        rotate([0,0,r]){
pathRadius=5.5;
num=3;
for (i=[1:num]){
	translate([pathRadius*cos(i*(45/num)),pathRadius*sin(i*(45/num)),0]) linear_extrude(3.5) circle(d=0.8);
}
}
}
}
    // Back
translate([32.5-33+10,Y,20-15]){
    for (r=330){
        rotate([0,0,r]){
pathRadius=5.2;
num=3;
for (i=[1:num]){
	translate([pathRadius*cos(i*(45/num)),pathRadius*sin(i*(45/num)),0]) linear_extrude(3.5) circle(d=0.8);
}
}
}
}
}
else{}
}
}
if(variable_height=="yes"){
    translate([-10,-10,23.4-15]) linear_extrude(25) square([13,13], center=true);
    translate([10,-10,23.5-15+(layer_height*2)]) linear_extrude(20) square([13,13], center=true);
    translate([10,10,23.5-15+(layer_height*4)]) linear_extrude(20) square([13,13], center=true);
}
else{}
}

// New nut trap cutout
module corner_cutout(){
    difference(){
            union(){
                translate([32.5-33+5,0,1]) rotate([0,35,0]) linear_extrude(10) square([5,8.75], center=true);
                    translate([4,1,0]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                    translate([4,-1,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
            translate([0,0,0]) linear_extrude(3.5)circle(d=6.93, $fn=6);
                    translate([0,0,3.5]){
    linear_extrude(layer_height*2) square([screw_w,6], center =true);
    linear_extrude(layer_height*4) square([screw_w,screw_w], center=true);
                    }
                }
                translate([4,0+6.5,0]) rotate([0,0,16.5]) linear_extrude(10) square([5,5.0475], center=true);
                translate([4,0-6.5,0]) rotate([0,0,-16.5]) linear_extrude(10) square([5,5.0475], center=true);

        }
    }