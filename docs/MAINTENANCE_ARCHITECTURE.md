# Maintenance Workflow Architecture

## Problem Solved

The `/maintenance` command was running as a single agent instead of orchestrating multiple specialized agents through the proper workflow architecture.

## Solution: Hook + Sub-Agent Architecture

### 1. Hook-Based Detection (`user_prompt_submit.py`)

- Detects `/maintenance` commands before they reach Claude
- Transforms them into proper agent-selector workflow requests
- Uses Claude Code hooks for deterministic control

### 2. Sub-Agent Delegation (`maintenance-orchestrator.md`)

- Specialized sub-agent for maintenance workflow orchestration
- Delegates to agent-selector for YAML workflow creation
- Follows single-responsibility principle

### 3. Proper Workflow Pattern

```
User: /maintenance
↓ (Hook intercepts)
Hook: Transforms to agent-selector request  
↓
Claude: Calls agent-selector
↓
agent-selector: Returns YAML workflow with 10+ agents
↓
User: Manually executes each agent in sequence
↓
Specialized Agents: Execute maintenance tasks
```

## Architecture Benefits

- **Separation of Concerns**: Each component has single responsibility
- **Deterministic Control**: Hooks ensure consistent behavior
- **Proper Delegation**: Sub-agents call other sub-agents appropriately
- **Workflow Orchestration**: agent-selector designs, user executes
- **Specialized Execution**: Each agent handles specific maintenance tasks

## Hook Types Used

- `user_prompt_submit`: Intercepts and transforms `/maintenance` commands
- Future: `pre_tool_use`, `post_tool_use` for validation and logging

## Files Modified

- `.claude/hooks/user_prompt_submit.py` - Hook for command detection
- `.claude/settings.json` - Hook configuration
- `.claude/commands/maintenance.md` - Sub-agent command handler
- `agents/maintenance-orchestrator.md` - Specialized maintenance sub-agent
- `docs/MAINTENANCE_ARCHITECTURE.md` - This documentation

## Testing

1. **Hook Test**: `/maintenance` should trigger agent-selector call
2. **Sub-Agent Test**: Direct maintenance-orchestrator call should delegate properly
3. **Workflow Test**: agent-selector should return proper YAML workflow
4. **Integration Test**: Full workflow execution with all specialized agents

This architecture follows Claude Code best practices for sub-agent coordination and workflow orchestration.
