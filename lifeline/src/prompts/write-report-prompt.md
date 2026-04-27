You are a senior biomedical engineering researcher and science communicator with expertise in soft robotics, microfluidics, and point-of-care diagnostics. Your task is to write a detailed, peer-review-quality research paper/write-up for a medical device called "Quickly-Draw!" — a compact, 3D-printable, minimally invasive vacuum blood sampling device designed for disaster-response and low-resource settings.

---

## DEVICE OVERVIEW

"Quickly-Draw!" is a painless blood sampling device that integrates:
1. A microneedle array (SLA-printed solid microneedles) for skin puncture
2. A Linear Soft Vacuum Actuator (LSOVA) bellows body (TPU 95A, α=45°) for vacuum generation via user compression — targeting –80 to –96 kPa
3. Microfluidic channels for unidirectional blood routing
4. A passive diaphragm check valve (TPU 85A, 0.4 mm flap, cracking pressure 5–8 kPa)
5. A commercial VacuTube (Vacutainer-compatible) as the sealed collection reservoir
6. Target unit cost: below USD $7
7. Manufacturing method: FDM (TPU/PLA/PETG) + SLA resin, fully open-source

The three-stage mechanism is:
- Stage 1 (Prime): User squeezes bellows → compresses TPU accordion → stores –80 to –96 kPa negative pressure; exhaust check valve opens, displacing air out
- Stage 2 (Apply): Device pressed onto skin → spring-loaded plunger fires microneedle array into skin at high velocity → springs retract needles instantly → device remains sealed against skin
- Stage 3 (Draw): Bellows spring-back expands chamber → check valve closes exhaust, opens blood-inlet path → vacuum draws capillary blood through microneedle channels → blood travels through microfluidic manifold into VacuTube reservoir

---

## KEY REFERENCES (cite these accurately — do not fabricate DOIs)

1. Tawk, C. et al. (2019). "3D Printable Linear Soft Vacuum Actuators: Their Modeling, Performance Quantification and Application in Soft Robotic Systems." IEEE/ASME Transactions on Mechatronics. DOI: 10.1109/TMECH.2019.2933027
   — Key data: 51% contraction, 27.66 N output force, –96 kPa operating pressure, ~6.49 Hz bandwidth, ~21,500 cycle lifetime, α=45° wall angle, TPU 95A, single-step FDM printing

2. Bioinspired Cost-Effective Minimally Invasive Blood Sampling (2024). Advanced Science. DOI: 10.1002/advs.202308809. PMC: PMC11095219
   — Key data: leech-inspired suction cup concept, microneedle + vacuum integration, pain reduction vs. conventional venipuncture, capillary blood volume enhancement

3. Moussi, K. et al. (2021). "A Comprehensive Review of Microneedles: Types, Materials, Processes, Characterizations and Applications." Polymers. DOI: 10.3390/polym13162815. PMC: PMC8400269
   — Key data: solid vs. hollow vs. coated microneedle taxonomy, SLA fabrication advantages, typical dimensions (height 150–1500 µm, tip radius <1 µm for solid), biocompatibility requirements

You may also reference Blicharz et al. (2018) Nature Biomedical Engineering (DOI: 10.1038/s41551-018-0194-1) for the TAP device flow logic; Cunningham et al. (2000) for vacuum-assisted lancing clinical validation; and Vante et al. (2016) PMC5089928 for passive check valve design principles.

---

## REPORT REQUIREMENTS

Write a structured research paper with the following sections. Use formal academic register. Include numbered citations in IEEE format (e.g., [1], [2]).

### 1. Abstract (250 words max)
Summarise: problem, device concept, key mechanism, target performance specs, and relevance to disaster/emergency contexts.

### 2. Introduction
- Frame the problem: conventional venipuncture barriers in low-infrastructure settings (trained personnel, cold chain, cost)
- Disaster/emergency context: why portable, low-cost, nurse-free blood sampling matters (displaced populations, remote triage, LMICs)
- Brief review of existing approaches: lancet + capillary tube (low volume), commercial microneedle patches (TAP device — cost, size), vacuum-assisted lancing (Cunningham 2000)
- State the gap: no fully 3D-printable, open-source, sub-$7 device combining LSOVA actuation + microneedle array + integrated vacuum draw
- Thesis sentence: "This paper presents Quickly-Draw!, a fully 3D-printable compact vacuum blood sampler..."

### 3. Literature Review
Synthesise three bodies of work:
- **LSOVA / soft vacuum actuators**: Tawk et al. [1] — bellows geometry, TPU 95A, force-contraction trade-off, scalability via parallel stacking, operating pressure overlap with blood sampling requirements
- **Microneedle technology**: Moussi et al. [3] — types (solid, hollow, coated), SLA fabrication, skin penetration mechanics, painlessness evidence, typical array geometries (5×5 grid)
- **Vacuum-assisted blood sampling**: Bioinspired device [2], TAP device (Blicharz 2018), Cunningham 2000 — clinical evidence for vacuum enhancing capillary blood yield, alternate site sampling (forearm), pain reduction (95% less painful vs fingerstick, r=0.96 glucose correlation)

### 4. Design & Mechanism Analysis
Describe the four integrated subsystems in detail:

**4.1 LSOVA Bellows (Vacuum Source)**
- Geometry: α=45° accordion fold, TPU 95A, fold-root wall thickness 1.2–1.5 mm
- Performance: –80 to –96 kPa peak vacuum, fully passive (no electronics), estimated squeeze force from user hand
- Relevance of Tawk et al. [1] parameters to this application
- Figure description: "Figure 1: Cross-section schematic of the LSOVA bellows showing accordion fold geometry at α=45°, wall thickness zones, and directional collapse under vacuum. Annotate: fold angle α, root wall thickness 1.2–1.5 mm, axial contraction direction."

**4.2 Microneedle Array**
- Design: 5×5 solid SLA-printed array, 3.0 mm pitch, tip radius <1 µm, height ~600–800 µm
- Spring-loaded insertion mechanism: heavy actuation spring + lighter retraction spring, pen-like latch release
- Reference Moussi et al. [3] for material and geometry rationale
- Figure description: "Figure 2: Bottom-face view of the microneedle array disc showing 5×5 grid, 3.0 mm pitch, and socket interface geometry."

**4.3 Check Valve & Microfluidic Manifold**
- Passive diaphragm check valve: TPU 85A, 0.4 mm thickness, Ø26.5 mm disc, 5-port cross pattern
- Cracking pressure calibration: 5–8 kPa — below operating vacuum (opens during draw), above atmospheric (stays closed when pump off)
- Manifold flow logic: exhaust path (air out during bellows compression) vs. blood-in path (activated during vacuum draw)
- Equal-path-length radial channel network: 5 channels at 72° spacing, L=10.5 mm, Ø1.5 mm, Re<4 (laminar)
- Figure description: "Figure 3: Exploded assembly diagram showing (top to bottom): button assembly, actuation spring, plunger + microneedle array, retraction spring, TPU bellows, manifold with check valves, VacuTube reservoir. Label all 8 components."

**4.4 VacuTube Interface**
- Pre-evacuated reservoir principle: stored vacuum drawn upon needle puncture of septum
- 8.5 mm bore, O-ring sealed (AS568-006), 4 mL collection volume vs. competitors' 0.5–0.8 mL
- Detachable for downstream lab analysis

### 5. Fabrication & Prototyping Plan
Step-by-step manufacturing plan:

| Step | Component | Material | Method | Critical parameter |
|------|-----------|----------|--------|--------------------|
| 1 | Bellows | TPU 95A (NinjaFlex / Bambu) | FDM, print vertically | Wall thickness 1.2–1.5 mm at fold root; 4+ perimeter walls |
| 2 | Manifold body | SLA resin (Formlabs Grey / ELEGOO) | SLA, 0.05 mm layer | Internal channel Ra 0.8 µm; min channel Ø0.5 mm |
| 3 | Check valve flap | TPU 85A | FDM thin sheet | 0.4 mm uniform thickness; Ø26.5 mm disc |
| 4 | Microneedle array | SLA biocompatible resin | SLA | Tip radius <1 µm; 5×5 grid, 3.0 mm pitch |
| 5 | Housing | PLA or PETG | FDM | Press-fit tolerances ±0.1 mm |
| 6 | Sealing | XTC-3D epoxy / Plasti-Dip | Post-process dip coat | 3 passes for <5% pressure loss over 10 min |

Discuss inter-layer porosity challenge for FDM vacuum-tight walls and the SLA migration path for production.

Discuss open-source prototyping path: OpenSCAD parametric modelling → GitHub release → community iteration.

### 6. Cost & Timeline Estimation

**Cost breakdown (per unit, prototype scale):**
- TPU filament (bellows + valve): ~$0.80
- SLA resin (manifold + microneedle array): ~$1.20
- PLA/PETG filament (housing): ~$0.40
- VacuTube (commercial, bulk): ~$0.50
- O-rings, springs, miscellaneous hardware: ~$1.50
- Sealant coating (Plasti-Dip / XTC-3D): ~$0.30
- Estimated assembly labour (manual): ~$2.00
- **Total target: <$7.00/unit**

Compare against: conventional venipuncture (trained nurse, lab equipment, cold chain) — typically $25–$50+ per draw in LMICs.

**Timeline (hackathon → MVP → open-source release):**
| Phase | Duration | Milestone |
|-------|----------|-----------|
| Design & CAD | 2 weeks | Fusion 360 / OpenSCAD parametric model complete |
| Print iteration | 3 weeks | Bellows seal integrity, check valve cracking pressure tuned |
| Bench testing | 2 weeks | Vacuum hold test, synthetic blood flow validation |
| Biological validation | 4 weeks | Ex-vivo tissue, IRB-approved human pilot |
| Open-source release | 1 week | GitHub STL + OpenSCAD files, BOM, assembly guide |

### 7. Discussion
- Significance: first fully open-source, sub-$7, nurse-free vacuum blood sampler
- Comparison to TAP device (Blicharz 2018): Quickly-Draw! trades precision manufacturing for printability and cost; 4 mL vs TAP's integrated lab-on-chip
- Limitations: inter-layer porosity in FDM requires post-processing; microneedle SLA biocompatibility certification needed for clinical use; check valve cracking pressure sensitive to print variation
- Disaster-response applicability: no electricity required, disposable, manufacturable locally with a $300 printer, compatible with standard VacuTube lab workflow

### 8. Future Work
- OpenSCAD + Claude Code parametric modelling for community iteration
- Plasma separation membrane integration (Archimedean spiral P1 pattern, Vivid GR polysulfone 0.45 mm)
- Multi-biomarker lateral flow strip integration downstream of manifold
- Formal biocompatibility testing (ISO 10993)
- Collaboration with Tawk et al. team for verified LSOVA STL geometry
- Scale-up: injection moulding pathway for >10,000 unit runs at <$2/unit

### 9. Conclusion
Restate: Quickly-Draw! demonstrates that a fully 3D-printable, open-source, sub-$7 blood sampling device integrating LSOVA vacuum actuation, microneedle arrays, and passive check valve microfluidics is feasible. It addresses a critical gap in disaster-response and LMIC healthcare infrastructure.

### 10. References
Format all references in IEEE style. Use the exact DOIs provided above. Do not fabricate any citation.

---

## FIGURE DESCRIPTIONS TO INCLUDE

For each figure listed in the sections above, write a detailed caption that could guide a technical illustrator or CAD software to reproduce the diagram. Where possible, suggest what the diagram should highlight (e.g., label dimensions, show blood flow direction with arrows, colour-code subsystems).

Additionally include:
- **Figure 4**: Pressure-volume diagram showing bellows squeeze phase (compression) vs. draw phase (expansion), annotating the –80 to –96 kPa operating window and the 5–8 kPa check valve cracking threshold
- **Figure 5**: Comparative table/visual of Quickly-Draw! vs. conventional venipuncture vs. TAP device vs. lancet + capillary — axes: cost, volume collected, pain level, required skill level, infrastructure needed

---

## TONE & FORMAT CONSTRAINTS

- Academic register, active voice where possible, third person for methods
- IEEE citation format [1], [2], [3] inline
- Use SI units throughout (kPa, µm, mm, mL, µL)
- Do not invent clinical trial data — qualify performance targets as "projected" or "design targets" unless citing a paper directly
- Total length: approximately 3,500–5,000 words (excluding references and figure captions)
- Author line: Loh John Ray, Product Development Lead, quickly-draw! Medical Devices — MIG Lifeline Hackathon, March 2026