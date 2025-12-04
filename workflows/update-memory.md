---
description: Update project memory bank
---

# Update Project Memory Bank

Updates memory bank when significant changes occur or user explicitly requests.

## When to Update

Trigger this workflow when:

- User explicitly says: **"update memory bank"**
- After implementing significant features/changes
- Discovering new project patterns or architecture changes
- Before major refactoring
- After adding new dependencies or technologies
- When current context has shifted significantly

**Don't update for minor changes** - focus on significant updates only.

## Steps

### 1. Review ALL Memory Files

Read and review every file in `.agent/memory/`:

- `project-brief.md`
- `product-vision.md`
- `context.md` ⭐ (always needs review)
- `architecture.md`
- `tech-stack.md`
- `patterns/common-tasks.md`
- Any additional files

### 2. Check project-brief.md

**Usually no changes needed** - this is maintained manually by developer.

If scope or core requirements have fundamentally changed:

- **DON'T edit directly**
- **Suggest to user**: "The project scope seems to have changed. Consider updating project-brief.md to reflect [specific changes]."

### 3. Update product-vision.md

Check if vision has evolved:

- [ ] Has the target audience changed?
- [ ] Are there new problems being solved?
- [ ] Have user experience goals shifted?
- [ ] Are there new success metrics?

Update if needed.

### 4. Update context.md ⭐ ALWAYS CHECK

**This file SHOULD be updated most frequently.**

Update to reflect:

- **Current focus**: What are we working on RIGHT NOW?
- **Recent changes**: What significant changes just happened?
- **Next steps**: What's planned next?

Keep it:

- SHORT (5-10 lines max)
- FACTUAL (no speculation)
- CURRENT (reflect actual state)

**Example**:

```markdown
# Current Context

**Current Focus**: Implementing Stripe payment integration for checkout flow

**Recent Changes** (as of 2025-12-03):

- Added payment provider abstraction layer
- Integrated Stripe SDK v12.0
- Created payment webhook handlers

**Next Steps**:

- Test payment flow end-to-end
- Add error handling for failed payments
- Implement refund functionality
```

### 5. Update architecture.md

Check for architectural changes:

- [ ] New components or services added?
- [ ] New design patterns introduced?
- [ ] Component relationships changed?
- [ ] New critical paths or data flows?
- [ ] Directory structure changes?

Update diagrams and descriptions if needed.

### 6. Update tech-stack.md

Check for technology changes:

- [ ] New dependencies added?
- [ ] Version upgrades (major versions)?
- [ ] New tools or frameworks?
- [ ] New external services/APIs?
- [ ] Build system changes?
- [ ] Deployment environment changes?

Update list and configurations.

### 7. Update patterns/common-tasks.md

Check for new patterns:

- [ ] Did we just complete a task that might repeat?
- [ ] Did we discover a better way to do something?
- [ ] Are there new repetitive workflows?

If yes, document the pattern (see "add task" workflow).

### 8. Review Additional Files

If custom files exist in `.agent/memory/`, review and update them as needed.

### 9. Display Updated Memory Status

Show updated status:

```
🧠 **Project Memory**: Updated
   - Brief: ✓ [summary]
   - Product: ✓ [summary]
   - Context: ✓ [NEW current focus]
   - Architecture: ✓ [summary, note if updated]
   - Tech Stack: ✓ [summary, note if updated]
   - Patterns: ✓ [X tasks, note if new ones added]
```

### 10. Summarize Changes

Provide concise summary of what was updated:

**Example**:

> "Memory bank updated:
>
> - ✏️ context.md: Updated to reflect payment integration work
> - ✏️ tech-stack.md: Added Stripe SDK v12.0
> - ✏️ architecture.md: Documented new payment provider layer
> - ✅ Other files: No changes needed"

## Special Cases

### User says "update memory bank" explicitly

When user explicitly requests update:

- **Review ALL files** even if you think some don't need updates
- Be extra thorough
- Look for subtle changes that might have been missed

### Adding context from specific source

If user says: "update memory bank using information from @/path/to/file"

- Focus special attention on that source
- Extract relevant patterns and information
- Update appropriate memory files with insights

### No updates needed

If after review no updates are needed:

- Still display memory status
- Confirm: "Memory bank reviewed - all files are current, no updates needed."

## Update Frequency Guidelines

- **context.md**: Update after every significant task
- **tech-stack.md**: Update when dependencies change
- **architecture.md**: Update when components/patterns change
- **product-vision.md**: Rarely - only when vision evolves
- **project-brief.md**: User maintains manually
- **patterns/common-tasks.md**: Update when new patterns emerge

## Quality Checklist

After update, verify:

- [ ] context.md reflects CURRENT state (not outdated)
- [ ] All new dependencies documented
- [ ] No contradictions between files
- [ ] File paths are accurate
- [ ] Information is factual, not speculative
- [ ] Brief and concise (no bloat)

## Integration with Task Flow

Memory bank updates typically happen:

- End of VERIFICATION mode (after significant features)
- When suggested by agent after meaningful changes
- When explicitly requested by user
