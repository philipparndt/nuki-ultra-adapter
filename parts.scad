
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

module boreHoles(diameter, depth, boreHoleDistance) {
    previewOptimize=.1;
    translate([-boreHoleDistance/2, 0, 0]) {
        translate([0, 0, -previewOptimize]) {
            cylinder(d=diameter, h=depth+previewOptimize*2, center=false, $fn=100);
        }
        
        translate([boreHoleDistance, 0, 0]) {
            translate([0, 0, -previewOptimize]) {
                cylinder(d=diameter, h=depth+previewOptimize*2, center=false, $fn=100);
            }
        }
    }
}

module countersinkHoles(diameter, depth, boreHoleDistance) {
    previewOptimize=.1;
    translate([-boreHoleDistance/2, 0, -depth]) {
        translate([0, 0, -previewOptimize]) {
            cylinder(r1=0, r2=diameter/2, h=depth, center=false, $fn=100);
        }

        translate([boreHoleDistance, 0, 0]) {
            translate([0, 0, -previewOptimize]) {
                cylinder(r1=0, r2=diameter/2, h=depth, center=false, $fn=100);
            }
        }
    }
}

Mtolerance = 0.1;
M5size = 7.8;

function M5() = M5size + Mtolerance;

module hexHole(flatToFlatDistance, depth) {
    previewOptimize = 0.1;
    hexagonSide = flatToFlatDistance / (cos(30) * 2);

    translate([0, 0, -previewOptimize]) {
        linear_extrude(height=depth + previewOptimize * 2, center=false) {
            polygon(points=[
                    [hexagonSide, 0],
                    [hexagonSide / 2, sqrt(3) * hexagonSide / 2],
                    [-hexagonSide / 2, sqrt(3) * hexagonSide / 2],
                    [-hexagonSide, 0],
                    [-hexagonSide / 2, -sqrt(3) * hexagonSide / 2],
                    [hexagonSide / 2, -sqrt(3) * hexagonSide / 2]
                ]);
        }
    }
}

module boreHexHoles(flatToFlatDistance, depth, boreHoleDistance) {
    translate([-boreHoleDistance / 2, 0, 0]) {
        hexHole(flatToFlatDistance, depth);
    }

    translate([boreHoleDistance / 2, 0, 0]) {
        hexHole(flatToFlatDistance, depth);
    }
}



base(diameter = 52, depth = 10, holeD = 5, boreHoleDistance=37.5);
