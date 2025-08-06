#!/bin/bash

# Test the agent-selector directly
echo "Testing agent-selector..."

# Create a simple test prompt
cat > /tmp/test_selector.txt << 'EOF'
You are the agent-selector from the Claude Code Agent System. 

USER REQUEST: I want to build a mobile recipe app with user authentication and social sharing features.

Please analyze this request and provide your YAML recommendation exactly as specified in your agent configuration. You have access to these agents: mobile-ux-engineer, mobile-ui-implementer, html-to-native-converter, requirements-analyst, system-architect, frontend-developer, backend-developer, test-automator, deployment-engineer, and others.

Remember:
1. Mobile projects MUST start with mobile-ux-engineer
2. You ONLY provide recommendations - you do NOT execute tasks  
3. Use the exact YAML format specified in your configuration
4. Follow the mobile app workflow pattern

Respond with your YAML recommendation now:
EOF

# Test with Claude Code directly
echo "Calling Claude Code with agent-selector prompt..."
claude --print --model sonnet < /tmp/test_selector.txt

# Cleanup
rm -f /tmp/test_selector.txt
