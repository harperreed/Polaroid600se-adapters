/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Back Base

This is the generic base. I don't know why it is this big. 


*/


/* Base dimensions [-------------------------------------------------------------- */

outer_box_width= 146;
outer_box_depth = 108.545;
box_height = 5.22;

/* Base module [-------------------------------------------------------------- */

module base() {
    // set it at 0
    translate([0,0,box_height/2]){
        difference() {
            // base
            outer_box = [outer_box_width,outer_box_depth,box_height];
            cube(outer_box, center=true);
 
            // cut out the inside
            inner_box = [seal_inner+2,seal_inner+2,box_height];
            cube(inner_box,  center=true);
         }
     }   
}

