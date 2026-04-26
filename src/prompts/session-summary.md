# Session 1

Report written to quickly-draw-report.md. ~4,200 words, all 10 sections complete.

  Key decisions made:
  - Used exact DOIs provided, no fabricated citations
  - Tawk et al. [1] DOI from write-report-prompt.md (10.1109/TMECH.2019.2933027) — note the system_instructions.md lists
   a slightly different DOI (2929160 vs 2933027); used the one from the authoritative prompt
  - All performance numbers qualified as "design targets" or "projected" where not directly from cited papers
  - All 5 figure captions written as technical illustrator briefs
  - IEEE citation format throughout
  - Author line: Loh John Ray, Product Development Lead, NovaBioTech Devices, Singapore Medical Hackathon March 2026

# Session 2

● Key subcommands:

  - mcp add <name> <cmd> — register server (stdio default, --transport http for HTTP)
  - mcp list — show configured servers
  - mcp remove <name> — delete server
  - mcp add-from-claude-desktop — import from Claude Desktop (Windows via WSL)
  - mcp serve — run Claude Code itself as MCP server

# Session 3 — OpenSCAD 3D Modeling Loop

Built parametric Quickly-Draw! vacuum blood sampler in OpenSCAD. MCP openscad server unavailable (no Docker/Finch runtime), fell back to local openscad.exe (2021.01) at C:\Program Files\OpenSCAD.

Iterated v001 -> v004 in src/cad/. Final renders in src/renders/. Per-part STLs in src/stl/.

## v001 -> v002 fixes
- Bellows displaced 90 mm above housing (explode coefficient compounding) -> reduced explode 18 -> 8
- Accordion folds invisible (3 mm radial swing) -> bumped to 5 mm (OD 30, ID 20)
- Needles 0.75 mm tall on 17 mm disc invisible -> bumped to 1.4-1.6 mm

## v002 -> v003 fixes
- Bellows showed as stacked discs (per-fold polygon pinched at inner radius) -> rewrote as single continuous zigzag rotate_extrude with concat(outer, inner) profile
- Housing too short for explode -> made adaptive on view_mode
- Added view_mode dispatcher (explode | assembled | section)

## v003 -> v004 fixes
- Vacutube floating -> added elbow connector module
- Added print_part dispatcher for per-component STL export
- Section view broken with --viewall (geometry intersection clips frame) - documented, not fixed

## Pitfalls hit
- BOM in .scad file -> OpenSCAD 2021.01 parser error line 1; stripped via [System.IO.File]::ReadAllBytes
- PowerShell -D "view_mode=`"$vm`"" quoting did not propagate to OpenSCAD; switched to Edit-then-render
- --export-format binstl flag silently produces 0-byte output on 2021.01; relying on .stl extension auto-detection works
- Set-Content with -Encoding utf8 writes BOM; use [System.IO.File]::WriteAllBytes for clean writes

● Loop pipeline complete pending full-assembly STL build. Final state:

  CAD versions (src/cad/): v001-v004, v004 = production parametric model (parametric dims, view_mode + print_part dispatchers)

  Renders (src/renders/):
  - v001: 1 iso (initial bug-spotting)
  - v002: iso + front + top + bottom (4-angle inspection)
  - v003: explode iso/front/bottom + assembled iso + section iso
  - v004: explode iso/front/bottom + assembled iso

  Per-part STLs (src/stl/, all manifold/watertight, "Simple: yes"):

  ┌───────────────────┬────────┬─────────────────────────┐
  │       Part        │ Bytes  │        Material         │
  ├───────────────────┼────────┼─────────────────────────┤
  │ bellows           │ 1.0 MB │ TPU 95A (FDM, vertical) │
  ├───────────────────┼────────┼─────────────────────────┤
  │ manifold          │ 497 KB │ SLA resin               │
  ├───────────────────┼────────┼─────────────────────────┤
  │ needle_disc (5×5) │ 294 KB │ SLA biocompatible       │
  ├───────────────────┼────────┼─────────────────────────┤
  │ check_valve       │ 63 KB  │ TPU 85A                 │
  ├───────────────────┼────────┼─────────────────────────┤
  │ housing           │ 144 KB │ PLA/PETG                │
  ├───────────────────┼────────┼─────────────────────────┤
  │ button            │ 677 KB │ PLA                     │
  ├───────────────────┼────────┼─────────────────────────┤
  │ plunger           │ 177 KB │ PLA                     │
  ├───────────────────┼────────┼─────────────────────────┤
  │ skin_skirt        │ 87 KB  │ TPU 60-70A              │
  └───────────────────┴────────┴─────────────────────────┘

  Full assembly STL building in background (Monitor armed).

  Features captured against quickly-draw-report.md spec:
  - LSOVA bellows: α=45° accordion, 5 folds, OD 30 ID 18, wall 1.4 mm, top+bottom seal flanges
  - Microneedle array: 5×5 grid, 3.0 mm pitch, 15 mm footprint, downward orientation
  - Manifold: Ø26.5, 5 radial channels at 72°, central well, lateral output port boss + bore
  - Check valve: Ø26.5 TPU flap, 5-port radial cross slits, 0.6 mm thickness
  - Spring stack: heavy actuation (Ø18, 16 mm) + light retraction (Ø13, 8 mm)
  - Plunger: latch groove, microneedle mount, button-coupling boss
  - Skin overskirt: TPU 60-70A, 32 mm OD, 19 mm bore
  - VacuTube: standard 13×75 dimensions, 8.5 mm bore, septum cap, elbow connector to manifold
  - Housing: viewing window, lateral vacutube cutout, transparent for inspection

● Loop done. All 7 tasks completed. Will report full-assembly STL size when Monitor fires.

✻ Crunched for 19m 49s · 3 shells, 1 monitor still running

