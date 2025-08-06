#!/usr/bin/env python3
"""
Claude Code Hook: user_prompt_submit
Detects /maintenance commands and transforms them into agent-selector calls
"""

import sys
import json
import re

def main():
    try:
        # Read the hook payload from stdin
        input_data = sys.stdin.read().strip()
        if not input_data:
            sys.exit(0)
            
        payload = json.loads(input_data)
        prompt = payload.get('prompt', '').strip()
        
        # Debug: write to stderr so we can see if hook is being called
        print(f"Hook received prompt: {prompt[:50]}...", file=sys.stderr)
        
        # Check if this is a maintenance command (more flexible matching)
        maintenance_patterns = [
            r'^/?maintenance\b',
            r'^maintenance$',
            r'^/maintenance$'
        ]
        
        is_maintenance = any(re.match(pattern, prompt.lower()) for pattern in maintenance_patterns)
        
        if is_maintenance:
            print("Hook detected maintenance command - transforming...", file=sys.stderr)
            
            # Create the agent-selector request
            new_prompt = """Use agent-selector to create a comprehensive system maintenance workflow for the Claude Code Agent System.

The workflow should include research, analysis, planning, implementation, testing, and deployment phases using existing agents in proper sequence.

Return a YAML workflow with all agents and tasks for comprehensive system maintenance."""
            
            # Output the transformed prompt to stdout
            print(new_prompt)
            sys.exit(0)
        
        # For non-maintenance prompts, output nothing (let original prompt through)
        sys.exit(0)
        
    except Exception as e:
        # Log error but don't block execution
        print(f"Hook error: {e}", file=sys.stderr)
        sys.exit(0)

if __name__ == "__main__":
    main()
