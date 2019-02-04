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
module standard_base_obj(base_x, base_y, base_z, seal_width) {
    // set it at 0
    base_obj(base_x, base_y, base_z, seal_width, seal_width, base_z);
}

module base_obj(base_x, base_y, base_z, inner_box_x, inner_box_y, inner_box_z) {
    // set it at 0
    translate([0,0,base_z/2]){
        difference() {
            // base
            outer_box = [base_x, base_y, base_z];
            cube(outer_box, center=true);
 
            // cut out the inside
            inner_box = [inner_box_y, inner_box_y, inner_box_z+2];
            cube(inner_box, center=true);
         }
     }   
}


//default base
module default_base() {
    standard_base_obj(outer_box_width,outer_box_depth,box_height,seal_inner+2);
}

//smaller base
module small_base() {
    standard_base_obj(outer_box_width-base_small_difference,outer_box_depth,box_height,seal_inner+2);
}


//smaller base
module cb70_base() {

    seal_inner = 85; // size of cb70 opening
    base_x = outer_box_width-base_small_difference+2;
    base_y = outer_box_depth;
    base_z = box_height;
    seal_width = seal_inner+2;

    inner_box_x = seal_width;
    inner_box_y = seal_width;
    inner_box_z = base_z + 4;
    inner_offset_y = 8;

    bottom_spacer = 6;
    bottom_offset_y = base_y/2+2; //attach the spacer here

    translate([0,0,base_z/2]){
        difference() {
            // base
                outer_box = [base_x,base_y,base_z];
                cube(outer_box, center=true);
            // cut out the inside
            inner_box = [inner_box_x,inner_box_y,inner_box_z];
            translate([0,inner_offset_y,0]){
                cube(inner_box,  center=true);
            }
        }
        
        translate([0,bottom_offset_y,0]){
            bottom_cb_70_base = [base_x,bottom_spacer,base_z];
            cube(bottom_cb_70_base, center=true);
        }
     }
 
}


