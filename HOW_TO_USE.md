# HOW TO USE THE AGENT SYSTEM

## Important: Agent-Selector is a RECOMMENDATION System

The agent-selector **ONLY provides recommendations** - it does not execute tasks. Here's the correct workflow:

### Step 1: Get Recommendations
```
Use agent-selector to [describe your task]
```

The agent-selector will return a YAML recommendation like:
```yaml
recommendation:
  workflow: "hotfix"
  agents:
    - phase: "Triage"
      agents: [incident-commander]
    - phase: "Debug" 
      agents: [debugger, backend-developer]
    - phase: "Deploy"
      agents: [deployment-engineer]
```

### Step 2: Manually Invoke Recommended Agents

You must then **manually invoke each recommended agent** with specific instructions:

```
Use incident-commander to analyze the production issue with memory usage
```

Then:
```
Use debugger to find the root cause of the memory leak
```

Then:
```
Use backend-developer to fix the identified memory leak
```

Finally:
```
Use deployment-engineer to deploy the fix to production
```

## Why This Two-Step Process?

1. **Separation of Concerns**: agent-selector focuses on planning, other agents focus on execution
2. **Flexibility**: You can modify the workflow based on intermediate results
3. **Control**: You maintain control over what gets executed when
4. **Clarity**: Each agent has a single, clear responsibility

## Common Workflows

### Web Application Development
1. Get recommendation: `Use agent-selector to build a React dashboard`
2. Execute phases:
   - `Use requirements-analyst to define dashboard requirements`
   - `Use system-architect to design the architecture`
   - `Use frontend-developer to build the React components`
   - `Use backend-developer to create the API`
   - `Use test-automator to create tests`
   - `Use deployment-engineer to deploy`

### Mobile App Development
1. Get recommendation: `Use agent-selector to create a fitness app`
2. Execute phases:
   - `Use mobile-ux-engineer to create app structure (no styling)`
   - `Use mobile-ui-implementer to add visual design`
   - `Use html-to-native-converter to create native code`

### Bug Fixing
1. Get recommendation: `Use agent-selector to fix production bug`
2. Execute phases:
   - `Use incident-commander to coordinate response`
   - `Use debugger to find root cause`
   - `Use appropriate developer to fix`
   - `Use deployment-engineer to deploy fix`

## Agent Invocation Patterns

### Sequential Execution
Execute agents one after another:
```
agent1 → agent2 → agent3
```

### Parallel Execution
Execute multiple agents simultaneously:
```
frontend-developer + backend-developer + database-architect
```

### Conditional Execution
Choose agents based on results:
```
If frontend issue → frontend-developer
If backend issue → backend-developer
```

## Important Notes

1. **agent-selector NEVER executes tasks** - it only recommends
2. **Each agent must be invoked separately** with specific instructions
3. **Follow the recommended order** for best results
4. **Some workflows have mandatory sequences** (e.g., mobile UX before UI)
5. **Quality gates must be met** before proceeding to next phase

## Troubleshooting

If agent-selector is trying to execute tasks instead of just recommending:
- It's misconfigured - it should ONLY return YAML recommendations
- Check that it has the correct tools (only read_file, search_files)
- Ensure it's not trying to write files or execute commands

If agents aren't working as expected:
- Verify each agent is invoked with clear, specific instructions
- Check that previous phases completed successfully
- Ensure quality gates are met
- Review the workflow sequence

## Example: Complete Task Flow

**User Request**: "Build a task management API"

**Step 1 - Get Recommendation**:
```
Use agent-selector to build a task management API
```

**agent-selector returns**:
```yaml
recommendation:
  workflow: "api_creation"
  agents:
    - phase: "Design"
      agents: [api-architect]
    - phase: "Implementation"  
      agents: [backend-developer]
    - phase: "Testing"
      agents: [test-automator]
```

**Step 2 - Execute Workflow**:
```
Use api-architect to design REST API for task management with CRUD operations
```
→ Returns API specification

```
Use backend-developer to implement the API using the specification from api-architect
```
→ Returns implemented code

```
Use test-automator to create comprehensive tests for the task management API
```
→ Returns test suite

**Result**: Complete, tested API ready for deployment

---

Remember: The power of this system is in its specialized agents working together, not in any single agent trying to do everything!
