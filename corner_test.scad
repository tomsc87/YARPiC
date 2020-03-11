// My printer sucks. Horizontal expansion is off the charts. If I reduce it too much in my slicer settings, it won't print the supports for the nut housing roof. As a result, I need to increase the width of the screw holes beyond the norm. Looking over code for the Original Prusa I3 MK3, it uses 3.3mm diameter for M3 screws, but my printer can't even handle 3.4mm (with -0.1mm horizontal expansion) without the screws being too tight.
// I think 3.6mm diameter is about as low as my printer can go. 

layer_height=0.2; // This sets the height of the screw hole support and the screw hole itself. It'll add two layers of the first support, and two layers for the second support.
screw_w=3.6; // I got sick of changing all constants, so I made it a variable.
supports="yes"; //[yes:Yes,no:No]

$fn=24;
for(X=10*[1,-1], Y=10*[1,-1]){
difference(){
    union(){
    // Corners
    translate([0,0,0]) linear_extrude(27-15)  translate([X,Y,-1])  circle(d=11);
    }
        // Screw holes
    translate([0,0,14-15]) linear_extrude(8.5)  translate([X,Y,0])  circle(d=screw_w);
            // Screw holes
    translate([0,0,23.5+(layer_height*4)-15]) linear_extrude(6)  translate([X,Y,0])  circle(d=screw_w);

// This is the new support for the screw hole. I might do something similar with the other screw holes where I've used cones/cylinders in the past.
translate([X,Y,23.5-15]){
    linear_extrude(layer_height*2) square([screw_w,5.5], center =true);
    linear_extrude(layer_height*4) square([screw_w,screw_w], center=true);
}        
    // Nut housing
    translate([0,0,20-15]) linear_extrude(3.5) for(X=13.75*[-1,1], Y=10*[-1,1]) translate([X,Y]) square([4.5,5.5], center=true);
            translate([0,0,20-15]) linear_extrude(3.5)  translate([X,Y]) circle(d=6.35, $fn=6);
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