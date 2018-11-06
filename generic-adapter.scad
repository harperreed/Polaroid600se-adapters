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

    union() {
        color( "green", 1.0 ){
            seal();
        }
        color( "blue", 1.0 ){
            default_base();
        }
        color( "red", 1.0 ){
            nubs();
        }
        
        color( "yellow", 1.0 ){
            claws();
        }
        
    }
}




adapter(); // Let's get that adapter going!
