/*
Dial Gauge Model

Parameters:
    diameter - The diameter of the dial body
    width - The width of the dial body
    mount_diameter - The diameter of the mount rod
    mount_lenght - The length of the mount rod
    mount_center_distance - The distance from the back of the dial body to the center of the mount rod
*/
module Dial_Gauge(diameter, width, mount_diameter, mount_lenght, mount_center_distance)
{
 
 translate([0, mount_center_distance, diameter/2 + mount_lenght]) rotate([90,0,0]) cylinder(h=width, d=diameter);
 cylinder(h=mount_lenght+1, d=mount_diameter);
 
 
    
}

// Test model
diameter = 57;
width = 25;
mount_diameter = 8;
mount_lenght = 20;
mount_center_distance = 8;
Dial_Gauge(diameter, width, mount_diameter, mount_lenght, mount_center_distance);