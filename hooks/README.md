# Claude Code Slash Command - Agent System

This directory originally contained JSON hook configurations, but Claude Code requires Markdown files in `.claude/commands/`.

## Current Implementation

The slash command is properly implemented as:
- `.claude/commands/maintenance.md` - The single `/maintenance` command

## Removed Files

The redundant JSON configurations have been removed to avoid confusion:
- ~~maintenance.json~~ (removed)
- ~~health-check.json~~ (removed)  
- ~~research.json~~ (removed)
- ~~create-agent.json~~ (removed)

## Usage

Simply type `/maintenance` in Claude Code to execute the complete system maintenance workflow.