# Packwerk Migration Checklist

## Completed Packs (9/27)

- [x] Pack 1: shared - 98 tests ✅
- [x] Pack 2: accounts - 216 tests ✅
- [x] Pack 3: users - 383 tests ✅
- [x] Pack 4: statuses - 197 tests ✅
- [x] Pack 5: notifications - 29 tests ✅
- [x] Pack 6: lists - 14 tests ✅
- [x] Pack 7: admin - 50 tests ✅
- [x] Pack 8: media - 15 tests ✅
- [x] Pack 9: filters - 23 tests ✅

**Total: 1,289 tests passing**

## Remaining Packs (18)

### High Priority

- [ ] Pack 10: announcements (Announcement, AnnouncementReaction, AnnouncementMute)
- [ ] Pack 11: tags (Tag, FeaturedTag, TagFollow)
- [ ] Pack 12: trends (Trends models and controllers)
- [ ] Pack 13: search (Search services and controllers)
- [ ] Pack 14: timelines (Feed, HomeFeed, timeline controllers)

### Medium Priority

- [ ] Pack 15: imports (BulkImport, BulkImportRow, Export, Backup)
- [ ] Pack 16: oauth (OauthApplication, OauthAccessToken, etc.)
- [ ] Pack 17: webhooks (Webhook models and controllers)
- [ ] Pack 18: instances (Instance, InstanceFilter, InstanceModerationNote)
- [ ] Pack 19: relays (Relay models and workers)
- [ ] Pack 20: follow_recommendations (FollowRecommendation, FollowRecommendationSuppression)

### Lower Priority

- [ ] Pack 21: markers (Marker model)
- [ ] Pack 22: encrypted_messages (EncryptedMessage, Device, etc.)
- [ ] Pack 23: preview_cards (PreviewCardProvider, PreviewCardTrend)
- [ ] Pack 24: site_settings (SiteUpload, Setting, etc.)
- [ ] Pack 25: email_blocks (CanonicalEmailBlock, EmailDomainBlock)
- [ ] Pack 26: identity (Identity, IdentityProvider)
- [ ] Pack 27: annual_reports (GeneratedAnnualReport, AnnualReport models)

## Remaining Models Count

- ~72 model files remaining in app/models/
- Multiple controller directories remaining
- Various service and worker files

## Notes

- All completed packs have zero packwerk violations
- All tests passing for completed packs
- Proper pre-commit hooks running (rubocop, prettier, haml-lint)
- Base classes (ApplicationRecord, ApplicationController, BaseService) remain in app/ due to boot dependencies
