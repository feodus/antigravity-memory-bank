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

### 4. Create Vision Files

**Context**: Generate content with Why this project exists, problems solved, user goals.

**Antigravity Mode**: Create `.agent/memory/product-vision.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/product.md`

### 5. Create Context File

**Context**: Generate content with Current work focus, recent changes, next steps.

**Antigravity Mode**: Create `.agent/memory/context.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/context.md`

### 6. Create Architecture File

**Context**: Generate content with System architecture, design patterns, component relationships.

**Antigravity Mode**: Create `.agent/memory/architecture.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/architecture.md`

### 7. Create Tech Stack File

**Context**: Generate content with Technologies, frameworks, development setup.

**Antigravity Mode**: Create `.agent/memory/tech-stack.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/tech.md`

### 8. Create Tasks File

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

### 9. Create Brief File

**CRITICAL**: This is the LAST file to create. All other memory bank files are already created and can be used as references.

**Step A: Read and Evaluate README.md**

Find and read `README.md` in the project root.

Evaluate if README contains **useful** information or is **standard/empty**:

**Useful README indicators**:

- Contains meaningful project description (not generic "Hello World")
- Explains what the project does and why
- Lists features, goals, or use cases
- Describes technology stack or architecture
- Provides domain context or unique characteristics
- Has substantial content (more than just setup instructions)

**Standard/Empty README indicators**:

- Only contains project title
- Is a GitHub/GitLab template
- Only has installation/build commands without context
- Less than 3-4 sentences of actual description
- Generic boilerplate text

**Step B: Create Brief Based on Source**

**CRITICAL**: You MUST run `git config user.name` to get the current user's name and use it for the "Created by" field in the brief.

**Antigravity Mode**: Create `.agent/memory/project-brief.md`
**Kilocode Mode**: Create `.kilocode/rules/memory-bank/brief.md`

**If README is USEFUL**:

1. Use README.md content as the primary source
2. Adapt its structure to match brief template format:
   - Project Overview → extract from README intro
   - Core Requirements → extract from features/requirements sections
   - Main Goals → extract from goals/objectives sections
   - Success Criteria → derive from stated goals
   - Scope Boundaries → extract from roadmap/scope sections
   - Key Stakeholders → extract from authors/contributors sections
3. Enhance with information from already created files:
   - Cross-reference with `product.md` for consistency
   - Add architecture highlights from `architecture.md` if missing
   - Include tech stack summary from `tech.md` if missing
4. Preserve original README tone and terminology
5. Add note: "Based on project README.md"

**If README is STANDARD/EMPTY**:

1. Use already created memory bank files as foundation:
   - `product.md` → for product vision and goals
   - `architecture.md` → for system design and scope
   - `tech.md` → for technology context
   - `context.md` → for current state
2. Synthesize comprehensive brief from these sources
3. Use project structure analysis from Step 2
4. Keep it factual and based on observed code
5. Add note: "Created from comprehensive project analysis"

**Brief Structure** (use template from `templates/project-brief.md`):

```markdown
# Project Brief

> **Created by**: [Git User Name from git config]  
> **Date**: [Current Date YYYY-MM-DD]  
> **Last updated**: [Current Date YYYY-MM-DD]

## Project Overview

[Description]

## Core Requirements

[List]

## Main Goals

[List]

## Success Criteria

[Checklist]

## Scope Boundaries

**In Scope**: [List]
**Out of Scope**: [List]

## Key Stakeholders

[List]

---

**Note**: [Source note - either "Based on project README.md" or "Created from comprehensive project analysis"]
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
