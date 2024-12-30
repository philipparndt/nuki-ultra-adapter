use <./gear/ub.scad>

gearHeight=4.2;         // Height of the gear
distance=0.7999;        // Distance between the gear and the adapter plate
totalHeight=11;         // Total height of the adapter including the gear
spokeDiameter=1.8;      // Diameter of the spokes (sporkes will work as torque limiters and shall break before the gear)
spokeCount=8;           // Number of spokes
fn = 150;               // Cylinder resolution


difference() {
    union() {
        gearCutOut=12;
        color([1, 0, 0]) {
            difference() {
                // Star Gear
                linear_extrude(height=gearHeight, center=false) {
                    rOut=16.8/2;
                    tLength=1; // tooth length
                    Stern(e=32, r1=rOut, r2=rOut-tLength, mod=4, delta=0, center=0, help=false);
                }

                // Cut Out a circle
                translate([0,0,-0.01]) {
                    cylinder(d = gearCutOut, h = gearHeight + 0.02, center = false, $fn = fn);
                }
            }
        }

        // Inner Cylinder
        translate([0,0,0]) {
            cylinder(d=10.6, h=gearHeight + distance, center=false, $fn=fn);
        }

        // Add eight spokes for torque limitation
        for (i = [0:spokeCount-1]) {
            rotate([0, 0, i * 360/spokeCount]) { // 360 degrees divided by 8 = 45-degree spacing
                translate([0, 0, 0]) { // Position the spoke between inner and outer edges
                    rotate([0, 90, 0]) { // Rotate cylinder to align radially
                        translate([-gearHeight/2, 0, 0]) {// Position the spoke at the center of the gear
                            cylinder(d = spokeDiameter, h = gearCutOut / 2, center = false, $fn = fn); // Spoke width 1.5mm
                        }
                    }
                }
            }
        }

        // Extension
        translate([0,0,gearHeight + distance]) {
            cylinder(d=13, h=totalHeight-gearHeight-distance, center=false, $fn=fn);
        }
    }

    // Substracting Keso specific holes
    keso(totalHeight);
}

// -----------------------------------
// Keso specific adapter plate holes
// -----------------------------------
module keso(h) {
    wall=7.05;     // 7mm was very tight but possible
    cubeHeight=6;
    translate([-wall/2, -wall/2, h-cubeHeight]) {  // Position the hole along the Z-axis, adjusting if needed
        cube([wall, wall, cubeHeight+.01], center=false);  // A square hole with x=y=7 and height=6
    }

    // Cylinder hole
    translate([0,0,-0.01]) {
        cylinder(d=7.05, h=h, center=false, $fn=fn);
    }
}
