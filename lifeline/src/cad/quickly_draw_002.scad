// =============================================================
// Quickly-Draw! Compact Vacuum Blood Sampler — v002
// Fixes: real accordion bellows, balanced explode, visible needles,
//        autocenter-friendly proportions, vertical vacutube.
// =============================================================

$fn = 64;
explode = 8;                    // tighter explode (mm)
view_mode = "explode";          // "explode" | "assembled" | "section"

// --------- KEY DIMENSIONS (mm) ---------
HOUSING_OD       = 34.0;
HOUSING_WALL     = 1.6;
HOUSING_H        = 60.0;

BELLOWS_OD       = 30.0;
BELLOWS_ID       = 20.0;        // bigger radial swing → visible folds
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
NEEDLE_H         = 1.4;         // visually larger (real ~0.75)
NEEDLE_BASE_R    = 0.30;

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
VACUTUBE_LEN     = 50.0;        // shorten for layout
VACUTUBE_CAP_H   = 5.0;

SKIN_SKIRT_OD    = 32.0;
SKIN_SKIRT_ID    = 19.0;
SKIN_SKIRT_H     = 2.5;

// --------- HELPERS ---------
function ez(base, idx) = base + (view_mode=="explode" ? explode*idx : 0);

// helical coil (sphere-trail approximation)
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

// accordion bellows — repeated zig-zag rotate_extrude
module bellows(od, id, h, folds, wall){
    pitch = h / folds;
    // single fold profile: outer "V" shell with inward offset for wall
    for (i = [0:folds-1])
        translate([0,0,i*pitch])
            rotate_extrude($fn=$fn)
                polygon(points = [
                    // outer skin
                    [id/2,                0],
                    [od/2,                pitch/2],
                    [id/2,                pitch],
                    // inner skin (offset toward axis by `wall`)
                    [max(0.5, id/2 - wall),  pitch],
                    [max(0.5, od/2 - wall),  pitch/2],
                    [max(0.5, id/2 - wall),  0],
                ]);
    // top + bottom seal flanges
    for (z = [0, h])
        translate([0,0,z - 0.6])
            difference(){
                cylinder(d=od + 1.5, h=1.2, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=id - 2, h=1.6, $fn=$fn);
            }
}

// 5x5 microneedle array on flat disc, needles point DOWN (-z)
module needle_disc(){
    color("DimGray", 0.95){
        // disc body
        translate([0,0,0])
            cylinder(d=NEEDLE_DISC_OD, h=NEEDLE_DISC_T, $fn=$fn);
        // needles below disc (z < 0)
        for (ix = [0:NEEDLE_GRID-1])
            for (iy = [0:NEEDLE_GRID-1]){
                x = (ix - (NEEDLE_GRID-1)/2) * NEEDLE_PITCH;
                y = (iy - (NEEDLE_GRID-1)/2) * NEEDLE_PITCH;
                translate([x, y, -NEEDLE_H])
                    cylinder(r1=0.02, r2=NEEDLE_BASE_R,
                             h=NEEDLE_H, $fn=14);
            }
        // keyed socket cutout illusion (top notch)
        translate([NEEDLE_DISC_OD/2 - 1.5, -1, NEEDLE_DISC_T - 0.4])
            cube([2.5, 2, 0.6]);
    }
}

// SLA manifold disc — 5 radial channels at 72°, central well
module manifold(){
    color("#3b4a55"){
        difference(){
            cylinder(d=MANIFOLD_OD, h=MANIFOLD_T, $fn=$fn);
            // central blood collection well
            translate([0,0,1.0])
                cylinder(d=4.0, h=MANIFOLD_T, $fn=$fn);
            // 5 radial channels at 72 deg (mid-plane)
            for (i = [0:MANIFOLD_PORTS-1]){
                rotate([0,0,i*360/MANIFOLD_PORTS])
                    translate([0, -PORT_DIA/2, MANIFOLD_T/2 - PORT_DIA/2])
                        cube([PORT_LEN, PORT_DIA, PORT_DIA]);
            }
            // central downstream port to vacutube
            translate([0,0,-0.1])
                cylinder(d=2.5, h=MANIFOLD_T+0.2, $fn=$fn);
            // exhaust port ring
            for (i = [0:CHECK_VALVE_PORTS-1]){
                rotate([0,0,i*360/CHECK_VALVE_PORTS + 36])
                    translate([8.5, 0, MANIFOLD_T - 1.2])
                        cylinder(d=1.2, h=1.6, $fn=$fn);
            }
            // lateral output stub-port (connects to vacutube)
            translate([0, 0, MANIFOLD_T/2])
                rotate([0,90,0])
                    cylinder(d=2.5, h=MANIFOLD_OD/2 + 1, $fn=$fn);
        }
        // lateral output boss
        translate([MANIFOLD_OD/2 - 0.5, 0, MANIFOLD_T/2])
            rotate([0,90,0])
                difference(){
                    cylinder(d=5.0, h=4.0, $fn=$fn);
                    translate([0,0,-0.1])
                        cylinder(d=2.5, h=4.5, $fn=$fn);
                }
    }
}

// passive diaphragm check valve (TPU 85A flap)
module check_valve(){
    color("OrangeRed", 0.85){
        difference(){
            cylinder(d=CHECK_VALVE_OD, h=CHECK_VALVE_T, $fn=$fn);
            // 5-port radial cross-cut slits
            for (i = [0:CHECK_VALVE_PORTS-1]){
                rotate([0,0,i*360/CHECK_VALVE_PORTS])
                    translate([2.0, -CHECK_VALVE_PORT_W/2, -0.1])
                        cube([CHECK_VALVE_PORT_L,
                              CHECK_VALVE_PORT_W,
                              CHECK_VALVE_T+0.2]);
            }
        }
    }
}

// plunger shaft with latch groove and array mount
module plunger(){
    color("Silver"){
        cylinder(d=PLUNGER_OD, h=PLUNGER_LEN, $fn=$fn);
        // latch groove ring
        translate([0,0,PLUNGER_LEN*0.65])
            difference(){
                cylinder(d=PLUNGER_OD+1.0, h=2.0, $fn=$fn);
                translate([0,0,-0.1])
                    cylinder(d=PLUNGER_OD-1.6, h=2.4, $fn=$fn);
            }
        // top button-stem coupling boss
        translate([0,0,PLUNGER_LEN])
            cylinder(d=PLUNGER_OD-1, h=2.5, $fn=$fn);
    }
}

module bellows_assy(){
    color("WhiteSmoke", 0.55)
        bellows(BELLOWS_OD, BELLOWS_ID, BELLOWS_H,
                BELLOWS_FOLDS, BELLOWS_WALL);
}

module housing(){
    color("SteelBlue", 0.35){
        difference(){
            cylinder(d=HOUSING_OD, h=HOUSING_H, $fn=$fn);
            translate([0,0,-0.1])
                cylinder(d=HOUSING_OD - 2*HOUSING_WALL,
                         h=HOUSING_H + 0.2, $fn=$fn);
            // viewing window
            translate([HOUSING_OD/2 - HOUSING_WALL - 0.5,
                      -10, HOUSING_H*0.2])
                cube([HOUSING_WALL+1, 20, HOUSING_H*0.55]);
            // lateral vacutube port
            translate([0,0,HOUSING_H*0.18])
                rotate([0,90,0])
                    cylinder(d=VACUTUBE_OD+0.6,
                             h=HOUSING_OD, $fn=$fn);
        }
    }
}

module skin_skirt(){
    color("LightCoral", 0.75){
        difference(){
            cylinder(d=SKIN_SKIRT_OD, h=SKIN_SKIRT_H, $fn=$fn);
            translate([0,0,-0.1])
                cylinder(d=SKIN_SKIRT_ID,
                         h=SKIN_SKIRT_H+0.2, $fn=$fn);
        }
    }
}

module vacutube(){
    // body
    color("Crimson", 0.55){
        difference(){
            cylinder(d=VACUTUBE_OD, h=VACUTUBE_LEN, $fn=$fn);
            translate([0,0,1.5])
                cylinder(d=VACUTUBE_BORE,
                         h=VACUTUBE_LEN, $fn=$fn);
        }
    }
    // septum cap
    color("DarkSlateGray")
        translate([0,0,-VACUTUBE_CAP_H])
            cylinder(d=VACUTUBE_OD+0.8, h=VACUTUBE_CAP_H, $fn=$fn);
}

module button(){
    color("RoyalBlue"){
        // domed top
        translate([0,0,BUTTON_H*0.6])
            scale([1,1,0.55])
                sphere(d=BUTTON_OD);
        // cylinder base
        cylinder(d=BUTTON_OD, h=BUTTON_H*0.6, $fn=$fn);
        // stem
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
// STACK z positions (assembled state, axis = +z up)
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

// =============================================================
// ASSEMBLY
// =============================================================
module assembly(){
    // 0. skin skirt
    translate([0,0,ez(Z_SKIRT, 0)])           skin_skirt();
    // 1. needle disc (needles point downward into skirt)
    translate([0,0,ez(Z_NEEDLE_DISC, 1)])     needle_disc();
    // 2. manifold
    translate([0,0,ez(Z_MANIFOLD, 2)])        manifold();
    // 3. check valve
    translate([0,0,ez(Z_CHECK_VALVE, 3)])     check_valve();
    // 4. retraction spring
    translate([0,0,ez(Z_RET_SPRING, 4)])      ret_spring();
    // 5. bellows
    translate([0,0,ez(Z_BELLOWS, 5)])         bellows_assy();
    // 6. plunger inside bellows region
    translate([0,0,ez(Z_PLUNGER_BASE, 5)])    plunger();
    // 7. actuation spring
    translate([0,0,ez(Z_ACT_SPRING, 6)])      act_spring();
    // 8. button
    translate([0,0,ez(Z_BUTTON, 7)])          button();
    // 9. housing — sized to envelop full assembled stack only,
    //    in explode view it sits at base (won't envelop top items)
    translate([0,0,ez(Z_NEEDLE_DISC + NEEDLE_DISC_T, 1)])
        housing();
    // 10. vacutube — vertical, port-side of manifold
    translate([HOUSING_OD/2 + 6 +
              (view_mode=="explode" ? explode*0.8 : 0),
              0,
              ez(Z_MANIFOLD, 2) + MANIFOLD_T/2 - VACUTUBE_LEN/2])
        vacutube();
}

module main(){
    if (view_mode == "section"){
        difference(){
            assembly();
            translate([-100, 0, -10]) cube([100, 200, 300]);
        }
    } else {
        assembly();
    }
}

main();
