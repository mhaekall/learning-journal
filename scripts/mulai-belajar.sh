#!/bin/bash

# ==============================================================================
# SCRIPT: mulai-belajar.sh
# DESKRIPSI: Otomatisasi persiapan lingkungan belajar harian.
# ==============================================================================

# Warna untuk output terminal agar estetik
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=======================================${NC}"
echo -e "${YELLOW}🚀 Menginisialisasi Mode Belajar...${NC}"
echo -e "${BLUE}=======================================${NC}"

# 1. Mendapatkan tanggal hari ini
TODAY=$(date +"%Y-%m-%d")
WEEK_NUM="week-$(date +"%V")" # Dinamis berdasarkan minggu berjalan
DIR_PATH="/data/data/com.termux/files/home/learning-journal/notes/$WEEK_NUM"
FILE_PATH="$DIR_PATH/$TODAY.md"

# 2. Menarik (Pull) update terbaru dari GitHub (jika ada perubahan dari device lain)
echo -e "\n${GREEN}[1/3] Sinkronisasi dengan GitHub...${NC}"
cd /data/data/com.termux/files/home/learning-journal || exit
git pull origin main --quiet
echo "Sinkronisasi selesai."

# 3. Membuat file jurnal hari ini jika belum ada
echo -e "\n${GREEN}[2/3] Menyiapkan Jurnal Harian ($TODAY)...${NC}"
mkdir -p "$DIR_PATH"

if [ ! -f "$FILE_PATH" ]; then
    cat <<EOF > "$FILE_PATH"
# 📅 Jurnal Belajar: $TODAY

## 🎯 Target Hari Ini
- [ ] Target 1
- [ ] Target 2

## 📚 Yang Dipelajari
-

## 💡 Insight / Aha Moment
-

## 🚧 Yang Masih Bingung
-
EOF
    echo "File jurnal baru berhasil dibuat: $FILE_PATH"
else
    echo "File jurnal hari ini sudah ada. Melanjutkan..."
fi

# 4. Membuka file jurnal (menggunakan nano/vim/kode editor di Termux)
echo -e "\n${GREEN}[3/3] Membuka Jurnal...${NC}"
echo -e "${YELLOW}Siap tempur! Tetap fokus pada hasil > teori.${NC}"

# Opsional: Jika Anda menggunakan code-server atau nvim, ganti 'nano' dengan editor Anda.
nano "$FILE_PATH"
