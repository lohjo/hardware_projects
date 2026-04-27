// =============================================================
// Quickly-Draw! Compact Vacuum Blood Sampler — v001
// Parametric assembly. OpenSCAD 2021.01 compatible (no libs).
// All dims in mm. Operating vacuum -80 to -96 kPa.
// =============================================================

// --------- GLOBAL RENDER PARAMS ---------
$fn = 48;                       // circle facets (preview-friendly)
explode = 18;                   // explode gap (mm). 0 = assembled
show_section = false;           // set true to slice -X half away

// --------- TOP-LEVEL DIMENSIONS ---------
HOUSING_OD       = 32.0;        // outer housing diameter
HOUSING_WALL     = 1.6;         // housing wall thickness
HOUSING_H        = 70.0;        // body section height (excl. tube + button)

BELLOWS_OD       = 28.0;
BELLOWS_ID       = 22.0;
BELLOWS_H        = 28.0;
BELLOWS_FOLDS    = 6;           // accordion fold count
BELLOWS_WALL     = 1.4;         // fold wall thickness (1.2-1.5 mm spec)

MANIFOLD_OD      = 26.5;
MANIFOLD_T       = 4.0;
MANIFOLD_PORTS   = 5;           // radial channels at 360/5 = 72 deg
PORT_DIA         = 1.5;
PORT_LEN         = 10.5;

NEEDLE_DISC_OD   = 17.0;
NEEDLE_DISC_T    = 1.5;
NEEDLE_GRID      = 5;           // 5x5
NEEDLE_PITCH     = 3.0;
NEEDLE_H         = 0.75;
NEEDLE_BASE_R    = 0.18;

PLUNGER_OD       = 10.0;
PLUNGER_LEN      = 32.0;

ACT_SPRING_OD    = 14.0;        // heavy actuation spring
ACT_SPRING_ID    = 11.0;
ACT_SPRING_LEN   = 18.0;
ACT_SPRING_TURNS = 7;

RET_SPRING_OD    = 9.0;         // lighter retraction spring
RET_SPRING_ID    = 7.0;
RET_SPRING_LEN   = 8.0;
RET_SPRING_TURNS = 4;

BUTTON_OD        = 18.0;
BUTTON_H         = 8.0;
BUTTON_STEM_OD   = 9.0;
BUTTON_STEM_H    = 6.0;

CHECK_VALVE_OD   = 26.5;        // TPU 85A flap disc
CHECK_VALVE_T    = 0.4;
CHECK_VALVE_PORTS = 5;          // 5-port cross pattern
CHECK_VALVE_PORT_W = 1.0;
CHECK_VALVE_PORT_L = 6.0;

VACUTUBE_OD      = 13.0;        // standard 13x75 pediatric vacutainer
VACUTUBE_BORE    = 8.5;
VACUTUBE_LEN     = 75.0;
VACUTUBE_CAP_H   = 6.0;

SKIN_SKIRT_OD    = 30.0;        // TPU 60-70A overskirt
SKIN_SKIRT_ID    = 18.0;
SKIN_SKIRT_H     = 3.0;

// stack centerline z-positions (assembled)
Z_SKIRT          = 0;
Z_NEEDLE_DISC    = SKIN_SKIRT_H;
Z_MANIFOLD       = Z_NEEDLE_DISC + NEEDLE_DISC_T;
Z_CHECK_VALVE    = Z_MANIFOLD + MANIFOLD_T;
Z_RET_SPRING     = Z_CHECK_VALVE + CHECK_VALVE_T;
Z_BELLOWS        = Z_RET_SPRING + RET_SPRING_LEN;
Z_PLUNGER_TOP    = Z_BELLOWS + BELLOWS_H;
Z_ACT_SPRING     = Z_PLUNGER_TOP;
Z_BUTTON         = Z_ACT_SPRING + ACT_SPRING_LEN;

// =============================================================
// MODULES
// =============================================================

// helper: shifted z for explode along central axis
function ez(base, idx) = base + explode * idx;

// helical coil (approximation via swept rings)
module coil(od, id, length, turns, wire_d=1.0){
    rad_mid = (od + id)/4;
    pitch = length / turns;
    n_seg = 24;
    for (t = [0:turns*n_seg]) {
        a = t * (360/n_seg);
        z = (t/n_seg) * pitch;
        translate([rad_mid*cos(a), rad_mid*sin(a), z])
            sphere(d=wire_d);
    }
}

// accordion bellows: stacked diamond folds via rotate_extrude
module bellows(od, id, h, folds, wall){
    fold_pitch = h / folds;
    rot_pts = [
        [id/2 - 0.5, 0],
        [od/2,        fold_pitch/2],
        [id/2 - 0.5, fold_pitch],
    ];
    // outer accordion shell
    difference(){
        union(){
            for (i = [0:folds-1]){
                translate([0,0,i*fold_pitch])
                    rotate_extrude($fn=$fn)
                        polygon(points=[
                            [id/2,            0],
                            [od/2,            fold_pitch/2],
                            [id/2,            fold_pitch],
                            [id/2 - wall,     fold_pitch],
                            [od/2 - wall,     fold_pitch/2],
                            [id/2 - wall,     0],
                        ]);
            }
            // top + bottom flange caps (sealing rings)
            for (z = [0, h]){
                translate([0,0,z - 0.6])
                    cylinder(d=od + 2, h=1.2, $fn=$fn);
            }
        }
    }
}

// 5x5 microneedle array on a disc
module needle_disc(){
    color("DimGray"){
        cylinder(d=NEEDLE_DISC_OD, h=NEEDLE_DISC_T, $fn=$fn);
        // needles point DOWN (toward skin) from disc bottom
        translate([0,0,0])
        for (ix = [0:NEEDLE_GRID-1])
            for (iy = [0:NEEDLE_GRID-1]){
                x = (ix - (NEEDLE_GRID-1)/2) * NEEDLE_PITCH;
                y = (iy - (NEEDLE_GRID-1)/2) * NEEDLE_PITCH;
                translate([x, y, 0])
                    rotate([180,0,0])
                        cylinder(r1=NEEDLE_BASE_R, r2=0.01,
                                 h=NEEDLE_H, $fn=12);
            }
    }
}

// SLA manifold: disc with 5 radial channels and central well
module manifold(){
    color("DarkSlateGray"){
        difference(){
            cylinder(d=MANIFOLD_OD, h=MANIFOLD_T, $fn=$fn);
            // central blood-collection well
            translate([0,0,0.6])
                cylinder(d=4.0, h=MANIFOLD_T, $fn=$fn);
            // 5 radial channels at 72 deg
            for (i = [0:MANIFOLD_PORTS-1]){
                rotate([0,0,i*360/MANIFOLD_PORTS])
                    translate([0, -PORT_DIA/2, MANIFOLD_T/2 - PORT_DIA/2])
                        cube([PORT_LEN, PORT_DIA, PORT_DIA]);
            }
            // central downstream port to vacutube
            translate([0,0,-0.1])
                cylinder(d=2.5, h=MANIFOLD_T+0.2, $fn=$fn);
            // bolt-pattern exhaust holes (5-port cross above check valve)
            for (i = [0:CHECK_VALVE_PORTS-1]){
                rotate([0,0,i*360/CHECK_VALVE_PORTS])
                    translate([8.0, 0, MANIFOLD_T - 1.0])
                        cylinder(d=1.0, h=1.5, $fn=$fn);
            }
        }
    }
}

// passive diaphragm check valve (TPU 85A flap, 5-port cross-cut)
module check_valve(){
    color("OrangeRed", 0.85){
        difference(){
            cylinder(d=CHECK_VALVE_OD, h=CHECK_VALVE_T, $fn=$fn);
            // 5-port cross pattern slits
            for (i = [0:CHECK_VALVE_PORTS-1]){
                rotate([0,0,i*360/CHECK_VALVE_PORTS])
                    translate([-CHECK_VALVE_PORT_L/2,
                              -CHECK_VALVE_PORT_W/2,
                              -0.05])
                        cube([CHECK_VALVE_PORT_L,
                              CHECK_VALVE_PORT_W,
                              CHECK_VALVE_T+0.1]);
            }
        }
    }
}

// plunger shaft
module plunger(){
    color("Silver"){
        cylinder(d=PLUNGER_OD, h=PLUNGER_LEN, $fn=$fn);
        // latch groove ring
        translate([0,0,PLUNGER_LEN*0.7])
            difference(){
                cylinder(d=PLUNGER_OD+0.6, h=2, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=PLUNGER_OD-1.2, h=2.2, $fn=$fn);
            }
    }
}

// TPU bellows (vacuum source)
module bellows_assy(){
    color("Gainsboro", 0.65)
        bellows(BELLOWS_OD, BELLOWS_ID, BELLOWS_H,
                BELLOWS_FOLDS, BELLOWS_WALL);
}

// outer housing (PLA blue)
module housing(){
    color("SteelBlue", 0.55){
        difference(){
            cylinder(d=HOUSING_OD, h=HOUSING_H, $fn=$fn);
            translate([0,0,-0.1])
                cylinder(d=HOUSING_OD - 2*HOUSING_WALL,
                         h=HOUSING_H + 0.2, $fn=$fn);
            // window cutout to view internals
            translate([HOUSING_OD/2 - HOUSING_WALL - 0.5,
                      -8, HOUSING_H*0.25])
                cube([HOUSING_WALL+1, 16, HOUSING_H*0.5]);
        }
    }
}

// skin overskirt (soft TPU 60-70A)
module skin_skirt(){
    color("LightCoral", 0.5){
        difference(){
            cylinder(d=SKIN_SKIRT_OD, h=SKIN_SKIRT_H, $fn=$fn);
            translate([0,0,-0.1])
                cylinder(d=SKIN_SKIRT_ID, h=SKIN_SKIRT_H+0.2, $fn=$fn);
        }
    }
}

// vacutube reservoir
module vacutube(){
    color("Crimson", 0.7){
        // body
        difference(){
            cylinder(d=VACUTUBE_OD, h=VACUTUBE_LEN, $fn=$fn);
            translate([0,0,1.0])
                cylinder(d=VACUTUBE_BORE, h=VACUTUBE_LEN, $fn=$fn);
        }
        // septum cap
        color("DarkGray")
            translate([0,0,VACUTUBE_LEN])
                cylinder(d=VACUTUBE_OD+0.6, h=VACUTUBE_CAP_H, $fn=$fn);
    }
}

// button (top user-interface)
module button(){
    color("RoyalBlue"){
        // domed cap
        difference(){
            cylinder(d=BUTTON_OD, h=BUTTON_H, $fn=$fn);
            translate([0,0,BUTTON_H-1.0])
                cylinder(d1=0, d2=BUTTON_OD-2,
                         h=1.2, $fn=$fn);
        }
        // stem
        translate([0,0,-BUTTON_STEM_H])
            cylinder(d=BUTTON_STEM_OD, h=BUTTON_STEM_H, $fn=$fn);
    }
}

// actuation spring (heavy)
module act_spring(){
    color("Gold")
        coil(ACT_SPRING_OD, ACT_SPRING_ID,
             ACT_SPRING_LEN, ACT_SPRING_TURNS, wire_d=1.4);
}

// retraction spring (light)
module ret_spring(){
    color("Khaki")
        coil(RET_SPRING_OD, RET_SPRING_ID,
             RET_SPRING_LEN, RET_SPRING_TURNS, wire_d=0.9);
}

// =============================================================
// FULL ASSEMBLY (exploded along central axis)
// =============================================================
module assembly(){
    // 1. skin skirt (bottom)
    translate([0,0,ez(Z_SKIRT, 0)])      skin_skirt();
    // 2. needle disc (5x5 array)
    translate([0,0,ez(Z_NEEDLE_DISC, 1)]) needle_disc();
    // 3. manifold
    translate([0,0,ez(Z_MANIFOLD, 2)])   manifold();
    // 4. check valve
    translate([0,0,ez(Z_CHECK_VALVE, 3)]) check_valve();
    // 5. retraction spring
    translate([0,0,ez(Z_RET_SPRING, 4)])  ret_spring();
    // 6. bellows
    translate([0,0,ez(Z_BELLOWS, 5)])     bellows_assy();
    // 7. plunger (inside bellows region)
    translate([0,0,ez(Z_RET_SPRING + RET_SPRING_LEN + 1, 5)])
        plunger();
    // 8. actuation spring
    translate([0,0,ez(Z_ACT_SPRING, 6)])  act_spring();
    // 9. button
    translate([0,0,ez(Z_BUTTON, 7)])      button();
    // 10. housing (outer shell, semi-transparent)
    translate([0,0,ez(Z_NEEDLE_DISC, 1)]) housing();
    // 11. vacutube (lateral, attached to manifold side port)
    translate([MANIFOLD_OD/2 + 6 + (explode>0?explode*0.6:0),
              0, ez(Z_MANIFOLD, 2) + MANIFOLD_T/2])
        rotate([0,90,0])
            vacutube();
}

// optional sectioning
module main(){
    if (show_section){
        difference(){
            assembly();
            translate([-100, 0, -10]) cube([100, 200, 300]);
        }
    } else {
        assembly();
    }
}

main();
