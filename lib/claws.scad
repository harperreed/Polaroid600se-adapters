/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Claws to hook into the camera body. 

There are two claws and two dummy claws that don't hook. 

The claws hook into the body via the locking / unlocking mechanism on the 600se. 





*/


/* Claw dimensions [-------------------------------------------------------------- */

claw_height_from_zero = 11.02;

claw_width = 6.11; // measured at 5.11
claw_depth = 10.17;
claw_height= claw_height_from_zero-box_height;

claw_distance_from_seal = 5.23;
claw_distance_from_side = 41.90;
claw_distance_from_otherside = 56.00;

claw_y = 7; // I wish i could derive this. but here we are. 
//used to be (outer_box_depth/2 - claw_distance_from_side) + (outer_box_depth/2 - claw_distance_from_otherside);
//echo(claw_y);

claw_leg_width = 3.00;

claw_inside_height_from_zero = 9.45;
claw_inside_height = claw_inside_height_from_zero-box_height;
claw_inside_width= claw_width - claw_leg_width; // remainder is 3





/* Claw modules [-------------------------------------------------------------- */

module claw(x,y,z, orientation) {
    translate([x,y,z]){
        rotate(a=[0,0, orientation]) {
        difference() {
            claw = [claw_width,claw_depth,claw_height];
            cube(claw, center=true);

            color( "red", 1.0 ){
                translate([claw_leg_width/2,0,-.8]){
                    inside_claw = [claw_inside_width, claw_depth+3, claw_inside_height];
                    cube(inside_claw, center=true);
                }
            }
        } 
        }
    }

}

module dumb_claw(x,y,z, orientation) {
    translate([x,y,z]){
            claw = [claw_width,claw_depth,claw_height];
            cube(claw, center=true);
    }

}


module claw_old(x,y,z, orientation) {
    
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
 
    claw_x = (outer_box_width/2)-12.5;
    
    //claw_y = 11 ; 
    height = claw_height/2 + box_height;

    claw(claw_x, -claw_y, height, -180);
    
    claw(-claw_x, -claw_y, height, 0);

    dumb_claw(-claw_x, claw_y, height, 0);
    dumb_claw(claw_x, claw_y, height, 0);
}