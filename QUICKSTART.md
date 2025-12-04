# Quick Start: Memory Bank Installation

## 🎯 Three Installation Methods

### 1️⃣ Automatic Installation (Easiest)

```bash
# Download repository
git clone https://github.com/feodus/antigravity-memory-bank
cd antigravity-memory-bank

# Navigate to your project
cd /path/to/your/project

# Run installer
/path/to/antigravity-memory-bank/install.sh
```

### 2️⃣ Curl Installation (One-Liner)

```bash
# From your project
curl -fsSL https://raw.githubusercontent.com/feodus/antigravity-memory-bank/main/install.sh | bash
```

### 3️⃣ Manual Installation (Maximum Control)

```bash
# In your project
mkdir -p .agent/workflows .agent/memory/patterns

# Download workflow files
curl -o .agent/workflows/init-memory.md https://raw.githubusercontent.com/.../init-memory.md
curl -o .agent/workflows/update-memory.md https://raw.githubusercontent.com/.../update-memory.md

# Create basic file
echo "# Common Tasks\n\n_No tasks yet._" > .agent/memory/patterns/common-tasks.md
```

---

## ⚙️ Antigravity Configuration

**Add rules to Antigravity:**

1. Open `antigravity-memory-bank.md`
2. Copy all contents
3. Paste into your Antigravity Custom Rules
4. Save

---

## 🚀 First Run

```
/init-memory
```

Antigravity will analyze the project and create memory bank.

---

## ✅ Done!

Now with each new task you will see:

```
🧠 **Project Memory**: Active
   - Brief: ✓ [your project]
   - Product: ✓ [description]
   - Context: ✓ [current focus]
   ...
```

---

📚 **Full Documentation**: [INSTALLATION.md](INSTALLATION.md)
