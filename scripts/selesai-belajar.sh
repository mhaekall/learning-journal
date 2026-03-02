#!/bin/bash

# ==============================================================================
# SCRIPT: selesai-belajar.sh
# DESKRIPSI: Mengotomatisasi proses commit & push catatan/kodingan ke GitHub
# ==============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}=======================================${NC}"
echo -e "${YELLOW}📦 Membungkus Sesi Belajar Hari Ini...${NC}"
echo -e "${BLUE}=======================================${NC}"

cd /data/data/com.termux/files/home/learning-journal || exit

# 1. Menampilkan status perubahan (apa saja file yang diedit/ditambah)
echo -e "\n${YELLOW}File yang berubah:${NC}"
git status --short

# 2. Meminta pesan commit dari Anda
echo -e "\n${GREEN}Masukkan pesan commit (contoh: docs: catatan hari 1 html):${NC}"
read -r COMMIT_MSG

# Validasi jika pesan kosong
if [ -z "$COMMIT_MSG" ]; then
    TODAY=$(date +"%Y-%m-%d")
    COMMIT_MSG="docs: update jurnal $TODAY"
    echo -e "${YELLOW}Pesan kosong! Menggunakan pesan default: '$COMMIT_MSG'${NC}"
fi

# 3. Proses Git (Add, Commit, Push)
echo -e "\n${GREEN}Menyimpan ke GitHub...${NC}"
git add .
git commit -m "$COMMIT_MSG"
git push origin main

if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}✅ Berhasil! Graph GitHub Anda sudah di-update.${NC}"
    echo -e "Selamat beristirahat. Besok kita hajar lagi!"
else
    echo -e "\n${RED}❌ Gagal melakukan push. Periksa koneksi internet atau token Anda.${NC}"
fi
