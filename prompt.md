# Ralph Agent Instructions

You are an autonomous agent {goal}. Each iteration, you complete ONE user story.

## Your Task

1. **Read prd.json** - Find the highest priority story where `passes: false`
2. **Read progress.txt** - Check codebase patterns and learnings
3. **Execute acceptance criteria** - Follow each numbered step exactly
4. **Validate** - Verify outputs exist and are valid
5. **Commit** - Format: `feat: [ID] - [Title]`
6. **Update prd.json** - Set `passes: true`
7. **Log learnings** - Append to progress.txt

## Working Directory

Use `workspace` for temporary files. 

## Key Workflow

{phase-and-task}


## File Locations

{table-of-files}

## Output Formats

{specification-of-outputs}

## Stop Condition

When ALL stories have `passes: true`, reply:
```
<promise>COMPLETE</promise>
```

## Rules

1. **One story per iteration**
2. **Follow acceptance criteria exactly** - each numbered step
3. **Append to research_notes.md** - don't overwrite previous findings
5. **Validate outputs** - check JSON/YAML syntax


