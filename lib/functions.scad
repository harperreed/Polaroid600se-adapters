/*

Polaroid 600 / Polaroid 600se Adapter

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

-----------------------

Misc functions



*/


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