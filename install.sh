#!/bin/bash

# Claude Code Sub-Agent System - Installation Script
# Version 2.1

set -e

echo "=================================================="
echo "  Claude Code Sub-Agent System Installation"
echo "  Version 2.1 - Self-Maintaining Architecture"
echo "=================================================="
echo ""

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p ~/.claude/{agents,knowledge,patterns,protocols,config,commands,hooks,context,policies,maintenance,tests,reports,backups,scripts}

# Copy master plan
echo "📄 Installing system documentation..."
cp docs/SYSTEM_MASTER_PLAN.md ~/.claude/
cp docs/CLAUDE.md ~/.claude/

# Copy knowledge files
echo "🧠 Installing knowledge base..."
cp -r knowledge/* ~/.claude/knowledge/

# Copy agent definitions
echo "🤖 Installing agents..."
cp -r agents/* ~/.claude/agents/ 2>/dev/null || mkdir -p ~/.claude/agents

# Copy configuration files
echo "⚙️ Installing configuration..."
cp -r config/* ~/.claude/config/ 2>/dev/null || mkdir -p ~/.claude/config

# Copy patterns
echo "📊 Installing workflow patterns..."
cp -r patterns/* ~/.claude/patterns/ 2>/dev/null || mkdir -p ~/.claude/patterns

# Copy maintenance scripts
echo "🔧 Installing maintenance scripts..."
cp -r maintenance/* ~/.claude/maintenance/ 2>/dev/null || mkdir -p ~/.claude/maintenance

# Set up hooks
echo "🪝 Setting up automation hooks..."
cp -r hooks/* ~/.claude/hooks/ 2>/dev/null || mkdir -p ~/.claude/hooks
chmod +x ~/.claude/hooks/*.sh 2>/dev/null || true

# Create initial directories
echo "📂 Creating working directories..."
touch ~/.claude/context/.gitkeep
touch ~/.claude/reports/.gitkeep
touch ~/.claude/backups/.gitkeep

echo ""
echo "✅ Installation complete!"
echo ""
echo "=================================================="
echo "🚀 Quick Start Guide:"
echo "=================================================="
echo ""
echo "1. Start with agent-selector for any task:"
echo "   'Use agent-selector to build a web app'"
echo ""
echo "2. Common commands:"
echo "   • Web App:    'Use agent-selector to build a SaaS dashboard'"
echo "   • Mobile App: 'Use agent-selector to create a fitness app'"
echo "   • Bug Fix:    'Use agent-selector to fix production issue'"
echo ""
echo "3. View documentation:"
echo "   • Master Plan: cat ~/.claude/SYSTEM_MASTER_PLAN.md"
echo "   • Constitution: cat ~/.claude/CLAUDE.md"
echo "   • Workflows: cat ~/.claude/knowledge/workflows.json"
echo ""
echo "4. Verify installation:"
echo "   ./verify_installation.sh"
echo ""
echo "=================================================="
echo "Your AI development team is ready! 🎯"
echo "=================================================="
