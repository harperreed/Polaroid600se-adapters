/*

First try of a Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

Todo:
1) Test test test


*/


base = 0;
outer_box_width= 139.7;
outer_box_depth = 114.3;
box_height = 5;

lip_depth = 3;
lip_side = 103;

inner_box_side = 97.5;

module roundedRect(size, radius)
{
	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}


module frame() {
    difference() {
        union() {
            outer_box = [outer_box_width,outer_box_depth,box_height];
            cube(outer_box, center=true);
 
            translate([0,0,box_height-1]){
                inner_box_lip = [lip_side,lip_side,lip_depth];
                cube(inner_box_lip, center=true);
            }
        }
        
        translate([0,0,2]){
            inner_box = [inner_box_side,inner_box_side,11];
            cube(inner_box, center=true);
        }
    }
}

    
module clawObject() {
    claw_width=10;
    claw_depth = 5;
    claw_height=6;
    
    difference() {
        claw_coords = [claw_width,claw_depth,claw_height];
        cube(claw_coords, center=true);
        translate([0,-1.5,-1]){
            color( "blue", 1.0 ){
            claw = [claw_width,claw_depth-3,claw_height-2];
            cube(claw, center=true);
            }
        }
    }
}


module claws() {
 
    claw_x = outer_box_width/2-12;
    claw_y = 8 ; 

     translate([claw_x,claw_y,6]){
            rotate(a=[0,0,-90]) {
                clawObject();
            }
        }
     translate([claw_x,-claw_y,6]){
            rotate(a=[0,0,-90]) {
                clawObject();
            }
        }
      translate([-claw_x,claw_y,6]){
            rotate(a=[0,0,90]) {
                clawObject();
            }
        }
     translate([-claw_x,-claw_y,6]){
            rotate(a=[0,0,90]) {
                clawObject();
            }
        }
}


module nub() {
    
    nub_height = box_height;
    nub_width = 4;
    nub_depth = 34;
    nub = [nub_width,nub_depth,nub_height];
    roundedRect(nub, 1);
    
}

module nubs() {
    claw_x = outer_box_width/2-14;
    claw_y = outer_box_depth/2-18 ; 
    rotate(0,0,180){
        translate([claw_x,claw_y,-1.99]){
            nub();
        }
    }
    rotate(0,0,180){
        translate([claw_x,-claw_y,-1.99]){
            nub();
        }
    }
    rotate(0,0,180){
        translate([-claw_x,claw_y,-1.99]){
            nub();
        }
    }
    rotate(0,0,180){
        translate([-claw_x,-claw_y,-1.99]){
            nub();
        }
    }
}

nubs();
/* body */
    

translate([0,0,0]){
  frame();
  claws();
}


 
 

echo(version=version());
