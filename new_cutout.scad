layer_height=0.2;
screw_w=3.6;

difference(){
            union(){
                translate([32.5-33+5,0,1]) rotate([0,35,0]) linear_extrude(10) square([5,8.75], center=true);
                    translate([5,1,0]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                    translate([5,-1,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                
                    translate([3.75,0,0]) linear_extrude(3.5) square([4.5,6], center=true);
            translate([0,0,0]) linear_extrude(3.5)circle(d=6.93, $fn=6);
                    translate([0,0,3.5]){
    linear_extrude(layer_height*2) square([screw_w,6], center =true);
    linear_extrude(layer_height*4) square([screw_w,screw_w], center=true);
                    }
                }
                translate([4,0+6.204,0]) rotate([0,0,16.5]) linear_extrude(10) square([5,5.0475], center=true);
                translate([4,0-6.204,0]) rotate([0,0,-16.5]) linear_extrude(10) square([5,5.0475], center=true);

        }
    