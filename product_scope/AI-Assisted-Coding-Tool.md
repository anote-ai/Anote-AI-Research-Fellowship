# AI Assisted Coding Tool

**Repo:** [anote-ai/AI-Assisted-Coding-Tool](https://github.com/anote-ai/AI-Assisted-Coding-Tool) · **Private**
**Status:** Production | Language: Rust | License: MIT | Size: ~5.6 MB | Created: April 2026

---

## What It Does

The **AI Assisted Coding Tool** is Anote's production-grade AI coding assistant built on the **Claude Agent SDK** (Anthropic). It ships as three integrated surfaces:

- **CLI** — terminal-based AI coding assistant with natural language commands
- **Web UI** — browser-based interface for AI-assisted coding sessions
- **VS Code Extension** — inline AI assistance directly in the editor

### Core Capabilities
- Full codebase access and traversal
- File reading, editing, and creation
- Streaming responses for real-time feedback
- Context-aware code suggestions, explanations, and refactors
- Built on Claude (Anthropic) via the Agent SDK

---

## Tech Stack

| Component | Technology |
|---|---|
| Core | Rust (primary language, ~5.6 MB codebase) |
| AI Backend | Claude Agent SDK (Anthropic) |
| CLI | Rust binary |
| Web UI | Likely Rust web server (Axum / Actix) + React/HTML frontend |
| VS Code Extension | TypeScript / Node.js |
| License | MIT |

---

## How to Run

> This repo is private. Steps below follow standard Rust application patterns.

### Prerequisites
- Rust toolchain via [rustup](https://rustup.rs/)
- Anthropic API key

### CLI
```bash
git clone https://github.com/anote-ai/AI-Assisted-Coding-Tool
cd AI-Assisted-Coding-Tool
cargo build --release
export ANTHROPIC_API_KEY=sk-ant-...
./target/release/ai-coding-tool
```

### Web UI
```bash
cargo run --bin web-server
open http://localhost:8080
```

### VS Code Extension
```bash
cd vscode-extension
npm install && npm run compile
# Press F5 in VS Code to launch the Extension Development Host
```

### Tests
```bash
cargo test
cargo clippy    # lint
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — installation, CLI commands, configuration, and quickstart
- [ ] **Add `.env.example`** — document required env vars (API keys, config paths)
- [ ] **Resolve 4 open issues** — triage and address the existing issue backlog
- [ ] **Add CI/CD** — GitHub Actions for `cargo build`, `cargo clippy`, and `cargo test` on every PR

### Features
- [ ] **Multi-model support** — switch between Claude models (Opus, Sonnet, Haiku) and other providers (OpenAI, Gemini) via config
- [ ] **Inline diff view** — show proposed file changes as a diff before applying, with per-hunk accept/reject
- [ ] **Session history** — persist and reload past coding sessions (conversation + file changes)
- [ ] **Test generation** — `/test` command that auto-generates unit tests for a function or file
- [ ] **Explain mode** — `/explain` command that walks through a codebase or function in plain English
- [ ] **Git-aware context** — auto-include recently changed files and current diff in the AI context
- [ ] **Workspace semantic search** — RAG over the codebase for context-aware suggestions
- [ ] **JetBrains plugin** — expand IDE support beyond VS Code to IntelliJ, PyCharm, WebStorm

### Rust-Specific Improvements
- [ ] **Async I/O throughout** — use `tokio` for all file and network operations
- [ ] **User-friendly error messages** — provide actionable suggestions when API calls fail
- [ ] **Smooth streaming output** — ensure tokens render cleanly in CLI and Web UI
- [ ] **Cross-platform release builds** — GitHub Actions release workflow for Linux, macOS (Intel + ARM), and Windows binaries
- [ ] **Plugin system** — allow external tools and commands to be registered as agent capabilities
