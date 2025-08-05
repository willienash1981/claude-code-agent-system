# Best Practices for Claude Code Sub-Agent System

## Strategic Implementation

### 1. Start with Discovery
- ALWAYS begin with agent-selector when unsure
- Let it analyze requirements and recommend workflows

### 2. Token Optimization
- Delegate files >500 lines to Gemini
- Use context-optimizer for long projects
- Leverage parallel execution

### 3. Quality Gates
- Planning: 85/100 minimum
- Development: 88/100 minimum
- Deployment: 90/100 minimum

### 4. Governance
- ALL production deployments need approval
- Database changes require review
- Financial operations need authorization

## Common Patterns

### Web Application
1. Start: agent-selector --pattern full_stack_app
2. Planning: requirements → architecture
3. Development: parallel frontend/backend
4. Testing: comprehensive suite
5. Deployment: staged rollout

### Mobile Application
1. Start: mobile-ux-engineer (NEVER skip)
2. Multiple UI variations in parallel
3. Convert best design to native
4. Test on actual devices

### Emergency Response
1. incident-commander takes control
2. Parallel debugging and analysis
3. Rapid fix and test
4. Immediate deployment with rollback ready
