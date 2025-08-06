# Slash Command Installation

The Claude Code slash command is implemented as a Markdown file in `.claude/commands/`.

## Available Command

- **`/maintenance`** - Complete system maintenance workflow

## Installation

To use the slash command in Claude Code:

### Option 1: Project-Specific (Default)
The command in `.claude/commands/maintenance.md` is already project-specific and works when running Claude Code from this project directory.

### Option 2: User-Wide Installation
```bash
# Copy the command to your user directory
cp .claude/commands/maintenance.md ~/.claude/commands/
```

## Verification

After installation, restart Claude Code and type `/` - you should see `/maintenance` in the list.

## Usage

```bash
/maintenance
```

This executes the complete system maintenance workflow using the existing agent ecosystem with system-evaluator validation.