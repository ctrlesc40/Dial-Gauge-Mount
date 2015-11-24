/*
Dial Gauge Mount for Prusa I3

Parameters:
    tolerance = This value is added to the negatives (using a diameter d for a negative will create a d+tolerance hole
    x_rod_diameter - the diameter of the x rods
    x_rod_distance - the distance between the 2 x rods 
    
*/

tolerance = 0.1;
x_rod_diameter = 8;
x_rod_distance = 45;


// Dial Gauge
diameter = 57;
width = 25;
mount_diameter = 8;
mount_lenght = 20;
mount_center_distance = 8;

use <DialGauge.scad>;

Dial_Gauge(diameter, width, mount_diameter, mount_lenght, mount_center_distance);