# Claude Code Agent System - Slash Commands

This directory contains the Claude Code slash commands for the agent system.

## Available Commands

- **`/maintenance`** - Complete system maintenance workflow (30-60 min, $2-4)
- **`/visual-testing`** - Comprehensive visual testing with real authentication and production-like data

## Usage

Simply type the slash command in Claude Code:
```bash
/maintenance          # System maintenance workflow
/visual-testing       # Visual regression testing workflow
```

These execute complete workflows using the existing 74+ agent ecosystem with system-evaluator validation to prevent breaking changes.

## Safety Features

Both commands include:
- **system-evaluator validation** - Critical safety gate for all changes
- **Human oversight** - You initiate and monitor the process  
- **Cost estimates** - Token usage and time estimates provided
- **Quality assurance** - Built-in testing and validation

## Implementation

Commands are implemented as `.md` files which Claude Code automatically recognizes as slash commands:
- `maintenance.md` → `/maintenance` 
- `visual-testing.md` → `/visual-testing`