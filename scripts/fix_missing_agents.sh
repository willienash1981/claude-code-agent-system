#!/bin/bash

# Fix Missing Agents Script
# This script diagnoses and fixes issues with missing agents in Claude Code

echo "🔍 Diagnosing missing agents issue..."

# Check if database-architect exists in both locations
echo "📁 Checking database-architect agent..."
if [ -f ~/.claude/agents/database-architect.md ]; then
    echo "  ✅ Agent file exists in ~/.claude/agents/"
else
    echo "  ❌ Agent file missing in ~/.claude/agents/"
    echo "  🔧 Copying from repository..."
    cp ~/Desktop/claude-code-agent-system/agents/database-architect.md ~/.claude/agents/
fi

if [ -f ~/Desktop/claude-code-agent-system/agents/database-architect.md ]; then
    echo "  ✅ Agent file exists in repository"
else
    echo "  ❌ Agent file missing in repository"
fi

# Check workflows.json for syntax errors
echo "📋 Checking workflows.json..."
if python3 -m json.tool ~/.claude/knowledge/workflows.json > /dev/null 2>&1; then
    echo "  ✅ workflows.json is valid JSON"
else
    echo "  ❌ workflows.json has JSON errors"
    echo "  🔧 Copying from repository..."
    cp ~/Desktop/claude-code-agent-system/knowledge/workflows.json ~/.claude/knowledge/
fi

# Check if database-architect is referenced in workflows
if grep -q "database-architect" ~/.claude/knowledge/workflows.json; then
    echo "  ✅ database-architect found in workflows.json"
else
    echo "  ❌ database-architect missing from workflows.json"
    echo "  🔧 Updating workflows.json from repository..."
    cp ~/Desktop/claude-code-agent-system/knowledge/workflows.json ~/.claude/knowledge/
fi

# Compare agent counts
INSTALLED_COUNT=$(find ~/.claude/agents -name "*.md" | wc -l | tr -d ' ')
REPO_COUNT=$(find ~/Desktop/claude-code-agent-system/agents -name "*.md" | grep -v backup | wc -l | tr -d ' ')

echo "📊 Agent counts:"
echo "  Installed: $INSTALLED_COUNT"
echo "  Repository: $REPO_COUNT"

if [ "$INSTALLED_COUNT" -lt "$REPO_COUNT" ]; then
    echo "  ⚠️  Some agents may be missing from installation"
    echo "  🔧 Syncing all agents from repository..."
    rsync -av ~/Desktop/claude-code-agent-system/agents/ ~/.claude/agents/ --exclude="*.backup"
fi

echo "✅ Missing agents diagnostic complete!"
echo ""
echo "🧪 To test the fix:"
echo "   Use agent-selector to build a web app with database"
echo "   The workflow should now include database-architect without errors"
