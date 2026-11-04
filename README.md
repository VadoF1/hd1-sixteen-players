# 16 Players

Up to 16 players in one game, with enemies scaled to the player count. Every player in the lobby needs this mod, the same version and the same camera option. Keep it at the bottom of the Obsidian load order.

A mod for HELLDIVERS (2015), packaged for [ObsidianModManager](https://github.com/Alomare/ObsidianModManager).

## Install

Download `vado.sixteen-players-<version>.zip` from the latest [release](../../releases/latest) and drop it onto Obsidian's mod list, then deploy.

## Updates

`mod/obsidian.json` names this repository as its `source`, so Obsidian shows an update button for it and offers each newer release.

## Releasing a new version

1. Replace the files in `mod/` with the new build.
2. Raise `version` in `mod/obsidian.json` and add a `## <version>` section to `CHANGELOG.md`.
3. Commit, then tag and push: `git tag v<version> && git push origin main v<version>`.

The Release workflow checks the tag against `obsidian.json`, zips `mod/` as `vado.sixteen-players-<version>.zip` and publishes the release. Never change the mod `id`.
