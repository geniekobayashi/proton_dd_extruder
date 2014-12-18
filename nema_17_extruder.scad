// NEMA 17 motor block
// 2014 bitfab - Genie Kobayashi

include <countersunk.scad>

module nema_17 (

slide = 0,
margin = 0.3,
flange_h = 2.3,
shaft_h = 24,
shaft_r = 5/2,
holes = 31,
M3_h = 9,
M3_r = 3.3/2)

{
offset = slide/2;
corner = (11 + margin)/2;
width = 42 + margin;
height = 42 + margin;
depth = 34 + margin;
flange = 22 + margin;

// body
		translate([-width/2, 0, -holes/2])
		cube([width+slide,depth,holes]);

		translate([-holes/2, 0, -height/2])
		cube([holes+slide,depth,height]);


		translate([holes/2+slide, depth, holes/2])
		rotate([90,0,0])
			cylinder(h = depth, r = corner, $fn=24);
		translate([holes/2+slide, depth, -holes/2])
		rotate([90,0,0])
			cylinder(h = depth, r = corner, $fn=24);

		translate([-holes/2, depth, holes/2])
		rotate([90,0,0])
			cylinder(h = depth, r = corner, $fn=24);
		translate([-holes/2, depth, -holes/2])
		rotate([90,0,0])
			cylinder(h = depth, r = corner, $fn=24);


// motor shaft
		translate([0, 0.1, 0])
		rotate([90,0,0])
			cylinder(h = flange_h, r = flange/2, $fn=24);

		translate([0, 0, 0])
		rotate([90,0,0])
			cylinder(h = shaft_h, r = shaft_r, $fn=24);

// motor shaft + slide
		translate([slide, 0.1, 0])
		rotate([90,0,0])
			cylinder(h = flange_h, r = flange/2, $fn=24);
//
		translate([0, -flange_h, -flange/2])
			cube([slide,flange_h,flange]);

		translate([slide, 0, 0])
		rotate([90,0,0])
			cylinder(h = shaft_h, r = shaft_r, $fn=24);
//
		translate([0, -shaft_h, -shaft_r])
			cube([slide,shaft_h,shaft_r*2]);

// wires
		translate([-10+offset, depth-9, -(height/2)-5])
		cube([20,8,5]);

// M3 bolts
		translate([holes/2, 0, holes/2])
		rotate([90,0,0])
			cylinder(h = 20, r = M3_r, $fn=24);
//		translate([holes/2, 0, -holes/2])
//		rotate([90,0,0])
			cylinder(h = M3_h, r = M3_r, $fn=24);
		translate([-holes/2, 0, holes/2])
		rotate([90,0,0])
			cylinder(h = M3_h, r = M3_r, $fn=24);
		translate([-holes/2, 0, -holes/2])
		rotate([90,0,0])
			cylinder(h = M3_h, r = M3_r, $fn=24);


//		translate([holes/2, 2.2-M3_h, holes/2])
//		countersunk_m3(0,90,0);

//		translate([holes/2, 2.2-M3_h, -holes/2])
//		countersunk_m3(0,90,0);

		translate([-holes/2, 2.2-M3_h, holes/2])
		countersunk_m3(0,90,0);

		translate([-holes/2, 2.2-M3_h, -holes/2])
		countersunk_m3(0,90,0);



	}
//nema_17();