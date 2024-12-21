use <./ub.scad>

rOut=16.8/2;
tLength=1;

color([1, 0.4, 0.7]) { // RGB values for pink
    linear_extrude(height=4.2, center=true) {
        Stern(e=32, r1=rOut, r2=rOut-tLength, mod=4, delta=0, center=00, help=true);
    }
}
