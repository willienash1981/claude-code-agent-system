#!/bin/bash

# Claude Code Agent System Wrapper
# This script integrates the Claude Code Agent System with Claude Code CLI

echo "🤖 Claude Code Agent System v2.2.0"
echo "====================================="

# Function to use agent-selector
use_agent_selector() {
    echo "🔍 Starting agent-selector for task analysis..."
    echo ""
    
    # Start Claude Code with specific instructions to use the agent system
    claude --model sonnet --print "
    I am the agent-selector from the Claude Code Agent System. My role is to analyze requirements and recommend which specialized agents to use.

    CRITICAL: I ONLY provide YAML recommendations - I do NOT execute tasks myself.

    Based on the user request: '$1'

    I must respond with this exact YAML format:

    \`\`\`yaml
    recommendation:
      workflow: \"[pattern_name or custom]\"
      description: \"Brief description of approach\"
      agents:
        - phase: \"Phase Name\"
          agents: [agent1, agent2]
          execution: \"sequential|parallel\"
          reason: \"Why these agents\"
      
      estimated:
        time: \"X hours\"
        tokens: XXXXX
        cost: \"\$X.XX\"
        success_rate: \"XX%\"
      
      critical_notes:
        - \"Important requirements\"
      
      next_steps:
        - \"User should invoke [agent] with [task]\"
    \`\`\`

    Available agents include: requirements-analyst, system-architect, frontend-developer, backend-developer, mobile-ux-engineer, mobile-ui-implementer, html-to-native-converter, test-automator, deployment-engineer, and 60+ others.

    Workflow patterns: full_stack_app, mobile_app, hotfix, microservices, data_pipeline, ai_feature.
    "
}

# Function to invoke a specific agent
use_agent() {
    local agent_name="$1"
    local task="$2"
    
    echo "🎯 Invoking $agent_name for: $task"
    echo ""
    
    # Check if agent file exists
    if [ ! -f "$HOME/.claude/agents/$agent_name.md" ]; then
        echo "❌ Agent '$agent_name' not found in ~/.claude/agents/"
        echo "Available agents:"
        ls ~/.claude/agents/ | sed 's/.md$//' | sed 's/^/  - /'
        return 1
    fi
    
    # Read agent configuration and start Claude Code with that context
    agent_config=$(cat "$HOME/.claude/agents/$agent_name.md")
    
    claude --model sonnet "
    $agent_config
    
    Task: $task
    
    Please execute this task according to my agent specification above.
    "
}

# Main script logic
if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "  $0 selector \"describe your requirements\"  # Get agent recommendations"
    echo "  $0 agent-name \"specific task\"             # Use specific agent"
    echo ""
    echo "Example:"
    echo "  $0 selector \"build a mobile app for recipes\""
    echo "  $0 mobile-ux-engineer \"design recipe app interface\""
    echo ""
    echo "Available agents:"
    ls ~/.claude/agents/ 2>/dev/null | sed 's/.md$//' | sed 's/^/  - /' || echo "  No agents found in ~/.claude/agents/"
elif [ "$1" = "selector" ]; then
    use_agent_selector "$2"
elif [ "$1" = "list" ]; then
    echo "Available agents:"
    ls ~/.claude/agents/ 2>/dev/null | sed 's/.md$//' | sed 's/^/  - /' || echo "  No agents found"
else
    use_agent "$1" "$2"
fi
