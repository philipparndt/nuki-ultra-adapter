
module lock(topDiameter, bottomDiameter, height, depth) {
    distance = height - topDiameter/2 - bottomDiameter/2;

    translate([0, -topDiameter/2 + height/2, 0]) {
        cylinder(h = depth, r = topDiameter/2, $fn=100);
        
        translate([0, -distance, 0]) {
            cylinder(h = depth, r = bottomDiameter/2, $fn=100);
        }
        
        translate([-bottomDiameter/2, -distance, 0]) {
            cube([bottomDiameter, distance, depth]);
        }
    }
}


//lock(topDiameter = 17, bottomDiameter = 10, height = 32, depth=10);


module base(diameter, depth, holeD, boreHoleDistance) {
    previewOptimize=.1;
    difference() {
        cylinder(d=diameter, h=depth, center=false, $fn=100);

        translate([-boreHoleDistance/2, 0, 0]) {
            translate([0, 0, -previewOptimize]) {
                cylinder(d=holeD, h=depth+previewOptimize*2, center=false, $fn=100);
            }
            
            translate([boreHoleDistance, 0, 0]) {
                translate([0, 0, -previewOptimize]) {
                    cylinder(d=holeD, h=depth+previewOptimize*2, center=false, $fn=100);
                }
            }
        }
    }
}

base(diameter = 52, depth = 10, holeD = 5, boreHoleDistance=37.5);