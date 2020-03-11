layer_height=0.2;

$fn=24;
for(X=10*[1,-1], Y=10*[1,-1]){
difference(){
    union(){
    // Corners
    translate([0,0,0]) linear_extrude(27-15)  translate([X,Y,-1])  circle(d=11);
    }
        // Screw holes
    translate([0,0,15-15]) linear_extrude(8.5)  translate([X,Y,-1])  circle(d=4);
            // Screw holes
    translate([0,0,23.5+(layer_height*4)-15]) linear_extrude(6)  translate([X,Y,0])  circle(d=4);

// This is the new support for the screw hole. I might do something similar with the other screw holes where I've used cones/cylinders in the past.
translate([X,Y,23.5-15]){
    linear_extrude(layer_height*2) square([4,6.2], center =true);
    linear_extrude(layer_height*4) square([4,4], center=true);
}        
    // Nut housing
    translate([0,0,20-15]) linear_extrude(3.5) for(X=13.75*[-1,1], Y=10*[-1,1]) translate([X,Y]) square([4.5,6], center=true);
            translate([0,0,20-15]) linear_extrude(3.5)  translate([X,Y]) circle(d=6.95, $fn=6);
    }
    
    // Supports
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
}