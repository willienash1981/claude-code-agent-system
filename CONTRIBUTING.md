# Contributing to Claude Code Sub-Agent System

We welcome contributions to the Claude Code Sub-Agent System! This document provides guidelines for contributing to the project.

## How to Contribute

### 1. Adding New Agents

To add a new agent:

1. Create a new markdown file in the `agents/` directory
2. Follow the agent template format:

```markdown
---
name: agent-name
description: Clear description of what this agent does
tools: list,of,required,tools
model: claude-sonnet-4-latest or claude-opus-4-latest
---

# Agent Name

Detailed description and instructions for the agent...
```

3. Update the agent count in documentation
4. Add the agent to relevant workflow patterns
5. Test the agent with agent-tester

### 2. Creating New Workflow Patterns

1. Add the pattern to `knowledge/workflows.json`
2. Include:
   - Pattern name and description
   - Agent sequence with execution type
   - Time and token estimates
   - Success rate metrics

### 3. Improving Existing Agents

1. Identify underperforming agents via metrics
2. Use prompt-engineer to optimize prompts
3. Test improvements with agent-tester
4. Document changes in changelog

### 4. Documentation Updates

- Keep SYSTEM_MASTER_PLAN.md current
- Update README.md for user-facing changes
- Maintain CLAUDE.md constitution
- Add examples to best practices

## Code of Conduct

### Be Respectful
- Treat all contributors with respect
- Welcome newcomers and help them get started
- Provide constructive feedback

### Quality Standards
- All agents must pass quality gates (85/100 minimum)
- Include comprehensive testing
- Document all changes
- Follow existing patterns and conventions

## Pull Request Process

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Update documentation
6. Submit a pull request with clear description

## Agent Design Principles

When creating or modifying agents:

1. **Single Responsibility**: Each agent should do one thing well
2. **Clear Communication**: Use precise, unambiguous language
3. **Error Handling**: Include robust error handling
4. **Token Efficiency**: Optimize for token usage
5. **Documentation**: Provide clear examples and usage instructions

## Testing Requirements

All contributions must:
- Pass agent-tester validation
- Include test cases
- Maintain >85% success rate
- Document edge cases

## Workflow Pattern Guidelines

New patterns should:
- Solve a real use case
- Be reusable across projects
- Include time/token estimates
- Have proven success rates
- Document prerequisites

## Documentation Standards

### Agent Documentation
- Clear purpose statement
- Tool requirements
- Model tier justification
- Usage examples
- Known limitations

### Workflow Documentation
- Use case description
- Agent sequence diagram
- Execution strategy (sequential/parallel)
- Resource estimates
- Success metrics

## Questions and Support

- Open an issue for bugs or feature requests
- Use discussions for questions
- Check existing issues before creating new ones
- Provide reproducible examples for bugs

## Recognition

Contributors will be recognized in:
- Release notes
- Contributors file
- System documentation

## Automated Improvements

The system can self-improve through:
- **best-practices-researcher**: Discovers new patterns
- **meta-agent-creator**: Creates optimized agents
- **agent-ecosystem-manager**: Maintains system health

These meta-agents may automatically:
- Optimize underperforming agents
- Create new agents for gaps
- Update documentation
- Improve workflows

## Version Management

- Follow semantic versioning
- Document breaking changes
- Provide migration guides
- Maintain backwards compatibility when possible

Thank you for contributing to make the Claude Code Sub-Agent System better!
