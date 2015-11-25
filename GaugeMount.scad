/*
Dial Gauge Mount for Prusa I3

Parameters:
    tolerance = This value is added to the negatives (using a diameter d for a negative will create a d+tolerance hole
    x_rod_diameter - the diameter of the x rods
    x_rod_distance - the distance between the 2 x rods 
    wall_thickness - how thick will the walls be
    
*/

tolerance = 0.1;
x_rod_diameter = 8;
x_rod_distance = 45;
wall_thickness = 5;


// Dial Gauge
diameter = 57;
width = 25;
mount_diameter = 8;
mount_lenght = 20;
mount_center_distance = 8;

use <DialGauge.scad>;
module dial_support()
{
    difference()
    {
        translate([-(diameter + 2*wall_thickness)/2, mount_center_distance-width, mount_lenght-wall_thickness]) difference()
        {
            intersection()
            {
                cube([diameter + 2*wall_thickness, width + wall_thickness, diameter + 2*wall_thickness],false);
                translate([(diameter + 2*wall_thickness)/2, 0, (diameter + 2*wall_thickness)/2]) {
                    rotate([-90,0,0]) cylinder(h=width + wall_thickness, d=diameter + 2*wall_thickness);
                }
            }
            translate([0, -1, (diameter + 2*wall_thickness)/2]) cube([diameter + 2*wall_thickness, width+1, (diameter + 2*wall_thickness)/2], false);
        }
        Dial_Gauge(diameter+tolerance, width+tolerance, mount_diameter+tolerance, mount_lenght, mount_center_distance);
    }
}

module printer_support()
{
    difference()
    {
        union()
        {
            cube([diameter + 2*wall_thickness, wall_thickness, x_rod_distance]);
            translate([0,(wall_thickness+x_rod_diameter)/2, 0]) rotate([0,90,0]) cylinder(h=diameter + 2*wall_thickness, d=wall_thickness+x_rod_diameter);
            translate([0,(wall_thickness+x_rod_diameter)/2, x_rod_distance]) rotate([0,90,0]) cylinder(h=diameter + 2*wall_thickness, d=wall_thickness+x_rod_diameter);
        }
        translate([-1,(wall_thickness+x_rod_diameter)/2,0]) rotate([0,90,0])cylinder(h=diameter+2 + 2*wall_thickness, d=x_rod_diameter+tolerance);
        translate([-1,(wall_thickness+x_rod_diameter)/2,x_rod_distance]) rotate([0,90,0])cylinder(h=diameter+2 + 2*wall_thickness, d=x_rod_diameter+tolerance);
        translate([-1,(wall_thickness+x_rod_diameter)/2,-(wall_thickness+x_rod_diameter)/2]) cube([diameter + 2*wall_thickness+2,(wall_thickness+x_rod_diameter)/2+tolerance,wall_thickness+x_rod_diameter+tolerance]);
    }
    
}

union()
{
    *dial_support();
    printer_support();
}