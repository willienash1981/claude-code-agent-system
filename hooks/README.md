# Claude Code Slash Commands - Agent System

This directory contains the original JSON hook configurations. The actual slash commands are implemented as Markdown files in `.claude/commands/`.

## Available Commands

### 🔄 `/maintenance` (aliases: `/update`, `/self-update`)
**Complete system maintenance workflow using existing agents**

- **Duration**: 30-60 minutes  
- **Cost**: $2-4 in tokens
- **Description**: Full system update cycle with research, planning, validation, implementation, and deployment
- **Safety**: Includes system-evaluator as critical safety gate

### 🏥 `/health` (aliases: `/status`)  
**Quick system health assessment**

- **Duration**: 5-10 minutes
- **Cost**: $0.50-1 in tokens  
- **Description**: Fast health check and performance assessment
- **Purpose**: Identify any immediate issues or performance problems

### 🔬 `/research`
**Research latest improvements without implementing**

- **Duration**: 10-15 minutes
- **Cost**: $1-2 in tokens
- **Description**: Research-only workflow that discovers trends and opportunities
- **Note**: Makes no changes to the system - purely informational

### 🤖 `/create-agent`
**Create a new agent for specific requirements**

- **Duration**: 15-20 minutes  
- **Cost**: $1-3 in tokens
- **Description**: Systematic agent creation with validation and testing
- **Usage**: `/create-agent "Need an agent for API documentation generation"`

## Implementation

The actual slash commands are implemented as Markdown files in `.claude/commands/`:
- `maintenance.md` - Complete maintenance workflow
- `health.md` - Quick health assessment  
- `research.md` - Research-only workflow
- `create-agent.md` - New agent creation workflow
- `update.md` - Alias for maintenance
- `self-update.md` - Alternative maintenance trigger
- `status.md` - Alias for health check

## How to Use

Simply type the slash command in Claude Code:
```bash
/maintenance
/health  
/research
/create-agent "Describe your requirements here"
```

The commands will appear in Claude Code's slash command menu after installation.