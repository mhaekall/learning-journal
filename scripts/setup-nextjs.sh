#!/bin/bash

# ==============================================================================
# SCRIPT: setup-nextjs.sh
# DESKRIPSI: Otomatisasi instalasi Next.js dengan Tailwind & Shadcn/ui
# ==============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ -z "$1" ]; then
    echo -e "${RED}❌ Error: Berikan nama proyek.${NC}"
    echo "Contoh: setup-nextjs.sh my-saas"
    exit 1
fi

PROJECT_NAME=$1

echo -e "${BLUE}=======================================${NC}"
echo -e "${YELLOW}🚀 Membuat Proyek Next.js: $PROJECT_NAME...${NC}"
echo -e "${BLUE}=======================================${NC}"

# Membuat Next.js project tanpa interaktif prompt yang mengganggu
npx create-next-app@latest "$PROJECT_NAME" --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --use-npm --yes

cd "$PROJECT_NAME" || exit

echo -e "
${GREEN}📦 Menginisialisasi Shadcn/ui...${NC}"
npx shadcn@latest init -d

echo -e "
${GREEN}✅ Proyek $PROJECT_NAME siap!${NC}"
echo -e "Silakan ketik: ${YELLOW}cd $PROJECT_NAME && dev${NC} untuk mulai."
