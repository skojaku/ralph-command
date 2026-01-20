# Instruction for creating ralph loop workflow

## What is Ralph loop?

The "Ralph Wiggum" is an autonomous agent pattern where Claude Code repeatedly executes a prompt until a completion condition is met. The key components are:

1. prd.json: A structured task list containing user stories with:
    - Unique IDs and titles
    - Numbered acceptance criteria
    - Priority ordering
    - Passes boolean to track completion

2. prompt.md: Agent instructions that tell Claude to:
  - Find the highest-priority story where passes: false
  - Execute each acceptance criterion exactly
  - Validate outputs
  - Commit changes with standardized format
  - Mark the story as complete
  - Log learnings to progress.txt

3. progress.txt: An intermediate file that logs the progress of task completions along with learning during task execution.

4. ralph.sh: A bash loop that pipes the prompt to Claude Code repeatedly. 


## Task 

1. Download the ralph loop starter files from by running the following command:

```bash
curl -O https://raw.githubusercontent.com/your-repo/ralph-loop/main/ral
