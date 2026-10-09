# minimalism-maxi

An agent skill for cutting designs, interfaces, slides, menus, pricing pages, emails and talks down to the few elements people can actually process, and for defending the cut with evidence that survives a "source?" reply.

Works with Claude Code, Codex CLI, Kimi Code, Gemini CLI, OpenCode and any other tool that reads the [agent skills format](https://agentskills.io) (a folder with a `SKILL.md`).

## The claim, stated honestly

The line you hear at design reviews is: "if your brain sees more than 12 things it activates the pain center and you walk away." No study says that. What the research does say is still a strong argument:

- People judge a page in about 50 ms, and visual complexity is the main thing they judge (Lindgaard 2006; Reinecke 2013).
- A table with 24 jams drew more shoppers and sold a tenth as much as a table with 6 (Iyengar & Lepper 2000).
- In the scanner, the brain's value signal for a set of options peaks at around 12 and drops by 24. Past a dozen, the effort of choosing outweighs what the extra options add (Reutskaja, Lindner, Nagel, Andersen & Camerer, Nature Human Behaviour 2018).
- Every object on a screen competes with every other one for the same attention (Kastner's biased-competition work).
- People hold about four things in mind at once; seven is the ceiling for the simplest items (Cowan 2001; Miller 1956).

The skill carries the exact findings, the numbers, the safe sentences and the sentences to refuse. See [references/evidence.md](references/evidence.md).

## What the skill does

1. **Cut.** Inventory every element, name the one job of the screen or message, group, cut, rank what remains, recount against the working limits, and write down what was removed so it does not creep back.
2. **Justify.** Give the user two or three sentences, in their own register, that are true and still land. Lead with behaviour (the jam study), then the mechanism (the brain study).
3. **Fact-check.** When someone brings a "the brain can only…" claim, find the study, check what was manipulated, what was measured and which way the effect went, and return a one-line verdict plus the corrected sentence.

## Install

```bash
git clone https://github.com/odinfree/minimalism-maxi.git
cd minimalism-maxi
./install.sh          # symlinks into every agent CLI skills folder it knows about
./install.sh --copy   # or copy, if your tool does not follow symlinks
```

Manual install for one tool: copy or symlink this folder into the tool's skills directory.

| Tool | Directory |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex CLI | `~/.codex/skills/` |
| Kimi Code | `~/.kimi/skills/` |
| Gemini CLI | `~/.gemini/skills/` |
| OpenCode | `~/.config/opencode/skills/` |
| Shared (agentskills.io) | `~/.agents/skills/` |

Project-local install: put the folder under `.claude/skills/`, `.codex/skills/` or `.agents/skills/` inside the repo.

## Layout

```
minimalism-maxi/
├── SKILL.md                 # the skill: limits, procedures, output format, judgement calls
├── references/evidence.md   # studies, numbers, safe and unsafe sentences
├── install.sh
└── LICENSE                  # MIT
```

## Working limits the skill uses

| Situation | Limit |
|---|---|
| Things to hold in mind at once | 3 to 4, hard stop at 7 |
| Options someone must choose between | 6 to 12, never 24 |
| Calls to action per screen or message | 1 |
| Decoration that carries no meaning | 0 |

Defaults, not laws. The skill explains where each comes from and when to bend it.

## License

MIT
