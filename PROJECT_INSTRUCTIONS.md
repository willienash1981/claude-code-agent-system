# Claude Code Project Instructions - Agent System Management

## Project Overview

This is the **Claude Code Agent System - Self-Maintaining**, a comprehensive AI orchestration system with 66+ specialized agents that work together to build, test, and deploy software. The system is designed to be self-maintaining, with agents that automatically update and improve the system weekly.

### Key Components
- **66+ Specialized Agents**: Each handles specific development tasks
- **11 Meta-Agents**: Manage and maintain the system itself
- **Self-Maintaining Architecture**: Automatically evolves and improves
- **Workflow Patterns**: Proven sequences for common tasks
- **Knowledge Base**: Extracted patterns and best practices

## Repository Information

- **GitHub URL**: https://github.com/willienash1981/claude-code-agent-system
- **Current Version**: v2.2.0
- **License**: MIT (open source)
- **Visibility**: Public (accepting contributions)

## File Locations

### System Installation (User's Machine)
```
~/.claude/                          # Main installation directory
├── SYSTEM_MASTER_PLAN.md          # Complete system documentation
├── CLAUDE.md                       # System constitution and rules
├── agents/                         # Individual agent definitions
│   └── agent-selector.md          # Primary entry point agent
├── knowledge/                      # Extracted knowledge base
│   ├── workflows.json             # Workflow patterns
│   ├── agent_quickref.json        # Quick agent lookups
│   ├── triggers.json              # Automatic triggers
│   ├── relationships.md           # Agent dependencies
│   └── best_practices.md          # Implementation guidelines
├── patterns/                       # Workflow templates
├── config/                        # System configuration
├── maintenance/                   # Auto-maintenance scripts
└── tests/                         # Testing framework
```

### Development Repository (Desktop)
```
~/Desktop/claude-code-agent-system/  # Git repository
├── README.md                       # Main documentation
├── HOW_TO_USE.md                  # Usage instructions
├── QUICK_START.md                 # Getting started guide
├── CONTRIBUTING.md                # Contribution guidelines
├── LICENSE                        # MIT license
├── install.sh                     # Installation script
├── verify_installation.sh         # Verification script
├── docs/                          # Documentation
│   ├── SYSTEM_MASTER_PLAN.md    # Master documentation
│   └── CLAUDE.md                 # Constitution
├── agents/                        # Agent definitions
├── knowledge/                     # Knowledge files
└── .git/                         # Git repository data
```

## Common Management Tasks

### 1. Testing Agent Changes

When modifying an agent:
```bash
# Edit the agent file
nano ~/.claude/agents/[agent-name].md

# Test the agent
"Use [agent-name] to [test task]"

# If successful, copy to repository
cp ~/.claude/agents/[agent-name].md ~/Desktop/claude-code-agent-system/agents/
```

### 2. Adding New Agents

```bash
# Create new agent in system
nano ~/.claude/agents/new-agent.md

# Test thoroughly
"Use new-agent to [test various tasks]"

# Add to repository
cp ~/.claude/agents/new-agent.md ~/Desktop/claude-code-agent-system/agents/

# Update documentation
# - Update agent count in README.md
# - Add to SYSTEM_MASTER_PLAN.md
# - Update knowledge/agent_quickref.json
```

### 3. Updating Workflow Patterns

```bash
# Edit workflow file
nano ~/.claude/knowledge/workflows.json

# Test the workflow
"Use agent-selector to [test workflow scenario]"

# Copy to repository
cp ~/.claude/knowledge/workflows.json ~/Desktop/claude-code-agent-system/knowledge/
```

### 4. Fixing Issues

```bash
# Identify the problem component
cat ~/.claude/agents/agent-selector.md  # Example: checking agent-selector

# Make fixes in the installed version
nano ~/.claude/agents/agent-selector.md

# Test the fix
"Use agent-selector to [test scenario]"

# Copy fixed version to repository
cp ~/.claude/agents/agent-selector.md ~/Desktop/claude-code-agent-system/agents/
```

## Git Workflow for Updates

### Standard Update Process

```bash
# Navigate to repository
cd ~/Desktop/claude-code-agent-system

# Check current status
git status

# Add all changes
git add -A

# Commit with descriptive message
git commit -m "Type: Brief description

- Detailed change 1
- Detailed change 2
- Why this change was needed"

# Push to GitHub
git push

# Example commit message:
git commit -m "Fix: agent-selector recommendation format

- Fixed YAML structure in responses
- Added delegation instructions
- Removed execution capabilities
- This ensures proper workflow delegation"
```

### Creating a New Release

For significant updates:
```bash
cd ~/Desktop/claude-code-agent-system

# Create and push a tag
gh release create v2.X.X --title "Release Title" --notes "## What's New

### Features
- New feature 1
- New feature 2

### Fixes
- Fixed issue 1
- Fixed issue 2

### Breaking Changes
- Any breaking changes

Installation:
\`\`\`bash
git clone https://github.com/willienash1981/claude-code-agent-system.git
cd claude-code-agent-system
./install.sh
\`\`\`"
```

## Critical Files to Maintain

### Always Keep Synchronized

1. **agent-selector.md** - Primary entry point, must work correctly
2. **SYSTEM_MASTER_PLAN.md** - Complete documentation
3. **workflows.json** - Workflow patterns
4. **README.md** - Public-facing documentation

### Update Together

When changing agents, update these files together:
- The agent file itself
- SYSTEM_MASTER_PLAN.md (agent list)
- agent_quickref.json (if adding new agent)
- workflows.json (if agent is part of workflows)
- README.md (if significant feature)

## Testing Checklist

Before pushing any changes:

- [ ] Test the modified agent/workflow locally
- [ ] Verify agent-selector still returns proper recommendations
- [ ] Run verify_installation.sh
- [ ] Check no personal information is included
- [ ] Update version number if significant change
- [ ] Write clear commit message
- [ ] Update documentation if needed

## Troubleshooting

### Common Issues and Fixes

1. **Agent-selector not recommending properly**
   - Check it only has read_file, search_files tools
   - Verify it returns YAML format
   - Ensure it's not trying to execute tasks

2. **Workflow not working**
   - Check agent dependencies in relationships.md
   - Verify all agents in workflow exist
   - Test each agent individually

3. **Installation issues**
   - Run verify_installation.sh
   - Check all directories exist
   - Verify file permissions

## Project Maintenance Commands

```bash
# Quick status check
cd ~/Desktop/claude-code-agent-system && git status

# View recent changes
git log --oneline -10

# Check differences
git diff

# Pull latest changes (if others contribute)
git pull

# View repository info
gh repo view

# Check issues
gh issue list

# View pull requests
gh pr list
```

## Important Notes

1. **NEVER commit**:
   - Personal information
   - API keys or credentials
   - Local file paths specific to your machine
   - Temporary or backup files

2. **ALWAYS test**:
   - Changes to agent-selector (most critical)
   - New agents before adding
   - Workflow modifications
   - Any changes to core meta-agents

3. **Keep synchronized**:
   - Local ~/.claude/ installation
   - Repository ~/Desktop/claude-code-agent-system/
   - GitHub remote repository

## Quick Reference

### Most Used Commands
```bash
# Test an agent
"Use [agent-name] to [task]"

# Get workflow recommendation
"Use agent-selector to [describe task]"

# Verify system
cd ~/Desktop/claude-code-agent-system && ./verify_installation.sh

# Commit and push
cd ~/Desktop/claude-code-agent-system && git add -A && git commit -m "message" && git push

# Check repository
cd ~/Desktop/claude-code-agent-system && gh repo view --web
```

## System Philosophy

Remember: This system is designed to be **self-maintaining**. The agents should:
- Improve themselves weekly via agent-ecosystem-manager
- Discover new patterns via best-practices-researcher
- Create new agents via meta-agent-creator
- Monitor performance via agent-observability-platform

Your role is to:
1. Guide the overall direction
2. Test and validate changes
3. Push updates to GitHub
4. Handle issues that require human judgment

The system handles its own evolution, but you control what gets published.

---

**Project Maintainer Instructions v1.0**
**Last Updated**: Current Session
**Repository**: https://github.com/willienash1981/claude-code-agent-system
