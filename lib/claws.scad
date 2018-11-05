/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Claws to hook into the camera body



*/


/* Claw dimensions [-------------------------------------------------------------- */

claw_width=10.11;
claw_depth = 5;
claw_height=5.92;
give = 2;


/* Claw modules [-------------------------------------------------------------- */

module claw(x,y,z, orientation) {
    
    translate([x,y,z]){
        rotate(a=[0,0, orientation]) {
            difference() {
                claw_coords = [claw_width,claw_depth,claw_height+z-give ];
                cube(claw_coords, center=true);
                translate([0,-1.5,-.6]){
                    
                    claw = [claw_width,claw_depth-3,claw_height+z-give];
                    cube(claw, center=true);
                    
                }
            }
        }
    }
}


module claws() {
 
    claw_x = outer_box_width/2-11.5;
    claw_y = 8 ; 

    claw(claw_x, -claw_y, box_height, -90);
    claw(claw_x, claw_y, box_height, -90);
    claw(-claw_x, -claw_y, box_height, 90);
    claw(-claw_x, claw_y, box_height, 90);
}