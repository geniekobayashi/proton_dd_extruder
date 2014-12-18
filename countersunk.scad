// Countersunk screw head
// 2014 bitfab - Genie Kobayashi

// M3
module countersunk_m3(x,x,z){
			rotate([x,x,z])
			cylinder(h=1.75+0.5,r1=3.4/2,r2=6.3/2, $fn=32);
}
// M4 
module countersunk_m4(x,x,z){
			rotate([x,x,z])
			cylinder(h=2.3+0.5,r1=4.4/2,r2=8.3/2, $fn=32);
}

// M5 
module countersunk_m5(x,x,z){
			rotate([x,x,z])
			cylinder(h=2.8+0.5,r1=5.4/2,r2=10.3/2, $fn=32);
}

