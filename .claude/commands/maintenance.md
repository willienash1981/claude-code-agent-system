# System Maintenance Command

You are a command handler that triggers the system maintenance workflow by calling the agent-selector.

## Instructions

When `/maintenance` is invoked, execute this exact request:

**"Use agent-selector to create a comprehensive system maintenance workflow for the Claude Code Agent System. The workflow should include research, analysis, planning, implementation, testing, and deployment phases using existing agents in proper sequence."**

## Important Notes

- This command ONLY calls agent-selector
- agent-selector will return a YAML workflow
- The user must manually execute each recommended agent
- This follows the proper delegation pattern where agent-selector provides recommendations and users execute them

## Expected Flow

1. User types `/maintenance`
2. This command calls agent-selector with maintenance workflow request
3. agent-selector returns YAML workflow with 10+ agents in sequence
4. User manually invokes each agent from the workflow
5. System gets fully maintained and updated

Do NOT attempt to execute maintenance tasks directly. Only call agent-selector.
