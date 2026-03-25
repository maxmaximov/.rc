# OpenCode Instructions for YouTrack

## Git Commit Rules

**IMPORTANT:** All commits must include attribution to the AI assistant.

Add the following line at the end of every commit message:

```
Generated with OpenCode (Claude)
```

## TeamCity Integration

- Build configurations are in project `YTDEV` (YouTrack Dev)
- Main test status build: `YTDEV_TestStatus`
- Always specify branch name when triggering builds

## Permissions Notes

After removal of `managePermissionsInYT` feature flag:
- `CONTRIBUTOR` role no longer includes `READ_USER_BASIC` or `READ_USER`
- Use `OBSERVER` role to grant user-reading permissions
- Use `findOrCreateDeveloperUser()` for users needing both roles

## Local Documentation

Research notes and analysis docs are stored in `/Users/maxmaximov/jb/youtrack/.docs/` (outside any worktree, shared across all branches). Check this directory when you need context about previously researched topics.
