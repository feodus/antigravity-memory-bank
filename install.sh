#!/bin/bash

# Memory Bank Installation Script
# Устанавливает систему Memory Bank в текущий проект

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
MEMORY_BANK_REPO="https://github.com/feodus/antigravity-memory-bank"
TEMP_DIR="/tmp/memory-bank-install-$$"

echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Memory Bank Installation Script         ║${NC}"
echo -e "${BLUE}║   для Antigravity Agent                    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a project directory
if [ ! -d ".git" ] && [ ! -f "package.json" ] && [ ! -f "go.mod" ] && [ ! -f "Cargo.toml" ]; then
    echo -e "${YELLOW}⚠️  Warning: Не похоже на корень проекта${NC}"
    echo -e "   Продолжить установку здесь? (y/n)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo -e "${RED}✗ Установка отменена${NC}"
        exit 1
    fi
fi

# Function to download from GitHub or use local files
install_from_source() {
    local source_type=$1
    
    if [ "$source_type" = "github" ]; then
        echo -e "${BLUE}→ Загрузка файлов из GitHub...${NC}"
        
        # Clone repository to temp directory
        git clone --depth 1 "$MEMORY_BANK_REPO" "$TEMP_DIR" 2>/dev/null || {
            echo -e "${RED}✗ Ошибка загрузки из GitHub${NC}"
            echo -e "${YELLOW}  Попробуйте локальную установку${NC}"
            exit 1
        }
        
        SOURCE_DIR="$TEMP_DIR"
    else
        # Use local files (assuming script is in the memory bank directory)
        SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        SOURCE_DIR="$SCRIPT_DIR"
        echo -e "${BLUE}→ Использование локальных файлов из: $SOURCE_DIR${NC}"
    fi
}

# Create directory structure
create_structure() {
    echo ""
    echo -e "${BLUE}→ Создание структуры директорий...${NC}"
    
    mkdir -p .agent/workflows
    mkdir -p .agent/memory/patterns
    
    echo -e "${GREEN}✓ Директории созданы${NC}"
}

# Copy workflow files
copy_workflows() {
    echo ""
    echo -e "${BLUE}→ Копирование workflow файлов...${NC}"
    
    if [ -f "$SOURCE_DIR/workflows/init-memory.md" ]; then
        cp "$SOURCE_DIR/workflows/init-memory.md" .agent/workflows/
        echo -e "${GREEN}  ✓ init-memory.md${NC}"
    fi
    
    if [ -f "$SOURCE_DIR/workflows/update-memory.md" ]; then
        cp "$SOURCE_DIR/workflows/update-memory.md" .agent/workflows/
        echo -e "${GREEN}  ✓ update-memory.md${NC}"
    fi
}

# Create initial memory files (optional)
create_initial_files() {
    echo ""
    echo -e "${BLUE}→ Создать начальные файлы памяти?${NC}"
    echo -e "  (Рекомендуется использовать ${YELLOW}/init-memory${NC} workflow для автоматического анализа)"
    echo -e "  Создать шаблоны сейчас? (y/n)"
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}  Копирование шаблонов...${NC}"
        
        if [ -d "$SOURCE_DIR/templates" ]; then
            cp "$SOURCE_DIR/templates/project-brief.md" .agent/memory/ 2>/dev/null && echo -e "${GREEN}  ✓ project-brief.md${NC}"
            cp "$SOURCE_DIR/templates/product-vision.md" .agent/memory/ 2>/dev/null && echo -e "${GREEN}  ✓ product-vision.md${NC}"
            cp "$SOURCE_DIR/templates/context.md" .agent/memory/ 2>/dev/null && echo -e "${GREEN}  ✓ context.md${NC}"
            cp "$SOURCE_DIR/templates/architecture.md" .agent/memory/ 2>/dev/null && echo -e "${GREEN}  ✓ architecture.md${NC}"
            cp "$SOURCE_DIR/templates/tech-stack.md" .agent/memory/ 2>/dev/null && echo -e "${GREEN}  ✓ tech-stack.md${NC}"
            cp "$SOURCE_DIR/templates/common-tasks.md" .agent/memory/patterns/ 2>/dev/null && echo -e "${GREEN}  ✓ patterns/common-tasks.md${NC}"
        fi
    else
        # Create empty patterns file
        cat > .agent/memory/patterns/common-tasks.md <<EOF
# Common Tasks

This file documents repetitive tasks and their workflows.

---

_No tasks documented yet. Use "add task" command after completing repetitive tasks._
EOF
        echo -e "${GREEN}  ✓ patterns/common-tasks.md (пустой)${NC}"
    fi
}

# Create .gitignore entry (optional)
update_gitignore() {
    echo ""
    echo -e "${BLUE}→ Добавить .agent/memory/ в .gitignore?${NC}"
    echo -e "  (Рекомендуется коммитить файлы памяти для команды)"
    echo -e "  Добавить в .gitignore? (y/n)"
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        if [ -f ".gitignore" ]; then
            if ! grep -q ".agent/memory/" .gitignore; then
                echo "" >> .gitignore
                echo "# Memory Bank files" >> .gitignore
                echo ".agent/memory/" >> .gitignore
                echo -e "${GREEN}  ✓ .gitignore обновлен${NC}"
            else
                echo -e "${YELLOW}  ⚠️  Уже присутствует в .gitignore${NC}"
            fi
        else
            echo "# Memory Bank files" > .gitignore
            echo ".agent/memory/" >> .gitignore
            echo -e "${GREEN}  ✓ .gitignore создан${NC}"
        fi
    fi
}

# Cleanup
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        echo -e "${BLUE}→ Временные файлы удалены${NC}"
    fi
}

# Main installation
main() {
    # Determine installation source
    echo -e "${BLUE}Выберите источник установки:${NC}"
    echo -e "  1) GitHub (загрузить актуальную версию)"
    echo -e "  2) Локальные файлы (использовать текущую директорию)"
    echo -n "Ваш выбор (1/2): "
    read -r choice
    
    case $choice in
        1)
            install_from_source "github"
            ;;
        2)
            install_from_source "local"
            ;;
        *)
            echo -e "${RED}✗ Неверный выбор${NC}"
            exit 1
            ;;
    esac
    
    # Run installation steps
    create_structure
    copy_workflows
    create_initial_files
    update_gitignore
    
    # Cleanup temp files
    trap cleanup EXIT
    
    # Success message
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   ✓ Memory Bank установлен успешно!       ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}📋 Следующие шаги:${NC}"
    echo ""
    echo -e "  1. Убедитесь, что правила Antigravity настроены"
    echo -e "     ${YELLOW}(см. antigravity-memory-bank.md)${NC}"
    echo ""
    echo -e "  2. Инициализируйте банк памяти:"
    echo -e "     ${YELLOW}/init-memory${NC}"
    echo ""
    echo -e "  3. Проверьте созданные файлы в ${YELLOW}.agent/memory/${NC}"
    echo ""
    echo -e "  4. Начните работу! Память будет загружаться автоматически"
    echo ""
    echo -e "${BLUE}📚 Документация: ${YELLOW}README.md${NC}"
    echo ""
}

# Run main
main
