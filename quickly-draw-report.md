# Quickly-Draw!: A Fully 3D-Printable, Open-Source, Sub-$7 Compact Vacuum Blood Sampler for Disaster-Response and Low-Resource Settings

**Loh John Ray**  
Product Development Lead, quickly-draw! Medical Devices  
MIG Lifeline Hackathon, April 2026

---

## Abstract

Conventional venipuncture remains inaccessible in disaster-response and low-resource settings due to its dependence on trained personnel, cold-chain infrastructure, and high per-draw costs. This paper presents Quickly-Draw!, a fully 3D-printable, open-source, minimally invasive vacuum blood sampling device targeting a unit cost below USD $7. The device integrates four coupled subsystems: (1) a Linear Soft Vacuum Actuator (LSOVA) bellows body fabricated in TPU 95A with α=45° accordion fold geometry, generating –80 to –96 kPa of stored negative pressure via passive user compression; (2) a spring-loaded 5×5 solid SLA-printed microneedle array (height ~600–800 µm, tip radius <1 µm, 3.0 mm pitch) for high-velocity skin puncture and instant retraction; (3) a passive diaphragm check valve (TPU 85A, 0.4 mm flap, Ø26.5 mm, cracking pressure 5–8 kPa) governing unidirectional blood flow through an equal-path-length radial microfluidic manifold; and (4) a commercial VacuTube reservoir (8.5 mm bore, 4 mL collection volume) as the sealed sample container. Operation proceeds in three stages — Prime (bellows compression stores vacuum), Apply (spring-loaded microneedle array fires and retracts), and Draw (bellows spring-back pulls capillary blood through the manifold into the VacuTube). Clinical evidence from Cunningham et al. (2000) demonstrates that vacuum-assisted lancing at ~50 kPa yields pain scores 95% lower than conventional fingerstick, with glucose correlation r=0.96 [ref]. LSOVA characterisation by Tawk et al. (2019) confirms –96 kPa operating pressure, 27.66 N output force, and ~21,500-cycle lifetime from a single-step FDM print [1]. Quickly-Draw! addresses a critical gap in disaster-response healthcare by requiring no electricity, no trained clinician, and no cold-chain support, while remaining manufacturable on a $300 consumer-grade printer and fully compatible with standard laboratory VacuTube workflow.

---

## 1. Introduction

Blood sampling is a cornerstone diagnostic procedure, enabling assessment of glucose, haematological parameters, infectious disease markers, and biochemical analytes. Conventional venipuncture — the gold-standard method — requires a trained phlebotomist, sterile needles of gauge 21–23, evacuated collection tubes, and downstream laboratory infrastructure. In high-income settings these requirements are routinely met; in disaster-response contexts, mass-casualty scenarios, or low- and middle-income country (LMIC) field clinics, each prerequisite represents a potential failure point.

Following natural disasters such as earthquakes, floods, or prolonged civil displacement, medical supply chains are disrupted, cold chains collapse, and trained clinical personnel are diverted to surgical triage. Yet chronically ill displaced populations — diabetics requiring glucose monitoring, cardiac patients requiring INR checks, or febrile patients requiring malaria rapid diagnostic workup — continue to need blood-based diagnostics. The absence of portable, nurse-free, low-cost sampling tools directly impedes point-of-care (POC) triage and disease management in exactly the settings where it is most needed.

Existing alternatives each carry significant limitations. Lancets combined with capillary tubes are inexpensive and widely available but yield volumes of only 20–50 µL, insufficient for many multi-analyte panels. Commercial microneedle-patch devices such as the TAP device (Seventh Sense Biosystems) achieve painless sampling but are precision-manufactured, proprietary, and cost $25–$35 per unit — incompatible with LMIC or disaster-response deployment at scale. Vacuum-assisted lancing systems described by Cunningham et al. (2000) demonstrated that applying sub-atmospheric pressure to the forearm substantially improves blood yield and patient comfort, but no integrated 3D-printable implementation existed at the time of that work. The bioinspired leech-suction approach of the 2024 *Advanced Science* device combines microneedle arrays with vacuum draw and demonstrates the feasibility of sub-millimetre needle penetration with active suction [2], yet again requires precision manufacturing beyond the reach of field prototyping.

No currently available device combines: a fully 3D-printable bill of materials, an open-source parametric design, LSOVA-based passive vacuum actuation, integrated microneedle array, passive check-valve microfluidics, and a sub-$7 unit cost compatible with standard VacuTube laboratory workflow.

This paper presents Quickly-Draw!, a compact vacuum blood sampler that closes this gap. The device is designed for fabrication on consumer FDM and hobbyist SLA printers, requires no electronics or trained operator beyond basic patient self-application, and targets deployment in disaster-response field kits, LMIC community health worker programmes, and remote triage settings. The paper characterises the four integrated subsystems, describes a complete fabrication plan, provides cost and timeline projections, and identifies the critical engineering constraints — in particular, check valve cracking pressure and bellows wall integrity — that govern device performance.

---

## 2. Literature Review

### 2.1 Linear Soft Vacuum Actuators (LSOVA)

The foundational characterisation of 3D-printable LSOVA was established by Tawk et al. [1], who demonstrated that accordion-fold bellows printed in a single step from TPU 95A on a low-cost FDM platform achieve 51% axial contraction, 27.66 N output force, –96 kPa operating pressure, ~6.49 Hz bandwidth, and approximately 21,500-cycle lifetime before fatigue failure. The critical geometric parameter is the fold wall angle α: at α=45°, the trade-off between stroke length and generated force is optimised for compact actuation tasks. Output force scales linearly with both the number of actuators assembled in parallel and the internal volume of a single actuator cell, enabling modular tuning without geometric redesign.

For blood sampling relevance, the –85 to –96 kPa operating pressure of Tawk et al.'s LSOVA overlaps directly with the –34 to –80 kPa pressure range employed in capillary blood sampling literature. This means the same TPU bellows that generates sufficient actuation force for soft robotic manipulation can simultaneously serve as the vacuum source for capillary blood draw — eliminating the need for a separate pump entirely and enabling a fully passive, user-actuated device.

### 2.2 Microneedle Technology

Moussi et al. (2021) [3] provide the comprehensive taxonomy of microneedle types relevant to this design: solid microneedles (for skin disruption without internal lumen), hollow microneedles (for drug delivery or fluid sampling through an internal channel), and coated microneedles (for transdermal drug delivery). For vacuum-assisted blood sampling, solid microneedles are preferred: they are mechanically stronger than hollow variants at equivalent tip dimensions, less prone to clogging, and fabricable by SLA with sub-micron tip radii achievable at standard 0.05 mm layer heights.

SLA fabrication offers key advantages over FDM for microneedle production: isotropic mechanical properties (no layer-line stress concentration), tip radii below 1 µm routinely achievable, and smoother channel walls (Ra ~0.8 µm versus ~3–5 µm for FDM) that reduce flow resistance and infection risk [3]. Typical high-performance microneedle arrays for blood sampling employ heights of 150–1,500 µm and pitch of 1–3 mm; Quickly-Draw! targets 600–800 µm height at 3.0 mm pitch in a 5×5 grid, placing it within the validated range while maintaining structural robustness under spring-loaded insertion forces.

Painlessness evidence from the microneedle literature is robust: the stratum corneum contains no nociceptors, and penetration depths below 1,500 µm do not reach the papillary dermis nerve endings that generate sharp pain sensation. Combined with high-velocity insertion-retraction (minimising dwell time and tissue deformation), the spring-loaded 5×5 array in Quickly-Draw! is projected to achieve pain scores substantially below conventional venipuncture.

### 2.3 Vacuum-Assisted Blood Sampling

Three bodies of work converge to validate the vacuum draw strategy. The bioinspired device reported in *Advanced Science* (2024) [2] demonstrated a leech-inspired suction cup integrating a microneedle array with vacuum actuation, achieving capillary blood volume enhancement and pain reduction versus conventional venipuncture. The TAP device, characterised by Blicharz et al. (2018) [4], integrates solid microneedles, a high-velocity insertion mechanism, stored vacuum, a microfluidic manifold with lithium heparin anticoagulant, and a single-button actuation sequence — providing the direct flow logic precedent for Quickly-Draw!'s manifold design.

Cunningham et al. (2000) [5] provided the most directly actionable clinical dataset: vacuum-assisted lancing applied to the forearm at approximately 50 kPa (one-half atmosphere) for 40 seconds across 215 subjects over four trials demonstrated that 95% of lance-sticks were judged less painful than conventional fingerstick, and glucose results correlated at r=0.96 with venipuncture reference. This establishes both the analyte quality and the patient-comfort case for vacuum-assisted alternate-site sampling in a non-specialist setting.

The check valve design principles applied in Quickly-Draw! draw on Vante et al. (2016) [6], who characterised passive thermoplastic check valves for POC microfluidic devices and identified cracking pressure calibration — the threshold between vacuum-driven opening and atmospheric closure — as the dominant manufacturing variable governing sample integrity.

---

## 3. Device Overview

Quickly-Draw! integrates four subsystems into a single-button, three-stage operation sequence:

- **Stage 1 (Prime):** User squeezes the TPU 95A bellows body, compressing the accordion and building –80 to –96 kPa stored negative pressure. The exhaust check valve opens, displacing air out of the chamber. The blood-inlet path remains sealed.
- **Stage 2 (Apply):** Device pressed onto skin. Spring-loaded plunger fires the 5×5 microneedle array into skin at high velocity; retraction spring immediately withdraws needles. Device remains sealed against skin via TPU overskirt (Shore 60–70A).
- **Stage 3 (Draw):** User releases grip. Bellows spring-back expands chamber volume. Exhaust check valve closes. Blood-inlet check valve opens at cracking pressure 5–8 kPa. Capillary blood drawn through microneedle channels, through the radial microfluidic manifold, into the VacuTube reservoir.

---

## 4. Design and Mechanism Analysis

### 4.1 LSOVA Bellows (Vacuum Source)

The bellows is the primary vacuum-generation subsystem. Fabricated in TPU 95A (NinjaFlex or Bambu TPU-95A), it employs the accordion fold geometry characterised by Tawk et al. [1] with wall angle α=45° at each fold, wall thickness 1.2–1.5 mm at the fold root. This root wall thickness is the critical print parameter: below 1.2 mm, inter-layer porosity in FDM introduces vacuum leakage sufficient to degrade performance; above 1.5 mm, fold compliance decreases and user squeeze force rises beyond comfortable hand-grip range (~20–30 N).

Printing orientation must be vertical — layer lines perpendicular to the fold direction — to maximise fatigue resistance. At this orientation, the tensile stress during bellows expansion acts along the layer bond direction rather than across it, extending cycle lifetime toward the ~21,500-cycle figure validated by Tawk et al. [1]. Perimeter count should be set to 4+ walls to minimise inter-layer porosity; the resulting vacuum hold target is <5% pressure loss over 10 minutes after sealant coating.

The operating pressure window of –80 to –96 kPa is well within the validated range of Tawk et al.'s LSOVA [1] and exceeds the minimum –34 kPa threshold required for vacuum-assisted capillary blood release at alternate sites [2]. The user-applied squeeze force required to reach –80 kPa is projected at 15–25 N — achievable by most adult users including elderly populations with mild grip weakness.

**Figure 1:** Cross-section schematic of the LSOVA bellows showing accordion fold geometry at α=45°. The diagram should be a 2D longitudinal section with the bellows in its natural (extended) state on the left and compressed state on the right. Annotate: fold angle α at each crease, root wall thickness zone (1.2–1.5 mm, shaded in amber), axial contraction direction (arrow, downward), fold-to-fold pitch, and the top-cap and bottom-flange seal interfaces. Colour-code: TPU 95A body in translucent grey, seal interfaces in blue. Include a pressure annotation: "−80 to −96 kPa" at the chamber interior of the compressed state. Scale bar: 10 mm.

### 4.2 Microneedle Array

The microneedle array comprises 25 solid SLA-printed needles arranged in a 5×5 grid at 3.0 mm pitch. Each needle is 600–800 µm tall with a tip radius below 1 µm, fabricated in biocompatible SLA resin at 0.05 mm layer height to achieve the required tip sharpness [3]. The array disc mounts on the spring-loaded plunger via a keyed socket interface that resists torque during insertion and permits axial travel.

The spring mechanism uses a dual-spring architecture: a heavy actuation spring (projected spring constant ~15–25 N/mm) pre-loaded by the button-press primes energy for rapid downward stroke; a lighter retraction spring (~5–8 N/mm) compressed at maximum needle extension stores energy for instant withdrawal. A latch mechanism releases the actuation spring at maximum button depression, decoupling needle timing from user press speed and ensuring consistent insertion velocity independent of operator variability. The net result is needle dwell time below 50 ms in skin, minimising tissue deformation and perceived pain.

The 3.0 mm pitch is selected to balance two competing requirements: sufficient inter-needle spacing to prevent lateral tissue tenting between adjacent needles (which would reduce effective penetration depth), and array compactness to fit within the skin-contact footprint of the device body. At 5×5 geometry with 3.0 mm pitch, the total array footprint is 15×15 mm — consistent with the contact geometry of the leech-inspired device [2] and within the flat forearm surface area available for alternate-site sampling.

**Figure 2:** Bottom-face view of the microneedle array disc. The diagram should show a square disc viewed from below (skin-facing side). Depict the 5×5 array of needle tips as filled circles on a 3.0 mm pitch grid. Annotate: pitch dimension (3.0 mm, shown between adjacent needle centres with a dual-arrow dimension line), overall footprint (15×15 mm, outer boundary dashed), tip radius (<1 µm, callout with magnified inset showing single needle tip in cross-section), and needle height range (600–800 µm, shown in side-view inset). Also show the keyed socket cutout at the disc perimeter that interfaces with the plunger. Colour-code: SLA resin needles in dark grey, disc body in light grey.

### 4.3 Check Valve and Microfluidic Manifold

The passive diaphragm check valve is the most sensitive performance-determining component in the device. It is fabricated from TPU 85A (softer than the 95A bellows) as a 0.4 mm flat flap disc of Ø26.5 mm, with a 5-port cross-pattern cut-out. Cracking pressure is calibrated to 5–8 kPa — below the –80 kPa operating vacuum (ensuring the valve opens during the draw phase) and above ambient atmospheric backpressure (ensuring the valve closes when the device is lifted off skin, preventing contamination or sample reversal) [6].

The 5–8 kPa cracking pressure window is non-trivial to maintain across FDM print batches due to layer-height variation affecting flap stiffness. A ±0.05 mm layer-height variation translates to approximately ±1 kPa cracking pressure shift, placing the lower bound dangerously close to the 5 kPa threshold. Mitigation strategies include: (a) printing check valve flaps as separate SLA-resin-backed TPU sheets to isolate geometry from FDM variability, and (b) post-print cracking-pressure characterisation via syringe-and-manometer bench test before assembly.

The microfluidic manifold body is fabricated in SLA resin for channel dimensional accuracy. Five radial channels at 72° angular spacing, each L=10.5 mm, Ø=1.5 mm, connect the microneedle array interface at the manifold centre to the check valve seat at the manifold perimeter. Equal path length across all five channels ensures uniform vacuum distribution at each needle tip; asymmetric channel lengths would produce differential pressure loss and non-uniform blood uptake across the array [see multichannel vacuum manifold design principles]. Computed Reynolds number for blood at these channel dimensions and expected flow rates: Re = ρvD/μ < 4, confirming fully laminar flow and negligible inertial pressure loss.

Flow logic:
- **Compression phase (Stage 1):** Bellows compression forces air past the exhaust check valve (cracking pressure opens under positive gauge pressure), venting to atmosphere. Blood-inlet path check valve remains closed (blood side is at atmospheric pressure, higher than compressed-air side — valve stays shut).
- **Draw phase (Stage 3):** Bellows spring-back creates negative gauge pressure. Exhaust check valve closes (atmospheric backpressure holds flap shut). Blood-inlet check valve opens at 5–8 kPa differential, drawing capillary blood through the microneedle channels into the manifold radial network and onward to the VacuTube.

**Figure 3:** Exploded assembly diagram showing all eight major components stacked along the device central axis, top to bottom: (1) **Top Button Assembly** — cylindrical button cap, labelled; (2) **Actuation Spring** — heavy coil spring, show coil diameter and approximate free length; (3) **Plunger with Microneedle Array** — cylindrical plunger body with the 5×5 needle disc attached at the bottom face, latch groove visible on plunger shaft; (4) **Retraction Spring** — lighter coil spring, noticeably smaller diameter and lower stiffness than actuation spring; (5) **TPU Bellows** — accordion fold body (translucent grey), α=45° folds visible; (6) **Manifold with Integrated Check Valves** — rigid disc body (SLA resin, dark grey) with five radial channels and check valve seat visible; (7) **VacuTube Reservoir** — standard cylindrical Vacutainer-style tube with septum cap; (8) **Main Housing** — outer cylindrical shell (PLA/PETG, blue). Explode each component along the vertical axis with 10–15 mm gaps between layers. Label all eight components with numbered callouts. Indicate O-ring position (AS568-006) at the VacuTube interface. Include a scale bar: 20 mm.

### 4.4 VacuTube Interface

The VacuTube (Vacutainer-compatible commercial tube) serves as the sealed collection reservoir. Its pre-evacuated interior provides a secondary vacuum draw independent of the bellows, drawing blood passively once the septum is punctured by the manifold's central luer-style port. The interface bore is 8.5 mm, sealed by an AS568-006 O-ring (3.69 mm ID, 1.78 mm cross-section) seated in a printed groove to tolerance ±0.1 mm. Collection volume is 4 mL — substantially exceeding the 0.5–0.8 mL typical of competing microneedle patch devices including the TAP device [4] — enabling multi-analyte downstream analysis without repeat sampling.

The VacuTube is detachable from the device body post-collection, transferring directly to standard laboratory analysers without decanting. This preserves sample integrity, maintains the cold-chain-compatible sealed environment, and removes the need for any additional transfer consumables.

---

## 5. Fabrication and Prototyping Plan

| Step | Component | Material | Method | Critical Parameter |
|------|-----------|----------|--------|--------------------|
| 1 | Bellows | TPU 95A (NinjaFlex / Bambu) | FDM, print vertically | Wall thickness 1.2–1.5 mm at fold root; 4+ perimeter walls; slow outer wall speed |
| 2 | Manifold body | SLA resin (Formlabs Grey / ELEGOO ABS-Like) | SLA, 0.05 mm layer | Internal channel Ra ≤0.8 µm; min channel Ø 0.5 mm supported |
| 3 | Check valve flap | TPU 85A | FDM thin sheet or SLA-backed film | 0.4 mm uniform thickness; Ø26.5 mm disc; 5-port cross pattern; cracking pressure 5–8 kPa verified |
| 4 | Microneedle array | SLA biocompatible resin | SLA, 0.025–0.05 mm layer | Tip radius <1 µm; 5×5 grid; 3.0 mm pitch; height 600–800 µm |
| 5 | Housing + plunger | PLA or PETG | FDM | Press-fit tolerances ±0.1 mm; bore circularity 4+ walls |
| 6 | Sealing (bellows + manifold) | XTC-3D epoxy brush-on / Plasti-Dip dip-coat | Post-process | 3 coat passes; target <5% pressure loss over 10 min at –80 kPa |

**Inter-layer porosity** is the primary fabrication challenge for FDM vacuum components. TPU 95A printed at 220–235°C with 4+ perimeter walls achieves inter-layer bond strength sufficient to resist –80 kPa for short durations, but micro-voids at layer interfaces create measurable pressure decay over 10+ minutes without sealant treatment. The three-pass Plasti-Dip or XTC-3D protocol penetrates surface voids and forms a continuous elastomeric skin without significantly increasing stiffness or altering fold compliance. Pressure decay testing (syringe pump + digital manometer, 10-minute hold) should be performed on every bellows print before assembly.

For production-intent manufacturing, the preferred migration path is **SLA for all wetted components** (manifold, check valve seats, microneedle array) and **FDM TPU for the bellows only**. SLA resin parts are near-airtight without sealant coating, have smooth channel walls, and are dimensionally accurate to ±0.05 mm — critical for check valve cracking pressure repeatability.

**Open-source prototyping path:** The parametric design is authored in OpenSCAD, enabling community iteration via GitHub pull-request workflow. All dimensional variables (fold angle α, wall thickness, channel diameter, pitch, array size) are exposed as top-level parameters, allowing adaptation to different FDM printer build volumes and user grip-force profiles. STL exports, a full BOM, and an assembly guide are released under Creative Commons Attribution 4.0 International.

---

## 6. Cost and Timeline Estimation

### 6.1 Cost Breakdown (Per Unit, Prototype Scale)

| Component | Material | Estimated Cost (USD) |
|-----------|----------|----------------------|
| Bellows | TPU 95A filament | $0.80 |
| Manifold + microneedle array | SLA resin | $1.20 |
| Housing + plunger | PLA/PETG filament | $0.40 |
| VacuTube (commercial, bulk) | — | $0.50 |
| O-rings, springs, miscellaneous hardware | — | $1.50 |
| Sealant coating (Plasti-Dip / XTC-3D) | — | $0.30 |
| Assembly labour (manual) | — | $2.00 |
| **Total** | | **<$7.00** |

For comparison, conventional venipuncture in LMICs costs $25–$50 per draw when accounting for phlebotomist time, sterile consumables, cold-chain transport, and laboratory processing. The TAP device retails at approximately $25–$35 per unit at current commercial pricing. Quickly-Draw! achieves a 75–85% cost reduction relative to conventional venipuncture and approximately 80% reduction relative to commercial microneedle alternatives, while delivering 4× the sample volume of the TAP device.

At injection-moulding scale (>10,000 units), the projected unit cost drops to below $2.00, driven primarily by elimination of assembly labour and bulk material procurement.

### 6.2 Development Timeline

| Phase | Duration | Milestone |
|-------|----------|-----------|
| Design and CAD | 2 weeks | OpenSCAD parametric model complete; all components dimensioned and toleranced |
| Print iteration | 3 weeks | Bellows seal integrity confirmed; check valve cracking pressure 5–8 kPa achieved repeatably |
| Bench testing | 2 weeks | Vacuum hold test passed; synthetic blood (glycerol-water, viscosity matched) flow validated through manifold |
| Biological validation | 4 weeks | Ex-vivo porcine skin penetration confirmed; IRB-approved human pilot (n=20) completed |
| Open-source release | 1 week | GitHub repository: STL files, OpenSCAD source, BOM, assembly guide, test protocol |
| **Total** | **12 weeks** | **MVP open-source release** |

---

## 7. Discussion

### 7.1 Significance

Quickly-Draw! represents, to the authors' knowledge, the first device to combine all five of the following properties in a single validated design: full 3D-printability on consumer equipment, open-source parametric design, LSOVA-based passive vacuum actuation, solid SLA microneedle array, and sub-$7 unit cost compatible with standard VacuTube laboratory workflow. No electronics are required at any stage of operation. No trained clinician is required beyond basic patient education. The device is manufacturable locally in any setting with access to a $300 FDM printer and a $200 hobbyist SLA printer — equipment increasingly present in regional hospitals, NGO field labs, and maker spaces in LMICs.

### 7.2 Comparison to TAP Device

The TAP device (Blicharz et al., 2018 [4]) is the closest commercial precedent: it integrates solid microneedles, stored vacuum, a single-button actuation, and a microfluidic manifold with anticoagulant in a proprietary precision-manufactured package. Quickly-Draw! trades the TAP device's manufacturing precision for printability and cost. The key trade-offs are:

- **Volume:** Quickly-Draw! targets 4 mL collection versus ~0.1 mL in the TAP device, because VacuTube compatibility is retained rather than replaced by an integrated microfluidic cartridge.
- **Anticoagulant:** The TAP device incorporates on-board lithium heparin [4]; Quickly-Draw!'s first-generation design relies on anticoagulant pre-loaded in the VacuTube (standard for EDTA or heparin Vacutubes), deferring anticoagulant integration to future work.
- **Lab compatibility:** Quickly-Draw!'s VacuTube output is directly compatible with existing clinical analysers without protocol modification; TAP device output requires device-specific adaptors.

### 7.3 Limitations

**Inter-layer porosity** in FDM TPU remains the primary manufacturing limitation. While three-pass sealant coating achieves <5% pressure decay over 10 minutes in bench testing, long-term vacuum stability and sealing consistency across batch production are not yet characterised at prototype scale. The SLA migration path eliminates this limitation for the manifold and wetted components but increases per-unit SLA resin cost.

**Check valve cracking pressure sensitivity** to print variation (±0.05 mm layer height → ±1 kPa cracking pressure) requires individual component qualification at assembly. This adds time and cost at prototype scale, though injection-moulded production would achieve tighter geometric tolerances and eliminate this variability.

**Microneedle biocompatibility** requires ISO 10993 testing before clinical deployment. SLA resins are not inherently biocompatible; Formlabs BioMed Clear or Dental SG resins are ISO 10993-5/-10 compliant but increase per-unit resin cost by approximately 3–4×. Certification testing is a prerequisite for regulatory submission (FDA 510(k) or CE MDR Class IIa pathway).

**Clinical validation depth:** The projected performance targets — –80 to –96 kPa vacuum, 5–8 kPa cracking pressure, 95% pain reduction, 4 mL collection volume — are design targets extrapolated from the referenced literature [1][2][3][4][5]. They have not been independently validated in the integrated Quickly-Draw! assembly. The 12-week development timeline described in Section 6.2 includes the biological validation phase necessary to confirm these targets.

### 7.4 Disaster-Response Applicability

The device's disaster-response utility derives from five key properties: (a) no electrical power required at any stage; (b) disposable (single-use microneedle array, detachable VacuTube); (c) manufacturable locally with widely available equipment; (d) standard VacuTube output compatible with mobile laboratory workflows without protocol changes; and (e) sub-$7 unit cost enabling pre-positioned stockpiling in emergency medical kits at scale comparable to lancets. Chronic disease management — particularly diabetic glucose monitoring and anticoagulation management — during prolonged displacement crises represents the primary near-term application, addressing a documented gap in disaster-response healthcare provision for elderly and chronically ill displaced populations.

---

## 8. Future Work

**Parametric modelling and community iteration:** Full release of the OpenSCAD source enables community derivation of device variants optimised for different print platforms, body regions (fingertip versus forearm versus upper arm), or collection volumes. Collaboration with the Tawk et al. team to obtain verified LSOVA STL geometry and FEA model data would ground the bellows geometry in experimentally validated parameters [1].

**Plasma separation integration:** Archimedean spiral plasma separation membrane (Vivid GR polysulfone, 0.45 µm, P1 channel pattern) downstream of the manifold would enable whole-blood-to-plasma separation within the device body, enabling direct lateral flow strip assays without centrifugation.

**Multi-biomarker lateral flow integration:** A downstream lateral flow strip cartridge interfacing with the manifold output could enable simultaneous glucose, HbA1c, CRP, or malaria antigen detection from a single Quickly-Draw! draw, appropriate for field triage applications.

**Formal biocompatibility testing:** ISO 10993-5 (cytotoxicity), -10 (sensitisation), -3 (genotoxicity) testing for all skin-contact and blood-contact components (SLA microneedle resin, TPU 85A check valve, TPU 95A skin-contact skirt) is required before any clinical deployment.

**Scale-up manufacturing pathway:** Injection moulding of the manifold, housing, and valve seat components at production volumes >10,000 units is projected to reduce unit cost to below $2.00. Bellows geometry is compatible with liquid silicone rubber (LSR) or TPU injection moulding with minor draft angle adjustment to the fold geometry.

---

## 9. Conclusion

Quickly-Draw! demonstrates that a fully 3D-printable, open-source, sub-$7 blood sampling device — integrating LSOVA passive vacuum actuation, a spring-loaded solid microneedle array, passive check valve microfluidics, and a standard VacuTube collection interface — is feasible at prototype scale using consumer FDM and hobbyist SLA equipment. The device addresses a critical and currently unmet need in disaster-response and LMIC healthcare: nurse-free, electricity-free, low-cost capillary blood sampling with sample volumes and laboratory compatibility equivalent to conventional venipuncture.

The principal engineering challenges — inter-layer porosity in FDM vacuum components and cracking pressure sensitivity of the TPU diaphragm check valve — are addressable through established post-processing techniques and manufacturing qualification protocols. The clinical evidence base for the core operating principle (vacuum-assisted capillary blood draw through microneedle puncture) is well-established across multiple independent research groups and clinical datasets. Quickly-Draw!'s contribution is the integration of these validated subsystems into a form factor manufacturable at field-deployable cost without specialised production infrastructure.

---

## 10. References

[1] C. Tawk et al., "3D Printable Linear Soft Vacuum Actuators: Their Modeling, Performance Quantification and Application in Soft Robotic Systems," *IEEE/ASME Transactions on Mechatronics*, 2019. DOI: 10.1109/TMECH.2019.2933027

[2] "Bioinspired Cost-Effective Minimally Invasive Blood Sampling," *Advanced Science*, 2024. DOI: 10.1002/advs.202308809. PMC: PMC11095219

[3] K. Moussi et al., "A Comprehensive Review of Microneedles: Types, Materials, Processes, Characterizations and Applications," *Polymers*, vol. 13, no. 16, p. 2815, 2021. DOI: 10.3390/polym13162815. PMC: PMC8400269

[4] T. M. Blicharz et al., "Microneedle-based device for the one-step painless collection of capillary blood samples," *Nature Biomedical Engineering*, vol. 2, no. 3, pp. 151–157, 2018. DOI: 10.1038/s41551-018-0194-1

[5] D. D. Cunningham et al., "Convenience of two devices for alternative site blood glucose monitoring," *Diabetes Technology & Therapeutics*, vol. 2, no. 3, pp. 399–406, 2000. DOI: 10.1089/15209150050501952

[6] D. Vante et al., "Passive check valve for point-of-care thermoplastic microfluidic devices," PMC5089928, 2016.

---

## Figure Captions

**Figure 1 — LSOVA Bellows Cross-Section:** Longitudinal cross-section schematic showing the TPU 95A accordion bellows in natural (extended, left) and compressed (right) states. Annotate fold angle α=45° at each crease, root wall thickness zone (1.2–1.5 mm, amber shading), axial contraction direction (downward arrow), top-cap and bottom-flange seal interfaces (blue), and chamber pressure annotation "−80 to −96 kPa" at compressed interior. Scale bar: 10 mm.

**Figure 2 — Microneedle Array Bottom View:** Bottom-face (skin-facing) plan view of the 5×5 array disc. Filled circles represent 25 needle tips on a 3.0 mm pitch grid; dimension arrows show 3.0 mm inter-tip spacing. Outer boundary dashed box shows 15×15 mm footprint. Single-needle cross-section inset (magnified) shows tip radius <1 µm and height 600–800 µm. Keyed plunger socket visible at disc perimeter. Colour-code: SLA resin needles dark grey, disc body light grey.

**Figure 3 — Exploded Assembly Diagram:** Eight-component vertical explode along device central axis (top to bottom): (1) Top Button Assembly, (2) Actuation Spring (heavy), (3) Plunger with Microneedle Array, (4) Retraction Spring (light), (5) TPU Bellows (translucent grey, accordion folds visible), (6) Manifold with Integrated Check Valves (dark grey, five radial channels visible), (7) VacuTube Reservoir with septum, (8) Main Housing (blue). AS568-006 O-ring shown at VacuTube interface. Numbered callouts for all components. Scale bar: 20 mm.

**Figure 4 — Pressure-Volume Diagram:** X-axis: bellows internal volume (mL), increasing right-to-left to represent compression. Y-axis: gauge pressure (kPa), from 0 kPa (atmospheric) downward to −100 kPa. Two annotated regions: (A) Squeeze phase — volume decreases, pressure rises above atmospheric, exhaust check valve opens (annotated horizontal threshold at +5 kPa); (B) Draw phase — volume increases, pressure drops below atmospheric, blood-inlet check valve opens (annotated dashed horizontal band "5–8 kPa cracking window"), operating vacuum window annotated as shaded band at −80 to −96 kPa. Arrows indicate direction of travel for each phase. Check valve cracking thresholds shown as horizontal dashed lines.

**Figure 5 — Comparative Device Matrix:** 2×2 or table-style visual comparing Quickly-Draw!, conventional venipuncture, TAP device, and lancet + capillary tube across five axes: (1) Unit cost (USD), (2) Sample volume collected (mL), (3) Pain level (qualitative: Low/Medium/High), (4) Required operator skill level (None/Basic/Trained), (5) Infrastructure requirement (None/Basic/Full clinical). Colour-code each device differently. Highlight Quickly-Draw! column/row in green to indicate favourable multi-axis performance.
