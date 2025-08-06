#!/bin/bash

# Claude Code Agent System Integration
# This creates a proper interface to use your agent system with Claude Code

AGENT_DIR="$(dirname "$0")/agents"
KNOWLEDGE_DIR="$(dirname "$0")/knowledge"

# Function to invoke agent-selector
selector() {
    if [ $# -eq 0 ]; then
        echo "Usage: selector \"describe your requirements\""
        return 1
    fi
    
    local requirements="$1"
    
    echo "🔍 Agent Selector Analysis for: $requirements"
    echo "============================================="
    
    # Read the agent-selector configuration
    local agent_config
    if [ -f "$AGENT_DIR/agent-selector.md" ]; then
        agent_config=$(cat "$AGENT_DIR/agent-selector.md")
    else
        echo "❌ agent-selector.md not found in $AGENT_DIR"
        return 1
    fi
    
    # Create a temporary prompt file
    local temp_prompt="/tmp/agent_selector_prompt.txt"
    cat > "$temp_prompt" << EOF
You are the agent-selector from the Claude Code Agent System. Here is your complete configuration:

$agent_config

USER REQUEST: $requirements

Please analyze this request and provide your YAML recommendation exactly as specified in your configuration. Remember:
1. You ONLY provide recommendations - you do NOT execute tasks
2. You MUST use the exact YAML format specified
3. Choose appropriate agents from the 66+ available agents
4. Follow the proven workflow patterns (full_stack_app, mobile_app, hotfix, etc.)
5. Include time estimates, token costs, and success rates

Respond with your YAML recommendation now:
EOF
    
    # Call Claude Code with the prompt
    claude --print --model sonnet < "$temp_prompt"
    
    # Clean up
    rm -f "$temp_prompt"
}

# Function to list available agents
list_agents() {
    echo "Available Agents:"
    echo "================="
    
    if [ -d "$AGENT_DIR" ]; then
        for agent_file in "$AGENT_DIR"/*.md; do
            if [ -f "$agent_file" ]; then
                local agent_name=$(basename "$agent_file" .md)
                echo "  ✅ $agent_name"
            fi
        done
    else
        echo "❌ Agent directory not found: $AGENT_DIR"
    fi
}

# Function to show system status
status() {
    echo "🤖 Claude Code Agent System Status"
    echo "=================================="
    echo ""
    
    # Check directories
    echo "📁 Directory Structure:"
    [ -d "$HOME/.claude" ] && echo "  ✅ ~/.claude/" || echo "  ❌ ~/.claude/"
    [ -d "$AGENT_DIR" ] && echo "  ✅ agents/" || echo "  ❌ agents/"
    [ -d "$KNOWLEDGE_DIR" ] && echo "  ✅ knowledge/" || echo "  ❌ knowledge/"
    
    echo ""
    echo "📊 Available Agents:"
    local agent_count=0
    if [ -d "$AGENT_DIR" ]; then
        for agent_file in "$AGENT_DIR"/*.md; do
            if [ -f "$agent_file" ]; then
                agent_count=$((agent_count + 1))
                local agent_name=$(basename "$agent_file" .md)
                echo "  - $agent_name"
            fi
        done
    fi
    
    echo ""
    echo "📈 Summary:"
    echo "  - Agents implemented: $agent_count"
    echo "  - Target agents: 66+"
    echo "  - Status: $([ $agent_count -gt 0 ] && echo "Partially Ready" || echo "Not Ready")"
}

# Function to create an agent template
create_agent() {
    if [ $# -eq 0 ]; then
        echo "Usage: create_agent \"agent-name\""
        return 1
    fi
    
    local agent_name="$1"
    local agent_file="$AGENT_DIR/$agent_name.md"
    
    if [ -f "$agent_file" ]; then
        echo "❌ Agent '$agent_name' already exists"
        return 1
    fi
    
    mkdir -p "$AGENT_DIR"
    
    cat > "$agent_file" << EOF
---
name: $agent_name
description: [Brief description of what this agent does]
tools: read_file,write_file,search_files
model: claude-sonnet-4-latest
---

# $agent_name

I am the $agent_name agent in the Claude Code Agent System.

## My Role
- [Primary responsibility]
- [Secondary responsibility]
- [Key capability]

## I DO NOT
- [What this agent should not do]
- [Scope limitations]

## My Process
1. [First step]
2. [Second step]
3. [Final step]

## Quality Standards
- [Requirement 1]
- [Requirement 2]
- [Success criteria]

## Dependencies
- Input from: [other agents]
- Output to: [other agents]

## Example Usage
\`\`\`
Task: [Example task description]
Approach: [How I would handle it]
Output: [What I would produce]
\`\`\`
EOF
    
    echo "✅ Created agent template: $agent_file"
    echo "📝 Please edit the file to complete the agent configuration"
}

# Main command dispatcher
case "$1" in
    "selector")
        selector "$2"
        ;;
    "list")
        list_agents
        ;;
    "status")
        status
        ;;
    "create")
        create_agent "$2"
        ;;
    *)
        echo "🤖 Claude Code Agent System v2.2.0"
        echo "=================================="
        echo ""
        echo "Commands:"
        echo "  selector \"requirements\"  - Get agent recommendations"
        echo "  list                     - List available agents"  
        echo "  status                   - Show system status"
        echo "  create \"agent-name\"      - Create new agent template"
        echo ""
        echo "Examples:"
        echo "  $0 selector \"build mobile recipe app\""
        echo "  $0 status"
        echo "  $0 create \"frontend-developer\""
        ;;
esac
