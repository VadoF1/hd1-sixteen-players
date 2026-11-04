# 16 Players (early test build)

Raises the HELLDIVERS player limit from 4 to 16 and scales the enemies to
the player count.

## Install

1. Drag the `.zip` onto the mod list in Obsidian.
2. Switch the mod on and pick the **Camera** option:
   - **Free (Recommended)**, the default: each machine follows its own
     player(s). When you have no living player, left/right cycles through
     the others.
   - **Shared**: the vanilla camera, one view that follows everyone.
3. Deploy, then start the game.

## Playing together

- **Every player needs this mod, the same version and the same camera
  option.** The game's network data changes, so a player without it crashes
  when a fifth player joins. Obsidian's "allow session mods" switch is not
  enough on its own.
- Modded lobbies only find each other: the mod tags the game build with its
  version and camera mode, on top of Obsidian's own matchmaking pool.
- Use Steam invites if the lobby browser shows nothing.

## What changes with more than 4 players

- Enemy points, alive-enemy cap (64 at 16 players), patrol count and rate,
  and encounter caps scale with the player count; per-type caps (one IFV
  patrol, heavy units per extermination wave) are lifted.
- Bug and illuminate bosses summon their adds once per 4 players, and boss
  fights no longer stop summoning at 6 enemies.
- HUD, loadout, load and end screens fit 16 players, your own first.
- Up to four players can share a ship hellpod.
- Respawns land at the reinforce point.
- Off-screen arrows point the right way for far-away players.
- The camera no longer jumps to a thrown reinforce beacon.
- Options menu: a colour for your own name in the player panels.
- Proving Grounds is off, and its support weapons are hidden in the armory.

At 4 or fewer players the game plays as vanilla.

## Load order and Obsidian

- Put this mod at the **bottom** of the load order: it replaces 15 game
  scripts and the network data, and the mod lower in the list wins.
- Every change is always on, whatever Obsidian decides about the lobby.
  Obsidian switches a session mod's hooks off on any machine whose lobby
  it has not cleared, and it works that out on each machine from every
  player's whole set of session mods, so in 0.7.0 a host with one extra mod
  ran the vanilla camera and spawns while the joiners ran the mod's. The
  mod's own version tag already keeps every player in a lobby on the same
  16 Players build, so nothing is gained by switching parts off.

## Known limits

- This is a test build. Report crashes with the game log and the mod's log
  (`%APPDATA%\Arrowhead\Helldivers\ObsidianModManager\logs`).
