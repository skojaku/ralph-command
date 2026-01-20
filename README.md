# Ralph - Autonomous Development Agent

Ralph is an autonomous agent system that iteratively executes user stories from a Product Requirements Document (PRD), making commits as it completes each task.

## Overview

Ralph operates in a loop, reading user stories from `prd.json`, executing their acceptance criteria, validating the results, and committing changes. It continues until all stories are marked as complete or the maximum number of iterations is reached.

## How It Works

1. **Reads** the highest priority incomplete user story from `prd.json`
2. **Executes** each acceptance criterion in sequence
3. **Validates** that outputs exist and are correct
4. **Commits** changes with a standardized format
5. **Updates** the PRD to mark the story as complete
6. **Logs** learnings and patterns to progress.txt
7. **Repeats** until all stories pass or max iterations reached

## Files

- **`ralph.sh`** - Main orchestration script that runs the agent loop
- **`prd.json`** - Product Requirements Document containing user stories
- **`prompt.md`** - Agent instructions template with placeholders for context

## Usage

### Basic Usage

```bash
./ralph.sh
```

This runs Ralph with the default maximum of 10 iterations.

### Custom Iteration Limit

```bash
./ralph.sh 20
```

Run Ralph with a custom maximum iteration count.

## Requirements

- **Bash** - Shell script execution
- **[amp](https://github.com/anthropics/amp)** - Anthropic Model Protocol CLI for running Claude

## PRD Format

The `prd.json` file contains structured user stories:

```json
{
  "branchName": "ralph/feature",
  "userStories": [
    {
      "id": "US-001",
      "title": "Add login form",
      "acceptanceCriteria": [
        "Email/password fields",
        "Validates email format",
        "typecheck passes"
      ],
      "priority": 1,
      "passes": false,
      "notes": ""
    }
  ]
}
```

### User Story Fields

- **`id`** - Unique identifier (e.g., US-001)
- **`title`** - Brief description of the feature
- **`acceptanceCriteria`** - Array of requirements that must be met
- **`priority`** - Execution order (1 = highest priority)
- **`passes`** - Boolean indicating completion status
- **`notes`** - Optional field for additional context

## Agent Workflow

Ralph follows this workflow for each iteration:

1. Read `prd.json` to find the highest priority story where `passes: false`
2. Check `progress.txt` for codebase patterns and previous learnings
3. Execute each acceptance criterion exactly as specified
4. Validate that all outputs exist and are valid
5. Commit with format: `feat: [ID] - [Title]`
6. Update `prd.json` to set `passes: true` for the completed story
7. Append learnings to `progress.txt`

## Completion

Ralph completes when:

- **Success**: All user stories have `passes: true`, returns: `<promise>COMPLETE</promise>`
- **Timeout**: Maximum iterations reached without completing all stories

## Output

Ralph provides real-time feedback:

```
🚀 Starting Ralph
═══ Iteration 1 ═══
[agent output...]
═══ Iteration 2 ═══
[agent output...]
✅ Done!
```

## Tips

- Keep acceptance criteria specific and actionable
- Use priority to control execution order
- Review `progress.txt` to see patterns and learnings
- Adjust max iterations based on task complexity
- Each story should be independently testable

## License

See project license file for details.
