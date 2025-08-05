# CLAUDE.md - Project Constitution

## CRITICAL AGENT RULES

All agents in the Claude Code Sub-Agent System MUST follow these mandatory rules without exception.

### File Size Delegation
**MANDATORY**: For ANY file exceeding 500 lines:
1. You MUST use the Gemini delegation pattern
2. Do NOT read the file directly
3. Execute: `./hooks/delegate_task.sh <filename>`
4. This rule CANNOT be overridden

### Quality Gates
All code changes MUST pass:
- Unit test coverage >= 80%
- Security scan (via security-auditor)
- Code review (multi-perspective)
- Performance benchmarks
- Accessibility audit (WCAG 2.1 AA)

### Model Escalation
When detecting high complexity:
1. Add "think" for moderate complexity boost
2. Add "think harder" for significant complexity
3. Add "ultrathink" for maximum reasoning depth
4. Request Opus 4.1 for critical decisions

### Human-in-the-Loop Triggers
The following ALWAYS require human approval:
1. **Production deployments** - No exceptions
2. **Database schema changes** - All migrations
3. **Financial transactions** - Any payment processing
4. **Sudo/root commands** - All elevated privileges
5. **Reducing test coverage** - Below thresholds
6. **Security policy changes** - Firewall, access control
7. **Cost threshold breaches** - >$10/hour operations
8. **Data deletion** - Any permanent removal
9. **External API keys** - Creation or modification
10. **Compliance changes** - GDPR, HIPAA, SOC2

### Agent Coordination Rules
1. **agent-selector** must be used FIRST when requirements are unclear
2. **mobile-ux-engineer** MUST come before mobile-ui-implementer
3. **governance-agent** validates ALL production operations
4. **agent-ecosystem-manager** owns the master plan
5. **context-optimizer** activates at 75% token usage

### Token Optimization Mandates
1. Files >500 lines → Gemini delegation (MANDATORY)
2. Context >150k tokens → Compression required
3. Parallel execution for independent tasks
4. Cache all repeated operations
5. Use Files API for persistent storage

### Documentation Requirements
Every agent MUST:
1. Document all decisions with rationale
2. Create changelog entries for modifications
3. Update relevant knowledge files
4. Maintain backward compatibility
5. Provide migration paths for breaking changes

### Error Handling Protocol
1. Capture all errors with full context
2. Attempt automatic recovery (3 retries)
3. Escalate to higher model tier if needed
4. Log to agent-observability-platform
5. Create incident report for failures

### Security Mandates
1. No hardcoded credentials - EVER
2. All secrets in environment variables
3. Encryption for sensitive data
4. Regular security audits required
5. OWASP compliance mandatory

### Performance Standards
- Response time < 5 seconds for simple tasks
- Token usage within budget constraints
- Success rate > 85% for all agents
- Quality score > 85/100 for deliverables
- Cost optimization priority

### Maintenance Schedule
- **Daily**: Performance monitoring
- **Weekly**: agent-ecosystem-manager maintenance
- **Monthly**: Full system optimization
- **Quarterly**: Architecture review

## GOVERNANCE ENFORCEMENT

The **governance-agent** has VETO power over:
- Any production deployment
- Database modifications
- Financial operations
- Security changes
- Compliance violations

## SYSTEM HIERARCHY

1. **agent-ecosystem-manager** - Supreme authority
2. **governance-agent** - Policy enforcement
3. **master-orchestrator** - Project coordination
4. **agent-selector** - Entry point
5. All other agents - Specialized workers

## QUALITY THRESHOLDS

These thresholds CANNOT be lowered without human approval:

| Phase | Minimum Score | Enforcement |
|-------|---------------|-------------|
| Planning | 85/100 | Block progression |
| Development | 88/100 | Require review |
| Testing | 90/100 | Block deployment |
| Production | 95/100 | Prevent release |

## INCIDENT RESPONSE

When failures occur:
1. **incident-commander** takes immediate control
2. All agents pause non-critical operations
3. Focus shifts to resolution
4. Post-mortem required within 24 hours
5. Lessons learned added to knowledge base

## EVOLUTION PROTOCOL

System changes require:
1. Proposal from best-practices-researcher
2. Testing by agent-tester
3. Review by prompt-engineer
4. Approval from agent-ecosystem-manager
5. Gradual rollout with monitoring

## COMPLIANCE

This constitution is:
- **Immutable** without human approval
- **Enforced** by governance-agent
- **Monitored** by agent-observability-platform
- **Maintained** by agent-ecosystem-manager
- **Audited** weekly for compliance

---

*Last Updated: Version 2.1*
*Authority: agent-ecosystem-manager*
*Enforcement: governance-agent*
