---
name: excalidraw-animate
description: |
  Generate animated or static Excalidraw-style technical architecture diagrams as self-contained HTML files with hand-drawn aesthetics, creative non-box visual representations (byte tapes, ring buffers, funnels, orbits), and interactive interview capability.
  Interactively interviews the user (/grill-me protocol via ask_question) to dial in exact animation modes, visual metaphors, and abstraction levels before generating.
  Use when the user asks to "animate a diagram", "create an excalidraw animation", "draw an architecture diagram with animation", "excalidraw diagram", "visualize system memory/architecture", or asks for hand-drawn technical diagrams.
tags: [visualization, diagrams, animation, excalidraw]
metadata:
  author: jimmy
  version: 2.0.0
---

# Excalidraw Animate — Pure Hand-Drawn Technical Visuals

Generate self-contained HTML files that render pure Excalidraw technical diagrams on a pitch-black canvas with zero bloat, zero sidebars, zero code editors, and authentic hand-drawn strokes.

---

## 🚨 ABSOLUTE PROHIBITIONS (NEVER VIOLATE)

Any diagram that violates these rules is a critical defect:
- ❌ **NO CRAMMING MULTIPLE SYSTEMS INTO ONE SCREEN:** If a topic covers multiple subsystems (e.g. Goroutines, Channels, and Mutexes), NEVER squeeze them into 3 narrow vertical columns on one screen. Create **multiple distinct, spacious diagrams** (each $1100 \times 600\text{px}$) laid out across the infinite canvas or as separate frames.
- ❌ **NO RAINBOW COLOR SCHEMES:** Stick to monochromatic white (`#ffffff` / `#e0e0e0`) strokes with dark `#1c1c1e` fills. Use at most **ONE or TWO functional accents** (`#30d158` green for active/healthy, `#ff9f0a` orange for contention/starvation). Never use neon purple, cyan, yellow, or pink palettes.
- ❌ **NO UI CHROME BURNED INTO DIAGRAM IMAGES:** If outputting an image or static diagram, NEVER render player scrubber bars, Play/Pause buttons, speed sliders, or nav bars inside the graphic. UI controls belong only in interactive web applications, never in the diagram content.
- ❌ **NO SIDEBARS OR MULTI-COLUMN PANELS:** Never create a left sidebar, right sidebar, or split layout. The canvas is a single, centered graphic.
- ❌ **NO CODE EDITORS / RUNTIME SOURCE INSPECTORS:** Never embed syntax-highlighted code blocks, code viewers, or IDE mockups. This is a visual architecture diagram, not an IDE.
- ❌ **NO WALLS OF TEXT OR DASHBOARD CARDS:** Never include paragraphs, "Senior Practitioner Insight" cards, or hardware spec tables. Labels must be 1 to 4 words maximum.
- ❌ **NO COMIC NEUE OR SYSTEM FONTS:** Font MUST be Google Fonts `'Architects Daughter'`.
- ❌ **NO THIRD-PARTY BLOG OR AUTHOR REFERENCES:** The skill is pure, generic, and self-contained. Never reference external blogs, author names, or specific articles.
- ❌ **NO ARBITRARY LIMITS (NOT CAPPED AT 5):** Never artificially limit the number of diagrams to 4 or 5. If a complex system needs 6, 8, or 10 diagrams to be simple and legible, generate as many spacious diagrams as needed.
- ❌ **NO OFF-BLACK OR NAVY CANVASES:** The background is ALWAYS solid pitch black (`#000000`).

---

## The Excalidraw Infinite Canvas Standard

When presenting multiple diagrams or a full architecture suite on a single HTML page:
1. **Infinite 2D Canvas with Pan & Zoom:**
   - Background: Pitch black `#000000` with subtle dot grid (`radial-gradient(rgba(255, 255, 255, 0.08) 1px, transparent 1px)`).
   - Mouse drag to pan anywhere across the canvas.
   - Mouse wheel to zoom in and out centered on the cursor.
   - Floating zoom HUD in bottom-left: `[ - ]`, `100%`, `[ + ]`, `[ 1:1 ]`.
   - Floating jump pills at top-left: Click any pill to smoothly glide the camera directly to that diagram.
   - `Fit All (Map View)` button to zoom out and see all diagrams at once.
2. **Generous Negative Space:**
   - Each diagram has its own large footprint ($1100 \times 600\text{px}$) with at least $150\text{px}$ margin between diagrams.
   - Zero overlap, zero crowding. Every concept has room to breathe.
3. **Simplicity First:**
   - Anyone looking at a single diagram should understand it within 5 seconds.
   - Keep elements minimal and clean. If a concept has more moving parts, branch it into its own step diagram rather than piling everything into one box.

---

## Step 0: Interactive Interview & Requirements Alignment (/grill-me Protocol)

Whenever this skill is triggered (or when the user's prompt is broad/underspecified), **DO NOT guess or rush into code**.
Run an interactive interview using the `ask_question` tool to determine the user's exact requirements:

### Questions to Ask:
1. **Output Mode & Interactivity:**
   - `(Recommended) Interactive Player Animation`: Fixed-viewport stage with Play/Pause, scrubber slider, timecode, and sequential SVG stroke draw-in.
   - `Static Multi-Frame Diagram`: Non-moving architectural comparison frames with tab/number key switching (`1`–`4`, `S` stacked).
   - `Scroll-Triggered Stage`: Pinned stationary viewport diagram that draws in proportionally as the user scrolls.
2. **Visual Representation Metaphor (Beyond Boxes):**
   - `(Recommended) Match Metaphor to Technical Problem`: Auto-select between Byte Tape, Radial Ring Wheel, Hydraulic Funnel, Latency Orbits, or Containers based on domain.
   - `Physical Byte Tape & Memory Ruler`: Continuous address tape (`0x1000`, `0x1008`), bracketed active slice/buffer windows, pointer laser beams (Memory, Slices, Structs, Pointers).
   - `Mechanical Radial Ring Buffer`: Circular donut wheel with radial slots, rotating Head/Tail needles, atomic math (Queues, Event Loops, Channels, Ring Buffers).
   - `Hydraulic Funnel & Token Bucket`: Physical funnel, dripping token faucet, liquid level, overflow spout, drain valve (Rate Limiting, Traffic Shaping, Backpressure).
   - `Concentric Gravitational Orbits`: Astronomical orbits around CPU core scaling latency to human time (Memory hierarchy, Caches, NVMe vs RAM).
   - `Architectural Boxes & Containers`: Inverted symmetry pairs, multi-tier pipelines, or service meshes (High-level system architecture).
3. **Technical Depth & Hardware Precision:**
   - `(Recommended) Low-Level Mechanical Sympathy`: Exact byte counts (8B words, 24B headers), memory addresses (`0x7fff...`), cycle latencies, and assembly registers.
   - `High-Level Conceptual Architecture`: Clean logical blocks and data flow without raw hex or low-level numbers.
4. **Failure States & Boundary Edge Cases:**
   - `(Recommended) Include Failure / Overflow Boundaries`: Out-of-bounds red panic fence, overflow valve (HTTP 429), or queue starvation states.
   - `Happy Path Only`: Pure nominal data flow.

---

## Visual Representation Intelligence (Beyond Boxes)

Senior systems engineers rarely use generic grids of boxes for everything. Choose the **physical and spatial metaphor** that matches the technical problem:

| Technical Concept | Non-Box Representation Primitive | Visual Metaphor |
| :--- | :--- | :--- |
| **Concurrency / Queues / Channels** | **Circular Radial Wheel** | Donut ring with 16 radial sectors, rotating Head/Tail needles, atomic `(idx & mask)` math, empty vs committed sectors. Zero boxes. |
| **Memory / Slices / Pointers / Offsets** | **Physical Byte Tape & Ruler** | Continuous steel engineering ruler with 8-byte word ticks (`0x1000`, `0x1008`), bracketed active slice windows `[ len ]`, dashed capacity `[ cap )`, pointer laser beams. Zero boxes. |
| **Rate Limiting / Flow Control / Backpressure** | **Hydraulic Funnel & Token Bucket** | Tapered physical funnel, dripping token faucet (`r tok/s`), liquid surface level (`b`), overflow spout (`HTTP 429`), bottom regulated drain valve. Zero boxes. |
| **Latency / Distance / Hardware Hierarchy** | **Concentric Planetary Orbits** | Gravitational planetary orbits around the CPU core ($0.5\text{ns}$ core $\to$ $4\text{ns}$ L1/L2 $\to$ $100\text{ns}$ RAM $\to$ $100\mu\text{s}$ SSD $\to$ $50\text{ms}$ WAN) scaled to human time. Zero boxes. |
| **Network Protocols / Bus Signals** | **Timing & Logic Waveforms** | High/Low square pulse trains, clock edge ticks (`CLK`, `DATA`, `ACK`), setup/hold intervals. |
| **Routing Tables / Compilers / ASTs** | **Organic Branching Dendrograms** | Tree bifurcations without boxes, leaf brackets, radix edges. |

---

## Architectural Topologies & Layout Archetypes

When boxes and containers ARE appropriate (e.g. system design), do NOT limit yourself to a single 2-box layout:

### Archetype A: Inverted Symmetry Pair (Two-Node Contract)
*Best for: 1-to-1 system contracts (e.g. Brain vs Devbox, Stack vs Heap, Client vs Sandbox).*
- Left Container: 1 wide pill on top, 2 split pills on bottom.
- Right Container: 2 split pills on top, 1 wide pill on bottom.
- Connecting Arrows: Top solid horizontal forward arrow (`-------->`), bottom dashed horizontal return arrow (`<--------`).

### Archetype B: Multi-Tier Storage & Pipeline (LSM-Tree / Ingestion Engine)
*Best for: Storage engines, compilers, build systems, data ingestion pipelines.*
- Ingress: Client write pill with branching arrows (`1. append` / `2. insert`).
- Tier 1 Container: Volatile RAM Boundary with sequential log buffer (WAL) + ordered Tree/SkipList with circular nodes and size freeze triggers.
- Transition: Async thread flush arrow across tiers.
- Tier 2 Container: Persistent NVMe Storage with uncompacted Level 0 SSTables, compaction merge sort arrows, and disjoint Level 1 SSTables with Bloom Filter status headers.

### Archetype C: Hierarchical Tree & Work-Stealing (Runtime Scheduler)
*Best for: Thread pools, M:P:N schedulers (Go/Erlang/JVM), distributed worker queues.*
- Top Tier: Global Run Queue (strip of runnable job pills `[G5][G6][G7]`).
- Middle Tier: Multiple logical processors / workers in parallel (`P0`, `P1`), each with lock-free local ring buffers.
- Dynamic Cross-Stealing Arrow: Dotted curved arrow from starved worker reaching into busy worker's queue (`steal half (runqsize / 2)`).
- Bottom Tier: Operating system execution threads bound to processors.

### Archetype D: Ingress Fan-Out & Storage Mesh (Event-Driven Gateway)
*Best for: Cloud backends, Kafka/microservice architectures, distributed databases.*
- Ingress Layer: Multi-client ingress (Web, Mobile) into Reverse Proxy / API Gateway (Envoy/Nginx).
- Broker Layer: Partitioned commit log (Kafka / RabbitMQ topic with `[P0]`, `[P1]`, `[P2]`).
- Processing Layer: Fan-out arrows to dedicated consumer microservices.
- Data Layer: Dual storage mesh — high-speed in-memory cache (Redis) + transactional database (PostgreSQL Primary with WAL streaming replication to Read Replica).

### Archetype E: Layered Privilege / Memory Boundary (eBPF / Kernel Internals)
*Best for: Linux kernel, drivers, network packet filters, isolation sandboxes.*
- Horizontal Boundary: Syscall & Memory Protection divider line (`--- Syscall Boundary ---`).
- Top Zone: Unprivileged User Space (telemetry daemons, Prometheus metrics, runtime apps).
- Bottom Zone: Ring 0 Kernel Space (NIC DMA RX ring buffer, XDP driver hooks, JIT bytecode engine, lockless BPF ring buffers).
- Inter-layer Arrows: Zero-copy `mmap()` or syscall read channels traversing the boundary.

---

## Canonical HTML Shell (Single Viewport, Zero Bloat)

Every generated diagram MUST follow this exact, clean structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Technical Diagram Title</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
<style>
  * { box-sizing: border-box; margin: 0; padding: 0; }
  body {
    background-color: #000000;
    color: #ffffff;
    font-family: 'Architects Daughter', cursive;
    overflow: hidden;
    width: 100vw;
    height: 100vh;
    user-select: none;
    -webkit-font-smoothing: antialiased;
  }

  .stage-viewport {
    width: 100vw;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    inset: 0;
  }

  svg {
    max-width: 96vw;
    max-height: 84vh;
    overflow: visible;
  }

  /* Fixed Floating Bottom Scrubber (If Animated) */
  .bottom-bar {
    position: fixed;
    bottom: 24px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1000;
    display: flex;
    align-items: center;
    gap: 12px;
    background: rgba(18, 18, 20, 0.88);
    border: 1px solid rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(16px);
    border-radius: 9999px;
    padding: 8px 16px;
    box-shadow: 0 12px 36px rgba(0, 0, 0, 0.85);
  }

  /* Fixed Floating Top HUD / Nav (Optional) */
  .top-hud {
    position: fixed;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1000;
    display: flex;
    align-items: center;
    gap: 8px;
    background: rgba(18, 18, 20, 0.88);
    border: 1px solid rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(16px);
    border-radius: 9999px;
    padding: 6px 14px;
  }
</style>
</head>
<body>
  <!-- Fixed Centered SVG Stage -->
  <main class="stage-viewport">
    <svg viewBox="0 0 1060 560">
      <!-- Defs for arrowheads -->
      <defs>
        <marker id="arr-white" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <polygon points="0 1, 8 4, 0 7" fill="#ffffff" />
        </marker>
        <marker id="arr-green" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <polygon points="0 1, 8 4, 0 7" fill="#30d158" />
        </marker>
        <marker id="arr-orange" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <polygon points="0 1, 8 4, 0 7" fill="#ff9f0a" />
        </marker>
      </defs>

      <!-- DIAGRAM GRAPHICS HERE: Centered, Clean, Hand-drawn -->
    </svg>
  </main>
</body>
</html>
```

---

## Verification Checklist

Before presenting the artifact to the user, run headless Chrome to verify:
- [ ] Solid `#000000` pitch-black canvas (no `#0e1117` navy blue)
- [ ] Google Fonts `'Architects Daughter'` loaded and rendered
- [ ] Single centered `<svg>` stage (ZERO sidebars, ZERO code editors, ZERO narrative paragraphs)
- [ ] No overlapping text or labels colliding with stroke lines
- [ ] Controls (if animated) are `position: fixed` and stay locked to screen edges
