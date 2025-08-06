# Claude Code Agent System - Slash Command

This directory contains the single Claude Code slash command for the agent system.

## Available Command

- **`/maintenance`** - Complete system maintenance workflow (30-60 min, $2-4)

## Usage

Simply type the slash command in Claude Code:
```bash
/maintenance
```

This executes the complete system maintenance workflow using the existing 66+ agent ecosystem with system-evaluator validation to prevent breaking changes.

## Safety Features

The command includes:
- **system-evaluator validation** - Critical safety gate for all changes
- **Human oversight** - You initiate and monitor the process  
- **Cost estimate** - $2-4 in tokens, 30-60 minutes
- **Quality assurance** - Built-in testing and validation

## Implementation

The command is implemented as `maintenance.md` which Claude Code automatically recognizes as a slash command.