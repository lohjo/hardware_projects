// =============================================================
// Quickly-Draw! Compact Vacuum Blood Sampler â€” v004
// Final: connecting elbow vacutube, working mid-plane section,
//        STL-printable individual subassembly modes.
// =============================================================

$fn = 64;
explode    = 9;
view_mode  = "assembled";   // "explode" | "assembled" | "section"
print_part = "all";       // "all"|"bellows"|"manifold"|"housing"|
                          // "needle_disc"|"check_valve"|"button"|
                          // "plunger"|"skin_skirt"

// --------- KEY DIMENSIONS (mm) ---------
HOUSING_OD       = 34.0;
HOUSING_WALL     = 1.6;

BELLOWS_OD       = 30.0;
BELLOWS_ID       = 18.0;
BELLOWS_H        = 24.0;
BELLOWS_FOLDS    = 5;
BELLOWS_WALL     = 1.4;

MANIFOLD_OD      = 26.5;
MANIFOLD_T       = 5.0;
MANIFOLD_PORTS   = 5;
PORT_DIA         = 2.0;
PORT_LEN         = 11.0;

NEEDLE_DISC_OD   = 17.0;
NEEDLE_DISC_T    = 2.0;
NEEDLE_GRID      = 5;
NEEDLE_PITCH     = 3.0;
NEEDLE_H         = 1.6;
NEEDLE_BASE_R    = 0.32;

PLUNGER_OD       = 12.0;
PLUNGER_LEN      = 26.0;

ACT_SPRING_OD    = 18.0;
ACT_SPRING_ID    = 14.0;
ACT_SPRING_LEN   = 16.0;
ACT_SPRING_TURNS = 7;

RET_SPRING_OD    = 13.0;
RET_SPRING_ID    = 9.5;
RET_SPRING_LEN   = 8.0;
RET_SPRING_TURNS = 4;

BUTTON_OD        = 22.0;
BUTTON_H         = 7.0;
BUTTON_STEM_OD   = 10.0;
BUTTON_STEM_H    = 5.0;

CHECK_VALVE_OD   = 26.5;
CHECK_VALVE_T    = 0.6;
CHECK_VALVE_PORTS = 5;
CHECK_VALVE_PORT_W = 1.2;
CHECK_VALVE_PORT_L = 7.0;

VACUTUBE_OD      = 13.0;
VACUTUBE_BORE    = 8.5;
VACUTUBE_LEN     = 50.0;
VACUTUBE_CAP_H   = 5.0;

SKIN_SKIRT_OD    = 32.0;
SKIN_SKIRT_ID    = 19.0;
SKIN_SKIRT_H     = 2.5;

ELBOW_OD         = 5.0;
ELBOW_BORE       = 2.5;
ELBOW_RUN        = 8.0;

// --------- HELPERS ---------
function ez(base, idx) = base + (view_mode=="explode" ? explode*idx : 0);

module coil(od, id, length, turns, wire_d=1.2){
    rad_mid = (od + id)/4;
    n_seg = 36;
    total = turns * n_seg;
    for (t = [0:total]){
        a = t * (360/n_seg);
        z = (t/total) * length;
        translate([rad_mid*cos(a), rad_mid*sin(a), z])
            sphere(d=wire_d);
    }
}

module bellows(od, id, h, folds, wall){
    n_pts = folds*2 + 1;
    half_pitch = h / (folds*2);
    outer = [ for (i = [0:n_pts-1])
        [ (i%2==0 ? id/2 : od/2), i * half_pitch ] ];
    inner = [ for (i = [n_pts-1:-1:0])
        [ (i%2==0 ? max(1.0, id/2 - wall)
                  : max(1.0, od/2 - wall)),
          i * half_pitch ] ];
    rotate_extrude($fn=$fn) polygon(points = concat(outer, inner));
    for (z = [0, h])
        translate([0,0,z - 0.6])
            difference(){
                cylinder(d=od + 1.5, h=1.2, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=id - 2, h=1.6, $fn=$fn);
            }
}

module needle_disc(){
    color("DarkSlateGray", 1.0)
        cylinder(d=NEEDLE_DISC_OD, h=NEEDLE_DISC_T, $fn=$fn);
    color("Silver", 1.0)
        for (ix = [0:NEEDLE_GRID-1])
            for (iy = [0:NEEDLE_GRID-1]){
                x = (ix - (NEEDLE_GRID-1)/2) * NEEDLE_PITCH;
                y = (iy - (NEEDLE_GRID-1)/2) * NEEDLE_PITCH;
                translate([x, y, -NEEDLE_H])
                    cylinder(r1=0.02, r2=NEEDLE_BASE_R,
                             h=NEEDLE_H, $fn=14);
            }
    color("DarkSlateGray")
        translate([NEEDLE_DISC_OD/2 - 1.2, -1.2, NEEDLE_DISC_T - 0.5])
            cube([2.4, 2.4, 0.7]);
}

module manifold(){
    color("#3b4a55"){
        difference(){
            union(){
                cylinder(d=MANIFOLD_OD, h=MANIFOLD_T, $fn=$fn);
                translate([MANIFOLD_OD/2 - 0.5, 0, MANIFOLD_T/2])
                    rotate([0,90,0])
                        cylinder(d=6.5, h=4.0, $fn=$fn);
            }
            translate([0,0,1.2])
                cylinder(d=4.0, h=MANIFOLD_T, $fn=$fn);
            for (i = [0:MANIFOLD_PORTS-1])
                rotate([0,0,i*360/MANIFOLD_PORTS])
                    translate([0, -PORT_DIA/2, MANIFOLD_T/2 - PORT_DIA/2])
                        cube([PORT_LEN, PORT_DIA, PORT_DIA]);
            translate([0,0,-0.1])
                cylinder(d=2.5, h=MANIFOLD_T+0.2, $fn=$fn);
            for (i = [0:CHECK_VALVE_PORTS-1])
                rotate([0,0,i*360/CHECK_VALVE_PORTS + 36])
                    translate([8.5, 0, MANIFOLD_T - 1.2])
                        cylinder(d=1.2, h=1.6, $fn=$fn);
            translate([0, 0, MANIFOLD_T/2])
                rotate([0,90,0])
                    cylinder(d=3.5, h=MANIFOLD_OD/2 + 6,
                             $fn=$fn);
        }
    }
}

module check_valve(){
    color("OrangeRed", 0.9){
        difference(){
            cylinder(d=CHECK_VALVE_OD, h=CHECK_VALVE_T, $fn=$fn);
            for (i = [0:CHECK_VALVE_PORTS-1])
                rotate([0,0,i*360/CHECK_VALVE_PORTS])
                    translate([1.6, -CHECK_VALVE_PORT_W/2, -0.1])
                        cube([CHECK_VALVE_PORT_L,
                              CHECK_VALVE_PORT_W,
                              CHECK_VALVE_T+0.2]);
        }
    }
}

module plunger(){
    color("Silver"){
        cylinder(d=PLUNGER_OD, h=PLUNGER_LEN, $fn=$fn);
        translate([0,0,PLUNGER_LEN*0.65])
            difference(){
                cylinder(d=PLUNGER_OD+1.0, h=2.0, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=PLUNGER_OD-1.6, h=2.4, $fn=$fn);
            }
        translate([0,0,PLUNGER_LEN])
            cylinder(d=PLUNGER_OD-1, h=2.5, $fn=$fn);
    }
}

module bellows_assy(){
    color("WhiteSmoke", 0.6)
        bellows(BELLOWS_OD, BELLOWS_ID, BELLOWS_H,
                BELLOWS_FOLDS, BELLOWS_WALL);
}

module housing(h_actual){
    color("SteelBlue", 0.30){
        difference(){
            cylinder(d=HOUSING_OD, h=h_actual, $fn=$fn);
            translate([0,0,-0.1])
                cylinder(d=HOUSING_OD - 2*HOUSING_WALL,
                         h=h_actual + 0.2, $fn=$fn);
            translate([-12, -HOUSING_OD/2 - 0.5, h_actual*0.2])
                cube([24, HOUSING_WALL+1, h_actual*0.55]);
            translate([0,0,h_actual*0.10])
                rotate([0,90,0])
                    cylinder(d=VACUTUBE_OD+0.6,
                             h=HOUSING_OD, $fn=$fn);
        }
    }
}

module skin_skirt(){
    color("LightCoral", 0.85){
        difference(){
            cylinder(d=SKIN_SKIRT_OD, h=SKIN_SKIRT_H, $fn=$fn);
            translate([0,0,-0.1])
                cylinder(d=SKIN_SKIRT_ID,
                         h=SKIN_SKIRT_H+0.2, $fn=$fn);
        }
    }
}

module vacutube(){
    color("Crimson", 0.55){
        difference(){
            cylinder(d=VACUTUBE_OD, h=VACUTUBE_LEN, $fn=$fn);
            translate([0,0,1.5])
                cylinder(d=VACUTUBE_BORE,
                         h=VACUTUBE_LEN, $fn=$fn);
        }
    }
    color("DarkSlateGray")
        translate([0,0,-VACUTUBE_CAP_H])
            cylinder(d=VACUTUBE_OD+0.8, h=VACUTUBE_CAP_H, $fn=$fn);
}

// connecting elbow tube manifold port â†’ vacutube cap
module elbow(){
    color("DarkRed", 0.85){
        // horizontal run
        rotate([0,90,0])
            difference(){
                cylinder(d=ELBOW_OD, h=ELBOW_RUN, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=ELBOW_BORE, h=ELBOW_RUN+0.2, $fn=$fn);
            }
        // 90Â° bend down to vacutube cap
        translate([ELBOW_RUN, 0, 0])
            difference(){
                cylinder(d=ELBOW_OD, h=ELBOW_RUN, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=ELBOW_BORE, h=ELBOW_RUN+0.2, $fn=$fn);
            }
    }
}

module button(){
    color("RoyalBlue"){
        translate([0,0,BUTTON_H*0.6])
            scale([1,1,0.55])
                sphere(d=BUTTON_OD);
        cylinder(d=BUTTON_OD, h=BUTTON_H*0.6, $fn=$fn);
        translate([0,0,-BUTTON_STEM_H])
            cylinder(d=BUTTON_STEM_OD, h=BUTTON_STEM_H, $fn=$fn);
    }
}

module act_spring(){
    color("Gold")
        coil(ACT_SPRING_OD, ACT_SPRING_ID,
             ACT_SPRING_LEN, ACT_SPRING_TURNS, wire_d=1.6);
}

module ret_spring(){
    color("Khaki")
        coil(RET_SPRING_OD, RET_SPRING_ID,
             RET_SPRING_LEN, RET_SPRING_TURNS, wire_d=1.0);
}

// =============================================================
Z_SKIRT          = 0;
Z_NEEDLE_DISC    = SKIN_SKIRT_H;
Z_MANIFOLD       = Z_NEEDLE_DISC + NEEDLE_DISC_T;
Z_CHECK_VALVE    = Z_MANIFOLD + MANIFOLD_T;
Z_RET_SPRING     = Z_CHECK_VALVE + CHECK_VALVE_T;
Z_BELLOWS        = Z_RET_SPRING + RET_SPRING_LEN;
Z_PLUNGER_BASE   = Z_RET_SPRING + RET_SPRING_LEN - 2;
Z_ACT_SPRING     = Z_BELLOWS + BELLOWS_H + 1;
Z_BUTTON         = Z_ACT_SPRING + ACT_SPRING_LEN + BUTTON_STEM_H;

ASSEMBLED_H = Z_BELLOWS + BELLOWS_H + 2;

// =============================================================
module assembly(){
    translate([0,0,ez(Z_SKIRT, 0)])           skin_skirt();
    translate([0,0,ez(Z_NEEDLE_DISC, 1)])     needle_disc();
    translate([0,0,ez(Z_MANIFOLD, 2)])        manifold();
    translate([0,0,ez(Z_CHECK_VALVE, 3)])     check_valve();
    translate([0,0,ez(Z_RET_SPRING, 4)])      ret_spring();
    translate([0,0,ez(Z_BELLOWS, 5)])         bellows_assy();
    translate([0,0,ez(Z_PLUNGER_BASE, 5)])    plunger();
    translate([0,0,ez(Z_ACT_SPRING, 6)])      act_spring();
    translate([0,0,ez(Z_BUTTON, 7)])          button();

    if (view_mode != "explode")
        translate([0,0,Z_NEEDLE_DISC + NEEDLE_DISC_T])
            housing(ASSEMBLED_H - NEEDLE_DISC_T - SKIN_SKIRT_H);

    // elbow + vacutube
    vacu_dx = (view_mode=="explode" ? explode*1.2 : 0);
    elbow_x = MANIFOLD_OD/2 + 1;
    translate([elbow_x, 0, ez(Z_MANIFOLD, 2) + MANIFOLD_T/2])
        elbow();
    translate([elbow_x + ELBOW_RUN, 0,
              ez(Z_MANIFOLD, 2) + MANIFOLD_T/2 - VACUTUBE_LEN
              + (view_mode=="explode" ? -explode*0.8 : 0)])
        vacutube();
}

module main(){
    if (view_mode == "section"){
        // bisect along Y axis: remove +x half
        difference(){
            assembly();
            translate([0, -200, -50])
                cube([200, 400, 400]);
        }
    } else {
        assembly();
    }
}

// individual print-part dispatcher (for STL export)
module print_dispatch(){
    if      (print_part == "bellows")     bellows_assy();
    else if (print_part == "manifold")    manifold();
    else if (print_part == "housing")     housing(ASSEMBLED_H);
    else if (print_part == "needle_disc") needle_disc();
    else if (print_part == "check_valve") check_valve();
    else if (print_part == "button")      button();
    else if (print_part == "plunger")     plunger();
    else if (print_part == "skin_skirt")  skin_skirt();
    else                                  main();
}

print_dispatch();

