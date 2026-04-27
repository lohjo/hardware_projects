# Hardware Projects

A collection of open-source hardware designs and 3D-printable devices for real-world applications.

## Projects

### 🩸 [Lifeline — Quickly-Draw!](./lifeline/)

**A fully 3D-printable, open-source compact blood sampler for disaster response and low-resource settings**

Sub-$7 vacuum-based microneedle blood sampling device requiring no electricity, no trained operator, and no cold-chain infrastructure. Integrates LSOVA bellows vacuum actuation, spring-loaded 5×5 microneedle array, passive check-valve microfluidics, and standard VacuTube laboratory compatibility.

- **Vacuum pressure:** –80 to –96 kPa
- **Sample volume:** 4 mL
- **Pain reduction:** 95% vs. conventional venipuncture
- **Deployment ready for:** disaster-response field kits, LMIC community health programs, remote triage
- **Cost target:** <$7 per unit

**Status:** MVP design, open-source release  
**License:** CC-BY-4.0  
[→ Full project documentation](./lifeline/README.md)

---

## Additional Projects

*More projects coming soon (TBC)*

---

## Repository Structure

```
hardware_projects/
├── lifeline/                    # Blood sampler project
│   ├── README.md               # Project-specific documentation
│   ├── quickly-draw-report.md  # Technical report
│   ├── src/
│   │   ├── cad/                # OpenSCAD source files (.scad)
│   │   ├── renders/            # Preview PNG images
│   │   ├── stl/                # Export-ready STL files
│   │   └── prompts/            # Design documentation & prompts
│   └── sketches/               # Reference sketches
├── README.md                    # This file
├── CLAUDE.md                    # OpenSCAD agent instructions
└── [other-projects]/            # Additional hardware projects (TBC)
```

## Open Source & Licensing

All projects in this repository are released under open-source licenses that permit:
- **Free use and modification** for any purpose (research, commercial, humanitarian)
- **Local manufacturing** on consumer 3D printers
- **Community contributions** via pull requests

Each project includes its own license file. Default license is **Creative Commons Attribution 4.0 International (CC-BY-4.0)** unless otherwise specified.

## Contributing

Contributions are welcome! To contribute:

1. **Report issues:** Found a bug or have an improvement? Open an issue.
2. **Submit designs:** Have a hardware design to share? Submit a pull request with:
   - Complete project README
   - Design files (OpenSCAD source, STL exports)
   - BOM and fabrication instructions
   - Renders/images for visualization
3. **Improve documentation:** Help make projects clearer and more accessible.

## Getting Started

### For Designers Using Claude Code

This repository includes OpenSCAD agent skills for iterative 3D model design:

- **`/openscad`** — Create versioned parametric designs with automatic rendering
- **`/preview-scad`** — Render `.scad` files to PNG for visual verification
- **`/export-stl`** — Export finalized models to STL with geometry validation

See [CLAUDE.md](./CLAUDE.md) for complete workflow instructions.

### For Builders & Manufacturers

Each project includes:
- **STL files** ready for slicing and printing
- **BOM (Bill of Materials)** with supplier links and cost estimates
- **Fabrication guide** with print settings and assembly instructions
- **CAD source files** in OpenSCAD for customization

Start with any project's README to download files and begin building.

---

## Contact & Community

**GitHub:** This repository  
**License:** See individual project directories  
**Contributing:** Pull requests and issues welcome  

---

**Last Updated:** April 2026  
**Status:** Active development
