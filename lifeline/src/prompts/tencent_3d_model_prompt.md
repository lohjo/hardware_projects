# 3D Model Generation Prompt
## Kimini Blood Sampler — Microfluidic Flow Channels with Integrated Check Valve
### Based on: Deiana & Smith (2024), *Micromachines* 15, 359 + Kimini-SAM-RPT Design Context

---

## PROMPT

Generate a highly detailed, dimensionally accurate, Fusion 360-style 3D CAD model of a
**compact microfluidic plasma separation and blood collection manifold** for the Kimini
Compact Vacuum Blood Sampler device. The model must integrate three tightly coupled
subsystems into a single monolithic SLA-printable body: **(1) an asymmetric microfiltration
plasma separation chamber**, **(2) a five-port passive TPU flap check valve seat**, and
**(3) an equal-path-length radial blood collection channel network** that terminates at a
lateral Luer-lock-compatible vacutube port. All internal flow geometry must be optimised
for laminar flow (Re < 10) of blood plasma at room temperature.

---

## PART 1 — OVERALL BODY GEOMETRY

The manifold body is a **short, squat disc** — imagine a hockey puck with precision
engineering inside it. Its outer diameter is exactly **48.0 mm**, which matches the outer
housing shell of the Kimini device and allows it to snap flush into the lower housing ring
without any overhang or gap. The total height of the manifold body from its flat bottom
face to its flat top face is **16.0 mm**. All external corners carry a **1.0 mm chamfer** (not a radius — a flat 45-degree cut) to prevent stress concentration during press-fit assembly and to give the part a machined, professional appearance when rendered.

The body is rendered in **medium-dark engineering grey** (approximately RAL 7037
Dusty Grey), with a **matte surface finish** simulating SLA-printed rigid photopolymer
resin (Formlabs Grey or ELEGOO plant-based translucent resin, post-cured). Internal
channel walls should be rendered in a slightly lighter grey with a faint semi-gloss finish
to represent the smooth, cured resin interior surfaces achievable with SLA printing at
0.05 mm layer height.

The body has **three distinct functional zones stacked vertically**, each occupying a
defined height band:

- **Zone A — Check Valve Seat (top 4.0 mm):** The uppermost layer of the manifold,
  interfacing directly with the TPU flap check valve disc and the bellows assembly above.
- **Zone B — Plenum and Radial Channel Network (middle 8.0 mm):** The heart of the
  manifold, containing the central blood collection plenum and all radial flow channels
  leading from needle interface points to the central collection zone.
- **Zone C — Plasma Separation Chamber (bottom 4.0 mm):** The lowermost layer,
  which houses the snap-fit membrane clamp geometry, the plasma collection pattern
  floor, and the microneedle array interface socket.

---

## PART 2 — ZONE C: PLASMA SEPARATION CHAMBER (BOTTOM LAYER)

### 2a. Microneedle Array Interface Socket

On the absolute bottom face of the manifold — the face that points toward the skin
during use — machine a **circular recessed socket** of diameter **22.5 mm** and depth
**2.5 mm**. This socket accepts the SLA-printed microneedle array disc with a light
interference fit. The socket walls are perfectly vertical (zero draft angle) with a surface
finish of Ra 0.8 µm (smooth, to ensure airtight press-fit contact). At the very base of
this socket, centred exactly on the manifold axis, drill **twenty-five vertical through-holes**
arranged in a **5×5 square grid pattern** with a **centre-to-centre pitch of 3.0 mm**. Each
hole has a diameter of **0.5 mm** — just wide enough to allow plasma and capillary blood
to rise under vacuum without admitting cellular debris. The grid is centred on the manifold
axis, meaning the outermost needles sit 6.0 mm from centre. The corners of this 5×5 grid
sit at ±6.0 mm in both X and Y from the manifold centreline.

### 2b. Plasma Collection Floor Pattern

Immediately surrounding the 5×5 needle hole grid, within the floor of the socket, cut
a **shallow plasma collection pattern** into the resin surface to a depth of **0.1 mm** and
feature width of **0.5 mm**. This pattern is directly inspired by **Pattern P1 from Deiana
& Smith (2024, Figure 3)** — a continuous **Archimedean spiral** radiating outward from
the central needle array zone to the outer edge of the socket floor.

The spiral begins at a radius of **4.0 mm** from centre (just outside the outermost
needle holes) and winds outward in a clockwise direction with a **constant pitch of
1.2 mm between successive spiral arms**, terminating at a radius of **10.0 mm** (just
inside the socket wall). The channel cross-section of the spiral groove is a **shallow
rectangular slot**: 0.5 mm wide × 0.1 mm deep, with **square edges** (no rounding of the
groove corners — this maximises capillary action along the groove walls).

The purpose of this spiral groove is to create a large wetted surface area that wicks
plasma away from the downstream membrane face by capillary action, directing it toward
the five radial collection ports that connect Zone C to Zone B above. The spiral pattern
should be visible as fine engraved lines on the socket floor when rendered from below.

### 2c. Membrane Clamp Ring

At the **outer perimeter of the socket** (radius 11.25 mm from centre), raise an
**annular membrane clamp ridge** that protrudes **0.4 mm upward** from the socket floor
and is **0.8 mm wide** in the radial direction. This ridge, when the microneedle array
disc is press-fitted into the socket, compresses the outer edge of the plasma separation
membrane (a 13.0 mm diameter Vivid GR polysulfone membrane disc, 0.45 mm thick)
between the clamp ridge and the flat underside of the microneedle disc, creating a
**circumferential hydraulic seal** that prevents whole blood from bypassing the membrane
and contaminating the filtered plasma stream. The top surface of this clamp ridge should
be flat and sharp-edged — not rounded — to maximise clamping pressure per unit area.

### 2d. Snap-Fit Locator Features (Single-Hook Geometry)

On the outer cylindrical wall of Zone C, at **two diametrically opposed positions**
(0° and 180° around the circumference), add **single-hook cantilever snap-fit features**
inspired by the S1 geometry from **Deiana & Smith (2024, Figure 2C)**:

- Each hook is a **rectangular cantilever beam** protruding **3.5 mm radially outward**
  from the manifold wall, **2.0 mm tall** in the vertical axis, and **4.0 mm wide**
  circumferentially.
- The tip of the cantilever carries a **0.8 mm tall locking barb** with a **30-degree lead-in
  ramp** on its lower face (to guide assembly) and a **90-degree locking face** on its upper
  face (to resist disassembly).
- The cantilever root has a **fillet radius of 0.3 mm** at its base to reduce stress
  concentration during the snap-fit engagement cycle.
- At 90° and 270° around the circumference, add two **rigid cylindrical locator pins**
  of diameter **2.0 mm** and height **3.0 mm** protruding from the manifold wall. These
  pins engage matching holes in the microneedle overskirt ring and prevent rotational
  misalignment during assembly.

---

## PART 3 — ZONE B: PLENUM AND RADIAL CHANNEL NETWORK (MIDDLE LAYER)

### 3a. Central Blood Collection Plenum

At the geometric centre of the manifold, bored vertically through the full **8.0 mm
height of Zone B**, create a **central cylindrical plenum chamber** of diameter **8.0 mm**.
This chamber is the convergence point for all radial blood channels and the origin of the
lateral vacutube port channel. Its walls are smooth (Ra 0.8 µm). The top of the plenum
opens directly into the check valve seat recess in Zone A above. The bottom of the plenum
connects to the spiral collection pattern in Zone C below via five vertical collection ports
(described in 3b).

### 3b. Five Vertical Collection Ports (Zone C to Zone B Interface)

At the floor of the central plenum (the Zone B/Zone C interface plane), drill **five
vertical through-holes** of diameter **0.8 mm** arranged in a **cross (plus-sign) pattern**:
one hole exactly on the manifold centreline, and four holes offset **2.5 mm** from centre
along the +X, −X, +Y, and −Y axes respectively. These five ports are the **inlet ports
of the check valve system** — they are the exact holes over which the TPU 85A flap disc
seats in Zone A. Their walls must be perfectly cylindrical with no taper, and their top edges
carry a **0.15 mm × 45-degree countersink chamfer** (a tiny funnel at the top) to provide
a defined seating surface for the flap membrane and to prevent the soft TPU from being
cut by a sharp edge under repeated pressure cycling.

### 3c. Radial Equal-Path Blood Channel Network

Radiating outward from the central plenum into the body of Zone B, cut **five
equal-length radial flow channels** — one channel aligned with each of the five collection
ports below, running horizontally (perpendicular to the manifold axis) through the
manifold body. Each channel:

- Has a **circular cross-section of diameter 1.5 mm** throughout its entire length,
  consistent with the **Hagen-Poiseuille laminar flow requirement** for blood plasma
  (dynamic viscosity µ ≈ 0.00125 Pa·s, density ρ ≈ 1025 kg/m³, Re < 4 confirmed
  by calculation matching Deiana & Smith 2024, Section 3.1).
- Runs at a **constant height of 8.0 mm from the bottom face** of the manifold (i.e.,
  midway through Zone B height), perfectly horizontal with zero slope.
- Travels from the wall of the central plenum outward to a **radial distance of
  10.5 mm from the manifold centreline** — this is the **equal-path length L = 10.5 mm**
  that ensures uniform suction pressure at all five collection points simultaneously,
  preventing any single port from dominating the draw.
- Terminates at its outer end in a **blind hemispherical end-cap** (a dome-shaped
  termination matching the drill bit geometry, radius 0.75 mm), except for the one
  channel that is aligned with the vacutube lateral port direction (see 3d).
- The five channels are arranged radially at **0°, 72°, 144°, 216°, and 288°** around
  the manifold centreline (i.e., equally spaced at 72-degree intervals in a pentagonal
  arrangement), providing rotationally symmetric vacuum distribution.

Visualise this channel network as the spokes of a wheel viewed from above, with the
central plenum as the hub. Each spoke is a smooth-bored cylindrical tunnel bored through
the solid resin body of the manifold, meeting the hub at a clean tangential intersection
with no sharp internal corners (apply a **0.5 mm internal fillet** at each spoke-hub
junction to reduce flow separation and prevent stagnation zones where blood could pool
and begin to coagulate).

### 3d. Lateral Vacutube Port Channel

One of the five radial channels — specifically the one aligned at **0° (the 3-o'clock
position when viewed from above)** — does not terminate blindly. Instead, it continues
past the 10.5 mm equal-path terminus and transitions into the **lateral vacutube port
bore**, which exits through the outer cylindrical wall of the manifold at exactly **90°
to the manifold axis**. This port bore has:

- **Inner diameter: 8.5 mm** (to accept standard 4 mL vacutube with a light push-fit).
- **Outer housing boss diameter: 14.0 mm** (a raised circular boss protruding 12.0 mm
  outward from the manifold wall, like a stubby nozzle).
- **Boss wall thickness: 2.75 mm** around the bore.
- **O-ring groove:** At 5.0 mm from the mouth of the port (measured inward along the
  port axis), cut an **O-ring groove** of width **1.6 mm** and depth **1.1 mm** with a
  **flat bottom** (not curved). This groove accepts a standard **AS568-006 silicone O-ring**
  (2.57 mm cross-section) that creates a hermetic seal with the vacutube outer wall when
  pressed home.
- The **mouth of the port** (the outer opening) is chamfered at **30 degrees** for a depth
  of 1.0 mm to guide the vacutube during insertion and prevent edge damage to the
  O-ring during assembly.

The transition between the 1.5 mm radial channel and the 8.5 mm vacutube bore is
accomplished via a **smoothly blended conical expansion section** 4.0 mm long — a
cone whose diameter increases from 1.5 mm to 8.5 mm over this 4.0 mm length, with a
half-angle of approximately 38 degrees. The inner wall of this expansion cone is smooth
and polished (Ra 0.4 µm) to minimise flow disruption as blood transitions from the narrow
collection channel into the wide vacutube reservoir bore.

---

## PART 4 — ZONE A: CHECK VALVE SEAT (TOP LAYER)

### 4a. Valve Seat Recess

On the **top face of the manifold** (the face that interfaces with the TPU bellows
assembly above), machine a **shallow circular recess** — think of it as a precisely sized
shallow bowl set into the top surface. This recess:

- Has a diameter of **27.0 mm** (0.5 mm wider than the 26.5 mm TPU flap disc,
  providing a 0.25 mm radial clearance on all sides so the disc can seat without
  binding yet without excessive lateral play).
- Has a **depth of 0.50 mm** — just deep enough to fully recess the 0.40 mm thick
  TPU flap disc so its top surface sits **0.10 mm below** the surrounding top face
  of the manifold. This 0.10 mm step means that when the bellows lower flange is
  clamped down onto the manifold top face, it exerts a gentle but consistent downward
  preload on the flap disc, ensuring it remains flat against its seat under zero-pressure
  conditions (the resting closed state).
- The floor of the recess is **mirror-flat** (Ra 0.2 µm, the finest surface finish on any
  feature of this part) because it is the sealing surface against which the TPU flap
  must make a bubble-tight contact over all five ports. Any surface roughness here
  would create leak paths past the valve in the closed state.
- The outer edge of the recess carries a **0.1 mm × 45-degree chamfer** to prevent
  the TPU disc edge from catching or folding during insertion.

### 4b. Five Seating Port Counterbores

The five vertical collection ports described in 3b continue upward through Zone A and
open into the floor of the valve seat recess. At each port opening on the recess floor,
apply a **0.15 mm radius hemispherical countersink** — a tiny, gently curved funnel
at the port mouth. This geometry, derived from the passive check valve design principles
in **Vante et al. (2016)**, creates a well-defined seating ring for the TPU flap at each
port location. When the flap is closed and resting against the recess floor, the curved
port mouth creates a slightly higher contact stress at the perimeter of each port opening,
improving the hydraulic seal without requiring high clamping force. Under the microscope,
these five countersunk port mouths — arranged in their cross pattern, polished to
near-mirror finish — should resemble five tiny eyes looking upward at the flap disc.

### 4c. Bellows Lower Flange Socket

Surrounding the valve seat recess, the top face of Zone A carries a **concentric annular
socket** that accepts the lower flange of the TPU 95A bellows:

- **Socket inner diameter: 42.5 mm** (matching the bellows outer diameter of 42.0 mm,
  with a 0.25 mm press-fit interference on radius).
- **Socket depth: 3.5 mm** (accepting the 3.0 mm thick bellows lower flange with
  0.5 mm of axial preload compression to ensure a gas-tight seal at the bellows-manifold
  interface without requiring adhesive).
- The **inner wall of this socket** carries a **single circumferential groove** at 1.5 mm
  depth from the socket top: 1.6 mm wide × 1.0 mm deep, to accept a bead of
  medical-grade silicone adhesive (Loctite 5248 or equivalent) as a secondary seal
  in addition to the interference fit.

---

## PART 5 — INTEGRATED CHECK VALVE COMPONENT (SEPARATE BODY)

Model the **TPU 85A flap check valve** as a **separate soft body** nested within the
valve seat recess. This component should be rendered in a **warm amber/golden colour**
(approximately Pantone 7509 C, representing the natural colour of Shore 85A TPU) with
a **slightly translucent, matte rubber-like surface appearance** — it should look unmistakably
like a thin flexible disc, not rigid plastic.

**Geometry:**

The flap is a **perfectly flat circular disc** of:
- **Outer diameter: 26.5 mm**
- **Thickness: 0.40 mm** (uniform throughout — no taper, no ribbing, no features
  on its surfaces other than the five port holes described below)
- **Corner break:** A **0.05 mm radius micro-chamfer** on all edges to prevent
  tearing during repeated flex cycles (this detail would only be visible in a close-up
  render, but it is structurally important)

Through the disc, cut **five through-holes matching the port pattern** — one central
hole and four offset at ±2.5 mm in the cardinal directions — each of diameter **0.80 mm**.
These holes in the flap are positioned to align exactly over the five counterbored port
openings in the valve seat recess floor when the disc is seated.

**The flap disc in the model should be shown in two states as separate sub-assemblies
or render layers:**

**State 1 — CLOSED (resting / Phase 1):** The flap lies perfectly flat and horizontal
in the seat recess, its bottom face in full contact with the polished recess floor. The disc
is uniformly flat — no bowing, no deflection. The five port holes in the disc align exactly
with the five port openings in the recess floor. From above, the assembly looks like a
golden disc inlaid flush into the grey manifold top face.

**State 2 — OPEN (Phase 3 blood draw):** The flap has bowed upward in the centre
by approximately **1.2 mm** at its maximum deflection point (the centre of the disc),
creating a **shallow dome or lens shape** when viewed in cross-section. The outer rim
of the disc (the outermost 2.0 mm annular ring) remains in contact with the recess floor,
acting as the hinge/pivot line. The five ports are now unobstructed — a clear gap
exists between the disc's underside and the recess floor over the entire central area,
creating the flow path for blood to rise through the ports and past the valve into the
plenum above. Render blood flow as semi-transparent **deep crimson red streams**
(approximately R:180, G:0, B:20, opacity 70%) rising through the five ports and
spreading beneath the bowed flap like water rising under a lifted drum.

---

## PART 6 — ASSEMBLY VIEW AND SECTION CUTS

**Required views for the complete model:**

**View 1 — Full Exploded Isometric (Top-Right-Front perspective, 35° elevation):**
Show all components floating above their assembly positions in the classic Fusion 360
exploded-view style, with thin grey leader lines connecting each component to its
assembled position. Components from top to bottom: (1) TPU bellows lower flange
cross-section silhouette shown in ghost/transparent, (2) TPU 85A check valve flap disc
(amber, flat / State 1), (3) the manifold body (grey, with all external features visible),
(4) the SLA microneedle array disc (clear/translucent, shown floating below the
manifold socket). The vacutube should be shown floating to the right of the manifold
at the correct lateral port angle, its Luer-lock boss aligned with the manifold port boss.

**View 2 — Full Mid-Plane Section Cut (vertical cut through manifold centreline
and vacutube port axis, i.e., the XZ plane if Y is the vacutube direction):**
This is the most information-rich view. It reveals simultaneously: the spiral plasma
collection pattern engraved in the socket floor, the five vertical collection ports as
narrow vertical bores cutting through all three zones, the central plenum as a tall
open cylinder, the radial channel network as horizontal bores intersecting the plenum,
the conical expansion transitioning into the vacutube port, the check valve seat recess
and flap disc shown in State 1 (flat and closed), and the bellows lower flange socket.
Label every critical dimension with thin blue leader lines and dimension callouts
in Fusion 360 house style (dimension text in 2.5 mm Arial, leader lines in 0.25 mm
weight, arrowheads as small filled triangles). Key dimensions to call out: Ø48.0,
H16.0, Ø8.0 plenum, Ø1.5 channel, L10.5 equal-path, Ø8.5 vacutube bore, depth
0.50 valve seat, t0.40 flap disc.

**View 3 — Bottom Face View (looking straight up at the underside of the manifold):**
The viewer is looking directly up at the face that presses against the skin during use.
This view should clearly show: the Ø22.5 mm microneedle socket as a deep circular
recess dominating the centre of the face, the spiral plasma collection pattern engraved
into the socket floor (all turns of the spiral visible as fine concentric-ish curved grooves),
the 25 needle holes as a neat 5×5 grid of tiny dots at the centre of the socket, the
membrane clamp ridge as a thin raised ring at the socket perimeter, and the two
snap-fit cantilever hooks and two locator pins at the 0°/90°/180°/270° positions.
Render this view with a slight warm lighting from below to emphasise the depth of
the socket and the fine relief of the spiral pattern.

**View 4 — Close-up cross-section of the check valve seat (50% scale zoom
into Zone A):** Show only the top 4.0 mm of the manifold in cross-section, with the
TPU flap shown in State 2 (open, bowed upward). Render the blood flow paths in
semi-transparent red rising through the five counterbored port openings, spreading
laterally beneath the domed flap, and converging upward into the central plenum
cavity above. Add micro-detail labels: the 0.15 mm countersink chamfer at each port
mouth, the 0.50 mm recess depth, the 0.10 mm flap protrusion gap, and the 1.2 mm
maximum dome deflection.

---

## PART 7 — MATERIAL, FINISH AND RENDERING SPECIFICATIONS

**Manifold body (all three zones):**
- Material: SLA-printed photopolymer rigid resin (Formlabs Grey Pro or ELEGOO
  plant-based translucent, post-cured)
- Colour: RAL 7037 Dusty Grey (#898176), matte finish
- Internal channel walls: slightly lighter grey (#A8A098), semi-gloss
- Surface roughness (external faces): Ra 1.6 µm (as-printed SLA quality)
- Surface roughness (valve seat recess floor): Ra 0.2 µm (polished)
- Surface roughness (internal channels): Ra 0.8 µm

**Check valve flap:**
- Material: TPU Shore 85A (softer than the bellows TPU 95A)
- Colour: Warm amber, semi-translucent (#D4954A at 85% opacity)
- Appearance: Matte rubber surface, slightly flexible-looking
- Render with a faint surface texture suggesting elastomeric material (fine bumpy
  stipple pattern, feature size ~0.05 mm, barely perceptible except in macro views)

**Blood flow visualisation:**
- Colour: Deep crimson (#B40014), semi-transparent (65–70% opacity)
- Render as smooth flowing streams, not discrete particles
- In section views, show blood filling the channels as a solid crimson fill
- In Phase 3 animated or exploded views, show blood as flowing wisps rising
  through ports and spreading beneath the open flap

**Plasma (post-filtration):**
- Colour: Pale straw yellow (#F5E6A3), semi-transparent (50% opacity)
- Represent plasma pooled in the vacutube as a slightly viscous, clear-golden liquid

**Background and staging:**
- White or very light grey background (#F8F8F6)
- Soft three-point studio lighting: key light from upper-left, fill from right,
  subtle rim light from below for the bottom-face view
- No shadows except soft ambient occlusion at recesses and snap-fit features
- Include a **scale bar of 10.0 mm** in every view, rendered as a solid white bar
  with black text in the lower-right corner

---

## PART 8 — KEY PERFORMANCE PARAMETERS TO ENCODE IN GEOMETRY

The following quantitative targets derived from **Deiana & Smith (2024)** and
**Kimini-SAM-RPT design context** must be reflected in the geometry choices:

| Parameter | Target | Geometric implication |
|---|---|---|
| Plasma yield | ≥ 56.88% of available volume | Spiral P1 pattern + tight membrane clamp |
| Extraction time | < 87 s | Short channel length (10.5 mm), Ø1.5 mm bore |
| Haemolysis (Hgb diff) | < 0.003 g/dL | Smooth channel walls Ra 0.8, no sharp bends |
| Check valve cracking P | 5–8 kPa | t_flap = 0.40 mm, Ø26.5 mm disc, TPU 85A |
| Operating vacuum | –50 to –96 kPa | All sealing features rated to 100 kPa differential |
| Blood volume input | 50 µL (capillary) | Socket volume ~20 µL, membrane area ~1.33 cm² |
| Flow regime | Laminar Re < 4 | Channel Ø1.5 mm, L 10.5 mm, u ≈ 0.007 m/s |
| Membrane type | Vivid GR 13mm disc | Socket recess Ø22.5 accepts folded membrane |
| Assembly method | Single snap-fit (S1) | One hook + one locator per side, hand-assemblable |
| Manufacturing method | SLA resin, 0.05 mm layer | Min feature 0.5 mm channel, no overhangs < 45° |

---

## PART 9 — DESIGN CONSTRAINTS AND MUST-AVOID LIST

- **No internal channels narrower than 0.50 mm** — below this diameter, SLA
  resin clogs during printing or immediately after removal, as confirmed by Deiana
  & Smith (2024, Section 2.3): the tested printer's minimum reliable channel was
  0.6 mm; the Kimini design uses 0.7 mm for plasma channels and 1.5 mm for the
  main blood channels, well above this limit.
- **No overhangs steeper than 45°** without support structures — all internal channel
  roofs must slope at ≤45° from horizontal OR be self-supporting arcs. The five
  vertical collection ports (diameter 0.8 mm, fully vertical) are the exception and
  are acceptable because they are narrow enough to bridge without support.
- **No sharp 90-degree internal corners** where flow changes direction — all
  direction changes in the channel network must use a **minimum bend radius of
  0.75 mm** (equal to the channel radius) to prevent flow separation and red blood
  cell shear damage at corners.
- **The membrane clamp ridge must compress the membrane edge uniformly** —
  the clamp ring must be co-planar (all points within ±0.05 mm of the same horizontal
  plane) to ensure uniform sealing pressure around the entire 360-degree membrane
  perimeter, as insufficient edge compression was identified as the primary failure
  mode in the multi-hook and S2 devices (Deiana & Smith 2024, Section 3.4).
- **The vacutube port axis must be exactly perpendicular (90°) to the manifold
  vertical axis** — any angular deviation creates misalignment with the lateral blood
  flow direction observed in the Kimini video reference and risks kinking the blood
  channel at the conical expansion junction.
- **All blood-contacting surfaces must be smoothly connected** — there should be
  no ledges, steps, undercuts, or abrupt diameter changes anywhere along the
  continuous flow path from needle interface holes → spiral grooves → vertical
  collection ports → radial channels → central plenum → conical expansion →
  vacutube bore. Every transition must be a smooth, tangentially blended surface.

---

## PART 10 — FILE AND OUTPUT SPECIFICATIONS

- **Primary format:** Autodesk Fusion 360 `.f3d` parametric model with full design
  history and named components
- **Export formats:** STEP (.stp) for universal CAD exchange; STL at 0.01 mm
  deviation tolerance for SLA slicing; OBJ + MTL with material assignments for
  rendering
- **Render outputs:** Four views as described in Part 6, each at 4K resolution
  (3840 × 2160 px), PNG format with transparent background option
- **Exploded view animation (optional):** 10-second turntable + explode sequence
  at 60 fps, 1920×1080, MP4
- **Drawing package:** 2D engineering drawing in A3 format with all dimensions
  from the Key Dimensions Table (Part 8) fully annotated in ISO first-angle projection,
  section view A-A through centreline, section view B-B through vacutube port axis

---

*Prompt compiled from: Deiana & Smith (2024), Micromachines 15, 359 ·
Blicharz et al. (2018), Nature Biomedical Engineering 2, 151–157 ·
Kimini-SAM-RPT CAD Design Documentation, NovaBioTech Devices, March 2026 ·
Vante et al. (2016), PMC5089928*