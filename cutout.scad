//cutout();
//layer_height=0.2;
//screw_w=3.6;
module cutout(){
    for(X=10*[1,-1], Y=10*[1,-1]){
        difference(){
            union(){
                translate([32.5-33+10+5,Y,21-15]) rotate([0,45,0]) linear_extrude(5) square([5,6], center=true);
                translate([-(32.5-33+10+5),Y,21-15]) rotate([0,-35,0]) linear_extrude(10) square([5,8.75], center=true);
                for(y=10*[1,-1]){
                    translate([-14,y+1,20-15]) translate([0,0,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                    translate([-14,y-1,20-15]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                    translate([14,y+1,20-15]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                    translate([14,y-1,20-15]) translate([0,0,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                }
                    translate([0,0,20-15]) linear_extrude(3.5) for(X=13.75*[-1,1], Y=10*[-1,1]) translate([X,Y]) square([4.5,6], center=true);
            translate([0,0,20-15]) linear_extrude(3.5)  translate([X,Y]) circle(d=6.93, $fn=6);
                    translate([X,Y,23.5-15]){
    linear_extrude(layer_height*2) square([screw_w,6], center =true);
    linear_extrude(layer_height*4) square([screw_w,screw_w], center=true);
                    }
            }
            for(y=10*[1,-1]){
                translate([-14,y+6.5,20-15]) translate([0,0,0]) rotate([0,0,-16.5]) linear_extrude(10) square([5,5.0475], center=true);
                translate([-14,y-6.5,20-15]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(10) square([5,5.0475], center=true);
                translate([14,y+6.5,20-15]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(10) square([5,5.0475], center=true);
                translate([14,y-6.5,20-15]) translate([0,0,0]) rotate([0,0,-16.5]) linear_extrude(10) square([5,5.0475], center=true);
            }
        }
    }
}