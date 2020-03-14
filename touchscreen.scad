$fn=24;

test="no"; //[yes:Yes,no:No]

difference(){
    translate([0,0,(8.5+14)/2]){
    union(){
        minkowski(){
            cube([193-14+3,110.8-14+3,8.5], center=true);
            sphere(7);
        }
    }
}
// Top cut-off
translate([0,0,8.5+2]) linear_extrude(15) square([200,160], center=true);
// Screen edge cut-out    
translate([0,0,8.5-0.8+2]) linear_extrude(24) offset(7) offset(-7) square([193,110.8], center=true);
// Body cut-out
translate([0,0,2+((8.5+6)/2)]){
    minkowski(){
        cube([193-6-5,110.8-6-5,8.5], center=true);
        sphere(3);
    }
}
// Screw holes
for(X=63*[1,-1], Y=33*[1,-1])
    translate([0,1.1,0]) translate([X,Y,0]) linear_extrude(5) circle(d=3.4);
// Cutout for boards
translate([0,4.9,0]) linear_extrude(10) offset(3) offset(-3) square([94,65], center=true);
if(test=="yes"){
    translate([0,-50,-1]) linear_extrude(20) square([200,120], center=true);
    translate([50,0,-1]) linear_extrude(20) square([150,120], center=true);
}
}
