use <./parts.scad>

totalHeight=60;

// Parameters for the cylinders
cylinder_diameter = 52;

original_plate_height = 9;
original_lock_offset = 5.6;
nuki_plate = 1;

boreHoleDistance=37.5; // TODO: should this be 38?

cylinder_height = 5.6 + original_plate_height - nuki_plate;

holderHeight = 6;
holderDiameter = 7;

module base(totalHeight, cylinder_diameter, cylinder_height) {
    center_distance = totalHeight - cylinder_diameter;

    union() {
        translate([0, center_distance, 0]) {
            cylinder(d=cylinder_diameter, h=cylinder_height, center=false, $fn=400);
        }

        cylinder(d=cylinder_diameter, h=cylinder_height, center=false, $fn=400);

        translate([-cylinder_diameter/2, 0, 0]) {
            cube([cylinder_diameter, center_distance, cylinder_height]);
        }

        translate([0, 0, -holderHeight]) {
            boreHoles(diameter=holderDiameter, depth=holderHeight, boreHoleDistance=boreHoleDistance);
        }
    }
}


difference() {
    center_distance = totalHeight - cylinder_diameter;
    
    base(totalHeight=totalHeight, cylinder_diameter=cylinder_diameter, cylinder_height=cylinder_height);

    previewOptimize=0.1;

    translate([0, 0, -previewOptimize]) {
        lock(topDiameter = 17, bottomDiameter = 10, height = 32, depth=cylinder_height + previewOptimize*2);
    }


    // Holes of the Top Plate
    translate([0, center_distance, 0]) {
        boreHoles(diameter=5.1, depth=cylinder_height, boreHoleDistance=boreHoleDistance);

        translate([0, 0, 0]) {
            boreHexHoles(flatToFlatDistance = M5(), depth = cylinder_height / 3, boreHoleDistance = boreHoleDistance);
        }
    }

    // Holes of the Bottom Plate
    translate([0, 0, -cylinder_height-1]) {
        boreHoles(diameter = 5.1, depth = cylinder_height*2, boreHoleDistance = boreHoleDistance);
    }

    translate([0, 0, cylinder_height / 2]) {
        boreHoles(diameter = 8, depth = cylinder_height / 2, boreHoleDistance = boreHoleDistance);
    }
}
