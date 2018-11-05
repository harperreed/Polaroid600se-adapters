/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Light seal



*/


/* Seal to block the light */
seal_outer = 101;
seal_inner = 99.5;
seal_height = 7.55;
seal_wall_width = 2.11;

module seal() {
    // set it at 0
    translate([0,0,seal_height/2]){
    difference() {
        
        seal_box = [seal_outer,seal_outer,seal_height];
        //cube(seal_box, center=true);
        miniround(seal_box, 3, center=true);
        
       // inside of the seal
        inner_box = [seal_inner,seal_inner,seal_height];
        miniround(inner_box, 1, center=true);
        //cube(inner_box_lip, center=true);
        
    }
    }
}
