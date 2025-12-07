#!/bin/bash

# Memory Bank Installation Script
# Installs Memory Bank system into current project

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
echo -e "${BLUE}║   for Antigravity Agent                    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Check if we're in a project directory
if [ ! -d ".git" ] && [ ! -f "package.json" ] && [ ! -f "go.mod" ] && [ ! -f "Cargo.toml" ]; then
    echo -e "${YELLOW}⚠️  Warning: Doesn't look like project root${NC}"
    echo -e "   Continue installation here? (Y/n)"
    read -r response </dev/tty
    if [[ -n "$response" && ! "$response" =~ ^[Yy]$ ]]; then
        echo -e "${RED}✗ Installation cancelled${NC}"
        exit 1
    fi
fi

# Function to download from GitHub or use local files
install_from_source() {
    local source_type=$1
    
    if [ "$source_type" = "github" ]; then
        echo -e "${BLUE}→ Downloading files from GitHub...${NC}"
        
        # Clone repository to temp directory
        git clone --depth 1 "$MEMORY_BANK_REPO" "$TEMP_DIR" || {
            echo -e "${RED}✗ Error downloading from GitHub${NC}"
            echo -e "${YELLOW}  Try local installation${NC}"
            exit 1
        }
        
        SOURCE_DIR="$TEMP_DIR"
    else
        # Use local files (assuming script is in the memory bank directory)
        SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        SOURCE_DIR="$SCRIPT_DIR"
        echo -e "${BLUE}→ Using local files from: $SOURCE_DIR${NC}"
    fi
}

# Create directory structure
create_structure() {
    echo ""
    echo -e "${BLUE}→ Creating directory structure...${NC}"
    
    mkdir -p .agent/workflows
    mkdir -p .agent/memory/patterns
    mkdir -p .agent/memory/docs
    
    echo -e "${GREEN}✓ Directories created${NC}"
}

# Copy workflow files
copy_workflows() {
    echo ""
    echo -e "${BLUE}→ Copying workflow files...${NC}"
    
    if [ -f "$SOURCE_DIR/workflows/init-memory.md" ]; then
        cp "$SOURCE_DIR/workflows/init-memory.md" .agent/workflows/
        echo -e "${GREEN}  ✓ init-memory.md${NC}"
    fi
    
    if [ -f "$SOURCE_DIR/workflows/update-memory.md" ]; then
        cp "$SOURCE_DIR/workflows/update-memory.md" .agent/workflows/
        echo -e "${GREEN}  ✓ update-memory.md${NC}"
    fi
}

# Copy documentation files
copy_documentation() {
    echo ""
    echo -e "${BLUE}→ Copying documentation files...${NC}"
    
    # Main rule file
    if [ -f "$SOURCE_DIR/antigravity-memory-bank.md" ]; then
        cp "$SOURCE_DIR/antigravity-memory-bank.md" .
        echo -e "${GREEN}  ✓ antigravity-memory-bank.md${NC}"
    fi
    
    # Documentation files
    if [ -f "$SOURCE_DIR/README.md" ]; then
        cp "$SOURCE_DIR/README.md" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/README.md${NC}"
    fi
    
    if [ -f "$SOURCE_DIR/INSTALLATION.md" ]; then
        cp "$SOURCE_DIR/INSTALLATION.md" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/INSTALLATION.md${NC}"
    fi
    
    if [ -f "$SOURCE_DIR/QUICKSTART.md" ]; then
        cp "$SOURCE_DIR/QUICKSTART.md" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/QUICKSTART.md${NC}"
    fi
    
    if [ -f "$SOURCE_DIR/GITHUB_SETUP.md" ]; then
        cp "$SOURCE_DIR/GITHUB_SETUP.md" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/GITHUB_SETUP.md${NC}"
    fi
    
    if [ -f "$SOURCE_DIR/CONTRIBUTING.md" ]; then
        cp "$SOURCE_DIR/CONTRIBUTING.md" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/CONTRIBUTING.md${NC}"
    fi

    if [ -f "$SOURCE_DIR/LICENSE" ]; then
        cp "$SOURCE_DIR/LICENSE" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/LICENSE${NC}"
    fi

    if [ -f "$SOURCE_DIR/RELEASE_v1.0.0.md" ]; then
        cp "$SOURCE_DIR/RELEASE_v1.0.0.md" .agent/memory/docs/
        echo -e "${GREEN}  ✓ docs/RELEASE_v1.0.0.md${NC}"
    fi
}

# Create initial memory files (optional)
create_initial_files() {
    echo ""
    echo -e "${BLUE}→ Create initial memory files?${NC}"
    echo -e "  (Recommended to use ${YELLOW}/init-memory${NC} workflow for automatic analysis)"
    echo -e "  Create templates now? (Y/n)"
    read -r response </dev/tty
    
    if [[ -z "$response" || "$response" =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}  Copying templates...${NC}"
        
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
        echo -e "${GREEN}  ✓ patterns/common-tasks.md (empty)${NC}"
    fi
}

# Create .gitignore entry (optional)
update_gitignore() {
    echo ""
    echo -e "${BLUE}→ Add .agent/memory/ to .gitignore?${NC}"
    echo -e "  (Recommended to commit memory files for team collaboration)"
    echo -e "  Add to .gitignore? (Y/n)"
    read -r response </dev/tty
    
    if [[ -z "$response" || "$response" =~ ^[Yy]$ ]]; then
        if [ -f ".gitignore" ]; then
            if ! grep -q ".agent/memory/" .gitignore; then
                echo "" >> .gitignore
                echo "# Memory Bank files" >> .gitignore
                echo ".agent/memory/" >> .gitignore
                echo -e "${GREEN}  ✓ .gitignore updated${NC}"
            else
                echo -e "${YELLOW}  ⚠️  Already present in .gitignore${NC}"
            fi
        else
            echo "# Memory Bank files" > .gitignore
            echo ".agent/memory/" >> .gitignore
            echo -e "${GREEN}  ✓ .gitignore created${NC}"
        fi
    fi
}

# Cleanup
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        echo -e "${BLUE}→ Temporary files removed${NC}"
    fi
}

# Main installation
main() {
    echo -e "${BLUE}Choose installation source:${NC}"
    echo -e "  1) GitHub (download latest version)"
    echo -e "  2) Local files (use current directory)"
    echo -n "Your choice (1/2): "
    read -r choice </dev/tty
    
    case $choice in
        1)
            install_from_source "github"
            ;;
        2)
            install_from_source "local"
            ;;
        *)
            echo -e "${RED}✗ Invalid choice${NC}"
            exit 1
            ;;
    esac

    echo ""
    echo -e "${BLUE}Choose installation mode:${NC}"
    echo -e "  1) Standard Antigravity (Recommended)"
    echo -e "  2) Kilocode Compatibility Mode (Legacy/Cross-platform)"
    echo -n "Your choice (1/2): "
    read -r mode_choice </dev/tty

    if [ "$mode_choice" = "2" ]; then
        install_kilo_mode
    else
        # Standard installation steps
        create_structure
        copy_workflows
        copy_documentation
        create_initial_files
        update_gitignore
    fi
    
    # Cleanup temp files
    trap cleanup EXIT
    
    # Success message
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   ✓ Memory Bank installed successfully!   ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}📋 Next steps:${NC}"
    echo ""
    if [ "$mode_choice" = "2" ]; then
         echo -e "  1. Copy rules from ${YELLOW}.kilocode/rules/memory-bank-instructions.md${NC}"
         echo -e "     to your Agent's custom instructions."
    else
         echo -e "  1. Make sure Antigravity rules are configured"
         echo -e "     ${YELLOW}(see antigravity-memory-bank.md)${NC}"
    fi
    echo ""
    echo -e "  2. Initialize memory bank:"
    echo -e "     ${YELLOW}/init-memory${NC}"
    echo ""
    echo -e "  3. Review created files in memory bank folder."
    echo ""
    echo -e "  4. Start working! Memory will load automatically"
    echo ""
    echo -e "${BLUE}📚 Documentation: ${YELLOW}.agent/memory/docs/README.md${NC}"
    echo ""
}

install_kilo_mode() {
    echo ""
    echo -e "${BLUE}→ Installing in Kilocode Compatibility Mode...${NC}"

    # 1. Create structure
    mkdir -p .kilocode/rules/memory-bank
    mkdir -p .agent/workflows 
    
    # 2. Hybrid Rule File
    echo -e "${BLUE}→ Creating hybrid rule file...${NC}"
    
    # Download original rules from source
    echo -e "${BLUE}  Downloading original rules from kilo.ai...${NC}"
    if curl -fsSL -o .kilocode/rules/memory-bank-instructions.md "https://kilo.ai/docs/downloads/memory-bank.md"; then
        echo -e "${GREEN}  ✓ Downloaded original rules${NC}"
    else
        echo -e "${RED}✗ Failed to download rules. Please check your internet connection.${NC}"
        echo -e "${YELLOW}  Creating placeholder rule file...${NC}"
        echo "# Memory Bank Rules" > .kilocode/rules/memory-bank-instructions.md
    fi

    # Append Adapter
    cat >> .kilocode/rules/memory-bank-instructions.md <<EOF

## Antigravity Adapter (Technical)

Technical Note: For Antigravity, the concept of 'Beginning of EVERY task' is equivalent to the \`task_boundary\` tool call with \`Mode: PLANNING\`. When this event occurs, the agent must execute the instructions above to read the Memory Bank files from \`.kilocode/rules/memory-bank/\`.
EOF

    echo -e "${GREEN}  ✓ .kilocode/rules/memory-bank-instructions.md created${NC}"

    # 3. Copy Templates to new names
    echo -e "${BLUE}→ Copying templates...${NC}"
    if [ -d "$SOURCE_DIR/templates" ]; then
        # Map to Kilocode names
        cp "$SOURCE_DIR/templates/project-brief.md" .kilocode/rules/memory-bank/brief.md 2>/dev/null && echo -e "${GREEN}  ✓ brief.md${NC}"
        cp "$SOURCE_DIR/templates/product-vision.md" .kilocode/rules/memory-bank/product.md 2>/dev/null && echo -e "${GREEN}  ✓ product.md${NC}"
        cp "$SOURCE_DIR/templates/context.md" .kilocode/rules/memory-bank/context.md 2>/dev/null && echo -e "${GREEN}  ✓ context.md${NC}"
        cp "$SOURCE_DIR/templates/architecture.md" .kilocode/rules/memory-bank/architecture.md 2>/dev/null && echo -e "${GREEN}  ✓ architecture.md${NC}"
        cp "$SOURCE_DIR/templates/tech-stack.md" .kilocode/rules/memory-bank/tech.md 2>/dev/null && echo -e "${GREEN}  ✓ tech.md${NC}"
        cp "$SOURCE_DIR/templates/common-tasks.md" .kilocode/rules/memory-bank/tasks.md 2>/dev/null && echo -e "${GREEN}  ✓ tasks.md${NC}"
    fi

    # 4. Copy Workflows (Standard Antigravity location)
    cp "$SOURCE_DIR/workflows/"*.md .agent/workflows/ 2>/dev/null
    echo -e "${GREEN}  ✓ Workflows installed in .agent/workflows/${NC}"
    
    # Update .gitignore for .kilocode
    echo ""
    echo -e "${BLUE}→ Updating .gitignore...${NC}"
    if [ -f ".gitignore" ]; then
        if ! grep -q ".kilocode/" .gitignore; then
             echo "" >> .gitignore
             echo "# Kilocode Memory Bank" >> .gitignore
             echo ".kilocode/" >> .gitignore
             echo -e "${GREEN}  ✓ Added .kilocode/ to .gitignore${NC}"
        fi
    else
        echo ".kilocode/" > .gitignore
        echo -e "${GREEN}  ✓ Created .gitignore${NC}"
    fi
}

# Run main
main
