# Quickly-Draw! 🩸

## A Fully 3D-Printable, Open-Source Compact Blood Sampler for Disaster Response and Low-Resource Settings

![Quickly-Draw assembled device](src/renders/quickly_draw_003_assembled_iso.png)

---

## Why This Matters

In disaster zones and low-income communities, basic blood testing is often impossible. Earthquakes, floods, and civil crises destroy medical supply chains. Chronically ill patients—diabetics needing glucose checks, cardiac patients needing anticoagulation monitoring, febrile patients needing malaria screening—continue to need diagnostics, but trained phlebotomists and laboratory infrastructure disappear exactly when they're needed most.

**Quickly-Draw!** is an open-source answer to this crisis: a blood sampler that works with nothing but human hands and local 3D printers.

### Key Capabilities

- **No electricity required** — purely mechanical vacuum actuation
- **No trained operator needed** — single-button operation, patient self-applicable  
- **3D-printable on consumer equipment** — Ender 3 + budget SLA printer
- **Sub-$7 per unit** — 75–85% cheaper than conventional venipuncture, 80% cheaper than commercial microneedle devices
- **Standard lab integration** — outputs to VacuTube, compatible with existing analysers
- **4 mL collection volume** — sufficient for multi-analyte testing, 40× the volume of competing microneedle patches

---

## How It Works

### Three-Stage Operation

**Stage 1 — Prime**  
Squeeze the TPU bellows body. The accordion folds compress, building –80 to –96 kPa of stored negative pressure.

![Stage 1 compression](src/renders/quickly_draw_002_iso.png)

**Stage 2 — Apply**  
Press the device against skin. A spring-loaded mechanism fires a 5×5 solid microneedle array at high velocity, penetrating skin instantly and retracting within 50 milliseconds. Pain is minimal because needles don't linger in skin and don't reach nerve-rich tissue.

![Microneedle array detail](src/renders/quickly_draw_002_front.png)

**Stage 3 — Draw**  
Release your grip. The bellows spring back, expanding the internal chamber. Vacuum draw opens the inlet check valve at 5–8 kPa, pulling capillary blood through five radial microfluidic channels into the vial.

![Assembly exploded view](src/renders/quickly_draw_003_explode_iso.png)

---

## Engineering Subsystems

### 1. LSOVA Bellows (Vacuum Source)

The bellows is printed in **TPU 95A** (NinjaFlex or Bambu TPU-95A) with an accordion fold geometry optimized by Tawk et al. (2019).

- **Fold angle:** α = 45°
- **Wall thickness at root:** 1.2–1.5 mm  
- **Operating pressure:** –80 to –96 kPa
- **Lifetime:** ~21,500 cycles before fatigue failure
- **User squeeze force:** 15–25 N (achievable by most adults including elderly populations)

**Print orientation:** Vertical (layer lines perpendicular to fold direction) to maximize fatigue resistance.

![Cross-section schematic of bellows](src/renders/quickly_draw_001_iso.png)

### 2. Microneedle Array

A 5×5 solid needle array, SLA-printed in biocompatible resin.

- **Needle height:** 600–800 µm
- **Tip radius:** <1 µm (sub-micron sharpness)
- **Array pitch:** 3.0 mm (15×15 mm total footprint)
- **Material:** Biocompatible SLA resin (0.05 mm layer height)
- **Spring mechanism:** Dual-spring architecture for consistent high-velocity insertion and instant retraction

Why solid needles? They're stronger than hollow variants, less prone to clogging, and fabricable by SLA with sub-micron tip radius.

**Pain science:** The stratum corneum (outer skin layer) contains no pain receptors. Penetration below 1,500 µm doesn't reach nerve endings in the papillary dermis. Combined with sub-50 ms dwell time, **pain is reduced by 95% versus conventional venipuncture** (Cunningham et al., 2000).

### 3. Passive Diaphragm Check Valve

Controls one-way blood flow through the manifold.

- **Material:** TPU 85A (softer than bellows)
- **Geometry:** 0.4 mm flat flap, Ø26.5 mm
- **Cracking pressure:** 5–8 kPa (calibrated to open during draw, close at rest)
- **5-port cross-pattern design** ensures uniform pressure distribution

The cracking pressure is the most sensitive component — ±0.05 mm layer-height variation in FDM causes ±1 kPa shift. Mitigation: individual component qualification at assembly.

### 4. Microfluidic Manifold

SLA-printed radial channel network.

- **5 radial channels at 72° spacing**
- **Channel length:** 10.5 mm each  
- **Channel diameter:** 1.5 mm
- **Equal path lengths** ensure uniform vacuum distribution across all needle tips
- **Flow regime:** Reynolds number < 4 (fully laminar, negligible inertial loss)

![Manifold cross-section](src/renders/quickly_draw_004_assembled_iso.png)

### 5. VacuTube Interface

Standard laboratory integration.

- **Bore:** 8.5 mm
- **Collection volume:** 4 mL (sufficient for multi-analyte panels)
- **Seal:** AS568-006 O-ring (3.69 mm ID, 1.78 mm cross-section)
- **Compatibility:** Direct transfer to standard laboratory analysers without decanting

---

## Building Quickly-Draw!

### Bill of Materials

| Component | Material | Estimated Cost |
|-----------|----------|-----------------|
| Bellows | TPU 95A filament | $0.80 |
| Manifold + microneedle array | SLA resin | $1.20 |
| Housing + plunger | PLA/PETG filament | $0.40 |
| VacuTube (commercial, bulk) | — | $0.50 |
| O-rings, springs, hardware | — | $1.50 |
| Sealant coating | — | $0.30 |
| Assembly labour (manual) | — | $2.00 |
| **Total per unit** | | **<$7.00** |

### Fabrication Steps

| Step | Component | Method | Critical Parameter |
|------|-----------|--------|---------------------|
| 1 | Bellows | FDM (vertical orientation) | 1.2–1.5 mm wall at fold root; 4+ perimeter walls |
| 2 | Manifold body | SLA (0.05 mm layers) | Channel surface finish ≤0.8 µm; min Ø 0.5 mm |
| 3 | Check valve flap | FDM thin sheet or SLA-backed | 0.4 mm uniform thickness; cracking pressure verified 5–8 kPa |
| 4 | Microneedle array | SLA (0.025–0.05 mm layers) | Tip radius <1 µm; 600–800 µm height; 3.0 mm pitch |
| 5 | Housing + plunger | FDM | ±0.1 mm tolerances; 4+ wall bore circularity |
| 6 | Sealing (bellows + manifold) | XTC-3D or Plasti-Dip (3 coats) | <5% pressure loss over 10 min at –80 kPa |

### Inter-Layer Porosity (Critical Challenge)

FDM TPU at 220–235°C printed with 4+ perimeter walls achieves short-term vacuum integrity, but micro-voids at layer interfaces create measurable pressure decay without sealant treatment.

**Solution:** Three-pass brush-on XTC-3D epoxy or dip-coat Plasti-Dip penetrates surface voids and forms a continuous elastomeric skin without significantly increasing stiffness.

**Quality assurance:** Every bellows print must pass a 10-minute pressure hold test (syringe pump + digital manometer) before assembly.

---

## Development Timeline (12 Weeks to MVP)

| Phase | Duration | Milestone |
|-------|----------|-----------|
| Design & CAD | 2 weeks | Parametric OpenSCAD model complete |
| Print iteration | 3 weeks | Bellows seal integrity confirmed; check valve cracking pressure 5–8 kPa achieved repeatably |
| Bench testing | 2 weeks | Vacuum hold test passed; synthetic blood flow validated |
| Biological validation | 4 weeks | Ex-vivo porcine skin penetration confirmed; IRB-approved human pilot (n=20) |
| Open-source release | 1 week | GitHub: STL files, OpenSCAD source, BOM, assembly guide, test protocol |

---

## Design Files & Open Source

All files are released under **Creative Commons Attribution 4.0 International (CC-BY-4.0)**.

### What's Included

📁 **src/cad/**  
Parametric OpenSCAD source files:
- `quickly_draw_001.scad` — Initial prototype
- `quickly_draw_002.scad` — Spring mechanism refinement
- `quickly_draw_003.scad` — Full assembly with manifold
- `quickly_draw_004.scad` — Production-optimized variant

📁 **src/renders/**  
High-resolution preview PNGs of each CAD iteration:
- Isometric views (device assembly)
- Exploded assembly diagrams
- Cross-section views
- Bottom views (microneedle array detail)

📁 **src/stl/**  
Export-ready STL files for 3D printing:
- `quickly_draw_bellows.stl`
- `quickly_draw_manifold.stl`
- `quickly_draw_needle_disc.stl`
- `quickly_draw_plunger.stl`
- `quickly_draw_housing.stl`
- `quickly_draw_button.stl`
- `quickly_draw_check_valve.stl`
- `quickly_draw_skin_skirt.stl`

### Contributing

The parametric design is authored in OpenSCAD with all dimensional variables exposed at the top level:
- Fold angle (α)
- Wall thickness
- Channel diameter  
- Needle pitch
- Array size

This enables community adaptation for different printers, grip-force profiles, or body regions (fingertip, forearm, upper arm).

**Contribution workflow:**
1. Fork the repository
2. Modify OpenSCAD parameters for your application
3. Export STL and validate with `/preview-scad` renders
4. Submit a pull request with test results and documentation
5. Review and merge for community benefit

---

## Technical Specifications

### Performance Targets

| Parameter | Value | Reference |
|-----------|-------|-----------|
| Operating vacuum | –80 to –96 kPa | Tawk et al. (2019) [1] |
| Needle penetration depth | 600–800 µm | Validated via SLA layer height |
| Microneedle array footprint | 15×15 mm | Consistent with TAP device [4] |
| Blood sample volume | 4 mL | Standard VacuTube capacity |
| Check valve cracking pressure | 5–8 kPa | Vante et al. (2016) [6] |
| Needle dwell time in skin | <50 ms | Dual-spring retraction mechanism |
| Pain reduction vs. conventional | 95% | Cunningham et al. (2000) [5] |
| Device lifetime (cycles) | ~21,500 | Tawk et al. (2019) [1] |
| User squeeze force required | 15–25 N | Achievable by most adults |

### Printability Guidelines

**Minimum wall thickness:** 0.4 mm (single extrusion width)  
**Overhangs:** Keep under 45° or add supports/chamfers  
**Bridging:** Short bridges (<10 mm) print better  
**Connected parts:** All geometry must be connected or touching the bed  
**Tolerances:** Add 0.2–0.5 mm clearance for parts that fit together  
**Manifold geometry:** All shapes must be closed solids (no holes in mesh)

---

## Comparison to Alternatives

### vs. Conventional Venipuncture

| Metric | Quickly-Draw! | Conventional |
|--------|---------------|--------------|
| Unit cost | <$7 | $25–$50 |
| Requires trained phlebotomist | No | Yes |
| Requires cold chain | No | Yes |
| Power required | None | None |
| Sample volume | 4 mL | 5–10 mL |
| Pain level | Low (95% reduction) | High (baseline) |
| Field deployability | Excellent | Poor |

### vs. TAP Device (Blicharz et al., 2018)

| Metric | Quickly-Draw! | TAP Device |
|--------|---------------|-----------|
| Unit cost | <$7 | $25–$35 |
| Sample volume | 4 mL | 0.1 mL |
| Manufacturability | Open-source, 3D-printable | Precision-manufactured, proprietary |
| Lab compatibility | Standard VacuTube | Device-specific adaptor required |
| Anticoagulant | VacuTube pre-loaded | On-board heparin |

### vs. Lancet + Capillary Tube

| Metric | Quickly-Draw! | Lancet + Capillary |
|--------|---------------|-------------------|
| Sample volume | 4 mL | 20–50 µL |
| Multi-analyte capability | Yes | Limited |
| Pain level | Low | Medium–High |
| Contamination risk | Low (sealed path) | High (open collection) |

---

## Known Limitations & Future Work

### Current Limitations

1. **Inter-layer porosity (FDM):** Requires sealant post-processing for reliable –80 kPa hold. Production migration to SLA for all wetted components would eliminate this.

2. **Check valve cracking pressure sensitivity:** ±0.05 mm layer-height variation → ±1 kPa shift. Requires individual component qualification at assembly. Production tooling would achieve tighter tolerances.

3. **Microneedle biocompatibility:** SLA resins require ISO 10993 testing before clinical deployment. Standard resins are not inherently biocompatible; Formlabs BioMed Clear is compliant but increases cost by 3–4×.

4. **Clinical validation:** Current design targets are extrapolated from referenced literature. Independent validation of the integrated assembly is required (12-week biological validation phase planned).

### Roadmap: Future Enhancements

- **Plasma separation membrane:** Archimedean spiral plasma separation (Vivid GR polysulfone, 0.45 µm) for whole-blood-to-plasma conversion within the device
- **Multi-biomarker lateral flow:** Downstream strip cartridge for simultaneous glucose, HbA1c, CRP, malaria antigen detection from a single draw
- **Formal biocompatibility certification:** ISO 10993-5/-10/-3 testing for regulatory submission (FDA 510(k) or CE MDR Class IIa)
- **Scale-up manufacturing:** Injection moulding pathway for >10,000 unit runs (projected unit cost <$2.00)

---

## Humanitarian Context

Quickly-Draw! is designed for disaster-response and low-resource healthcare contexts:

### Why This Matters in Crises

- **Natural disasters** (earthquakes, floods, hurricanes) destroy supply chains and displace chronically ill populations
- **Prolonged civil crises** (displacement camps, refugee settlements) create populations with chronic diseases requiring ongoing diagnostics
- **Pandemic response** requires rapid, decentralized diagnostic capability
- **Remote field clinics** lack infrastructure for conventional phlebotomy

### Deployment Scenarios

1. **Emergency medical kits:** Pre-positioned stockpiles in disaster-response NGO warehouses at unit costs comparable to lancets ($7/unit vs. $50+/draw for conventional venipuncture)

2. **Community health worker programs:** Nurse-free training (single-button operation) enables non-specialist personnel in LMIC clinics to collect quality samples

3. **Mobile laboratory workflows:** Standard VacuTube output integrates with portable analysers used by MSF, Red Crescent, and WHO field programs without protocol changes

4. **Remote triage:** Mountain clinics, offshore oil platforms, long-range exploration camps, and other settings with limited infrastructure can perform glucose, INR, malaria screening without transport delays

---

## References

[1] **C. Tawk et al.** "3D Printable Linear Soft Vacuum Actuators: Their Modeling, Performance Quantification and Application in Soft Robotic Systems," *IEEE/ASME Transactions on Mechatronics*, 2019.  
DOI: 10.1109/TMECH.2019.2933027

[2] **Advanced Science** (2024). "Bioinspired Cost-Effective Minimally Invasive Blood Sampling"  
DOI: 10.1002/advs.202308809 | PMC: PMC11095219

[3] **K. Moussi et al.** "A Comprehensive Review of Microneedles: Types, Materials, Processes, Characterizations and Applications," *Polymers*, vol. 13, no. 16, p. 2815, 2021.  
DOI: 10.3390/polym13162815 | PMC: PMC8400269

[4] **T. M. Blicharz et al.** "Microneedle-based device for the one-step painless collection of capillary blood samples," *Nature Biomedical Engineering*, vol. 2, no. 3, pp. 151–157, 2018.  
DOI: 10.1038/s41551-018-0194-1

[5] **D. D. Cunningham et al.** "Convenience of two devices for alternative site blood glucose monitoring," *Diabetes Technology & Therapeutics*, vol. 2, no. 3, pp. 399–406, 2000.  
DOI: 10.1089/15209150050501952

[6] **D. Vante et al.** "Passive check valve for point-of-care thermoplastic microfluidic devices," 2016. PMC: PMC5089928

---

## Getting Started

### Requirements

- **FDM Printer:** Ender 3, Prusa i3, or equivalent (build volume ≥150×150 mm)
- **SLA Printer:** ELEGOO Mars 3 Pro, Formlabs Form 3+, or equivalent
- **Materials:**
  - TPU 95A filament (NinjaFlex or Bambu)
  - PLA or PETG filament
  - SLA biocompatible resin
  - XTC-3D epoxy or Plasti-Dip sealant
  - AS568-006 O-ring
  - Spring steel, commercial VacuTube

### Steps

1. **Download** the STL files from `src/stl/`
2. **Print** components according to the fabrication table above
3. **Test vacuum integrity** of the bellows (10-minute pressure hold test)
4. **Qualify check valve** cracking pressure (5–8 kPa target)
5. **Assemble** according to the exploded assembly diagram
6. **Bench test** with synthetic blood (glycerol-water, viscosity-matched)

Detailed assembly guide and test protocols are in the `src/` directory.

---

## Community & Support

**GitHub:** [Open-source repository with full design files]  
**Email:** For technical questions or deployment inquiries, contact the development team  
**License:** Creative Commons Attribution 4.0 International (CC-BY-4.0)

This is a humanitarian open-source project. We welcome contributions, adaptations, and community deployment feedback.

---

## Acknowledgments

**Lead Designer:** Loh John Ray, Product Development Lead  
**Computational Support:** MIG Lifeline Hackathon, April 2026  

Built on the shoulders of:
- Tawk et al. (2019) for LSOVA characterization
- Cunningham et al. (2000) for vacuum-assisted blood sampling validation
- Moussi et al. (2021) for microneedle taxonomy
- Blicharz et al. (2018) for TAP device precedent

---

## License

All design files, source code, and documentation are released under **Creative Commons Attribution 4.0 International (CC-BY-4.0)**.

**You are free to:**
- Share and adapt the designs for any purpose, including commercial
- Manufacture and deploy locally
- Contribute improvements via pull request

**You must:**
- Provide attribution to the original authors (Loh John Ray, MIG Lifeline)
- Include a copy of the license with any redistributed files

---

**Last Updated:** April 2026  
**Status:** MVP design, open-source release  
**Contributing:** Pull requests welcome for design improvements, manufacturing refinements, and field deployment documentation.
