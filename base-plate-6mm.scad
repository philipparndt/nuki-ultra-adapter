use <./parts.scad>

// You need to update this for your cylinder
LockDistance=5;

// Enable to cover only the size of the Nuki Ultra and not the classic lock size
nukiSize=true;

// Add some guides to provide solid connection with the door
guides=true;
guidesHeight = 6;
guidesDiameter = 7;

// Cut some holes that will be invisible to save some material
cheaperPrint=false;

// Other configuration
totalHeight=60;

// Parameters for the cylinders
cylinder_diameter = 52;

boreHoleDistance=38;

// Calculate final depth of the base plate
Z=LockDistance - 0.1;

// Reduce the height in the bottom part (0 = no reduction)
bottomOffset=nukiSize ? LockDistance : 0;

topHolesDepth=1;

fn=400;

module base(totalHeight, cylinder_diameter, cylinderZ) {
    center_distance = totalHeight - cylinder_diameter;

    union() {
        // Top cylinder
        translate([0, center_distance, 0]) {
            cylinder(d=nukiSize ? 57 : cylinder_diameter, h=cylinderZ, center=false, $fn=fn);
        }

        if (nukiSize) {
            brim_width=2.5;
            brim_height=2.5;
            start_angle=233;
            gap_angle=20;
            gap_angle_s=45;

            translate([0, center_distance, 0])
                rotate([0,0,start_angle+gap_angle_s-gap_angle-5])
                    rotate_extrude($fn = fn, angle = 360-gap_angle_s)
                        translate([(57 / 2 - brim_width), cylinderZ, 0])
                            polygon(points = [[0, 0], [brim_width, 0], [brim_width, brim_height], [brim_width - 1, brim_height]]);


            translate([0, center_distance, 0])
                rotate([0,0,start_angle])
                    rotate_extrude($fn = fn, angle = 360-gap_angle)
                        translate([(57 / 2 - brim_width), cylinderZ, 0])
                            polygon(points = [[brim_width - 1, 0], [brim_width, 0], [brim_width, brim_height], [brim_width - 1, brim_height]]);
        }

        // Bottom cylinder
        cylinder(d=cylinder_diameter, h=cylinderZ-bottomOffset, center=false, $fn=400);

        translate([-cylinder_diameter/2, 0, 0]) {
            cube([cylinder_diameter, center_distance, cylinderZ-bottomOffset]);
        }

        // Guides
        if (guides) {
            translate([0, 0, -guidesHeight]) {
                boreHoles(diameter=guidesDiameter, depth=guidesHeight, boreHoleDistance=boreHoleDistance);
            }
        }
    }
}


difference() {
    center_distance = totalHeight - cylinder_diameter;
    
    base(totalHeight=totalHeight, cylinder_diameter=cylinder_diameter, cylinderZ=Z);

    previewOptimize=0.1;

    translate([0, 0, -previewOptimize]) {
        lock(topDiameter = 18, bottomDiameter = 10, height = 33.5, depth=Z + previewOptimize*2);
    }

    // Holes of the Top Plate
    translate([0, center_distance, 0]) {
        boreHoles(diameter=5.1, depth=Z, boreHoleDistance=boreHoleDistance);

        translate([0, 0, 0]) {
            depth = Z - topHolesDepth;
            assert(depth >= 3.9, "hex holes too small, reduce topHolesDepth");
            assert(topHolesDepth >= 1, "topHolesDepth to small - will not be stable");
            boreHexHoles(flatToFlatDistance = M5(), depth = depth, boreHoleDistance = boreHoleDistance);
        }
    }

    // Holes of the Bottom Plate
    translate([0, 0, -Z-1]) {
        boreHoles(diameter = 5.1, depth = Z*2 + 1, boreHoleDistance = boreHoleDistance);
    }

    keepMaterial=5;
    translate([0, 0, keepMaterial]) {
        boreHoles(diameter = 9.5, depth = Z, boreHoleDistance = boreHoleDistance);
    }

    // Countersink hole
    translate([0, 0, keepMaterial + .001]) {
        countersinkHoles(diameter = 9.5, depth = 3, boreHoleDistance = boreHoleDistance);
    }

    // Save some material
    if (cheaperPrint) {
        translate([0, 25, -Z-1]) {
            cylinder(d=12, h=30, center=false, $fn=50);

            translate([15, -5, 0]) {
                cylinder(d=8, h=30, center=false, $fn=50);
            }

            translate([-15, -5, 0]) {
                cylinder(d=8, h=30, center=false, $fn=50);
            }
        }
    }
}
