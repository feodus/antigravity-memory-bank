---
description: Update project memory bank
---

# Update Memory Bank

Updates the project memory bank to reflect the current state of the project.

**When to use**:

- After significant changes
- When discovering new patterns
- Before major refactoring
- When context needs clarification

## Steps

### 1. Determine Memory Bank Mode

Check if `.kilocode/rules/memory-bank/` exists.

- **If detected**: Use **Kilocode Mode** (Target: `.kilocode/rules/memory-bank/`)
- **Else**: Use **Antigravity Mode** (Target: `.agent/memory/`)

### 2. Review Current State

Analyze the project structure and recent changes:

- What has changed since last update?
- Are there new dependencies?
- Have architectural patterns evolved?
- Is the current context accurate?

### 3. Update Foundation Files (If Needed)

Check for changes generally.

**Modes**:

- **Brief**: `project-brief.md` (AG) / `brief.md` (Kilo)
- **Product**: `product-vision.md` (AG) / `product.md` (Kilo)
- **Tech**: `tech-stack.md` (AG) / `tech.md` (Kilo)
- **Architecture**: `architecture.md` (Both)

### 4. Update Context File (Required)

**Target**: `context.md` (Both modes)

Update with:

- Current work focus
- Recent changes implemented
- Next planned steps
- Active branches

**Keep this SHORT and FACTUAL.**

### 5. Update Patterns (If New Patterns Found)

**Target**: `patterns/common-tasks.md` (AG) / `tasks.md` (Kilo)

- Document newly discovered repetitive tasks
- Refine existing workflows based on experience

### 6. Display Updated Status

Show updated memory status marker:

```
🧠 **Project Memory**: Updated
   - Brief: ✓ [status]
   - Product: ✓ [status]
   - Context: ✓ [Updated focus]
   - Architecture: ✓ [status]
   - Tech Stack: ✓ [status]
   - Patterns: ✓ [count]
```

### 7. Summary

Provide a brief summary of what was updated:

> "I've updated the memory bank to reflect the new payment integration changes. Context now focuses on the testing phase, and I've added a new pattern for creating API endpoints."
