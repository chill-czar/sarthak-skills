# sarthak-skills

> The battle-tested agent skills I use in my day-to-day engineering workflow, bundled into one command.

Built for **Claude Code**, **Antigravity**, **Cursor**, **Gemini CLI**, and any tool supporting the open [skills](https://skills.sh) standard.

---

## ⚡ Quick Install

### Into the current project:
```bash
curl -fsSL https://raw.githubusercontent.com/chill-czar/sarthak-skills/main/install.sh | bash
```

### Globally (user-level, across all projects):
```bash
curl -fsSL https://raw.githubusercontent.com/chill-czar/sarthak-skills/main/install.sh | bash -s -- -g
```

### Or using the `skills` CLI:
```bash
bunx skills add chill-czar/sarthak-skills -y
```

> **Targeting a specific agent:** By default, installation targets `claude-code`. To install for another agent (e.g. `cursor`, `gemini-cli`), prefix with `SKILLS_AGENT`:
> ```bash
> SKILLS_AGENT=cursor curl -fsSL https://raw.githubusercontent.com/chill-czar/sarthak-skills/main/install.sh | bash
> ```

---

## 🔁 The Workflow

```mermaid
flowchart LR
    A["<b>Think</b><br>/grill-with-docs"] --> B["<b>Plan</b><br>/to-spec"]
    B --> C["<b>Decompose</b><br>/to-tickets"]
    C --> D["<b>Build</b><br>/implement"]
    D --> E["<b>Review</b><br>/code-review"]
    
    style A fill:#1e1e2e,stroke:#89b4fa,stroke-width:2px,color:#cdd6f4
    style B fill:#1e1e2e,stroke:#a6e3a1,stroke-width:2px,color:#cdd6f4
    style C fill:#1e1e2e,stroke:#f9e2af,stroke-width:2px,color:#cdd6f4
    style D fill:#1e1e2e,stroke:#fab387,stroke-width:2px,color:#cdd6f4
    style E fill:#1e1e2e,stroke:#f38ba8,stroke-width:2px,color:#cdd6f4
```

---

## 🎯 1. Direct Driver Skills (Explicitly Invoked)

These are the primary skills triggered directly via chat prompts or slash commands:

| Stage | Command / Keyword | Skill | What it does | Source |
| :--- | :--- | :--- | :--- | :--- |
| **Think** | `/grill-with-docs` | `grill-with-docs` | Relentlessly stress-tests design decisions through an adversarial interview while generating ADRs and a bounded domain glossary (`CONTEXT.md`). | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **Think** | `/grill-me` | `grilling` | Rapid-fire adversarial grilling on an idea, plan, or bug without producing document artifacts. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **Plan** | `/to-spec` | `to-spec` | Synthesizes current conversation context, constraints, and architecture into an approved engineering specification. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **Plan** | `/to-tickets` | `to-tickets` | Decomposes a validated spec into sequenced, dependency-tracked tracer-bullet tickets. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **Build** | `/implement` | `implement` | Implements tickets from specs adhering strictly to pre-agreed architectural seams. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **Review** | `/code-review` | `code-review` | Spawns two parallel subagents: one audits codebase standards, the other audits spec fidelity. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **Control**| `/desktop` | `desktop` | Direct Linux Mint / Cinnamon X11 desktop UI control and application automation via `deskctl`. | **First-Party** (`skills/desktop`) |

---

## ⚙️ 2. Under-the-Hood Subskills (Automated)

These skills are not called directly by the user, but are automatically utilized by the primary drivers:

| Skill | Utilized By | Purpose | Source |
| :--- | :--- | :--- | :--- |
| **`domain-modeling`** | `/grill-with-docs` | Manages domain terminology, bounded contexts, and ADR formatting. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **`tdd`** | `/implement` | Enforces test-first red-green-refactor discipline during code execution. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **`diagnosing-bugs`** | `/implement` / Review | Four-step structured diagnosis loop for resolving hard bugs and regressions. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| **`desktop/*`** | `/desktop` | Submodules (`apps`, `auth`, `core`, `security`, `tasks`) powering the desktop agent. | **First-Party** (`skills/desktop`) |

---

## 🖥️ First-Party Skill: Desktop Automation (`deskctl`)

The `desktop` skill allows agents to interact with a Linux desktop (Linux Mint / Cinnamon / X11) through an observe-plan-act-verify loop:
- **AT-SPI Accessibility Tree**: Native element finding and clicking immune to screen resolution shifts.
- **OCR Text Detection**: Fallback text targeting for Electron and canvas apps.
- **Safety Sandboxing**: Active window isolation (`deskctl screenshot --privacy`) and safety killswitch daemon.

---

## 📁 Repository Structure

```
sarthak-skills/
├── README.md                          # Workflow guide and documentation
├── install.sh                         # Dual upstream + first-party installer
├── vercel.json                        # Curl rewrite & browser redirect configuration
├── skills/
│   ├── sarthak-skills/
│   │   └── SKILL.md                   # Meta-skill for agent discovery
│   └── desktop/                       # Complete portable desktop automation skill
│       ├── SKILL.md
│       ├── apps/                      # App-specific workflows (browser, terminal, files)
│       ├── auth/                      # Credential and privilege elevation rules
│       ├── core/                      # Screen mapping and window topology
│       ├── security/                  # Privacy filters and killswitch controls
│       └── scripts/                   # ATSPI helpers and daemon scripts
```

---

## License

MIT © [Sarthak Chaudhari (@chill_czar)](https://github.com/chill-czar)
