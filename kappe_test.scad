$fn=500; 

// user defined
w_wall = 1;
h_cap = 10;
d_inner=50;

w_profile = 15;
h_profile = 10;
wall_profile = 1.5;

// computed
r_inner = d_inner / 2;
d_outer = d_inner + 2 * w_wall;
d_diff = d_outer-d_inner;
r_diff = d_outer / 2;

x=sqrt(pow(r_inner, 2) - pow(h_profile / 2 - wall_profile, 2));
t=r_inner - x + w_wall/2;
cut = 1.1;

difference() {
    union() {
        // pipe cap outer
        cylinder(d=d_outer, h=h_cap, center=false);

        // profile cap outer 
        color("red")
        translate([d_inner / 2 - t, -w_profile / 2 - w_wall,0]) {
            w = w_profile + w_wall*2;
            h = h_profile + w_wall;
            scale([h, w, h_cap]) {
                cube(1);
            }
        }
    }

    union() {        
        // pipe cap innner
        translate([0,0,w_wall]) {
            cylinder(d=d_inner, h=h_cap, center=false);
        }

        //profile cap inner
        translate([d_inner/2 - t -cut, -w_profile / 2,  w_wall]) {
            scale([h_profile + cut, w_profile, h_cap+2]) {
                cube(1);
            }
        }
    }
}