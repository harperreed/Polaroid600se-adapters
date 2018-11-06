/*

Polaroid 600 / Polaroid 600se Adapter

Refactor of first try


This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

Todo:
1) Test test test


*/

include <lib/functions.scad>
  
include <lib/base.scad> // Back base
include <lib/seal.scad> // Light seal
include <lib/claws.scad>  // Claws
include <lib/misc.scad> // misc parts


module adapter() {
rotate([0,180,0]) {
    union() {
        color( "green", 1.0 ){
            seal();
        }
        color( "blue", 1.0 ){
            small_base();
        }
        claws();
        
    }
    }
}


cb70_padding = 2;
cb70_width = 112+cb70_padding;
cb70_depth = 154+cb70_padding;
cb70_height = 25+cb70_padding;

module cb70_body() {
    cube ([cb70_width, cb70_depth, cb70_height], center=true);
}    



cb70_notch_height = 8;
cb70_notch_depth = 54;
cb70_notch_width = 13; // at widest point

module cb70_notch() {
    
    x = cb70_width/2+cb70_notch_width/2;
    y = cb70_notch_depth-24;
    z = 5;
    
    translate([x,y,z]){
        cube ([cb70_notch_width, cb70_notch_depth, cb70_notch_height], center=true);
    }
    
}


module cb70() {
    x = 0;
    y = (cb70_depth/2-outer_box_depth/2);
    z = cb70_height/2; // reset to zero
    translate([x,y,z]){
        union() {
        
            cb70_body();
     
            cb70_notch();
  
        }
    }
}

/* holster */

holster_wall_width = 10;
holster_width = cb70_width + holster_wall_width;
holster_depth = outer_box_depth;
holster_height = cb70_height + holster_wall_width;

module holster() {
    x = 0;
    y = (outer_box_depth/2-outer_box_depth/2);
    z = holster_height/2; // reset to zero
    
    translate([x,y,z]){
        cube ([holster_width, holster_depth, holster_height], center=true);
    }
}




rotate([90]){
union () {

    difference(){
        
        holster();
        cb70(); 
    }
    adapter();

}
}
//debug_corner();