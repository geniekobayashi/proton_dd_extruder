// Vertical mount bowden type
// Direct Drive extruder for Proton
// http://etherpod.org/blog/?p=7962
// 2014-2015 bitfab - Genie Kobayashi

$fn = 32;

offset = 0.5;

include <countersunk.scad>
include <nema_17_extruder.scad>
include <screw_m6.scad>

//difference() {
//nema_17();
body();
lever();
//translate([4.5,-25,-40])
//		cube([20,50,80]);
//}

module M3_nut()
{ union()
	{
		//entrance
		translate([0,-2.7,15]) cube([6.65,6,3],center=true);
		//nut
		translate([0,0.3,13.5]) rotate([0,0,0])cylinder(r=6.65/2,h=3,$fn=6);
	}
}


module body(){
difference() {
union () {
difference() {
union () {
// Wing 
		translate([-30, -9, -35])
		cube([8,16,70]);

translate([-26,-9+16,35]) rotate ([90,0,0]) 
cylinder(h=16,r=8/2);

translate([-26,-9+16,-35]) rotate ([90,0,0]) 
cylinder(h=16,r=8/2);

// slant pillars
 translate([-28.5,-9,20]) rotate ([0,45,0])
cube ([8.5,16,9]);

 translate([-22,-9,-26]) rotate ([0,-45,0])
cube ([8.5,16,9]);

// Plate
		translate([-22, -9, -21])
		cube([22,16,42]);

		translate([0, -17.5, 0])
		cube([11.5,17.5,21]);

		translate([0, -17.5, -21])
		cube([10,17.5,21]);
difference() {
		translate([-5, -14, -21])
		cube([5,5,42]);
// Tapers
translate([3.5+1.75/2,-9-offset,6])
cylinder(h=5,r1=5/2,r2=2.25/2);

translate([3.5+1.75/2,-9-offset,-12])
cylinder(h=5,r1=2.25/2,r2=3.5/2);

		translate([-5, -19, -22]) rotate ([0,0,45])
		cube([7.07,7.07,44]);
}
// Bearing hold
translate([0,-9,0]) rotate ([90,0,0]) 
cylinder(h=8.5,r1=33/2, r2=30/2,$fn = 64);

// Bottom mesa
translate([3.5+1.75/2,-9-offset,-24.5])
cylinder(h=4,r1=7/2, r2=9/2);
}
nema_17();
// Blank
translate([0,-2.1,0]) rotate ([90,0,0]) 
cylinder(h=11.4,r=25/2);

// Block
		translate([0, -11.4-2.1, -10])
		cube([20,11.4,20]);
// for bearing
//		translate([0, -11.4-3.3, -11.9/2])
//		cube([20,1.2,11.9]);

		translate([0, -11.4-7.3, -10.3/2])
		cube([20,5.5,10.3]);
// Wedge
translate([0,-20,0]) rotate([0,45,0])
		cube([20,20,20]);

// Thin cut
		translate([10, -18, -21])
		cube([3,18,21]);

// M4 fixing holes
rotate ([0,90,0]) translate([-30,-1,-35])
cylinder (h=20, r=2.2);

translate([-24.7,-1,-30])
countersunk_m4(0,90,90);

rotate ([0,90,0]) translate([30,-1,-35])
cylinder (h=20, r=2.2);

translate([-24.7,-1,30])
countersunk_m4(0,90,90);

// Bearing SMF105ZZ
translate([0,-12.9-offset,0]) rotate ([90,0,0]) 
cylinder(h=1.2,r=11.9/2);

translate([0,-14-offset,0]) rotate ([90,0,0]) 
cylinder(h=4,r=10.2/2);


// Tube fitting
translate([3.5+1.75/2,-9-offset,16.5])
cylinder(h=10,r=6.3/2);

// Bottom tube insert
translate([3.5+1.75/2,-9-offset,-28.5])
cylinder(h=10,r=4.25/2);

// Hinge tube clear
		translate([31/2, 1, 31/2])
		rotate([90,0,0])
			cylinder(h = 19, r = 13/2);

// hinge cramp holes
translate([-5,-4.5,-15.5]) rotate ([0,90,0]) 
cylinder(h=25,r=3.4/2);

translate([-5,-14,-15.5]) rotate ([0,90,0]) 
cylinder(h=25,r=3.4/2);

// embed M3 nuts
	translate([37.5-18,-4.5,-15.5]) rotate([-90,90,90]) M3_nut();
	translate([7.5-18,-14,-15.5]) rotate([-90,90,270]) M3_nut();
}

// Drive pulley
//translate([0,-2-offset,0]) rotate ([90,0,0]) 
//cylinder(h=11,r=9/2);

// Filament idler
//translate([12.8,-5.5-offset,0]) rotate ([90,0,0]) 
//cylinder(h=7,r=17.5/2);

difference() {
// M6 nut tube fitting
translate([3.5+1.75/2,-9-offset,17]) hex_nut(6);

// Hinge tube clear
		translate([31/2, 1, 31/2])
		rotate([90,0,0])
			cylinder(h = 19, r = 13/2, $fn=24);
}

intersection() {
union () {
// Sleeves
translate([3.5+1.75/2,-9-offset,8])
cylinder(h=9,r=7/2);

translate([3.5+1.75/2,-9-offset,-12])
cylinder(h=4,r=7/2);
}
// Blank
translate([0,-2.1,0]) rotate ([90,0,0]) 
cylinder(h=11.4,r=25/2);
 }
}
// Filament 1.75mm
translate([3.5+1.75/2,-9-offset,-40])
cylinder(h=80,r=2.25/2);

// Tapers
translate([3.5+1.75/2,-9-offset,8])
cylinder(h=6,r1=6/2,r2=2.25/2);

translate([3.5+1.75/2,-9-offset,-13])
cylinder(h=5,r1=2.25/2,r2=3.5/2);

}
}


module lever(){
difference() {
union () {
// Hinge tube
		translate([31/2, 0, 31/2])
		rotate([90,0,0])
			cylinder(h = 17.5, r = 11.3/2);

// Idler shaft holder
translate([12.8,-2-offset,0]) rotate ([90,0,0]) 
cylinder(h=15,r=12.6/2);

		translate([8, -17-offset, 4]) rotate ([0,45,0])
		cube([4,15,10]);

		translate([15.5, -17-offset, -11.6]) rotate ([0,-45,0])
		cube([4,15,10]);

// Bar
		translate([12.65, -17.5, -34])
		cube([8.5,17.5,50]);

translate([19.4,0,-34]) rotate ([90,0,0]) 
cylinder(h=17.5,r=3.5/2);
}

// M3 hex bolt
		translate([31/2, 15, 31/2])
		rotate([90,0,0])
			cylinder(h = 45, r = 3.3/2);

		translate([31/2, -17.5+2.5, 31/2])
		rotate([90,0,0])
			cylinder(h = 5, r = 7.3/2);

// Filament idler
translate([12.8,-5.5-offset,0]) rotate ([90,0,0]) 
cylinder(h=7,r=17.5/2);

// M5 for idler
translate([12.8,-1.9-offset,0]) rotate ([90,0,0]) 
cylinder(h=16,r=(5-0.3)/2);

// Cutout
		translate([11.5, -18, -42]) rotate ([0,-20,0]) 
		cube([8.5,18,20]);
// Window
		translate([20.6, -13, -3.5])
		cube([8.5,7,7]);

// hinge cramp holes
translate([1,-4.5,-15.5+3]) rotate ([0,90,0]) 
cylinder(h=25,r=3.4/2);

translate([1,-14,-15.5+3]) rotate ([0,90,0]) 
cylinder(h=25,r=3.4/2);

translate([1,-4.5,-15.5-3]) rotate ([0,90,0]) 
cylinder(h=25,r=3.4/2);

translate([1,-14,-15.5-3]) rotate ([0,90,0]) 
cylinder(h=25,r=3.4/2);

		translate([12, -6.2, -18.5])
		cube([15.5,3.4,6]);

		translate([12, -15.7, -18.5])
		cube([15.5,3.4,6]);
 }

difference() {
union () {
// Mesas
translate([12.8,-5.5-offset,0]) rotate ([90,0,0]) 
cylinder(h=1,r1=7.5/2,r2=6/2);

translate([12.8,-11.5-offset,0]) rotate ([90,0,0]) 
cylinder(h=1,r1=6/2,r2=7.5/2);
}
// M5 for idler
translate([12.8,-2-offset,0]) rotate ([90,0,0]) 
cylinder(h=16,r=(5-0.3)/2);
 }
}

