use <./gear/ub.scad>

rOut=16.8/2;
tLength=1;

gearHeight=4.2;
distance=1.5;
totalHeight=17;
fn=100;

color([1, 1, 0]) {
    difference() {
        
        union() {
            difference() {
                // Star Gear
                linear_extrude(height=gearHeight, center=true) {
                    Stern(e=32, r1=rOut, r2=rOut-tLength, mod=4, delta=0, center=0, help=true);
                }
                
                // Cut Out a circle
                cylinder(d=12, h=5, center=true, $fn=fn);
            }

            // Inner Cylinder
            translate([0,0,-gearHeight/2]) {
                cylinder(d=10.6, h=gearHeight + distance, center=false, $fn=fn);
            }

            // Add eight spokes for torque limitation
            for (i = [0:7]) {
                rotate([0, 0, i * 45]) { // 360 degrees divided by 8 = 45-degree spacing
                    translate([rOut / 2, 0, 0]) { // Position the spoke between inner and outer edges
                        rotate([0, 90, 0]) { // Rotate cylinder to align radially
                            cylinder(d=2.3, h=gearHeight, center=true, $fn=fn); // Spoke width 1.5mm
                        }
                    }
                }
            }
            
            // Extension
            translate([0,0,gearHeight/2 + distance]) {
                cylinder(d=13, h=totalHeight-gearHeight-distance, center=false, $fn=fn);
            }
        }
        
        // Subtracting a rectangular hole
        translate([0, 0, totalHeight]) {  // Position the hole along the Z-axis, adjusting if needed
            cube([7, 7, totalHeight], center=true);  // A square hole with x=y=7 and height=6
        }
        
        translate([0,0,gearHeight/2 + distance]) {
                cylinder(d=7, h=totalHeight, center=true, $fn=fn);
            }
    }
}