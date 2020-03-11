layer_height=0.2;

$fn=24;
for(X=10*[1,-1], Y=10*[1,-1]){
difference(){
    union(){
    // Corners
    translate([0,0,0]) linear_extrude(27)  translate([X,Y,-1])  circle(d=11);
    }
        // Screw holes
    translate([0,0,15]) linear_extrude(8.5)  translate([X,Y,-1])  circle(d=3.4);
            // Screw holes
    translate([0,0,23.5+(layer_height*4)]) linear_extrude(6)  translate([X,Y,0])  circle(d=3.4);
    
translate([X,Y,23.5]){
    linear_extrude(layer_height*2) square ([4,6.2], center =true);
    linear_extrude(layer_height*3.4) square([4,4], center=true);
}

//    translate([X,Y,17-3.5+23.7])
//rotate([180,0,90]){
//{
//intersection()
//    {
//        translate([0,0,9])cylinder(d=6.95,h=25, $fn=6); // head cut
//        translate([0,0,17-3.5]) cube([6.2,3.4,0.4], center=true);
//    }
//    translate([0,0,17-4]) cube([3.4,3.4,0.4], center=true);
//    translate([0,0,17-3.5])cylinder(d=6.95,h = 0, $fn=6); // head cut
//}
//}
        
    // Nut housing
    translate([0,0,20]) linear_extrude(3.5) for(X=13.75*[-1,1], Y=10*[-1,1]) translate([X,Y]) square([4.5,6], center=true);
            translate([0,0,20]) linear_extrude(3.5)  translate([X,Y]) circle(d=6.95, $fn=6);
    }
    
    // Supports
translate([-(32.5-33+10),Y,20]){
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
translate([32.5-33+10,Y,20]){
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