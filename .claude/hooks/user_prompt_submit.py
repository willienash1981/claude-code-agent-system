#!/usr/bin/env python3
"""
Claude Code Hook: user_prompt_submit
Triggers when user submits a prompt - detects /maintenance and transforms it into agent-selector call
"""
# /// script
# dependencies = ["requests"]
# ///

import sys
import json
import re

def main():
    # Read the hook payload from stdin
    try:
        payload = json.loads(sys.stdin.read())
        prompt = payload.get('prompt', '').strip()
        
        # Check if this is a maintenance command
        if re.match(r'^/?maintenance\b', prompt.lower()):
            # Transform the maintenance command into proper agent-selector workflow request
            new_prompt = """Use agent-selector to create a comprehensive system maintenance workflow for the Claude Code Agent System.

The workflow should include:
- Phase 1: Research & Analysis (best-practices-researcher, agent-observability-platform)
- Phase 2: Planning & Coordination (agent-ecosystem-manager, meta-agent-creator, system-evaluator)
- Phase 3: Implementation (prompt-engineer, meta-agent-creator, code-reviewer) 
- Phase 4: Testing & Deployment (agent-tester, agent-ecosystem-manager)

Return a YAML workflow with all agents in proper sequence for comprehensive system maintenance, updates, and improvements."""
            
            # Return JSON to replace the prompt
            output = {
                "decision": "approve",
                "prompt_override": new_prompt,
                "reason": "Transforming /maintenance command into proper agent-selector workflow request"
            }
            
            print(json.dumps(output))
            sys.exit(0)
        
        # For all other prompts, let them pass through normally
        sys.exit(0)
        
    except Exception as e:
        # If anything goes wrong, let the original prompt pass through
        print(f"Hook error: {e}", file=sys.stderr)
        sys.exit(0)

if __name__ == "__main__":
    main()
