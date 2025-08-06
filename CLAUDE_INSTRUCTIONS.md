# Instructions for Claude - Agent System Project Management

You are managing the Claude Code Agent System, a self-maintaining AI orchestration system with 66+ specialized agents.

## Context

This project is a public GitHub repository containing a comprehensive agent system for Claude Code. It includes specialized agents for development tasks, meta-agents for system management, and self-maintaining capabilities.

### Repository Details
- **URL**: https://github.com/willienash1981/claude-code-agent-system
- **Local Path**: `~/Desktop/claude-code-agent-system/`
- **Installed Path**: `~/.claude/`
- **Version**: v2.2.0

## Your Responsibilities

### 1. Code Management
- Test agent modifications in `~/.claude/agents/` first
- Copy working changes to `~/Desktop/claude-code-agent-system/`
- Maintain synchronization between installed and repository versions
- Ensure no personal information in commits

### 2. Git Operations
When updates are needed:
```bash
cd ~/Desktop/claude-code-agent-system
git add -A
git commit -m "Type: Description

- Detailed changes
- Reason for changes"
git push
```

### 3. Testing Protocol
Before any commit:
1. Test modified agents locally
2. Verify agent-selector returns proper YAML recommendations
3. Run `./verify_installation.sh`
4. Check for personal information
5. Update documentation if needed

### 4. Critical Files
Always keep these synchronized:
- `agents/agent-selector.md` - Must return recommendations only
- `docs/SYSTEM_MASTER_PLAN.md` - Complete documentation
- `knowledge/workflows.json` - Workflow patterns
- `README.md` - Public documentation

## Key System Rules

### Agent-Selector Behavior
- **MUST** only return YAML recommendations
- **MUST NOT** execute any tasks
- **MUST NOT** have write_file tool
- **MUST** include delegation instructions

### Workflow Structure
1. User asks agent-selector for recommendations
2. Agent-selector returns YAML workflow
3. User manually invokes each recommended agent
4. Agents execute their specific tasks

### File Locations Map
```
~/.claude/                    # Installed system (testing)
├── agents/                   # Test changes here first
├── knowledge/               # Knowledge base
└── SYSTEM_MASTER_PLAN.md    # Master documentation

~/Desktop/claude-code-agent-system/  # Git repository
├── agents/                   # Copy tested agents here
├── knowledge/               # Copy tested knowledge here
├── docs/                    # Documentation
└── .git/                    # Git management
```

## Common Tasks

### Adding a New Agent
1. Create in `~/.claude/agents/new-agent.md`
2. Test: `Use new-agent to [test task]`
3. Copy to repository: `cp ~/.claude/agents/new-agent.md ~/Desktop/claude-code-agent-system/agents/`
4. Update documentation
5. Commit and push

### Fixing an Agent
1. Edit in `~/.claude/agents/[agent].md`
2. Test the fix
3. Copy to repository
4. Commit with clear message about the fix
5. Push to GitHub

### Updating Workflows
1. Edit `~/.claude/knowledge/workflows.json`
2. Test with agent-selector
3. Copy to repository
4. Update documentation
5. Commit and push

### Creating a Release
```bash
cd ~/Desktop/claude-code-agent-system
gh release create v2.X.X --title "Title" --notes "Release notes"
```

## Testing Commands

```bash
# Verify installation
cd ~/Desktop/claude-code-agent-system && ./verify_installation.sh

# Test agent-selector
echo "Use agent-selector to build a web app"

# Check repository status
cd ~/Desktop/claude-code-agent-system && git status

# View recent commits
cd ~/Desktop/claude-code-agent-system && git log --oneline -5
```

## Important Reminders

1. **agent-selector** is ONLY for recommendations
2. Test ALL changes before committing
3. Keep commit messages descriptive
4. Never include personal paths or data
5. Update version numbers for significant changes
6. Maintain backwards compatibility
7. Document breaking changes

## Error Recovery

If something breaks:
1. Check `git status` for uncommitted changes
2. Use `git diff` to review changes
3. Test the specific broken component
4. Fix in `~/.claude/` first
5. Verify fix works
6. Copy to repository and commit

## Project Philosophy

This system is **self-maintaining**:
- It updates itself weekly
- It discovers improvements automatically
- It creates new agents as needed
- It monitors its own performance

Your role is to:
- Guide overall direction
- Test and validate changes
- Manage the Git repository
- Handle human-judgment decisions
- Publish updates for the community

## Quick Command Reference

```bash
# Navigate to project
cd ~/Desktop/claude-code-agent-system

# Check status
git status

# Add and commit
git add -A && git commit -m "message"

# Push to GitHub
git push

# Create release
gh release create vX.X.X

# Open in browser
gh repo view --web
```

Remember: The system maintains itself, but you control what gets published to the world.
