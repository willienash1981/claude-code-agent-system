# Slash Commands Installation

The Claude Code slash commands are now properly implemented as Markdown files in `.claude/commands/`.

## Installation for Your Local System

To use these slash commands in Claude Code, you need to copy them to your local Claude installation:

### Option 1: Automatic Installation (Recommended)
```bash
# Copy all commands to your local Claude installation
cp -r .claude/commands ~/.claude/

# Or copy them to your project-specific location
mkdir -p ~/.claude/commands/
cp .claude/commands/*.md ~/.claude/commands/
```

### Option 2: Symlink (For Development)
```bash
# Create a symlink so commands stay in sync with the repository
ln -sf $(pwd)/.claude/commands ~/.claude/commands-agent-system
```

### Option 3: Project-Specific Commands
The commands in `.claude/commands/` are already project-specific and will be available when you run Claude Code from this project directory.

## Verification

After installation, restart Claude Code and the commands should appear when you type `/`:

- `/maintenance` - Complete system maintenance
- `/health` - Quick health check
- `/research` - Research improvements only  
- `/create-agent` - Create new agent
- `/update`, `/self-update`, `/status` - Aliases

## Troubleshooting

If commands don't appear:
1. Ensure files are in `.claude/commands/` directory
2. Restart Claude Code completely
3. Check that files have `.md` extension
4. Verify you're in the project directory or commands are in `~/.claude/commands/`

## Usage

Simply type the slash command in Claude Code:
```bash
/maintenance
/health
/research  
/create-agent "Describe your requirements"
```

The commands will orchestrate the existing agent ecosystem to perform maintenance and operations safely.