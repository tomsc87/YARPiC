// Hello, you lovely people. I added some more features to my Yet Another Raspberry Pi Case (YARPiC), and decided to release a customizable source code for you. 

// To make it as simple as possible, I've split it into two parts: 1) a customizer (../yarpic_customizer.scad), and 2) another file that does all the hard work (this file). If I've done my job correctly, you shouldn't need to touch the latter (and see how much of a mess my coding is).

// Anyway, I hope you find this easy to use and post your makes to Thingiverse. If you have any comments, complaints, or suggestions, feel free to leave a comment (here: https://www.thingiverse.com/thing:3464513, or here: https://github.com/tomsc87/YARPiC).

// DON'T TOUCH!! Important maths stuff. DON'T TOUCH!!

if((rail=="side"||rail=="back")&&(vesa=="yes")){
    translate([0,0,0]) linear_extrude(2) text("Turn off either rail or vesa.", halign="center", valign="center");
}
else{}

if(part=="bottom"){
	if((rail=="side"||rail=="back")&&vesa=="yes"||(dc_text=="yes")||(screwtest=="yes")){}
    else{
        translate([0,model=="pi3a" ? -10:0,0]) bottom();
    }
}
else {}

if(part=="top"){
    if((rail=="side"||rail=="back")&&vesa=="yes"||(dc_text=="yes")||(screwtest=="yes")){}
    else{
        translate([0,model=="pi3a" ? -10:0,0]) top();
    }
}
else {}

if(part=="both"){
    if((rail=="side"||rail=="back")&&vesa=="yes"||(dc_text=="yes")||(screwtest=="yes")){}
    else{
        translate([-50,model=="pi3a" ? -10:0,0]) top();
        translate([50,model=="pi3a" ? -10:0,0]) bottom();
        if(vesa=="yes"){
			translate([50,model=="pi3a"&&corners=="yes" ? -10:0,0]) vesa();
        }
        else{}
    }
}
else{}

if(dc_text=="yes"){
    if(screwtest=="yes"){}
    else{
        if(part=="both"){
            translate([-50,model=="pi3a" ? -10:0,0]) dc_text();
        }
        else if(part=="top"){
            translate([0,model=="pi3a" ? -10:0,0]) dc_text();
        }
        else{}
    }
}
else {}

if((vesa=="yes")&&(part=="bottom")){
    if((rail=="side"||rail=="back")&&(corners=="yes"||vesa=="yes")||((dc_text=="yes"))||(screwtest=="yes")){}
    else{
        translate([0,model=="pi3a"&&corners=="yes" ? -10:0,0]) vesa();
    }
}
else {}

if(screwtest=="yes"){
    screwtest();
}
else {}

module bottom(){
    difference(){
        union(){
            difference(){
                union(){
                    difference(){
                        union(){
                            if(model=="pi3a"){
                                translate([0,10,0]){
                                    if(bevel=="yes"){
                                        translate([0,0,2.975]){
                                            minkowski(){
                                                linear_extrude(27)  square([(59),(68)], center=true);
                                                sphere(3);
                                            }
                                        }
                                    }
                                    else{
                                        linear_extrude(27) offset(3) offset(-3) square([(65),(74)], center=true);
                                    }
                                    // V-slot
                                    if(rail=="side"){
                                        difference(){
                                            union(){
                                                translate([corners=="yes" ? 37:31,0,0]) linear_extrude(21) square([3,100], center=true);
                                            }
                                            for (y=45*[1,-1]){
                                                translate([corners=="yes" ? 39.5:33.5,y,10.5]) rotate([0,-90,0]) linear_extrude(10) circle(d=3.6);
                                                translate([corners=="yes" ? 37:31,y,10.5]) rotate([0,-90,0]) linear_extrude(10) circle(d=6);
                                            }
                                        }
                                    }
                                    else{}
                                }
                            }
                            else{
                                // Case
                                if(bevel=="yes"){
                                    translate([0,0,2.975]){
                                        minkowski(){
                                            linear_extrude(27)  square([(59),(88)], center=true);
                                            sphere(3);
                                        }
                                    }
                                }
                                else{
                                    linear_extrude(27) offset(3) offset(-3) square([(65),(94)], center=true);
                                }
                                // V-slot
                                if(rail=="side"){
                                    difference(){
                                        union(){
                                            translate([corners=="yes" ? 37:31,0,0]) linear_extrude(21) square([3,120], center=true);
                                        }
                                        for (y=55*[1,-1]){
                                            translate([corners=="yes" ? 39.5:33.5,y,10.5]) rotate([0,-90,0]) linear_extrude(10) circle(d=3.6);
                                            translate([corners=="yes" ? 37:31,y,10.5]) rotate([0,-90,0]) linear_extrude(10) circle(d=6);
                                        }
                                    }
                                }
                                else{}
                            }
                            if(rail=="back"){
                                difference(){
                                    union(){
                                        translate([0,corners=="yes" ? 50:45.5,0]) linear_extrude(corners=="yes" ? 17.5:21) square([95,3], center=true);
                                    }
                                    for(X=42.5*[1,-1]){
                                        translate([X,corners=="yes" ? 52:47,10.5]) rotate([90,0,0]) linear_extrude(10) circle(d=3.6);
                                        translate([X,corners=="yes" ? 50:45.5,10.5]) rotate([90,0,0]) linear_extrude(10) circle(d=6);
                                    }
                                }
                            }
                        }
                        // Rear holes for airflow
                        if(cooling_slots=="back"||cooling_slots=="both"){
                            rotate([90,0,0]) translate([0,14,-48]){
                                linear_extrude(6) for(X=3.25*[-1,1,-3,3,-5,5,-7,7], Y=2.5) translate([X,Y,-1]) offset(1) offset(-1) square([4,15], center=true); // As awful as this is with the rotate, it's a LOT better than the alternative (minkowski).
                            }
                        }
                        if(cooling_slots=="side"||cooling_slots=="both"){
                            translate([29,model=="pi3a" ? 10:0,17]) rotate([0,90,0]){
                                linear_extrude(6) for(Y=model=="pi3a" ? 3.25*[-1,1,-3,3,-5,5,-7,7]:3.25*[-1,1,-3,3,-5,5,-7,7,-9,9,-11,11]) translate([0,Y,0]) offset(1) offset(-1) square([15,4], center=true);
                            }
                        }
                        else{}
                        if(model=="pi4"){
                            // RJ-45 port
                            translate([17.75,-45,6.5]) linear_extrude(14.5) square([17,16], center=true);
                            // USB port
                            translate([-10,-45,6.7]){
                                for(x=-9*[1,-1]){
                                    translate([x,0,0]) linear_extrude(17) square([15.5,16], center=true);
                                }
                            }
                            // power port
                            translate([-28,31.9,6]) linear_extrude(5.5) square([16,12.5], center=true);
                            // HDMI port
                            translate([-28,(19.5/2),4.5]){
                                for(y=(13.5/2)*[1,-1]){
                                    translate([0,y,0]) linear_extrude(7.6) square([16,11.2], center=true);
                                }
                            }
                            // audio port
                            translate([-28,-11.4,6.2]) linear_extrude(6.8) square([16,6.8], center=true);
                            // Side cutout
                            translate([new_io=="yes" ? -30:-35.75,11,6]){
                                minkowski(){
                                    linear_extrude(8.5) square([4,55], center=true);
                                    sphere(3);
                                }
                            }
                        }
                        else if(model=="pi3b"){
                            // RJ-45 port
                            translate([-17.7,-45,6.5]) linear_extrude(14.5) square([17,16], center=true);
                            // USB port
                            translate([10,-45,6.4]){
                                for(x=9*[1,-1]){
                                    translate([x,0,0]) linear_extrude(17) square([16.5,16], center=true);
                                }
                            }
                            // power port
                            translate([-28,31.9,6.3]) linear_extrude(4) square([15,10], center=true);
                            // HDMI port
                            translate([-28,10.5,7.3]) linear_extrude(7) square([16,17], center=true);
                            // audio port
                            translate([-28,-11,6.3]) linear_extrude(6.6) square([16,6.6], center=true);
                            // Side cutout
                            translate([new_io=="yes" ? -30:-35.75,11,6]){
                                minkowski(){
                                    linear_extrude(12) square([4,55], center=true);
                                    sphere(3);
                                }
                            }
                        }
                        else if(model=="pi3a"){
                            // USB port
                            translate([3.45,-25,6.6]) linear_extrude(8.5) square([16.5,16], center=true);
                            // power port
                            translate([-28,31.9,6.3]) linear_extrude(4) square([15,10], center=true);
                            // HDMI port
                            translate([-28,10.5,7.3]) linear_extrude(7) square([16,17], center=true);
                            // audio port
                            translate([-28,-11,6.3]) linear_extrude(6.6) square([16,6.6], center=true);
                            // Side cutout
                            translate([new_io=="yes" ? -30:-35.75,11,6]){
                                minkowski(){
                                    linear_extrude(12) square([4,55], center=true);
                                    sphere(3);
                                }
                            }
                            // Front cutout
                            translate([3.45,-(68/2)+10,6.4]) linear_extrude(20) square([17,3], center=true);
                        }
                    }
                    if(corners=="yes"){
                        // Corners
                        translate([0,model=="pi3a" ? 10:0,0]) linear_extrude(27) for(X=33*[-1,1], Y=model=="pi3a" ? 36*[-1,1]:46*[-1,1]) translate([X,Y,-1])  circle(d=11);
                    }
                    else{}
                }
                if(model=="pi4"){
                    // Front cutout
                    translate([-0.5,-(88/2),6.4]) linear_extrude(20) square([55,3], center=true);
                }
                else{}
                if(model=="pi3b"||model=="pi4"){
                    // Hollow out for lid
                    translate([0,0,25.25]) linear_extrude(10) offset(3) offset(-3) square([62,91], center=true);
                    if(bevel=="yes"){
                        // Cut off top
                        translate([0,0,27]) linear_extrude(9) square([79,118], center=true);
                        // Hollow out
                        minkowski(){
                            translate([0,0,5]) linear_extrude(30) square([59-5.5,88-5.5], center=true);
                            sphere(3);
                        }
                    }
                    else{
                        translate([0,0,2]) linear_extrude(30) offset(3) offset(-3) square([59.5,88.5], center=true);
                    }
                }
                else if(model=="pi3a"){
                    // Hollow out for lid
                    translate([0,10,25.25]) linear_extrude(10) offset(3) offset(-3) square([62,71], center=true);
                    if(bevel=="yes"){
                        // Cut off top
                        translate([0,10,27]) linear_extrude(9) square([79,98], center=true);
                        // Hollow out
                        minkowski(){
                            translate([0,10,5]) linear_extrude(30) square([59-5.5,68-5.5], center=true);
                            sphere(3);
                        }
                    }
                    else{
                        translate([0,10,2]) linear_extrude(30) offset(3) offset(-3) square([59.5,68.5], center=true);
                    }
                }
                else{}
                if(corners=="yes"){ // I could add all this to the nut_trap() module, but it adds about 10 seconds to the render time.
                    translate([0,model=="pi3a" ? 10:0,0]){
                        for(X=33*[-1,1], Y=model=="pi3a" ? 36*[-1,1]:46*[-1,1]){
                            translate([X,Y,23.5+(layer_height*4)]) cylinder(d1=3.6,d2=3.6+1.6,h=5);
                            translate([X,Y,15]) cylinder(d1=3.6,d2=3.6+1.6,h=5);
                            // Screw holes
                            translate([X,Y,15-1]) linear_extrude(20) circle(d=3.6);
                            // New nut trap
                            translate([33,Y,17.5]) nut_trap();
                            translate([-33,Y,17.5]) rotate([0,0,180]) nut_trap();
                        }
                    }
                }
                else{}
            }
            // Stand offs
            translate([0,10,1.9]){
                for(X=24.5*[-1,1], Y=29*[-1,1]){
                    translate([X,Y,0]) cylinder(d1=9, d2=6, h=3.4);
                }
            }
        }
        if(corners=="yes"){
            // Screw holes
            translate([0,10,2.5]){
                for(X=24.5*[-1,1], Y=29*[-1,1]){
                    translate([X,Y,0]) linear_extrude(3)  circle(d=screw_hole);
                    translate([X,Y,2]) cylinder(d1=screw_hole, d2=screw_hole+2,h=1.5);
                }
            }
        }
        else{
            // Screw holes
            translate([0,10,-0.5]){
                for(X=24.5*[-1,1], Y=29*[-1,1]){
                    // Embed
                    translate([X,Y,0]) cylinder(d=6.8, h=2.5);
                    // All the way through
                    translate([X,Y,0]) linear_extrude(6) circle(d=3.2);
                    // Supports
                    translate([X,Y,2.5]){
                        linear_extrude(layer_height*2) square([3.2,6], center =true);
                        linear_extrude(layer_height*4) square([3.2,3.2], center=true);
                    }
                }
            }
        }
        if(sd_card=="no"||rail=="back"){
            translate([0,40,3]) linear_extrude(new_io=="yes" ? 35:4.5) square([15,11], center=true);
        }
        else{
            // microSD card slot
            translate([0,51,-1]) linear_extrude(7.7) square([15,21], center=true);
        }
    }
    if(model=="pi4"&&new_io=="yes"){
        difference(){
            union(){
                translate([-33.2,11,4.5]){
                    difference(){
                        minkowski(){
                            linear_extrude(11.5) square([4,57], center=true);
                            sphere(3);
                        }
                        translate([-3.25,0,-3.0]) linear_extrude(18) square([10,64], center=true);
                    }
                }
            }
            translate([-34.35,11,5.85]){
                minkowski(){
                    linear_extrude(8.8) square([4,55.4], center=true);
                    sphere(3);
                }
            }
            // power port
            translate([-28,31.9,6]) linear_extrude(5.5) square([16,12.5], center=true);
            // HDMI port
            translate([-28,(19.5/2),5.8]){
                for(y=(13.5/2)*[1,-1]){
                    translate([0,y,0]) linear_extrude(5) square([16,9], center=true);
                }
            }
            // audio port
            translate([-28,-11.4,6.2]) linear_extrude(6.8) square([16,6.8], center=true);
            if(corners=="no"){
                rotate([0,180,0]) translate([0,0,-35]) top();
            }
            else{}
        }
    }
    else if((model=="pi3b"||model=="pi3a")&&new_io=="yes"){
        difference(){
            union(){
                translate([-33.2,11,4.5]){
                    difference(){
                        minkowski(){
                            linear_extrude(15) square([4,57], center=true);
                            sphere(3);
                        }
                        translate([-3.25,0,-3.0]) linear_extrude(21) square([10,64], center=true);
                    }
                }
            }
            translate([-34.35,11,5.85]){
                minkowski(){
                    linear_extrude(12.4) square([4,55.4], center=true);
                    sphere(3);
                }
            }
            // power port
            translate([-28,31.9,6.3]) linear_extrude(4) square([15,10], center=true);
            // HDMI port
            translate([-28,10.5,7.3]) linear_extrude(7) square([16,17], center=true);
            // audio port
            translate([-28,-11,6.3]) linear_extrude(6.6) square([16,6.6], center=true);
            if(corners=="no"){
                rotate([0,180,0]) translate([0,0,-35]) top();
            }
            else{}
        }
    }
    else{}
}

module top(){
    fan_holes=((fan_size/100)*80)/2;
    fan_hole=full_embed=="yes"&&(fan_size==25||fan_size==30) ? (fan_size/100)*90:(fan_size/100)*96;
    difference(){
        union(){
            difference(){
                union(){
                    difference(){
                        union(){
                            if(bevel=="yes"){
                                translate([0,model=="pi3a" ? 10:0,2.975]){
                                    difference(){
                                        union(){
                                            // Outer
                                            minkowski(){
                                                linear_extrude(8)  square([(59),(model=="pi3a" ? 68:88)], center=true);
                                                sphere(3);
                                            }
                                        }
                                        // Flatten the top
                                        translate([0,0,5]) linear_extrude(10) square([69,model=="pi3a" ? 78:98], center=true);
                                    }
                                }
                            }
                            else{
                                // Case
                                translate([0,model=="pi3a" ? 10:0,0]){
                                    // Outer
                                    linear_extrude(8) offset(3) offset(-3) square([(65),(model=="pi3a" ? 74:94)], center=true);
                                }
                            }
                            // Lip
                                  translate([0,model=="pi3a" ? 10:0,3]) linear_extrude(6.5) offset(3) offset(-3)  square([62-0.4,model=="pi3a" ? 71-0.4:91-0.4], center=true);
                        }
                    }
                    if(corners=="yes"){
                        // Corners
                        translate([0,model=="pi3a" ? 10:0,0]) linear_extrude(8) for(X=33*[-1,1], Y=model=="pi3a" ? 36*[-1,1]:46*[-1,1]) translate([X,Y,-1])  circle(d=11);
                    }
                    else{}
                }
                if(corners=="yes"){
                    // Corner screw holes
                    translate([0,model=="pi3a" ? 10:0,0]){
                        for(X=33*[-1,1], Y=model=="pi3a" ? 36*[-1,1]:46*[-1,1]){
                            translate([X,Y,0]) linear_extrude(8) circle(d=3.6);
                            translate([X,Y,full_embed=="yes" ? 3+(layer_height*4):1.5+(layer_height*4)])  cylinder(d1=4, d2=3.6, h=5-(layer_height*4));
                        }
                    }
                    // Corner screw embeds
                    translate([0,model=="pi3a" ? 10:0,0]) for(X=33*[-1,1], Y=model=="pi3a" ? 36*[-1,1]:46*[-1,1]){
                        translate([X,Y,-1])  cylinder(d=6, h= full_embed=="yes" ? 4:2.5);
                        translate([X,Y, full_embed=="yes" ? 3:1.5]){
                            linear_extrude(layer_height*2) square([4,4.45], center =true);
                            linear_extrude(layer_height*4) square([4,4], center=true);
                        }
                    }
                }
                else{}
                // Hollow out
                if(bevel=="yes"){
                    translate([0,model=="pi3a" ? 10:0,5]){
                        minkowski(){
                            linear_extrude(8)  square([59-5.5,model=="pi3a" ? 68-5.5:88-5.5], center=true);
                            sphere(3);
                        }
                    }
                }
                else{
                    translate([0,model=="pi3a" ? 10:0,2]) linear_extrude(8) offset(3) offset(-3) square([59,model=="pi3a" ? 68:88], center=true);
                }
                if(fan=="yes"&&dc_text=="no"){
                    translate([gpio=="yes" ? 4:0,model=="pi3a" ? 14:10,0]){
                        // Fan Hole
                        translate([0,0,1]) linear_extrude(5) circle(d=fan_hole);
                        // Holes for mesh
                        grill = (fan_size / 1.1) / (fan_size / 8) - 1.5;
                        x = (grill * 0.75 + 1.5 * sqrt(3) / 2);
                        y = (grill / 2 * sqrt(3) + 1.5);
                        translate([0,0,-0.1]){
                            intersection(){
                                cylinder(d=fan_hole,h=1+1,center=false);
                                translate([-16.9, -19.5, 0])
                                for(i = [0 : fan_size / 8 * (fan_size==40?1.25:fan_size==30?1.5:2)]){
                                    for(j = [0 : fan_size / 8 * (fan_size==40?1.25:1.5)]){
                                        translate([x * i, y * (j + 0.5 * (i % 2)), 0])
                                        linear_extrude(2) circle(d = grill, $fn = 6);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if(corners=="yes"){}
            else{
                difference(){
                    union(){
                        translate([0,10,0]){
                            // Stand offs
                            for(X=24.5*[-1,1], Y=29*[-1,1]) {
                                translate([X,Y,0]) cylinder(h=28.2, r1=5, r2=3);
                            }
                        }
                    }
                    // Screw holes
                    translate([0,10,20]){
                        linear_extrude(10) for(X=24.5*[-1,1], Y=29*[-1,1]) {
                            translate([X,Y,0]) circle(d=screw_hole);
                        }
                    }
                }
            }
            if(full_embed=="yes"&&fan=="yes"){
                                translate([0,0,2]) fan_test();
                            }
                            else{}
        }
        if(add_text=="yes"&&dc_text=="no"){
            translate([model=="pi3a"&&gpio=="yes" ? 4:0,model=="pi3a" ? -14:-30,0]){
                translate([move_x,move_y,0])text_();
            }
        }
        if(fan=="yes"){
            // Fan screw embeds
            translate([gpio=="yes" ? 4:0,model=="pi3a" ? 14:10,0]){
                if(full_embed=="yes"){
                    for(X=fan_holes*[1,-1], Y=fan_holes*[1,-1]){
                        translate([X,Y,0]) cylinder(d=3.6, h=3);
                        translate([X,Y,0]) cylinder(d=6, h=3);
                    }
                    for(X=fan_holes*[-1], Y=fan_holes*[1], R=45){
                        translate([X,Y,3]) rotate([0,0,R]){
                            linear_extrude(layer_height*2) square([4.75,3.6], center =true);
                            linear_extrude(layer_height*4) square([3.6,3.6], center=true);
                        }
                    }
                    for(X=fan_holes*[1], Y=fan_holes*[-1], R=45){
                        translate([X,Y,3]) rotate([0,0,R]){
                            linear_extrude(layer_height*2) square([4.75,3.6], center =true);
                            linear_extrude(layer_height*4) square([3.6,3.6], center=true);
                        }
                    }
                    for(X=fan_holes*[1], Y=fan_holes*[1], R=-45){
                        translate([X,Y,3]) rotate([0,0,R]){
                            linear_extrude(layer_height*2) square([4.75,3.6], center =true);
                            linear_extrude(layer_height*4) square([3.6,3.6], center=true);
                        }
                    }
                    for(X=fan_holes*[-1], Y=fan_holes*[-1], R=-45){
                        translate([X,Y,3]) rotate([0,0,R]){
                            linear_extrude(layer_height*2) square([4.75,3.6], center =true);
                            linear_extrude(layer_height*4) square([3.6,3.6], center=true);
                        }
                    }
                }
                else{
                    for(X=fan_holes*[-1,1], Y=fan_holes*[-1,1]) translate([X,Y,-1]){
                        cylinder(d1=8, d2=3.6, h=3.5);
                    }
                }
            }
        }
        if(gpio=="yes"){
            // GPIO cutout
            translate([-24.4,10,-1]) linear_extrude(27.2) square([8,52], center=true);
        }
        else{}
    }
}

module fan_test(){
    fan_holes=((fan_size/100)*80)/2;
    fan_hole=full_embed=="yes"&&(fan_size==25||fan_size==30) ? (fan_size/100)*90:(fan_size/100)*96;
    translate([gpio=="yes" ? 4:0,model=="pi3a" ? 14:10,0]){
        difference(){
            union(){
                translate([0,0,0]) linear_extrude(3) offset(2) offset(-2) square([fan_size/100*110,fan_size/100*110], center=true);
            }
            translate([0,0,-0.1])linear_extrude(15) circle(d=fan_hole);
            for(X=fan_holes*[1,-1], Y=fan_holes*[1,-1]){
                translate([X,Y,0]) linear_extrude(20) circle(d=3.6);
            }
        }
    }
}

module dc_text(){
    intersection(){
        translate([model=="pi3a"&&gpio=="yes" ? 4:0,model=="pi3a" ? -14:-30,0]){
            translate([move_x,move_y,0])text_();
        }
        top();
    }
}

module vesa(){
    difference(){
        union(){
            // VESA base
            for(r=45*[-1,1]){
                rotate([0,0,r]) linear_extrude(2.3) offset(10.25) offset(-10.24) square([20.5,160], center=true);
            }
        }
        // lid/board screw holes
        if(corners=="yes"){}
        else{
            // Screw embeds
            translate([0,model=="pi3a" ? 0:10,-0.5]){
                for(X=24.5*[-1,1], Y=29*[-1,1]){
                    translate([X,Y,0]) linear_extrude(3) circle(d=6.8);
                }
            }
        }
        // VESA 100 mount holes
        for(x=50*[-1,1], y=50*[-1,1]){
            translate([x,y,-1]) linear_extrude(4) circle(d=5);
            translate([x,y,1]) linear_extrude(2) circle(d=9);
        }
        // VESA 75 mount holes
        for(x=37.5*[-1,1], y=37.5*[-1,1]){
            translate([x,y,-1]) linear_extrude(4) circle(d=5);
            translate([x,y,1]) linear_extrude(2) circle(d=9);
        }
        // Hollow out
        translate([0,model=="pi3a"&&corners=="yes" ? 10:0,2]) linear_extrude(30) offset(3) offset(-3) square([60,model=="pi3a" ? 68:88], center=true);
    }
}


module screwtest(){
    difference(){
        union(){
            linear_extrude(2) offset(3) offset(-3) square([26,26], center=true);
            // Stand offs
            linear_extrude(18.2) for(X=10*[-1,1], Y=10*[-1,1]) {
                translate([X,Y,0]) circle(d=6);
            }
        }
        // Screw holes
        translate([0,0,10]){
            linear_extrude(27.2) for(X=10*[-1,1], Y=10*[-1,1]) {
                translate([X,Y,0]) circle(d=screw_hole);
            }
        }
    }
}

module nut_trap(){
    difference(){
        union(){
            translate([32.5-33+5,0,1]) rotate([0,35,0]) linear_extrude(10) square([5,8.75], center=true);
            translate([5,1,0]) rotate([0,0,19.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
            translate([5,-1,0]) rotate([0,0,-19.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
            translate([3.75,0,0]) linear_extrude(3.5) square([4.5,5.8], center=true);
            translate([0,0,0]) linear_extrude(3.5)circle(d=6.7, $fn=6);
            translate([0,0,3.5]){
                linear_extrude(layer_height*2) square([3.6,5.8], center =true);
                linear_extrude(layer_height*4) square([3.6,3.6], center=true);
            }
        }
        translate([3.9,6.2051,0]) rotate([0,0,19.5]) linear_extrude(10) square([5,5.0475], center=true);
        translate([3.9,-6.2051,0]) rotate([0,0,-19.5]) linear_extrude(10) square([5,5.0475], center=true);
        translate([7,0,-5]) linear_extrude(5) square([3,10], center=true);
    }
}

module text_(){
    rotate([0,0,rotate_]){
        if(line2==""){
            translate([0,0,1]) rotate([0,180,0]) linear_extrude(1) text(line1, text_size, font, halign="center", valign="center");
        }
        else{
            translate([0,5+spacing,1]) rotate([0,180,0]) linear_extrude(1) text(line1, text_size, font, halign="center", valign="center");
            translate([0,-5-spacing,1]) rotate([0,180,0]) linear_extrude(1) text(line2, text_size, font, halign="center", valign="center");
        }
    }
}