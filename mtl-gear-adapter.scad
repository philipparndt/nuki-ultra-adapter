// ---------------------------------------------------------------------------
// Nuki Ultra IL adapter (DIY, unofficial) - Israeli / Mul-T-Lock knob cylinders
//
// Replaces the yellow gear that normally rides on Nuki's own cylinder, so a
// Nuki Ultra can drive an existing geared cylinder (MTL / Israeli standard)
// through its plain knob shaft.
//
//   z 0 .. toothH        : 32-tooth star gear, OD 16.8  -> faces the Nuki body
//   z toothH .. height   : smooth cylinder at root dia  -> faces the door
//   radial channel       : headless set screw, straight through both walls,
//                          threading into the shaft's own cross-hole
//
// The part is ORIENTED: the engraved bore number sits on the smooth (door) face.
//
// Licence: CC0 1.0 (public domain).
// Tooth geometry derived from philipparndt/nuki-ultra-adapter (CC0), which in
// turn uses the Stern() star-polygon idea from UBaer21/UB.scad (CC0).
// Star polygon re-implemented standalone below so this file needs no library.
// ---------------------------------------------------------------------------

/* ---- MEASURE THESE ON YOUR OWN LOCK ---- */
boreD      = 8.1;   // knob shaft diameter + print fit. See FITTING below.
shaftLen   = 7.5;   // collar face -> shaft tip
tipToHole  = 3.5;   // shaft tip -> axis of the cross-hole
screwD     = 4.8;   // set-screw channel. M4 -> 4.8, M3 -> 3.8 (incl. FDM shrink)

/* ---- USUALLY LEAVE ALONE ---- */
collarGap      = 0.3;   // standoff from the brass collar
tipClear       = 0.2;   // material left past the shaft tip
toothH         = 4.2;   // Nuki mesh band width - do not shrink
teethN         = 32;
toothOD        = 16.8;
toothDepth     = 1;     // root dia = toothOD - 2*toothDepth = 14.8
toothClearance = 0;     // 0 for SLA/SLS/MJF, 0.1 for FDM
engrave        = true;  // bore number on the door face (orientation marker)
fn             = 150;

/* ---- FITTING -------------------------------------------------------------
   Printed holes come out undersize. If you have no calipers, print the part
   at three bore sizes (e.g. 7.9 / 8.1 / 8.3) and keep the one that slides on
   snugly by hand. The set screw must pass through the plastic FREELY - the
   thread lives in the brass shaft only. If it binds, open the channel with a
   drill; forcing it will round out the hex socket.
   ------------------------------------------------------------------------ */

height  = shaftLen - collarGap + tipClear;   // 7.4 with the values above
holeZ   = tipClear + tipToHole;              // 3.7 - set by the shaft, not by us
smoothD = toothOD - 2*toothDepth;            // 14.8

module star2d(e, r1, r2, mod=4, delta=0) {
    step = 360/(e*mod);
    pts = [for (i = [0 : e*mod])
             (i % mod) < mod/2 + round(delta)
               ? [sin(i*step)*r1, cos(i*step)*r1]
               : [sin(i*step)*r2, cos(i*step)*r2]];
    rotate(-90) polygon(points = pts, convexity = 5);
}

difference() {
    union() {
        // tooth band - toward the Nuki body
        linear_extrude(height = toothH)
            star2d(e  = teethN,
                   r1 = toothOD/2 - toothClearance,
                   r2 = toothOD/2 - toothClearance - toothDepth);
        // smooth band at root diameter - toward the door
        cylinder(d = smoothD, h = height, $fn = fn);
    }
    // shaft bore, straight through
    translate([0,0,-0.01]) cylinder(d = boreD, h = height + 0.02, $fn = fn);
    // set-screw channel through both walls
    translate([0,0,holeZ]) rotate([0,90,0])
        cylinder(d = screwD, h = toothOD*3, center = true, $fn = 48);
    // bore number on the door face
    if (engrave)
        translate([0, smoothD/2 - 2.4, height - 0.5])
            linear_extrude(1) text(str(boreD), size = 1.4, halign = "center", $fn = 40);
}
