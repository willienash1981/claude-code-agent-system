# Claude Code Agent System - Slash Commands

This directory contains Claude Code slash commands for the agent system maintenance and operations.

## Available Commands

- **`/maintenance`** - Complete system maintenance workflow (30-60 min, $2-4)
- **`/update`** - Alias for maintenance workflow  
- **`/self-update`** - Alternative maintenance trigger
- **`/health`** - Quick system health check (5-10 min, $0.50-1)
- **`/status`** - Alias for health check
- **`/research`** - Research improvements only (10-15 min, $1-2)
- **`/create-agent`** - Create new specialized agent (15-20 min, $1-3)

## Usage

Simply type the slash command in Claude Code:
```bash
/maintenance
/health  
/research
/create-agent "Need an agent for API documentation generation"
```

## Safety Features

All commands include:
- **system-evaluator validation** - Critical safety gate for all changes
- **Human oversight** - You initiate and monitor all processes  
- **Cost estimates** - Know exactly what you'll spend upfront
- **Duration estimates** - Plan your time accordingly
- **Quality assurance** - Built-in testing and validation

## Command Details

Each command is implemented as a Markdown file that Claude Code automatically recognizes. The commands orchestrate the existing 66+ agent ecosystem to perform specific maintenance and operational tasks.

See individual `.md` files for detailed instructions and expected outcomes.