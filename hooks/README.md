# Claude Code Slash Commands - Agent System Hooks

This directory contains Claude Code slash command configurations for the agent system maintenance and operations.

## Available Commands

### 🔄 `/maintenance` (aliases: `/update`, `/self-update`, `/maintain`)
**Complete system maintenance workflow using existing agents**

- **Duration**: 30-60 minutes  
- **Cost**: $2-4 in tokens
- **Description**: Full system update cycle with research, planning, validation, implementation, and deployment
- **Safety**: Includes system-evaluator as critical safety gate

**What it does:**
1. Research latest improvements and assess system health
2. Create improvement plan and validate all changes  
3. Implement only approved changes with quality assurance
4. Test and deploy validated improvements

### 🏥 `/health` (aliases: `/check`, `/status`)  
**Quick system health assessment**

- **Duration**: 5-10 minutes
- **Cost**: $0.50-1 in tokens  
- **Description**: Fast health check and performance assessment
- **Purpose**: Identify any immediate issues or performance problems

### 🔬 `/research` (aliases: `/discover`, `/trends`)
**Research latest improvements without implementing**

- **Duration**: 10-15 minutes
- **Cost**: $1-2 in tokens
- **Description**: Research-only workflow that discovers trends and opportunities
- **Note**: Makes no changes to the system - purely informational

### 🤖 `/create-agent` (aliases: `/new-agent`, `/agent`)
**Create a new agent for specific requirements**

- **Duration**: 15-20 minutes  
- **Cost**: $1-3 in tokens
- **Description**: Systematic agent creation with validation and testing
- **Usage**: Specify the capability gap when using this command

## How to Use

### In Claude Code:
```bash
# Full system maintenance
/maintenance

# Quick health check  
/health

# Research improvements only
/research

# Create new agent
/create-agent "Need an agent for API documentation generation"
```

### Traditional Prompt Alternative:
If slash commands aren't available, use these prompts:

```yaml
maintenance: "Execute system maintenance workflow for the Claude Code Agent System"
health: "Use agent-observability-platform to assess system health, then use agent-ecosystem-manager to address any critical issues"
research: "Use best-practices-researcher to identify latest development trends that could improve our agent system" 
create_agent: "Use meta-agent-creator to design and create a new agent for [specific requirement]"
```

## Hook Architecture

Each hook is a JSON configuration file that defines:

- **Trigger**: Command and aliases
- **Workflow**: Phases and agent sequence  
- **Safety Features**: Validation and approval gates
- **Expected Outcomes**: What the workflow accomplishes
- **Cost/Duration**: Resource estimates

## Safety Features

All hooks include built-in safety measures:

- **system-evaluator validation** for any system changes
- **Human oversight** - you initiate and monitor 
- **Rollback capability** if issues arise
- **Quality assurance** with testing phases
- **Clear cost estimates** before execution

## Integration

These hooks integrate with:
- Claude Code's command system
- The existing 66+ agent ecosystem  
- The established maintenance workflow
- Git repository management
- Quality assurance processes

## Configuration Files

- `maintenance.json` - Complete maintenance workflow
- `health-check.json` - Quick health assessment  
- `research.json` - Research-only workflow
- `create-agent.json` - New agent creation workflow

## Benefits

✅ **Convenience**: Single command instead of long prompts
✅ **Consistency**: Standardized workflows every time  
✅ **Safety**: Built-in validation and approval gates
✅ **Efficiency**: Optimized agent sequences
✅ **Documentation**: Clear expectations and outcomes
✅ **Cost Control**: Upfront cost estimates

The slash commands provide the convenience of automation while maintaining human control and system safety.