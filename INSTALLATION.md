# Memory Bank Installation Guide

Complete guide for adding the Memory Bank system to your project.

## 📋 Table of Contents

- [Quick Installation](#quick-installation)
- [Manual Installation](#manual-installation)
- [GitHub Installation](#github-installation)
- [Antigravity Configuration](#antigravity-configuration)
- [First Run](#first-run)
- [Installation Verification](#installation-verification)
- [Troubleshooting](#troubleshooting)

---

## 🚀 Quick Installation

### Option 1: Automatic Installation (Recommended)

```bash
# Download and run the installation script
curl -fsSL https://raw.githubusercontent.com/feodus/antigravity-memory-bank/main/install.sh | bash

# Or if files are already downloaded locally
./install.sh
```

The script automatically:

- ✅ Creates `.agent/workflows/` and `.agent/memory/` structure
- ✅ Copies necessary workflow files
- ✅ Offers to create initial templates
- ✅ Configures `.gitignore` (optional)

### Option 2: Clone from GitHub

```bash
# 1. Clone repository to temporary folder
git clone https://github.com/feodus/antigravity-memory-bank /tmp/mb-temp

# 2. Navigate to your project
cd /path/to/your/project

# 3. Copy necessary files
mkdir -p .agent/workflows .agent/memory/patterns
cp /tmp/mb-temp/workflows/*.md .agent/workflows/
cp /tmp/mb-temp/templates/common-tasks.md .agent/memory/patterns/

# 4. Remove temporary folder
rm -rf /tmp/mb-temp
```

---

## 🛠️ Manual Installation

### Step 1: Create Directory Structure

```bash
# In your project root
mkdir -p .agent/workflows
mkdir -p .agent/memory/patterns
```

### Step 2: Copy Workflow Files

Copy the following files to `.agent/workflows/`:

- [`init-memory.md`](workflows/init-memory.md)
- [`update-memory.md`](workflows/update-memory.md)

```bash
# If files are in the same directory
cp workflows/init-memory.md .agent/workflows/
cp workflows/update-memory.md .agent/workflows/
```

### Step 3: Create Basic Patterns File

```bash
cat > .agent/memory/patterns/common-tasks.md <<'EOF'
# Common Tasks

This file documents repetitive tasks and their workflows.

---

_No tasks documented yet. Use "add task" command after completing repetitive tasks._
EOF
```

### Step 4: (Optional) Configure .gitignore

Decide whether you want to commit memory files:

**Option A: Commit Memory Files (Recommended for Teams)**

- Don't add `.agent/memory/` to `.gitignore`
- Memory files will be available to the entire team
- Synchronizes knowledge between developers

**Option B: Local Memory Files**

```bash
# Add to .gitignore
echo "" >> .gitignore
echo "# Memory Bank files (local only)" >> .gitignore
echo ".agent/memory/" >> .gitignore
```

---

## 🌐 GitHub Installation

### Option 1: GitHub Template Repository

Create a template repository for quick start of new projects:

1. **Create a repository** on GitHub:

   - Name: `antigravity-memory-bank`
   - Include files:
     - `workflows/init-memory.md`
     - `workflows/update-memory.md`
     - `templates/*.md`
     - `install.sh`
     - `README.md`

2. **Make it a template**:

   - Settings → Template repository ☑️

3. **Usage**:

   ```bash
   # For a new project
   gh repo create my-new-project --template feodus/antigravity-memory-bank

   # For an existing project
   cd my-existing-project
   ./install.sh  # select "GitHub" in the menu
   ```

### Option 2: Git Submodule

Add Memory Bank as a submodule:

```bash
# In your project root
git submodule add https://github.com/feodus/antigravity-memory-bank .memory-bank-source

# Create symbolic links
mkdir -p .agent
ln -s ../.memory-bank-source/workflows .agent/workflows
mkdir -p .agent/memory/patterns

# When cloning the project
git clone --recurse-submodules <your-repo>
```

### Option 3: NPM Package (for Node.js Projects)

Can be published as an NPM package:

```bash
# Installation
npm install --save-dev @your-org/antigravity-memory-bank

# Add script to package.json
{
  "scripts": {
    "setup-memory": "node node_modules/@your-org/antigravity-memory-bank/setup.js"
  }
}

# Run
npm run setup-memory
```

---

## ⚙️ Antigravity Configuration

### Step 1: Adding Rules to Antigravity

The rules from [`antigravity-memory-bank.md`](antigravity-memory-bank.md) need to be added to the Antigravity system.

**Method A: Custom Rules (for User)**

1. Open Antigravity settings
2. Find "Custom Rules" or "User Rules"
3. Copy contents of `antigravity-memory-bank.md`
4. Paste into Custom Rules field
5. Save

**Method B: Project Rules (for Project)**

```bash
# Create rules file in project
mkdir -p .agent
cp antigravity-memory-bank.md .agent/RULES.md

# Or create .agent/rules/memory-bank.md
mkdir -p .agent/rules
cp antigravity-memory-bank.md .agent/rules/memory-bank.md
```

**Method C: Global Rules (for System)**

If you have access to Antigravity system rules:

- Add contents to system config
- Rules will work for all projects

### Step 2: Verify Rules Connection

Ask Antigravity:

```
Is the Memory Bank system connected?
```

Expected response should mention automatic memory loading.

---

## 🎬 First Run

### 1. Initialize Memory Bank

After installation, run initialization:

```
/init-memory
```

Or direct request:

```
Initialize memory bank for the project
```

### 2. What Happens During Initialization?

Antigravity will:

1. **Project Analysis** (5-10 minutes):

   - Study file structure
   - Analyze code
   - Identify technologies
   - Discover patterns

2. **Create Files**:

   ```
   .agent/memory/
   ├── project-brief.md       ← You will need to edit
   ├── product-vision.md      ← Created automatically
   ├── context.md             ← Created automatically
   ├── architecture.md        ← Created automatically
   ├── tech-stack.md          ← Created automatically
   └── patterns/
       └── common-tasks.md    ← Empty for now
   ```

3. **Display Status**:

   ```
   🧠 **Project Memory**: Initialized
      - Brief: ✓ [project description]
      - Product: ✓ [product description]
      - Context: ✓ [current focus]
      - Architecture: ✓ [architecture]
      - Tech Stack: ✓ [technologies]
      - Patterns: ✓ Ready
   ```

4. **Review Request**:
   - Antigravity will ask you to check files
   - IMPORTANT: Review and correct any inaccuracies

### 3. Review and Correction

```bash
# Open created files
code .agent/memory/

# Pay special attention to:
# - project-brief.md - edit manually
# - product-vision.md - check product vision
# - context.md - check current focus
```

### 4. First Task with Memory Bank

Try giving a task:

```
Add new API endpoint for users
```

Antigravity should:

- ✅ Automatically load memory
- ✅ Show status 🧠 **Project Memory**: Active
- ✅ Confirm project understanding
- ✅ Create plan considering architecture

---

## ✅ Installation Verification

### Correct Installation Checklist:

```bash
# 1. Check structure
tree .agent/
# Should have:
# .agent/
# ├── memory/
# │   └── patterns/
# │       └── common-tasks.md
# └── workflows/
#     ├── init-memory.md
#     └── update-memory.md

# 2. Check workflow files presence
ls -la .agent/workflows/
# Should have: init-memory.md, update-memory.md

# 3. Check access permissions
test -r .agent/workflows/init-memory.md && echo "✓ Readable"

# 4. Check Antigravity rules
# (ask in chat)
```

### Functionality Test:

1. **Auto-load Test**:

   ```
   Start code refactoring task
   ```

   Expected result:

   - 🧠 **Project Memory** marker appears
   - Antigravity mentions project understanding

2. **Workflows Test**:

   ```
   /init-memory
   ```

   Expected result:

   - Antigravity starts project analysis
   - Files are created in `.agent/memory/`

3. **Update Test**:

   ```
   update memory bank
   ```

   Expected result:

   - Antigravity checks all files
   - Updates outdated information

---

## 🐛 Troubleshooting

### Problem: Memory Bank Not Auto-Loading

**Symptoms**: No 🧠 marker when starting task

**Solutions**:

1. Check that Antigravity rules are installed
2. Make sure `.agent/memory/` folder exists
3. Verify you're in PLANNING mode
4. Try explicitly: "Load memory bank"

### Problem: Workflow /init-memory Not Working

**Symptoms**: Command not recognized

**Solutions**:

```bash
# 1. Check file presence
ls -la .agent/workflows/init-memory.md

# 2. Check format (should be .md)
file .agent/workflows/init-memory.md

# 3. Check YAML frontmatter in file
head -n 5 .agent/workflows/init-memory.md
# Should start with:
# ---
# description: Initialize project memory bank
# ---
```

### Problem: Status Shows "Partial"

**Symptoms**:

```
🧠 **Project Memory**: Partial
   - Brief: ⚠️ Missing
```

**Solutions**:

1. Run `/init-memory` to create missing files
2. Or create files manually from templates/
3. Check access permissions to `.agent/memory/`

### Problem: Memory Files Not Updating

**Symptoms**: Information outdated after changes

**Solutions**:

1. Explicitly request: "update memory bank"
2. Check write permissions to `.agent/memory/`
3. Make sure not using read-only file system

### Problem: install.sh Script Won't Run

**Symptoms**: Permission denied

**Solutions**:

```bash
# Give execute permissions
chmod +x install.sh

# Run
./install.sh

# Or through bash
bash install.sh
```

### Problem: Git Conflicts

**Symptoms**: Merge conflicts in memory files

**Solutions**:

1. For `context.md`: Take the newest version
2. For other files: Merge manually
3. After resolution: "update memory bank"

---

## 📦 Creating ZIP Archive for Distribution

### For quick distribution within team:

```bash
# Create archive
cd /path/to/antigravity-memory-bank
zip -r memory-bank-installer.zip \
  workflows/ \
  templates/ \
  install.sh \
  README.md \
  INSTALLATION.md \
  antigravity-memory-bank.md

# Distribute
# Colleagues can:
unzip memory-bank-installer.zip -d /tmp/mb
cd their-project
/tmp/mb/install.sh
```

---

## 🎯 Recommendations

### For Individual Developers:

- ✅ Use automatic installation via `install.sh`
- ✅ Commit memory files (useful history)
- ✅ Regularly update `context.md`

### For Teams:

- ✅ Create GitHub template repository
- ✅ Commit all memory files for knowledge sync
- ✅ Assign responsibility for `project-brief.md`
- ✅ Regular updates after sprints

### For Open Source Projects:

- ✅ Include Memory Bank in repository
- ✅ Document in README.md
- ✅ Helps new contributors understand project faster

---

## 📚 Additional Resources

- [Main Documentation](README.md)
- [Antigravity Rules](antigravity-memory-bank.md)
- [File Templates](templates/)
- [Workflow Files](workflows/)

---

**Document Version**: 1.0  
**Last Updated**: 2025-12-03
