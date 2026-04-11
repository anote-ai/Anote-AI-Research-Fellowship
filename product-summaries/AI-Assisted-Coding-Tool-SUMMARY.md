# AI Assisted Coding Tool — Product Summary

**Repo:** [anote-ai/AI-Assisted-Coding-Tool](https://github.com/anote-ai/AI-Assisted-Coding-Tool) *(Private)*
**Status:** Production | **License:** MIT

---

## What It Does

The **AI Assisted Coding Tool** is Anote's production-grade AI coding assistant — a CLI, Web UI, and VS Code extension built on the Claude Agent SDK. It provides developers with full codebase access, file editing capabilities, and streaming AI responses directly in their development environment.

From the product description:
- **CLI tool** — Terminal-based AI coding assistant with natural language commands
- **Web UI** — Browser-based interface for AI-assisted coding sessions
- **VS Code extension** — Inline AI assistance directly in the editor

The tool is built on the **Claude Agent SDK** (Anthropic), giving it:
- Full codebase access and traversal
- File reading, editing, and creation
- Streaming responses for real-time feedback
- Context-aware code suggestions and explanations

**Tech:** Rust (primary language, ~5.6MB codebase), MIT licensed, created April 2026, actively developed (4 open issues).

---

## How to Run

> **Note:** This repo is private. The following is inferred from the product description and standard Rust application patterns.

### Prerequisites
- Rust toolchain (via [rustup](https://rustup.rs/))
- Anthropic API key

### CLI Setup
```bash
# Clone repo (requires org access)
git clone https://github.com/anote-ai/AI-Assisted-Coding-Tool
cd AI-Assisted-Coding-Tool

# Build
cargo build --release

# Configure
export ANTHROPIC_API_KEY=sk-ant-...

# Run CLI
./target/release/ai-coding-tool
```

### Web UI
```bash
# Start web server
cargo run --bin web-server

# Open browser
open http://localhost:8080
```

### VS Code Extension
```bash
cd vscode-extension
npm install
npm run compile
# Press F5 in VS Code to launch extension development host
```

### Tests
```bash
cargo test
```

---

## TODOs & Enhancements

### High Priority
- [ ] **Write a README** — Document installation, setup, CLI commands, and configuration
- [ ] **Add `.env.example`** — Document required environment variables (API keys, config paths)
- [ ] **Resolve 4 open issues** — Triage and address the existing open issues
- [ ] **Add CI/CD pipeline** — GitHub Actions for Rust build, clippy lint, and tests on every PR

### Features
- [ ] **Multi-model support** — Allow switching between Claude models (Opus, Sonnet, Haiku) and other providers (OpenAI, Gemini) via config
- [ ] **Project context management** — Smart `.gitignore`-aware context loading; exclude build artifacts and node_modules automatically
- [ ] **Inline diff view** — Show proposed file changes as a diff before applying, with accept/reject per-hunk
- [ ] **Session history** — Persist and reload past coding sessions (conversation + file changes)
- [ ] **Test generation** — `/test` command that auto-generates unit tests for a given function or file
- [ ] **Explain mode** — `/explain` command that walks through a codebase or function in plain English
- [ ] **Git-aware context** — Auto-include recently changed files and the current diff in the AI context
- [ ] **Workspace search** — Semantic code search across the entire codebase (RAG over code)
- [ ] **JetBrains plugin** — Expand IDE support beyond VS Code to IntelliJ, PyCharm, WebStorm

### Improvements (Rust-specific)
- [ ] **Async I/O throughout** — Use `tokio` for all file and network operations to avoid blocking the main thread
- [ ] **Error messages** — Provide user-friendly error messages with suggestions when API calls fail
- [ ] **Streaming output polish** — Ensure streaming tokens render smoothly in both the CLI and Web UI
- [ ] **Cross-platform builds** — Set up GitHub Actions release workflow to produce binaries for Linux, macOS (Intel + ARM), and Windows
- [ ] **Plugin system** — Allow external tools and commands to be registered as agent capabilities
