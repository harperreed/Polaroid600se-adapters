/*

Polaroid 600 / Polaroid 600se Adapter

Refactor of first try


This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

Todo:
1) Test test test


*/



base = 0;





module miniround(size, radius, center=false)
{
$fn=50;
x = size[0]-radius/2;
y = size[1]-radius/2;

minkowski()
{
    cube(size=[x,y,size[2]], center=center);
    cylinder(r=radius);
    // Using a sphere is possible, but will kill performance
    //sphere(r=radius);
}
}

/* Seal to block the light */
seal_outer = 102;
seal_inner = 99.08;
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

/* Outer dimensions */

outer_box_width= 146;
outer_box_depth = 108.545;
box_height = 5.22;


module frame() {
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


nub_depth = 34.19;
nub_width = 5.76;
nub_distance_from_seal = 2;
nub_distance_from_edge = 13.95;
nub_height_from_zero = 5.52;
nub_height = nub_height_from_zero - box_height;



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


claw_width=10.11;
claw_depth = 5;
claw_height=5.92;
give = 2;

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


module adapter() {

    union() {
        color( "green", 1.0 ){
            seal();
        }
        color( "blue", 1.0 ){
            frame();
        }
        color( "red", 1.0 ){
            nubs();
        }
        
        color( "yellow", 1.0 ){
            claws();
        }
        
    }
}

/* Debug seal */

module debug_corner() {

    difference() {
    
        adapter();
            
        /* block out the rest */
        translate([00,75,10]){
            cube([150,150,20], center=true);
        }
        
        translate([50,00,10]){
            cube([150,150,20], center=true);
        }
    
    
    }
}


adapter();

//debug_corner();