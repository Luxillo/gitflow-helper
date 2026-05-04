#!/bin/bash

# Colores
GREEN='\033[0-32m'
BLUE='\033[0-34m'
YELLOW='\033[1-33m'
RED='\033[0-31m'
NC='\033[0m' 

mostrar_helpers() {
    echo -e "\n${BLUE}=== 📘 AYUDA DISPONIBLE PARA GIT FLOW ===${NC}"
    echo -e "${YELLOW}🚀 TAREAS SEMANALES:${NC} git flow feature start [nombre]"
    echo -e "${YELLOW}💾 RESPALDO NUBE:${NC}   git flow feature publish [nombre]"
    echo -e "${YELLOW}🏁 FINALIZAR TAREA:${NC} git flow feature finish [nombre]"
    echo -e "${YELLOW}📦 PASAR A MAIN:${NC}    git flow release start [vX.X.X]"
    echo -e "${YELLOW}☁️  SINCRONIZAR TODO:${NC} git push origin main develop --tags"
    echo -e "${BLUE}===========================================${NC}"
}

# 1. Validar si es un repositorio de Git
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Error: No estás dentro de un repositorio de Git.${NC}"
    exit 1
fi

# 2. Verificar archivos "sucios" (sin commit)
# git status --porcelain devuelve una lista si hay cambios, o nada si está limpio
cambios=$(git status --porcelain)

if [ -n "$cambios" ]; then
    echo -e "${RED}⚠️  ¡ATENCIÓN! Tienes archivos sucios o sin guardar:${NC}"
    echo -e "$cambios"
    echo -e "${YELLOW}\n👉 Recomendación: Haz 'git add .' y 'git commit' antes de continuar.${NC}"
    echo -e "-----------------------------------------------------------"
else
    echo -e "${GREEN}✅ El directorio de trabajo está limpio.${NC}"
fi

# 3. Validar si Git Flow está inicializado
if git config --get gitflow.branch.develop > /dev/null; then
    echo -e "${GREEN}✅ Git Flow está activo.${NC}"
    mostrar_helpers
else
    echo -e "${YELLOW}⚠️  Git Flow no está configurado en este repositorio.${NC}"
    read -p "¿Deseas activarlo ahora? (s/n): " respuesta

    if [[ "$respuesta" =~ ^[Ss]$ ]]; then
        echo -e "${BLUE}\n🛠️ Iniciando Git Flow (Presiona ENTER para valores por defecto)...${NC}"
        git flow init
        [ $? -eq 0 ] && mostrar_helpers
    fi
fi
