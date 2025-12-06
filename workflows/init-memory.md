---
description: Initialize project memory bank
---

# Initialize Project Memory Bank

Creates the project memory bank structure with comprehensive project analysis.

**CRITICAL**: Initialization is extremely important - it defines all future effectiveness. Be thorough!

## Steps

### 1. Determine Memory Bank Mode

Check if `.kilocode/rules/memory-bank/` exists.

- **If detected**: Use **Kilocode Mode** (Target: `.kilocode/rules/memory-bank/`)
- **Else**: Use **Antigravity Mode** (Target: `.agent/memory/`)

### 2. Comprehensive Project Analysis

Analyze the entire project:

- **Source code**: All files, their relationships, patterns used
- **Configuration**: Build system, package.json, tsconfig, etc.
- **Structure**: Project organization, folder hierarchy
- **Documentation**: README, comments, existing docs
- **Dependencies**: NPM packages, external services
- **Testing**: Test frameworks, coverage, patterns

### 3. Create Folder Structure

**Antigravity Mode**:

```bash
mkdir -p .agent/memory/patterns
```

**Kilocode Mode**:

```bash
mkdir -p .kilocode/rules/memory-bank
```

### 4. Create Foundation Files

**Context**: Generate content with Project name, purpose, core requirements.

**Antigravity Mode**: Create `.agent/memory/project-brief.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/brief.md`

### 5. Create Vision Files

**Context**: Generate content with Why this project exists, problems solved, user goals.

**Antigravity Mode**: Create `.agent/memory/product-vision.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/product.md`

### 6. Create Context File

**Context**: Generate content with Current work focus, recent changes, next steps.

**Antigravity Mode**: Create `.agent/memory/context.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/context.md`

### 7. Create Architecture File

**Context**: Generate content with System architecture, design patterns, component relationships.

**Antigravity Mode**: Create `.agent/memory/architecture.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/architecture.md`

### 8. Create Tech Stack File

**Context**: Generate content with Technologies, frameworks, development setup.

**Antigravity Mode**: Create `.agent/memory/tech-stack.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/tech.md`

### 9. Create Tasks File

**Context**: Initialize empty tasks file.

**Antigravity Mode**: `.agent/memory/patterns/common-tasks.md`
**Kilocode Mode**: `.kilocode/rules/memory-bank/tasks.md`

Content:

```markdown
# Common Tasks

This file documents repetitive tasks and their workflows.

---

_No tasks documented yet. Use "add task" command after completing repetitive tasks._
```

### 10. Display Memory Status

Show memory status marker (adjust filenames in display based on mode):

```
🧠 **Project Memory**: Initialized
   - Brief: ✓ [project summary]
   - Product: ✓ [product description]
   - Context: ✓ [current focus]
   - Architecture: ✓ [architectural pattern]
   - Tech Stack: ✓ [main technologies]
   - Patterns: ✓ Ready for tasks
```

### 11. Request User Review

Provide summary of findings and request review:

**Example**:

> "Memory bank initialized! I've analyzed the project and documented:
>
> - E-commerce platform built with Next.js
> - Microservices architecture with PostgreSQL
> - Currently focused on payment integration
>
> Please review the files in the memory bank folder and correct any misunderstandings or add missing information. This will significantly improve our future interactions."

## Post-Initialization Checklist

User should verify:

- [ ] Product description is accurate
- [ ] Technology stack is complete
- [ ] Architecture understanding is correct
- [ ] No major components or features missed
- [ ] Current context reflects actual state

## Tips for Quality Initialization

1. **Be thorough**: Spend extra time analyzing - this pays off long-term
2. **Use examples**: Include code snippets showing key patterns
3. **Be specific**: Use actual file paths, not generic descriptions
4. **Link files**: Use markdown file links where relevant
5. **Stay factual**: Avoid assumptions, document what you observe
6. **Think long-term**: Document information your future self needs

## Workflow Integration

After initialization, memory bank will auto-load when entering PLANNING mode for any new task.
