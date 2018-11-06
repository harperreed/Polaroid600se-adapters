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

base_small_difference = 17;

/* Base module [-------------------------------------------------------------- */

// Base abstraction
module base_obj(x,y,z,seal_width) {
    // set it at 0
    translate([0,0,z/2]){
        difference() {
            // base
            outer_box = [x,y,z];
            cube(outer_box, center=true);
 
            // cut out the inside
            inner_box = [seal_width,seal_width,z];
            cube(inner_box,  center=true);
         }
     }   
}


//default base
module default_base() {
    base_obj(outer_box_width,outer_box_depth,box_height,seal_inner+2);
}

//default base
module small_base() {
    base_obj(outer_box_width-base_small_difference,outer_box_depth,box_height,seal_inner+2);
}




