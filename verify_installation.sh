#!/bin/bash
# Verify Claude Code Sub-Agent System Installation

echo "🔍 Verifying Claude Code Sub-Agent System Installation..."
echo "========================================================="

# Check directory structure
echo ""
echo "📁 Checking directory structure..."
directories=(
    "$HOME/.claude"
    "$HOME/.claude/agents"
    "$HOME/.claude/knowledge"
    "$HOME/.claude/patterns"
    "$HOME/.claude/protocols"
    "$HOME/.claude/config"
    "$HOME/.claude/commands"
    "$HOME/.claude/hooks"
    "$HOME/.claude/context"
    "$HOME/.claude/policies"
    "$HOME/.claude/maintenance"
    "$HOME/.claude/tests"
    "$HOME/.claude/reports"
    "$HOME/.claude/backups"
    "$HOME/.claude/scripts"
)

all_dirs_exist=true
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        echo "  ✅ $(basename $dir)/"
    else
        echo "  ❌ $(basename $dir)/ - missing"
        all_dirs_exist=false
    fi
done

echo ""
echo "📄 Checking critical files..."

# Check critical files
files=(
    "$HOME/.claude/SYSTEM_MASTER_PLAN.md"
    "$HOME/.claude/CLAUDE.md"
    "$HOME/.claude/knowledge/workflows.json"
    "$HOME/.claude/knowledge/agent_quickref.json"
    "$HOME/.claude/knowledge/triggers.json"
    "$HOME/.claude/knowledge/relationships.md"
    "$HOME/.claude/knowledge/best_practices.md"
    "$HOME/.claude/agents/agent-selector.md"
)

all_files_exist=true
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        size=$(wc -l < "$file" 2>/dev/null)
        echo "  ✅ $(basename $file) ($size lines)"
    else
        echo "  ❌ $(basename $file) - missing"
        all_files_exist=false
    fi
done

echo ""
echo "📊 System Summary:"
echo "  - Master Plan: $([ -f "$HOME/.claude/SYSTEM_MASTER_PLAN.md" ] && echo "✅ Installed" || echo "❌ Missing")"
echo "  - Constitution: $([ -f "$HOME/.claude/CLAUDE.md" ] && echo "✅ Installed" || echo "❌ Missing")"
echo "  - Knowledge Base: $([ -d "$HOME/.claude/knowledge" ] && echo "✅ Ready" || echo "❌ Missing")"
echo "  - Agent Selector: $([ -f "$HOME/.claude/agents/agent-selector.md" ] && echo "✅ Ready" || echo "❌ Missing")"

echo ""
echo "📈 Knowledge Files:"
if [ -d "$HOME/.claude/knowledge" ]; then
    for file in "$HOME/.claude/knowledge"/*; do
        if [ -f "$file" ]; then
            echo "  - $(basename $file)"
        fi
    done
else
    echo "  ❌ Knowledge directory not found"
fi

echo ""
if $all_dirs_exist && $all_files_exist; then
    echo "✅ System installation verified successfully!"
    echo ""
    echo "🚀 Next Steps:"
    echo "  1. Start with: agent-selector"
    echo "  2. Describe your project requirements"
    echo "  3. Follow the recommended workflow"
    echo ""
    echo "📚 Quick Commands:"
    echo "  - View master plan: cat ~/.claude/SYSTEM_MASTER_PLAN.md"
    echo "  - Check constitution: cat ~/.claude/CLAUDE.md"
    echo "  - List workflows: cat ~/.claude/knowledge/workflows.json"
    echo "  - View relationships: cat ~/.claude/knowledge/relationships.md"
else
    echo "⚠️  Installation incomplete. Some components are missing."
    echo ""
    echo "🔧 To complete installation:"
    echo "  1. Ensure all directories are created"
    echo "  2. Copy all required files to their locations"
    echo "  3. Run this verification again"
fi

echo ""
echo "========================================================="
echo "Claude Code Sub-Agent System v2.1 - Self-Maintaining"
