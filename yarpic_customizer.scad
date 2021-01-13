// Hello, you lovely people. I added some more features to my Yet Another Raspberry Pi Case (YARPiC), and decided to release a customizable source code for you.

// To make it as simple as possible, I've split it into two parts: 1) a customizer (this document), and 2) another file that does all the hard work (maths/yarpic_model.scad). If I've done my job correctly, you shouldn't need to touch the latter (and see how much of a mess my coding is).

// Anyway, I hope you find this easy to use and post your makes to Thingiverse. If you have any comments, complaints, or suggestions, feel free to leave a comment (here: https://www.thingiverse.com/thing:3464513, or here: https://github.com/tomsc87/YARPiC).

include <maths/yarpic_model.scad>

/*[Main]*/

// Moves the ports around for different models.
model="pi3b"; //[pi3b:Paspberry Pi 1 B+/2 B/3 B/3 B+/Tinker Board,pi4:Paspberry Pi 4 B,pi3a:Paspberry Pi 1A+/3A+]

// Render both top and bottom, or just top or bottom.
part="both"; // [both:Both,bottom:Bottom,top:Top]

// For bevelled top and bottom edges. This seriously reduces performance, so change this last if you want bevelled edges.
bevel="no"; //[no:No,yes:Yes]

// This re-adds the corners from my original design and removes the through-board screw holes to hold the top in place. This cannot be used with the V-slot mounting rail.
corners="no"; //[no:No,yes:Yes]

// If using corners, set the layer height you plan to print at so a single layer gets printed above the nut housing as a base for the screw holes. You can use a drill or small circular file to remove it in post processing. If not using corners, this doesn't need to be set.
layer_height=0.2;

// Increase to add smoothness (slow render); decrease to reduce smoothness (fast render). Default is "24".
$fn=24;

/*[Bottom]*/

// Add cooling slots on the rear (microSD side) wall.
cooling_slots="no"; //[no:None,back:Back,side:Side,both:Both]

// Adds a 75*75 and 100*100 VESA mount to the bottom of the case. The 100*100 works with corners, but the 75*75 might be a bit close (I haven't actually tested it yet). Also, cannot be used with rail.
vesa="no"; //[no:No,yes:Yes]

// Adds mounting holes for 2020 aluminium (aluminum) extrusion V-slot so you can mount the case to a 3D printer that uses V-slots such as the Creality Ender 3, Geeetech A10(M)/A20(M)/A30(M), or Original Prusa i3 MK3(S).
rail="no"; //[no:None,side:Side,back:Back]

// Thingiverse user mikegi wanted the option to have the SD card covered, so here it is.
sd_card="yes"; //[yes:Yes,no:No]

// Moves the side I/O cutout in for better HDMI clearance. Also adds spacing at back if you have sd_card set to "no".
new_io="no"; //[no:No,yes:Yes]

/*[Top]*/

// Adds access to GPIO header through lid. This will also offset the fan slightly (if fan is enabled).
gpio="no"; //[no:No,yes:Yes]

// Adds fan hole on lid.
fan="no"; //[no:No,yes:Yes]

// Change fan size. It should work for any size fan (assuming it fits in the case); however, I've only tried it with the sizes that are listed. Input should be in millimetres between "25" and "40".
fan_size=40; //[25,30,40]

// This option allows you to fully embed the fan and/or corner screws for a cleaner look. (Might not work with 25mm fans.)
full_embed="no"; //[yes:Yes,no:No]

/*[Text options]*/

// Add text. Pretty obvious, right?
add_text="no"; //[no:No,yes:Yes]

// Whatever you put in the quotation marks will appear on the top of the case.
line1="YourTextHere1";

// Same as above. However, you can leave this blank for just a single line.
line2="YourTextHere2"; 

// Check "Help > Font List" to see all available fonts (try "Chiller"; it's my favourite). (I might add a dropdown font list in future revisions.)
font="";

// This is pretty obvious.
text_size=6.5; //[5:0.5:13]

// Rotate text allows you to have more than just 0 and 180 degrees on the text.
rotate_=0; // [-180:0.5:180]

// This moves the text up (positive) and down (negative). Movement is absolute (i.e. relative to the case, not the text itself), so rotation will have no impact on the location. Another thing to note is that the text can go through the fan grill, but not the fan holes.
move_y=0; // [-10:0.5:70]

// This moves the text left (positive) and right (negative). (Yes, the slider is inverted, but there's not a lot I can do about that.)
move_x=0; // [-10:0.5:10]

// This adjusts the spacing between the two lines of text.
spacing=0; //[-10:0.5:10]

// This adds a dual colour option for text. Obviously, you have to render this separately from everything else.
dc_text="no"; //[no:No,yes:Yes]

/*[Test]*/

// After changing hotend and nozzle on my printer, I was having problems with the screw holes for the top not being tight enough to grip the screws. Instead of printing out a new top every time, I made a test to get the right size.
// Print this out and then change the variable "screw_hole" if your screws are too tight (increase the variable) or too loose (decrease the variable) until the screws fit snugly.
screwtest="no"; //[no:No,yes:Yes]
screw_hole=2.75;