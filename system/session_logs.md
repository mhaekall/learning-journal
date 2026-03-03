# Session Logs - Gemini CLI

## [2026-03-02] Sesi Perkenalan & Workflow Hacker
- **Konteks:** General Setup & Productivity Strategy.
- **Key Takeaways:**
    - Memahami konsep **Background Process** (`is_background: true`) buat *multitasking* (nyalain server sambil ngoding).
    - Definisi **Tailwind Watcher** (mandor otomatis UI) dan **Cek Log** (CCTV dapur/backend vs Inspect Element).
    - Strategi **4 Ruang Sesi** (Pabrik UI, Studio Kreatif, Mesin Cuci Data, Ruang R&D) biar nggak *overwhelming*.
- **Otomatisasi Baru:**
    - Filter sesi di awal chat (Memory: `ask context`).
    - Auto-summary pas ketik "Cabut" (Memory: `session logging`).
- **Life Hacks Teridentifikasi:**
    - Pipeline `PRD.md` -> App (Project Amanaja).
    - Auto-generate aset visual via `generate_canvas.py`.
    - Script konten TikTok pake analogi HTML dari folder `diagrams`.
    - Auto-journaling ke folder `learning-journal`.

---

## Sesi: 2026-03-02 22:22:14
- **Persona Update**: Mengadopsi gaya komunikasi profesional CLI Agent Expert.
- **Storage Org**: Restrukturisasi direktori lokal (dev, docs, data, tools).
- **Automations**: Cron job untuk disk analyzer, inotify-tools watcher untuk auto-organize downloads.
- **Dotfiles**: Setup manajemen konfigurasi terpusat menggunakan GNU Stow (.bashrc, .zshrc, .gitconfig) dan instalasi Starship prompt.
- **Scripts**: sys-dashboard.sh (Quotes & Disk space), wip (auto-commit WIP), gac (AI-powered Git Auto Commit), expose (Cloudflared tunnel).
- **Tools Installed**: fzf, bat, fd, eza, zoxide, jq, parallel, ncdu, cloudflared, pm2, make.

## Session Summary: Ruang R&D/Learning - Free APIs & Mashups (March 2, 2026)
- **Concepts Learned:** Free API limits, monetization rules (Rate Limit, ToS, Database Caching), and API Mashup pipelines.
- **Projects Built:**
  1. `daily-motivation-ios` (Cat API + Quotes).
  2. `meme-indo-ios` (Cat GIF API + Gen-Z Slang Array).
  3. `wibu-travel-guide` (REST Countries + Open-Meteo + Jikan API) with Glassmorphism UI.
## Session Log: 2026-03-03 07:13

**Context:** Ruang R&D/Learning (MCP Experimentation)

**Key Takeaways:**
- Memahami Model Context Protocol (MCP) sebagai 'Pintu Dapur Ajaib' bagi AI untuk mengakses sistem lokal.
- Perbedaan MCP TypeScript (struktur kuat/Zod) vs Python (cepat/FastMCP).
- Cara menghubungkan MCP Server ke Claude Desktop dan Cline (VS Code) menggunakan OpenRouter (Model Gratis).

**Code & Tools:**
- Proyek: `hello-mcp-server` (TypeScript) di `~/dev/sandbox/`.
- Script: `start-mcp.sh` untuk otomasi Inspector + Token extraction.
- Tools: `say_hello` dan `calculate_sum`.

**Status:** Berhasil menjalankan Inspector dan memahami arsitektur MCP.

---

## Session Log: 2026-03-03 (Pabrik UI/Coding)

**Context:** Migrasi dan Peningkatan Environment CLI

**Key Takeaways:**
- **Upgrade Shell**: Migrasi dari Bash ke Zsh sebagai shell default untuk meningkatkan produktivitas CLI.
- **Modern CLI Tools**: Instalasi `zsh`, `starship`, `eza`, `bat`, `fzf`, `ripgrep`, `fd`, `jq`, `neovim`, `tmux`, `btop`, `gh`, dan `openssh`.
- **Konfigurasi Porting**: Memindahkan seluruh fungsi utilitas, startup script (`sys-dashboard.sh`, `space_monitor.sh`), dan _custom aliases_ dari `.bashrc` ke `.zshrc`.
- **Produktivitas & Tampilan**:
  - `Starship` diinisialisasi sebagai prompt modern yang lebih estetik dan informatif.
  - Perintah standar di-_alias_ ke alat modern (misalnya `ls`, `ll`, `tree` menggunakan `eza --icons`).
  - Fungsi kustom `fp` diciptakan dengan menggabungkan pipeline `fzf` dan `bat` untuk _file preview_ instan di dalam terminal.

---
