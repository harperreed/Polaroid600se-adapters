/*

Polaroid 600 / Polaroid 600se Adapter

Refactor of first try


This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.

https://creativecommons.org/licenses/by-nc-sa/3.0/

This is a test to see if the corner fits properly. 


*/

include <lib/functions.scad>
  
include <lib/base.scad> // Back base
include <lib/seal.scad> // Light seal
include <lib/claws.scad>  // Claws
include <lib/misc.scad> // misc parts



/* Debug seal */

module debug_corner() {

    debug = 1;

    difference() {
    
        union() {
            color( "green", 1.0 ){
                seal();
            }
            color( "blue", 1.0 ){
                small_base();
            }
            color( "red", 1.0 ){
                nubs();
            }
            
            color( "yellow", 1.0 ){
               
            }
             claws();
            
        }
        
        /* block out the rest */
        if (debug==1){


            translate([00,75,10]){
               //cube([150,220,20], center=true);
            }
            
            translate([50,00,10]){
                cube([180,150,20], center=true);
            }
        }
    
    
    }
}



debug_corner();
