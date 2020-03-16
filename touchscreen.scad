// Every time I start this project, I quickly want to quit. The Raspberry Pi Official 7" Touchscreen is poorly designed and poorly documented.
// The plan for YARPiC compatibility is: a hollowed out YARPiC with ports moved up slightly and a second MicroUSB port for the screen's power; it'll mount to the screen with four M3 screws in a configuration similar to the VESA mount; the top/lid will be mounted with corners.
// I'm considering extending the +X wall (long wall with no I/O) of YARPiC to the edge of the screen (+Y of this model) and adding a slant so it can be angled.

include<maths/yarpic_model.scad>


/*[Main]*/
$fn=24;

// Pretty self-explanatory.
bevel="yes"; //[yes:Yes,no:No]

// There's some dispute about the radius of the curve on the touchscreen. This is so I can easilly change all instances throughout the file.
curve=6.5;

/*[Tests]*/

// This was so I could render and print just one corner to test the fit.
test="no"; //[yes:Yes,no:No]

// This will give you a complete render, including a YARPiC with the variables set below.
test_fit="no"; //[yes:Yes,no:No]

// From here on down, it's some standard YARPiC variables that have no impoact on the look of the touchscreen.
corners="yes";
cooling_slots="yes";
layer_height=0.2;
fan="yes";
fan_size=40;
line1="Screen";
line2="Test";
add_text="yes";
pi4="no";

module screen(){
difference(){
        union(){
    if(bevel=="yes"){
    translate([0,0,(8.5+(curve*2))/2]){
        minkowski(){
            cube([193-(curve*2)+3,110.8-(curve*2)+3,8.5], center=true);
            sphere(curve);
        }
    }
}

else{
    linear_extrude(10) offset(curve) offset(-curve) square([193+3,110.8+3], center=true);
}
}
// Top cut-off
translate([0,0,8.5+2]) linear_extrude(15) square([200,160], center=true);
// Screen edge cut-out    
translate([0,0,8.5-0.8+2]) linear_extrude(24) offset(curve) offset(-curve) square([193,110.8], center=true);
// Body cut-out
if(bevel=="yes"){
translate([0,0,2+((8.5+6)/2)]){
    minkowski(){
        cube([193-6-5,110.8-6-5,8.5], center=true);
        sphere(3);
    }
}
}
else{
    translate([0,0,2]) linear_extrude(10) offset(curve) offset(-curve) square([193-6,110.8-6], center=true);
}
// Screw holes
for(X=(126.2/2)*[1,-1], Y=(65.65/2)*[1,-1])
    translate([0,1.1,0]) translate([X,Y,0]) linear_extrude(5) circle(d=3.4);
// Cutout for boards
translate([-5,5.2,0]) linear_extrude(10) offset(3) offset(-3) square([88.5,59.5], center=true);
if(test=="yes"){
    translate([0,-50,-1]) linear_extrude(20) square([200,120], center=true);
    translate([50,0,-1]) linear_extrude(20) square([150,120], center=true);
}
else{}
}
}

if(test_fit=="yes"){
    translate([0,0,52.4])rotate([0,108,90]){
    difference(){
        union(){
            difference(){
        translate([5.2,-5,0]){
            bottom();
        }
    }
            
    for(r=27.646*[-1,1]){
            rotate([0,0,r]) linear_extrude(2.3) offset(10.25) offset(-10.24) square([20.5,160], center=true);
        }
        rotate([0,180,0]) translate([-5.2,-5,-(27+8+0.2)]) top();
            rotate([180,0,90]) screen();

        }
        // Power port
            translate([5.2,-5,0]) translate([-28,31.9,6.3-12]) linear_extrude(4) square([15,10], center=true);
        // Ribon cable
        translate([5.2,41-5,0]) linear_extrude(25.25) square([25,10], center=true);
        // Bottom cut-out
        translate([5.2,-5,-1]) linear_extrude(10) offset(3) offset(-3) square([59.4,88.4], center=true);
        // Screw holes
for(X=(126.2/2)*[1,-1], Y=(65.65/2)*[1,-1])
    rotate([0,0,90]) translate([0,-1.1,0]) translate([X,Y,0]) linear_extrude(5) circle(d=3.4);
    }
}
}
else{
    screen();
}
