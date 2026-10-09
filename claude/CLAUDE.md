## VoltAgent Subagents
All agents can use VoltAgent subagents for specialized tasks. When appropriate:
- Spawn VoltAgent subagents for domain-specific work (language specialists, infra experts, etc.)
- Use `/agents` to activate subagent manager or request subagent assistance explicitly
- Install via: `claude plugin install voltagent-lang` (or appropriate category)
- VoltAgent agents are in `~/.claude/agents/` for global access

## Wiki Knowledge Base
Path: ~/dev/claude-obsidian

When you need context not already in this project:
1. Read wiki/hot.md first (recent context cache)
2. If not enough, read wiki/index.md
3. If you need domain details, read the relevant domain sub-index
4. Only then drill into specific wiki pages

Do NOT read the wiki for general coding questions or tasks unrelated to [domain].
