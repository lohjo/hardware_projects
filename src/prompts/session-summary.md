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
