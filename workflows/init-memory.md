---
description: Initialize project memory bank
---

# Initialize Project Memory Bank

Creates the project memory bank structure in `.agent/memory/` with comprehensive project analysis.

**CRITICAL**: Initialization is extremely important - it defines all future effectiveness. Be thorough!

## Steps

### 1. Comprehensive Project Analysis

Analyze the entire project:

- **Source code**: All files, their relationships, patterns used
- **Configuration**: Build system, package.json, tsconfig, etc.
- **Structure**: Project organization, folder hierarchy
- **Documentation**: README, comments, existing docs
- **Dependencies**: NPM packages, external services
- **Testing**: Test frameworks, coverage, patterns

### 2. Create Folder Structure

```bash
mkdir -p .agent/memory/patterns
```

### 3. Create project-brief.md

Create `.agent/memory/project-brief.md` with:

- Project name and purpose
- Core requirements
- Main goals and success criteria
- Key stakeholders (if applicable)
- Project scope boundaries

### 4. Create product-vision.md

Create `.agent/memory/product-vision.md` with:

- Why this project exists
- What problems it solves
- Target users/audience
- How it should work (high-level)
- User experience goals
- Success metrics

### 5. Create context.md

Create `.agent/memory/context.md` with:

- Current work focus area
- Recent significant changes
- Next planned steps
- Active branches/features (if applicable)

**Keep this SHORT and FACTUAL** - no speculation!

### 6. Create architecture.md

Create `.agent/memory/architecture.md` with:

- System architecture overview (consider using mermaid diagrams)
- Key components and their file paths
- Design patterns in use (e.g., MVC, microservices)
- Component relationships and data flow
- Critical implementation details
- Key directories and their purposes

### 7. Create tech-stack.md

Create `.agent/memory/tech-stack.md` with:

- Programming languages and versions
- Frameworks and major libraries
- Development tools
- Build system and tooling
- Technical constraints
- Testing frameworks
- Deployment environment
- External services/APIs

### 8. Create patterns/common-tasks.md

Create `.agent/memory/patterns/common-tasks.md`:

```markdown
# Common Tasks

This file documents repetitive tasks and their workflows.

---

_No tasks documented yet. Use "add task" command after completing repetitive tasks._
```

### 9. Display Memory Status

Show memory status marker:

```
🧠 **Project Memory**: Initialized
   - Brief: ✓ [project summary]
   - Product: ✓ [product description]
   - Context: ✓ [current focus]
   - Architecture: ✓ [architectural pattern]
   - Tech Stack: ✓ [main technologies]
   - Patterns: ✓ Ready for tasks
```

### 10. Request User Review

Provide summary of findings and request review:

**Example**:

> "Memory bank initialized! I've analyzed the project and documented:
>
> - E-commerce platform built with Next.js
> - Microservices architecture with PostgreSQL
> - Currently focused on payment integration
>
> Please review the files in `.agent/memory/` and correct any misunderstandings or add missing information. This will significantly improve our future interactions."

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
