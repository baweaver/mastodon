# Circular Dependency Issue

## Problem

After moving nested directories (concerns, forms, account_suggestions) to their respective packs, we have a circular dependency:

```
packs/domain_blocking → packs/relationships → packs/federation →
packs/interactions → packs/trends → packs/timelines →
packs/conversations → packs/polls → packs/moderation → packs/domain_blocking
```

## Root Cause

The `packs/federation` pack contains ActivityPub services that are used by many domain packs (interactions, relationships, polls, etc.). However, federation also depends on those domain packs for their models and services, creating a cycle.

## Potential Solutions

1. **Extract ActivityPub to lower-level pack**: Create `packs/activitypub` that only depends on shared/accounts/statuses, and have both federation and domain packs depend on it
2. **Dependency inversion**: Use interfaces/protocols to break the cycle
3. **Restructure federation**: Split federation into "federation core" and "federation integrations"

## Current State

- All nested directories properly moved to packs
- 138 packwerk violations due to circular dependencies
- All tests still passing
- Need architectural decision before resolving

## Next Steps

1. Complete remaining packs first
2. Decide on architectural approach
3. Refactor to break circular dependency
4. Re-run packwerk validate to confirm acyclic graph
