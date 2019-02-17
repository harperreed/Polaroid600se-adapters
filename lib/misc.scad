/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Various parts


The nubs are stupid


*/

/* Nub dimensions [-------------------------------------------------------------- */

nub_depth = 34.19;
nub_width = 5.76;
nub_distance_from_seal = 2;
nub_distance_from_edge = 13.95;
nub_height_from_zero = 5.52;
nub_height = nub_height_from_zero - box_height;

/* Nub modules [-------------------------------------------------------------- */

module nub(nub_x, nub_y, nub_z) {
    
    translate([nub_x,nub_y,nub_z]){
        nub = [nub_width,nub_depth,nub_height];
                
        cube(nub,  center=true);
                
    }
}


module nubs() {
    nub_position1 = (outer_box_width/2-nub_width/2 - nub_distance_from_edge);
    nub_position2 = outer_box_depth/2-nub_depth/2;
    
    nub(nub_position1, nub_position2*-1, box_height);
    nub(nub_position1*-1, nub_position2, box_height);
    nub(nub_position1*-1, nub_position2*-1, box_height);
    nub(nub_position1, nub_position2, box_height);
    
}

/* screw holes for cb70 [-------------------------------------------------------------- */


/* screw hole dimensions [-------------------------------------------------------------- */


screw_diameter = 3;
screw_hole_height = 20;

/* Screw hole modules [-------------------------------------------------------------- */

module screw_hole(screw_x, screw_y, screw_z, height, diameter) {
    
    radius = diameter/2;

    translate([screw_x, screw_y, screw_z]){
        cylinder(h=height, r=radius, center=true);
    }
   
   
}


module screw_holes() {
    //30 from top
    top_screw_position_x = 50;
    top_screw_position_y = -27;
    top_screw_position_z = -0;

    screw_hole(top_screw_position_x,top_screw_position_y,top_screw_position_z,screw_hole_height,screw_diameter);
    screw_hole(-top_screw_position_x,top_screw_position_y,top_screw_position_z,screw_hole_height,screw_diameter);

    //17ish from bottom

    bottom_screw_position_x = 50;
    bottom_screw_position_y = 35;
    bottom_screw_position_z = -0;
    
    screw_hole(bottom_screw_position_x,bottom_screw_position_y,bottom_screw_position_z,screw_hole_height,screw_diameter);
    screw_hole(-bottom_screw_position_x,bottom_screw_position_y,bottom_screw_position_z,screw_hole_height,screw_diameter);
    

   
}
