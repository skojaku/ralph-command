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
curl -O https://raw.githubusercontent.com/skojaku/ralph-command/refs/heads/main/prompt.md
curl -O https://raw.githubusercontent.com/skojaku/ralph-command/refs/heads/main/prd.json
curl -O https://raw.githubusercontent.com/skojaku/ralph-command/refs/heads/main/ralph.sh
```

2. Identify the tasks and modify the prd.json. Each task must be atomic and have clear acceptance criteria. If the task implemnts a new feature, create a test task that implements test scripts for each task of new feature. The test scripts must be tests folder if not exists. 

3. Customize the prompt.md to fit your project needs. You can modify the instructions to better suit your workflow or project requirements. Make sure to keep the structure intact and key instructions (one task at a time, validate outputs, commit changes, etc.)

4. Ask the following questions to the user:
- Which folder to save the deliverables to (where should the outcome of the ralph loop be placed?)
- What file types do you want (.py scripts, jupyter notebooks, or something else)?
- Any other questions you can think of to ceate a loop. 

5. Present the plan before making the file for approval from the user.
