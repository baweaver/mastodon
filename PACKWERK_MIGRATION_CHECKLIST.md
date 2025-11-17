# Packwerk Migration Checklist

## Completed Packs (11/27)

- [x] Pack 1: shared - 98 tests ✅
- [x] Pack 2: accounts - 216 tests ✅
- [x] Pack 3: users - 383 tests ✅
- [x] Pack 4: statuses - 197 tests ✅
- [x] Pack 5: notifications - 29 tests ✅
- [x] Pack 6: lists - 14 tests ✅
- [x] Pack 7: admin - 50 tests ✅
- [x] Pack 8: media - 15 tests ✅
- [x] Pack 9: filters - 23 tests ✅
- [x] Pack 10: tags - 105 tests ✅
- [x] Pack 11: announcements - 25 tests ✅

**Total: 1,419 tests passing**

## Remaining Packs (16)

### High Priority

- [ ] Pack 11: announcements - Announcement, AnnouncementReaction, AnnouncementMute, AnnouncementFilter + controllers
- [ ] Pack 12: trends - Trends, TagTrend, PreviewCardTrend + admin/trends/\* controllers
- [ ] Pack 13: timelines - Feed, HomeFeed, PublicFeed, LinkFeed, TagFeed + api/v1/timelines/\* controllers
- [ ] Pack 14: relationships - Follow, FollowRequest, Block, Mute, RelationshipFilter + relationship controllers

### Medium Priority

- [ ] Pack 15: imports_exports - BulkImport, BulkImportRow, Export, Backup + settings/exports, settings/imports
- [ ] Pack 16: oauth - Oauth* models + oauth/* controllers
- [ ] Pack 17: webhooks - Webhook + admin/webhooks, api/v1/admin/webhooks
- [ ] Pack 18: instances - Instance, InstanceFilter, InstanceModerationNote, UnavailableDomain + admin/instances
- [ ] Pack 19: relays - Relay + admin/relays
- [ ] Pack 20: follow_recommendations - FollowRecommendation\* models + controllers

### Lower Priority

- [ ] Pack 21: markers - Marker + api/v1/markers
- [ ] Pack 22: disputes - Appeal handling + disputes/\* controllers
- [ ] Pack 23: preview_cards - PreviewCardProvider + admin/trends/links/preview_card_providers
- [ ] Pack 24: site_settings - SiteUpload, Setting, ExtendedDescription, PrivacyPolicy, TermsOfService, SoftwareUpdate
- [ ] Pack 25: identity - Identity + auth/omniauth_callbacks
- [ ] Pack 26: annual_reports - GeneratedAnnualReport + annual_report/\* models
- [ ] Pack 27: activitypub - activitypub/_ controllers, well_known/_, activitypub services

## Detailed Remaining Work

### Standalone Models Needing Pack Assignment (68 files)

- AccountDeletionRequest, AccountDomainBlock, AccountModerationNote
- AccountRelationshipSeveranceEvent, RelationshipSeveranceEvent, SeveredRelationship
- AccountStatusesCleanupPolicy, AccountSuggestions, AccountWarning, AccountWarningPreset
- AsyncRefresh, CanonicalEmailBlock, ContentRetentionPolicy, Context
- Fasp, Quote, RemoteFollow, RuleTranslation, Search, Tombstone, Translation
- UsernameBlock, Web, WorkerBatch
- (Plus models in subdirectories: concerns/_, form/_, terms*of_service/*, trends/_, web/_, fasp/_, annual_report/_, account*suggestions/*)

### Controllers Still in app/controllers/

- activitypub/\* (outbox, collections, replies)
- api/v1/\* (many endpoints)
- api/v2/\* (some endpoints)
- concerns/\* (may stay as shared)
- disputes/_, oauth/_, redirect/_, well_known/_

### Services Still in app/services/

- activitypub/\* services
- Domain-specific services not yet categorized

### Workers Still in app/workers/

- Domain-specific workers
- scheduler/\* jobs
- Various service and worker files

## Notes

- All completed packs have zero packwerk violations
- All tests passing for completed packs
- Proper pre-commit hooks running (rubocop, prettier, haml-lint)
- Base classes (ApplicationRecord, ApplicationController, BaseService) remain in app/ due to boot dependencies
