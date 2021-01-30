[UPDATE: 30/01/2021]

Okay, I lied. This really will be the final update of January 2021 (and for a while).

<ul>
<li>Added the option for double fans (some restrictions apply), which was suggested by Thingiverse user <a href="https://www.thingiverse.com/muga/" target="_blank">Muga</a>.</li>
<li>Changed the camera cutout slightly (you can't have it when you have double fans).</li>
</ul>

That's it. No more updates until my big overhaul.

[UPDATE: 28/01/2021]

This should be the final update of January 2021 (and for a while).

Here's what's changed:

<ul>
<li>Moved all hinge parts into modules.</li>
<li>Created a test part for hinge so you can dial in horizontal expansion settings without having to print out a whole case.</li>
<li>Refined hinge slightly.</li>
<li>Added cutout for camera ribbon cable. (Suggested by Thingiverse user <a href="https://www.thingiverse.com/gregkster/designs" target="_blank">Gregkster</a>.)</li>
<li>Updated .json file.</li>
</ul>

Future updates will come few and far between. I have some ideas; however, they'll take some time and will likely require a complete redesign.

[UPDATE: 25/01/2021]

Today, I bring you the long-awaited hinged cover for the microSD card slot. It's still experimental, and you may need to adjust your horizontal expansion settings in your slicer software. It is rather slap-dash at the moment, so it increases render times by between 20 and 25% compared with the "Open" option, but I will refine it over time.

Here are all the changes:

<ul>
<li>Changed sd_card options to include the hinged cover. ("Yes" is now "Open", "No" is now "Closed", and added "Cover (experimental)" for the hinged cover.)</li>
<li>Updated the .json file.</li>
<li>Minor bug fixes.</li>
</ul>

In the next update, I hope to refine the microSD card cover enough so you can print out a test of it without having to waste time and material by printing out a full case to get your horizontal expansion settings dialled in. I might also add an option for a camera ribbon cable cutout in the top of the case as well as camera mounting options; however, they're low on my priorities list right now.

[UPDATE: 21/01/2021]

Just a small update, with no new features, but tidied up the code.

Here are the changes:

<ul>
<li>Ports for different models merged together. (Using mostly inline conditionals, but some nested conditionals where needed.)</li>
<li>Moved front and side ports into separate modules. (So you don't have to render ports twice when new_io is set to "yes".)</li>
<li>Using inline conditional for building the main body of bottom() instead of nested conditional. (Had already done this for top(), but never got round to doing it for bottom().)</li>
</ul>

In all, 109 lines of code have been removed in this update.

Still working on a hinged cover for the microSD card. Might commit that to a new branch tomorrow.

[UPDATE: 13/01/2021]

It's been a crazy 9 months. Happy new year. Hope you're all doing well. Most of my time was spent doing nothing with YARPiC; however, over the last 2 months, YARPiC has gone through quite a few revisions that I've been too busy to finalize and upload (or "commit" as I think I recall it being known as on the GitHubs).

Anyway, here are the changes:

<ul>
<li>Option of a deeper side cutout to give better clearance to HDMI (because the Pi has to go in sideways with this option, I've added a cutout at the back when sd_card option is set to "no" to give clearance; if sd_card option is set to "yes", you can just insert the microSD card after installing the board) (only tested on Pi4B with corners option set to "yes"; might be some clearance problems with Pi3A and Pi3B with corners option set to "no" (I've tried to mitigate it, but, again, I haven't tested it)).</li>
<li>Tapered board screw holes when corners option set to "yes" to better guide screws.</li>
<li>(Almost) complete freedom to manipulate text; text can be moved anywhere and rotated any amount (in 0.5 degree increments); spacing between two lines of text can be increased or decreased; text can even be printed in the fan grill, but it won't cover the screw holes.</li>
<li>Added option for rail mounting from rear (SD card side) of the case for better clearance when mounting to Prusa i3 printers.</li>
<li>Option for cooling slots along the GPIO side of the case, as well as both the SD card side and GPIO side (untested).</li>
</ul>

I think that's everything that's been changed. Might have moved the USB and ethernet slightly, but nothing major. Oh, and I finally got round to sorting out the indents (that was a pain in the arse).

In the next update, I'll probably just tidy up the ports, which should get rid of between 50 and 70 lines of code. I was also working on a hinged cover for the microSD card; however, it was getting a bit too demanding, so I put that on hold; maybe that will be in the next update as well.

[UPDATE: 21/04/2020]

Small update. Here's the changes:

<ul>
<li>Removed the restriction for rail and corners together.</li>
<li>Added embedded screw hole to the rail.</li>
<li>Added new corner/rail combination to examples.</li>
<li>Changed the lip on the top of case so it no longer uses the Minkowski function (cuts about 2 seconds off the render time).</li>
</ul>

[UPDATE: 12/04/2020]

All the customizability you've come to expect from YARPiC, but now in a smaller form factor. Here's what's new:

<ul>
<li>Added support for the Raspberry Pi 1 Model A+ and 3 Model A+.</li>
<li>Lots of translates to make A+ work smoothly.</li>
<li>Added option to fully embed screws on fans and/or corners.</li>
<li>Removed most unused code.</li>
<li>Tidied up code (especially most of the misplaced indents caused by commenting out sections of code).</li>
</ul>

As always, feedback would be much appreciated.

[UPDATE: 30/03/2020]

Minor update.

<ul>
<li>Merged part translates from "touchscreen" branch because they're cleaner.</li>
<li>Merged GPIO/fan translate from mkgin's fork because it helps remove redundant code.</li>
</ul>
</ul>

[UPDATE: 12/03/2020]

Another small update.

<ul>
<li>Redesigned nut trap for corners.</li>
<li>Fixed corner impinging on front cutout for Pi4.</li>
</ul>

[UPDATE: 09/03/2020]

Just a small update. I've tweaked the edge_detection function for "dc_text" and made it default. It doubles render times for dc_text (when set to bevelled), but that comes out at 6 seconds (much better than the 38 seconds in the last update). Unfortunately, when bevel is set to "no", it comes out at 16 seconds for reasons that I don't fully understand because it's completely illogical (it's still better than 38 seconds). As a result, if your text doesn't extend beyond the edge of the case, I recommend rendering dc_text with bevel set to "yes", even if you don't have bevel enabled on the case.

[UPDATE: 08/03/2020]

Lots of changes in this update.

<ul>
<li>Bevelled side cutout (power, HDMI, audio) to make printing easier.</li>
<li>Larger micro HDMI cutouts for Pi 4.</li>
<li>Option to remove access to SD card (suggested by @<a href="https://www.thingiverse.com/mikegi/about" target="_blank">mikegi</a>).</li>
<li>Moved corner nut housing up a bit (M3*16 bolts can be used instead of M3*20), made slightly wider (so nuts fit in better), and added a hexagon (so it holds nuts in place better).</li>
<li>Added supports for corner nut housing roof (can easily be removed in post processing with side cutters or a craft knife).</li>
<li>Added a full layer above corner nut housing as support for screw hole (can easily be removed in post processing with a drill, file, or even just a screw if you're lazy (like me)). (Can be adjusted for different layer heights.)</li>
<li>New embedded screw holes on top of case with corners set to "yes". (I.e. no more need for supports.)</li>
<li>screw_hole variable now sets the screw hole size for the stand offs when corners is set to "yes". (Was overlooked before because I never print with corners any more.)</li>
<li>Dual colour text edge detection. Now the text can extend beyond the edge of the case and dc_text will conform to it. (<strike>Must be set manually because it drastically increases render times.</strike>)</li>
<li>Minor code refinements to help reduce render times.</li>
</ul>

I think that's all the changes in this update.

Again, Thingiverse isn't giving out the correct file in the main download, so go to Thing Files and download YARPiC_March_2020.zip to get the most recent version.

[ORIGINAL]

I couldn't find a Raspberry Pi case that I liked or that met my needs, so I made one myself.

My basic requirements were:
<ul>
<li>Could house an Asus Tinker Board with stock heatsink</li>
<li>Could house a 40*40*10 fan as well</li>
<li>Used nuts and bolts (since clip together cases always break)</li>
<li>Not too thin and flexible (too many cases on here have, like, 0.5mm thick surfaces, which is just too flexible)</li>
<li>Could fit my chunky Amazon Basic USBs</li>
<li>Didn't look like it was trying to be a retro console (the most important thing)</li>
</ul>

After a couple of hours in OpenSCAD and a few prototypes later, I give you YARPiC.

To properly use it, you will need:
<ul>
<li> 4 x M3*16 bolts (for the fan)</li>
<li> 4 x M3*20 bolts (for the lid)</li>
<li> 8 x M3 nuts (for the fan and lid)</li>
<li> 4 x M2.5*5 screws (for the board)</li>
<li> 1 x Raspberry Pi (1 B+, 2 B, 3 B, 3 B+) or Tinker Board (or any SBC with the same form factor)</li>
<li> 1 x 40*40*10mm fan (ideally 5V; I went for the Noctua one)</li>
</ul>

Tree supports in Cura are awesome, but they're not perfect, so you might need to tidy up the nut housing; I used a craft knife, small circular file, and a pair of tweezers to get it looking nice.

[UPDATE: 15/03/2019]

I've included a customizable OpenSCAD file, so you can customize YARPiC to your needs.

What you can now do:
<ul>
<li>Change fan size.</li>
<li>Add slot for GPIO.</li>
<li>Bevel the edges.</li>
<li>Add exhaust slots.</li>
<li>Add embedded text.</li>
<li>Add dual colour text.</li>
<li>Change wall size.</li>
<li>Render bottom, top, and text separately.</li>
</ul>

If you have any questions, complaints, or suggestions, feel free to leave a comment.

[UPDATE: 19/03/2019]

I wanted to mount this case to my printer because I wasn't happy with the case I had. As a result, I had to find a way to add a V-slot rail to it, which meant I had to get rid of the corner screws and find another way to fix the lid in place. Thus, I give you "YARPiC No Corners". This is the intermediary stage (without the V-slot rail), and a preview of things to come.

What you'll need:
<ul>
<li>4 x M3*16 bolts (for the fan)</li>
<li>4 x M3 nuts (for the fan)</li>
<li>4 x M2.5*8 screws</li>
<li>Raspberry Pi</li>
<li>40*40*10mm 5V fan</li>
</ul>

Again, you will need to slice with supports (ideally tree supports in Cura) so that the embedded screw holes don't collapse when printing.

In the coming days, I will add the alterations to the customizer so you can add text, change fan size, add V-slot rail etc.

[UPDATE: 23/03/2019]

As promised, here's the updated version of the YARPiC customizer so you can make YARPiC without the corner screw holes.

Here's what's new:
<ul>
<li>Option to remove the corner screw holes and add through-board screws for the top.</li>
<li>Add V-slot mounting rail for 3D printers that use 2020, 2040, 4040 extrusion. (NOTE: V-slot cannot be used with corners.)</li>
<li>Up to two lines of text.</li>
</ul>

Bug fixes:
<ul>
<li>Fixed bevelled edge with GPIO set to "yes".</li>
</ul>

As always, I hope you enjoy, and look forward to seeing your creations. If you have any questions, suggestions, or complaints, leave a comment. 
[UPDATE: 04/04/2019]

Did someone say "VESA mounts"? Okay, no one said "VESA mounts", but I decided to add them anyway.

Updates:
<ul>
<li>VESA mounts.</li>
</ul>

As always, if you have any complaints, comments, or suggestions, leave them in the comments.

[UPDATE: 02/04/2019]

Bug fix:
<ul>
<li>Increased the size of screw holes from 2.6mm to 3mm to reduce stress on (and subsequent breakage of) the top when "corners" is set to "No".</li>
<li>Fixed screw towers going through text on lid.</li>
</ul>

[UPDATE: 25/06/2019]

Added support for the new Raspberry Pi 4 Model B. This is untested. While I do have my Pi 4, all my printers are out of action at the moment. As a result, feedback would be greatly appreciated.

[UPDATE: 22/08/2019]

My main printer is working again, so I've been able to work on this again.

Change log:
<ul>
<li>Modified fan grill to decrease render time (by up to ~43%) and increase airflow (~6.5% better cooling)</li>
<li>Smaller power port when Pi4 is set to "No"</li>
<li>Deeper screw holes on the bottom </li>
<li>Modified top mounts to make them stronger</li>
<li>Added screw hole test</li>
</ul>

Things I still have to do:
<ul>
<li><strike>Rewrite the entirety of the top of the case because the code is a mess and drastically increases render times.</strike></li>
</ul>

[UPDATE: 25/08/2019]

I notices there was a problem with the standoffs breaking (caused by the deeper screw holes bug fix in the last update), so this is a quick bug fix for that.

Changes:
<ul>
<li>Changed diameter of standoffs from 6mm to 8mm to stop breakage. (Untested, but should work)</li>
</ul>

[UPDATE: 06/09/2019]

Right, I've done a massive overhaul. Here are the changes:

<ul>
<li>Removed the reliance on the third-party bevel library for the bevelled edge option</li>
<li>Fewer, larger cooling slots on the back to increase airflow slightly</li>
<li>Embedded screw holes that no longer need supports</li>
<li>Added cutout for easier insertion and removal of Pi4</li>
</ul>

I think that's all the changes. As always, feedback would be much appreciated.

[UPDATE: 18/09/2019]

I finally installed OpenSCAD 2019.05 and discovered the amazing Customizer in there, so I've made yarpic_customizer.scad compatible with that. I think it makes my code more of a mess, but it makes it easier to use with the built-in Customizer. And, with it, I've included a .json file with some pre-configured YARPiCs (including the one I use to test render times).

Speaking of render times, I've also tidied up the code in the maths/yarpic_model.scad file (removing redundant code that got added over time), resulting in ~38% faster render times (compared with the first Raspberry Pi 4 revision).

Also, I noticed a bug where the fan mesh stuck out the side of the case when "gpio" and "fan" were set to "yes", so I made the mesh smaller. Because of this, I didn't include an option for 50mm fan in the Customizer (although, you can add it manually), so the smaller mesh shouldn't be a problem (not that you can fit a 50mm fan in the case with "gpio" set to "yes" anyway (I'm not even sure a 50mm fan will fit in the case without "gpio" set to "yes" because I haven't tried it)).

Finally, I've made it so you cannot render the "screwtest" or "dc_text" with the case itself. Obviously, rendering "dc_text" with the case would defeat the purpose of having text (because it would fill in the text in the .stl). And the "screwtest" only takes 15 minutes to print and should be printed (and the "screw_hole" variable set correctly) before you print the case anyway.

Well, I think that's all the changes in this (hopefully final) revision.

If you notice any bugs, let me know in the comments section.

[UPDATE: 13/02/2020]

Just a small update with two changes:

<ul>
<li>Changed the V/T-slot. It now requires two M3 T-nuts and two M3x8 bolts. This makes it a lot stronger.</li>
<li>Reduced the default fragment number ($fn) from 50 to 24. It doesn't reduce detail too much, but halves the render time, so it's a worthy trade off. Of course, you can still set it whatever you like in the customizer.</li>
</ul>

Thingiverse is still giving out the 18th September 2019 update when you click "download all files", so, for the time being, go over to the "thing files" tab and download the "yarpic_customizer_2020.zip" file from there.
