/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Various parts



*/

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

