# Troubleshooting Guide

## Common Issues and Solutions

### Missing Agent Error: "Agent type 'X' not found"

**Symptoms:**
- Claude Code shows error: `Agent type 'database-architect' not found`
- Workflow attempts to use an agent that exists in repository but isn't recognized
- System falls back to similar agent (e.g., data-engineer instead of database-architect)

**Root Causes:**
1. **Synchronization Issue**: Agent exists in repository but not in installed `~/.claude/agents/`
2. **Corrupted workflows.json**: JSON syntax errors or missing references in installed version
3. **Cache Issue**: Claude Code may need to refresh agent registry

**Diagnosis:**
```bash
# Check if agent file exists in both locations
ls ~/.claude/agents/database-architect.md
ls ~/Desktop/claude-code-agent-system/agents/database-architect.md

# Validate workflows.json syntax
python3 -m json.tool ~/.claude/knowledge/workflows.json

# Check agent references in workflows
grep -n "database-architect" ~/.claude/knowledge/workflows.json
```

**Solution:**
1. **Quick Fix**: Run the automated diagnostic script
   ```bash
   cd ~/Desktop/claude-code-agent-system
   ./scripts/fix_missing_agents.sh
   ```

2. **Manual Fix**:
   ```bash
   # Copy agent from repository to installed location
   cp ~/Desktop/claude-code-agent-system/agents/database-architect.md ~/.claude/agents/
   
   # Update workflows.json
   cp ~/Desktop/claude-code-agent-system/knowledge/workflows.json ~/.claude/knowledge/
   
   # Sync all agents to be safe
   rsync -av ~/Desktop/claude-code-agent-system/agents/ ~/.claude/agents/ --exclude="*.backup"
   ```

3. **Verification**:
   - Test with: `Use agent-selector to build a web app with database`
   - Should no longer show "Agent type not found" error
   - Should properly recommend `database-architect` in workflow

### Agent Count Mismatch

**Symptoms:**
- Different number of agents between installed and repository versions
- Some workflows fail unexpectedly

**Diagnosis:**
```bash
# Compare agent counts
echo "Installed: $(find ~/.claude/agents -name '*.md' | wc -l)"
echo "Repository: $(find ~/Desktop/claude-code-agent-system/agents -name '*.md' | grep -v backup | wc -l)"

# Find missing agents
diff <(ls ~/.claude/agents/*.md | xargs -n1 basename | sort) \
     <(ls ~/Desktop/claude-code-agent-system/agents/*.md | grep -v backup | xargs -n1 basename | sort)
```

**Solution:**
```bash
# Full synchronization
rsync -av ~/Desktop/claude-code-agent-system/agents/ ~/.claude/agents/ --exclude="*.backup"
rsync -av ~/Desktop/claude-code-agent-system/knowledge/ ~/.claude/knowledge/
```

### JSON Syntax Errors in workflows.json

**Symptoms:**
- Agents exist but aren't properly referenced in workflows
- System falls back to generic agents

**Diagnosis:**
```bash
# Validate JSON syntax
python3 -m json.tool ~/.claude/knowledge/workflows.json
```

**Solution:**
```bash
# Replace with repository version
cp ~/Desktop/claude-code-agent-system/knowledge/workflows.json ~/.claude/knowledge/
```

## Prevention

### Regular Maintenance
1. **Weekly Sync**: Ensure repository and installed versions stay synchronized
2. **Validation**: Run verification script after any manual changes
3. **Testing**: Test agent-selector after updates

### Best Practices
- Always test agents in `~/.claude/` before committing to repository
- Keep workflows.json synchronized between versions
- Use the provided scripts for maintenance tasks
- Validate JSON files after manual editing

## Emergency Recovery

If the system becomes unstable:

1. **Reset from Repository**:
   ```bash
   # Backup current state
   cp -r ~/.claude ~/.claude.backup.$(date +%Y%m%d_%H%M%S)
   
   # Reinstall from repository
   cd ~/Desktop/claude-code-agent-system
   ./verify_installation.sh
   ```

2. **Selective Recovery**:
   ```bash
   # Just fix specific components
   cp ~/Desktop/claude-code-agent-system/knowledge/workflows.json ~/.claude/knowledge/
   cp ~/Desktop/claude-code-agent-system/agents/*.md ~/.claude/agents/
   ```

3. **Complete Reinstall**:
   ```bash
   rm -rf ~/.claude
   cd ~/Desktop/claude-code-agent-system
   ./install.sh  # If available
   ```

## Getting Help

1. **Check System Status**: `./verify_installation.sh`
2. **Run Diagnostics**: `./scripts/fix_missing_agents.sh`
3. **Review Logs**: Check Claude Code output for specific error messages
4. **Community Support**: Report issues with full error output and system state
