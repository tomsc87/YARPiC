// Hello, you lovely people. I added some more features to my Yet Another Raspberry Pi Case (YARPiC), and decided to release a customizable source code for you. 

// To make it as simple as possible, I've split it into two parts: 1) a customizer (../yarpic_customizer.scad), and 2) another file that does all the hard work (this file). If I've done my job correctly, you shouldn't need to touch the latter (and see how much of a mess my coding is).

// Anyway, I hope you find this easy to use and post your makes to Thingiverse. If you have any comments, complaints, or suggestions, feel free to leave a comment (here: https://www.thingiverse.com/thing:3464513).

// DON'T TOUCH!! Important maths stuff. DON'T TOUCH!!

// I wouldn't touch the rest either if I were you... it's a complete mess.

    if((rail=="yes")&&(corners=="yes")){
    translate([0,12,0]) linear_extrude(2) text("Turn off either rail or corners.", halign="center", valign="center"); 
        }
else{}

    if((rail=="yes")&&(vesa=="yes")){
    translate([0,0,0]) linear_extrude(2) text("Turn off either rail or vesa.", halign="center", valign="center"); 
        }
else{}

if(part=="both"||part=="bottom"){
        if((rail=="yes")&&(corners=="yes"||vesa=="yes")||(dc_text=="yes")||(screwtest=="yes")){}
        else{
bottom();
        }
}
else {}

if(part=="both"||part=="top"){
        if((rail=="yes")&&(corners=="yes"||vesa=="yes")||(dc_text=="yes")||(screwtest=="yes")){}
        else{
top();
        }
}
else {}

if(dc_text=="yes"){
    if(screwtest=="yes"){}
    else{
dc_text();
        }
    }
else {}

if((vesa=="yes")&&(part=="both"||part=="bottom")){
        if((rail=="yes")&&(corners=="yes"||vesa=="yes")||((dc_text=="yes"))||(screwtest=="yes")){}
        else{
vesa();
        }
}
else {}

if(screwtest=="yes"){
    
screwtest();
        }
else {}

module bottom(){
    translate ([50,0,0]){
        difference(){
            union(){ // UNION 1
                difference(){
                    union(){ // UNION 2
                        difference(){
                            union(){ // UNION 3
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
                                if(rail=="yes"){
                                    difference(){
                                        union(){
                                            translate([31,0,0]) linear_extrude(21) square([3,120], center=true);
                                        }
                                        for (y=55*[1,-1]) translate([33.5,y,10.5]) rotate([0,-90,0]) linear_extrude(10) circle(d=3.5);
                                        }
                                    }
                                    else {}
                                }
                                //END OF UNION 3
        // Rear holes for airflow
                                if(cooling_slots=="yes"){
                                    rotate([90,0,0]) translate([0,14,-48]){
                                        linear_extrude(6) for(X=3.25*[-1,1,-3,3,-5,5,-7,7], Y=2.5) translate([X,Y,-1]) offset(1) offset(-1) square([4,15], center=true);
                                        }
                                    }
                                    else{}
  
    if( plain_base=="yes")
    {}
    else
    {
                                    if(pi4=="yes"){
                                        // RJ-45 port
                                        translate([17.75,-45,6.5]) linear_extrude(14.5) square([17,16], center=true);
                                        // USB port
                                        translate([-10,-45,6.7]){
    for(x=-9*[1,-1])
    {
        translate([x,0,0]) linear_extrude(17) square([16.5,16], center=true);
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
    translate([-35.75,11,6]){
       minkowski(){ linear_extrude(8.5) square([4,55], center=true);
           sphere(3);
       }
   }
    }
else {    
    // RJ-45 port
    translate([-17.75,-45,6.5]) linear_extrude(14.5) square([17,16], center=true);
    // USB port
        translate([10,-45,6.4]){
    for(x=9*[1,-1])
    {
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
    translate([-35.75,11,6]){
       minkowski(){ linear_extrude(12) square([4,55], center=true);
           sphere(3);
       }
   }
}
}
    }
   if(corners=="yes")
   {
       // Corners
       translate([0,0,0]) linear_extrude(27) for(X=33*[-1,1], Y=46*[-1,1]) translate([X,Y,-1]) circle(d=corner_od);
   }
   else{}
   }
   //END OF UNION2

    
    if(pi4=="yes" &&  plain_base!="yes" ){
            // Front cutout
    translate([-0.5,-(88)/2,6.5]) linear_extrude(20) square([55,3], center=true);
    }
    else{}
    
        // Hollow out for lid
    if( plain_base!="yes")
    {

    translate([0,0,25.25]) linear_extrude(10) offset(3) offset(-3) square([62,91], center=true);
    }


 if(bevel=="yes"){
        // Cut off top
    translate([0,0,27]) linear_extrude(9) square([79,118], center=true);
        // Hollow out
    minkowski(){
    translate([0,0,5]) linear_extrude(30) square([59-5.5,88-5.5], center=true);
                sphere(3);
            }
        }
        else {
            translate([0,0,2]) linear_extrude(30) offset(3) offset(-3) square([59.5,88.5], center=true);
        }
    
       if(corners=="yes"){
        for(X=33*[-1,1], Y=46*[-1,1]){
            translate([X,Y,23.5+(layer_height*4)]) cylinder(d1=3.6,d2=3.6+1.6,h=5);
            translate([X,Y,15]) cylinder(d1=3.6,d2=3.6+1.6,h=5);
    
            // Corner Screw holes
            //translate([X,Y,15-1]) 
            translate([X,Y, corners_through=="yes" ? -1 :15-1]) 
            linear_extrude(corners_through="yes" ? 35: 20 ) #circle(d= corner_screw_d);
            
            // New nut trap
        translate([33,Y,17.5]) nut_trap();
        translate([-33,Y,17.5]) rotate([0,0,180]) nut_trap();
    }
        }
    else{}

    }
    
    if ( plain_base!="yes" )
    {
        // Stand offs 
    translate([0,10,1.9]){
        for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) cylinder(d1=9, d2=6, h=3.4);
        }
       }
   }
}  //END OF UNION 1

if ( plain_base!="yes" )
    {
       if(corners=="yes"){
        // Screw holes in the lower standoff
           translate([0,10,3]){
               linear_extrude(3)
               for(X=24.5*[-1,1], Y=29*[-1,1]) {
                    translate([X,Y,0]) circle(d=screw_hole);
        }
   }
   }
else {
    translate([0,10,1.8]){
        // Screw holes for base (through the bottom)
        linear_extrude(4.9) for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) circle(d=bottom_pi_screw_d);
        }
   }
   }
   
       //  Bottom screw hole taper
  translate([0,10,1.9]){
      for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) cylinder(d1=7.1, d2=3, h=2.5);
        }
   }
       // Bottom screw hole taper
       translate([0,10,-0.5]){
       for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) cylinder(d1=7, d2=7, h=2.475);
        }
   
    }
   
   }
if ( plain_base!="yes" )   
{
if(sd_card=="yes"  ){
    // microSD card slot
    translate([0,51,-1]) linear_extrude(7.7) square([15,21], center=true);
}
else{
    translate([0,43.5,3]) linear_extrude(4.5) square([15,3.5], center=true);
}
}
}
}
}

module top(){
fan_holes=((fan_size/100)*80)/2;
fan_hole=(fan_size/100)*95;
    translate ([-50,0,0]){
        difference(){
            union(){
difference(){
    union(){
        difference(){
            union(){
           if(bevel=="yes"){
               // Outer
     translate([0,0,2.975]){
         difference(){
             union(){
        minkowski(){
           linear_extrude(8)  square([(59),(88)], center=true);
            sphere(3);
        }
    }
    translate([0,0,5]) linear_extrude(10) square([69,98], center=true);
}
// Inner
difference(){
    union(){
        minkowski(){
    linear_extrude(9.5)  square([55.5,85.5], center=true);
            sphere(3);
        }
    }
    translate([0,0,6.5]) linear_extrude(10) square([69,98], center=true);
}
    }
}
    else{               
        // Case
        linear_extrude(8) offset(3) offset(-3) square([(65),(94)], center=true);
    linear_extrude(9.5) offset(3) offset(-3)  square([62-0.5,91-0.5], center=true);
    }
                }
}
       if(corners=="yes"){
           // Corners
    translate([0,0,0]) linear_extrude(8) for(X=33*[-1,1], Y=46*[-1,1]) translate([X,Y,-1])  circle(d=corner_od);
    }
    else{}
    
    }
       if(corners=="yes"){
    // Corner screw holes
    translate([0,0,0]) linear_extrude(9) for(X=33*[-1,1], Y=46*[-1,1]) translate([X,Y,-1])  circle(d=corner_screw_d);
        
    // Corner screw embeds
        translate([0,0,0]) for(X=33*[-1,1], Y=46*[-1,1]) translate([X,Y,0])  cylinder(d1=7,d2=3.6,h=3);
    }
    else{}

    // Hollow out
    
            if(bevel=="yes"){
                translate([0,0,5]) {
                minkowski(){
    linear_extrude(8)  square([59-5.5,88-5.5], center=true);
                    sphere(3);
                }
        }
    }
        else{
                translate([0,0,2]) linear_extrude(8) offset(3) offset(-3) square([59,88], center=true);
            }
    
if(fan=="yes"){
    translate([gpio=="yes" ? 4:0,10,0])
     {
          // Fan Hole 
          translate([0,0,fan_grill_thickness])
          linear_extrude(5) circle(d=fan_hole);
          
            // Holes for mesh

    grill = (fan_size / 1.1) / (fan_size / 8) - 1.5;
    x = (grill * 0.75 + 1.5 * sqrt(3) / 2);
    y = (grill / 2 * sqrt(3) + 1.5);
    translate([0,0,-0.1])
    intersection()
    {
         cylinder(d=fan_hole,h= fan_grill_thickness+1,center=false);
    translate([-45/2, -45.5/2, 0])
    for(i = [0 : fan_size / 8 * 2])
    {
        for(j = [0 : fan_size / 8 * 2])
        {
                translate([x * i, y * (j + 0.5 * (i % 2)), 0])
                    linear_extrude(fan_grill_thickness +1) circle(d = grill, $fn = 6);
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
        // Stand offs in top
              for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) cylinder(h=28.2, r1=5, r2=3);
              }
}
}
        // Screw holes in (top) standoffs
    translate([0,10,20]){
        linear_extrude(10) for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) circle(d=screw_hole);
        }
   }
   }
}   
}
        if(add_text=="yes"){
        if(flip_text=="yes"){
        if(line2==""){
        translate([0,-30,1]) rotate([0,180,180]){ linear_extrude(2) text(line1, text_size, font, halign="center", valign="center");
    }
}
else{
            translate([0,-35,1]) rotate([0,180,180]){ linear_extrude(2) text(line1, text_size, font, halign="center", valign="center");
    }
        translate([0,-25,1]) rotate([0,180,180]){ linear_extrude(2) text(line2, text_size, font, halign="center", valign="center");
    }

}
}
else {
            if(line2==""){
        translate([0,-30,1]) rotate([0,180,0]){ linear_extrude(2) text(line1, text_size, font, halign="center", valign="center");
    }
}
            else{
        translate([0,-25,1]) rotate([0,180,0]){ linear_extrude(2) text(line1, text_size, font, halign="center", valign="center");
    }
        translate([0,-35,1]) rotate([0,180,0]){ linear_extrude(2) text(line2, text_size, font, halign="center", valign="center");
        }
    }       
}
}
if(fan=="yes"){
            if(gpio=="yes"){
        // Fan screw embeds
    translate([4,10,-0.25]) for(X=fan_holes*[-1,1], Y=fan_holes*[-1,1]) translate([X,Y,-1])  cylinder(d1=8, d2=3.6, h=3.5);
    }
else {

        // Fan screw embeds
    translate([0,10,-0.25]) for(X=fan_holes*[-1,1], Y=fan_holes*[-1,1]) translate([X,Y,-1])  cylinder(d1=8, d2=3.6, h=3.5);
    }
}
// JUST do gpio slot once here
   if(gpio=="yes"){
       // GPIO cutout
       translate([-24.4,10,-1]) linear_extrude(27.2) square([8,52], center=true);
   }
   else{}
}
}
}
module dc_text(){
    translate([-50,0,0]){
            intersection(){
    color("Teal", 1){
        if(add_text=="yes"){
        if(flip_text=="yes"){
        if(line2==""){
        translate([0,-30,1]) rotate([0,180,180]){ linear_extrude(1) text(line1, text_size, font, halign="center", valign="center");
    }
}
else{
            translate([0,-35,1]) rotate([0,180,180]){ linear_extrude(1) text(line1, text_size, font, halign="center", valign="center");
    }
        translate([0,-25,1]) rotate([0,180,180]){ linear_extrude(1) text(line2, text_size, font, halign="center", valign="center");
    }

}
}
else {
            if(line2==""){
        translate([0,-30,1]) rotate([0,180,0]){ linear_extrude(1) text(line1, text_size, font, halign="center", valign="center");
    }
}
            else{
        translate([0,-25,1]) rotate([0,180,0]){ linear_extrude(1) text(line1, text_size, font, halign="center", valign="center");
    }
        translate([0,-35,1]) rotate([0,180,0]){ linear_extrude(1) text(line2, text_size, font, halign="center", valign="center");
}
}
}
}
}
           if(bevel=="yes"){
               // Outer
     translate([0,0,2.975]){
        minkowski(){
           linear_extrude(8)  square([59,88], center=true);
            sphere(3);
        }
}
}
else{
            linear_extrude(8) offset(3) offset(-3) square([65,94], center=true);
}

}
}
}
module vesa(){
        translate ([50,0,0]){
difference(){
    union(){
        // VESA base
        for(r=45*[-1,1]){
            rotate([0,0,r]) linear_extrude(2.3) offset(10.25) offset(-10.24) square([20.5,160], center=true);
        }
}
    // lid/board screw holes
       if(corners=="yes"){}
       else {
    // Stand offs
       translate([0,10,-0.5]){
        linear_extrude(3) for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) circle(d=7);
        }
   }
              // Screw holes
   translate([0,10,0]){
        linear_extrude(6.3) for(X=24.5*[-1,1], Y=29*[-1,1]) {
            translate([X,Y,0]) circle(d=3.2);
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
    translate([0,0,2]) linear_extrude(30) offset(3) offset(-3) square([60,88], center=true);
}
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
                    translate([5,1,0]) translate([0,0,0]) rotate([0,0,16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                    translate([5,-1,0]) rotate([0,0,-16.5]) linear_extrude(3.5) square([4.5,5.5], center=true);
                
                    translate([3.75,0,0]) linear_extrude(3.5) square([4.5,6], center=true);
            translate([0,0,0]) linear_extrude(3.5)circle(d=6.93, $fn=6);
                    translate([0,0,3.5]){
    linear_extrude(layer_height*2) square([3.6,6], center =true);
    linear_extrude(layer_height*4) square([3.6,3.6], center=true);
                    }
                }
                translate([4,0+6.204,0]) rotate([0,0,16.5]) linear_extrude(10) square([5,5.0475], center=true);
                translate([4,0-6.204,0]) rotate([0,0,-16.5]) linear_extrude(10) square([5,5.0475], center=true);

    }
}
