# System Maintenance Workflow

## Trigger Options
- **Slash Command**: `/maintenance` (in Claude Code)
- **Traditional Prompt**: `"Execute system maintenance workflow for the Claude Code Agent System"`

## Workflow Description
This workflow uses existing agents in sequence to perform comprehensive system maintenance, updates, and improvements without creating redundant capabilities.

## Agent Execution Sequence

### Phase 1: Research & Analysis
```yaml
step_1:
  agent: "best-practices-researcher"
  task: "Research latest development trends, tools, and patterns that could improve our agent system"
  purpose: "Identify improvement opportunities and industry changes"
  output: "Research findings and recommendations"

step_2:
  agent: "agent-observability-platform" 
  task: "Analyze current system performance, agent success rates, and identify bottlenecks"
  purpose: "Assess current system health and performance"
  output: "Performance metrics and system health report"
```

### Phase 2: Planning & Coordination  
```yaml
step_3:
  agent: "agent-ecosystem-manager"
  task: "Review research findings and performance data, create improvement plan"
  purpose: "Coordinate system-wide improvements and maintain architectural integrity" 
  output: "System improvement plan and priority list"

step_4:
  agent: "meta-agent-creator"
  task: "Identify gaps where new agents are needed based on improvement plan"
  purpose: "Determine if new specialized agents should be created"
  output: "New agent specifications or modification requirements"

step_5:
  agent: "system-evaluator"
  task: "Apply common sense validation to all proposed changes and improvements"
  purpose: "CRITICAL SAFETY GATE - Prevent well-intentioned changes from breaking the working system"
  output: "Approved, rejected, or modified proposals with detailed rationale"
```

### Phase 3: Implementation (APPROVED CHANGES ONLY)
```yaml
step_6:
  agent: "prompt-engineer"
  task: "Optimize existing agent prompts based on APPROVED improvements only"
  purpose: "Improve agent performance using validated enhancements"
  output: "Updated agent specifications with enhanced prompts"

step_7:
  agent: "meta-agent-creator"  
  task: "Create APPROVED new agents only (rejected proposals are not implemented)"
  purpose: "Extend system capabilities for validated requirements only"
  output: "New agent files and specifications for approved agents"

step_8:
  agent: "code-reviewer"
  task: "Review all APPROVED agent modifications for quality and consistency"
  purpose: "Ensure high quality and maintain system standards"
  output: "Validated agent updates and quality assessment"
```

### Phase 4: Testing & Deployment
```yaml
step_9:
  agent: "agent-tester"
  task: "Test all APPROVED modified and new agents for functionality"
  purpose: "Validate system works properly after validated updates"
  output: "Test results and validation report"

step_10:
  agent: "agent-ecosystem-manager"
  task: "Deploy APPROVED and TESTED changes, update system documentation, commit changes, and create release"
  purpose: "Deploy validated improvements and update system version"
  output: "Updated documentation, Git commits, and new release"
```

## Implementation Instructions

### For User:
1. **Option 1**: Type `/maintenance` in Claude Code
2. **Option 2**: Copy and paste: `"Execute system maintenance workflow for the Claude Code Agent System"`
3. The workflow will execute in sequence automatically
4. Total time: 30-60 minutes depending on scope of updates

### Expected Outcomes:
- ✅ System updated with latest industry best practices
- ✅ Performance bottlenecks identified and resolved  
- ✅ New agents created for identified capability gaps
- ✅ Existing agents optimized and improved
- ✅ Documentation updated and system released to GitHub
- ✅ All changes tested and validated

## Workflow Benefits

### Leverages Existing Capabilities:
- **No Redundancy**: Uses specialized agents for their intended purposes
- **Proper Delegation**: Each agent handles what they do best
- **Systematic Approach**: Comprehensive coverage without duplication
- **Quality Assurance**: Built-in testing and validation steps

### Maintains Agent Architecture:
- **Single Responsibility**: Each agent has one clear purpose
- **No Sub-Agent Calls**: Workflow orchestrated at user level
- **Proper Sequencing**: Logical flow from research to implementation
- **Human Oversight**: User initiates and monitors the process
- **Safety Gate**: system-evaluator prevents breaking changes

This workflow pattern enables true system self-maintenance while respecting the existing agent architecture and avoiding redundancy.
