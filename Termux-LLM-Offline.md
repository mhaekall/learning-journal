# Dokumentasi Instalasi LLM Offline (Qwen 3.5 4B) di Termux

Dokumentasi ini berisi langkah-langkah teknis untuk menjalankan model AI (LLM) secara lokal dan 100% offline pada perangkat Android (Snapdragon 778G / RAM 8GB).

## 1. Persiapan Lingkungan (Environment)
Instalasi paket sistem utama di Termux:
```bash
pkg update && pkg upgrade
pkg install clang llvm cmake ninja python python-numpy rust wget -y
pkg install llama-cpp
```

## 2. Instalasi Library Python
Instalasi `llama-cpp-python` (untuk integrasi Python) dan dependensi lainnya:
```bash
export ANDROID_API_LEVEL=24
export CMAKE_ARGS="-DGGML_OPENBLAS=ON"
pip install llama-cpp-python huggingface-hub
```

### Perbaikan Bug "Unsupported Platform"
Jika muncul error `RuntimeError: Unsupported platform`, lakukan patching manual pada library:
```bash
sed -i 's/sys.platform.startswith("linux") or sys.platform.startswith("freebsd")/sys.platform.startswith("linux") or sys.platform.startswith("freebsd") or sys.platform == "android"/' /data/data/com.termux/files/usr/lib/python3.13/site-packages/llama_cpp/_ctypes_extensions.py
```

## 3. Model AI (Qwen 3.5 4B)
Model yang digunakan adalah **Qwen 3.5 4B Q4_K_M (GGUF)** dari Unsloth karena optimasi RAM dan kecerdasannya yang tinggi.

**Download Manual (Paling Stabil):**
```bash
wget -O Qwen3.5-4B-Q4_K_M.gguf https://huggingface.co/unsloth/Qwen3.5-4B-GGUF/resolve/main/Qwen3.5-4B-Q4_K_M.gguf
```

## 4. Script Menjalankan AI (Wrapper Subprocess)
Dibuat menggunakan Python untuk memanggil binary `llama-cli` secara langsung (menghindari error backend di Python).

**Nama File:** `chat_qwen_subprocess.py`
```python
import subprocess

class LlamaCpp:
    def __init__(self, model_path, n_ctx=1024, n_threads=4):
        self.model_path = model_path
        self.n_ctx = n_ctx
        self.n_threads = n_threads
        self.llama_bin = "llama-cli" 

    def chat_interactive(self):
        cmd = [
            self.llama_bin,
            "-m", self.model_path,
            "-c", str(self.n_ctx),
            "-t", str(self.n_threads),
            "-cnv", 
            "--color", "on"
        ]
        subprocess.run(cmd)

if __name__ == "__main__":
    llm = LlamaCpp(model_path="./Qwen3.5-4B-Q4_K_M.gguf")
    llm.chat_interactive()
```

## 5. Fitur Tambahan
- **Alias:** Gunakan perintah `openqwen` untuk langsung chat.
- **Baca File:** Gunakan perintah `/read <lokasi_file>` di dalam chat untuk menganalisis dokumen teks offline.
- **Memori:** AI bersifat *stateless* (tidak menyimpan memori setelah aplikasi ditutup).

---
*Dokumentasi ini dibuat secara otomatis pada 5 Maret 2026.*
