# Quick Setup Guide

## 1. Prerequisites

- Claude Code (Claude Desktop App) installed
- Unix-like environment (macOS, Linux, or WSL on Windows)
- Basic familiarity with terminal commands

## 2. Installation

```bash
# Clone the repository
git clone https://github.com/[your-username]/claude-code-agent-system.git
cd claude-code-agent-system

# Run the installation script
chmod +x install.sh
./install.sh

# Verify installation
./verify_installation.sh
```

## 3. First Use

In Claude Code, start any project with:

```
Use agent-selector to [describe what you want to build]
```

### Examples:

**Build a Web Application:**
```
Use agent-selector to build a React dashboard with user authentication and real-time data
```

**Create a Mobile App:**
```
Use agent-selector to create a fitness tracking app for iOS and Android
```

**Fix a Bug:**
```
Use agent-selector to debug high memory usage in our Node.js production server
```

**Create an API:**
```
Use agent-selector to design and implement a REST API for a blog platform
```

## 4. Understanding the Response

The agent-selector will provide:

1. **Recommended Workflow** - The best pattern for your needs
2. **Agent Sequence** - Specific agents in execution order
3. **Execution Strategy** - Sequential or parallel execution
4. **Resource Estimates** - Time and token usage predictions
5. **Critical Notes** - Important rules or requirements
6. **Alternatives** - Other approaches if available

## 5. Common Workflows

### Full Stack Web App (3-4 hours)
```
requirements-analyst → system-architect → 
frontend-developer + backend-developer (parallel) →
test-automator → deployment-engineer
```

### Mobile App (2-3 hours)
```
mobile-ux-engineer → mobile-ui-implementer (x3 parallel) →
html-to-native-converter → test-automator
```

### Emergency Hotfix (30-60 min)
```
incident-commander → debugger → 
backend-developer → deployment-engineer
```

## 6. Important Rules

⚠️ **MANDATORY RULES:**
- Files >500 lines MUST use external delegation
- Mobile apps MUST start with UX (no styling first!)
- Production deployments require governance approval
- Quality gates: Planning(85) → Development(88) → Deployment(90)

## 7. Monitoring

Check system status anytime:
```
Use agent-metrics-dashboard to show current system status
```

## 8. Getting Help

- **Discovery**: Always start with agent-selector
- **Documentation**: Check `~/.claude/SYSTEM_MASTER_PLAN.md`
- **Constitution**: Review `~/.claude/CLAUDE.md` for rules
- **Workflows**: See `~/.claude/knowledge/workflows.json`

## 9. Tips for Success

1. **Trust the agent-selector** - It knows the optimal approach
2. **Don't skip phases** - Especially UX for mobile apps
3. **Use parallel execution** - Faster results when possible
4. **Monitor tokens** - Use context-optimizer for long projects
5. **Let it self-maintain** - System improves weekly

## 10. Troubleshooting

If something isn't working:

1. Run `./verify_installation.sh` to check setup
2. Ensure all directories exist in `~/.claude/`
3. Check that agent-selector.md is in `~/.claude/agents/`
4. Verify knowledge files are in `~/.claude/knowledge/`

---

Ready to build something amazing? Start with:
```
Use agent-selector to [your project idea]
```
