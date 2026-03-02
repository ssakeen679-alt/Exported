# Roblox Game Example - Complete Hierarchy & Scripts

## 📋 Project Overview

This is a complete example Roblox game hierarchy with functional scripts demonstrating core game development patterns. It includes player management, combat systems, UI, NPCs, and more.

---

## 🗂️ Folder Structure

```
RobloxGameExample/
│
├── 📁 ServerScripts/
│   ├── PlayerManager.lua          [Server Script]
│   ├── GameManager.lua            [Server Script]
│   └── CombatSystem.lua           [Server Script]
│
├── 📁 LocalScripts/
│   ├── 📁 CharacterScripts/
│   │   ├── CharacterHealth.lua    [Local Script]
│   │   ├── Movement.lua           [Local Script]
│   │   └── Combat.lua             [Local Script]
│   │
│   └── 📁 PlayerScripts/
│       ├── ClientUI.lua           [Local Script]
│       └── InputHandler.lua       [Local Script]
│
├── 📁 ModuleScripts/
│   ├── Constants.lua              [Module Script]
│   ├── Utilities.lua              [Module Script]
│   ├── SpawnManager.lua           [Module Script]
│   └── MapManager.lua             [Module Script]
│
├── 📁 WorkspaceScripts/
│   ├── 📁 NPCs/
│   │   ├── BasicNPC.lua           [Script - Place on NPC]
│   │   └── NPCSpawner.lua         [Module Script]
│   │
│   └── 📁 Maps/
│       └── (Map-related scripts)
│
└── README.md                      [Documentation]
```

---

## 📜 Script Descriptions

### Server-Side Scripts (ServerScriptService)

#### **PlayerManager.lua**
- Runs when players join the game
- Creates player data structure with stats (Level, Experience, Gold)
- Cleans up data when players leave
- **Key Functions:**
  - `onPlayerAdded()` - Initialize new player
  - `onPlayerRemoved()` - Cleanup on disconnect

#### **GameManager.lua**
- Controls overall game state (Lobby, Running, Intermission)
- Manages game rounds and timing
- Teleports players to spawn locations
- Checks minimum player count before starting
- **Key Variables:**
  - `GameState` - Current game phase
  - `RoundDuration` - How long each round lasts
  - `LobbyWaitTime` - Time before round starts

#### **CombatSystem.lua**
- Module that handles combat interactions
- Manages damage, healing, and death
- Shared across multiple scripts
- **Key Functions:**
  - `DamageCharacter()` - Apply damage to a character
  - `HealCharacter()` - Restore health
  - `IsAlive()` - Check if character is alive

---

### Character Scripts (StarterCharacterScripts)

These scripts run automatically for every character that spawns.

#### **CharacterHealth.lua**
- Initializes character health system
- Monitors health changes
- Handles character death
- Uses `DEFAULT_HEALTH` constant from Constants module

#### **Movement.lua**
- Handles player movement input (W/A/S/D)
- Sets walk speed from constants
- Processes jump input (Space bar)
- Tracks which keys are currently pressed

#### **Combat.lua**
- Handles attack input (E key)
- Checks for enemies within attack range (20 studs)
- Calculates damage with critical hit chance
- **Attack Mechanics:**
  - Base Damage: 25
  - Cooldown: 1 second
  - Critical Multiplier: 1.5x
  - Critical Chance: 20%

---

### Player Scripts (StarterPlayerScripts)

These run once per player when they join.

#### **ClientUI.lua**
- Creates main UI elements
- Displays health bar at top-left
- Shows info panel at top-right with controls
- Displays real-time health text
- **UI Elements:**
  - Health Bar (green fill on gray background)
  - Control Info Panel
  - Health Counter Text

#### **InputHandler.lua**
- Manages mouse and keyboard input
- Tracks player input states
- Allows ability selection with number keys (1-4)
- Handles mouse clicks for future expansion
- Provides global input state tracking

---

### Shared Modules (ReplicatedStorage/Modules)

Available to both client and server scripts.

#### **Constants.lua**
- Centralized game settings
- Character stats (walk speed, health, jump power)
- Combat values (damage, critical chance)
- Leveling constants
- Team colors
- **Used by:** Nearly all other scripts

#### **Utilities.lua**
- Helper functions used across the game
- **Key Functions:**
  - `RandomInt()` - Generate random numbers
  - `Round()` - Round to decimal places
  - `TableContains()` - Check table membership
  - `DeepCopy()` - Clone tables with nesting
  - `FormatTime()` - Convert seconds to MM:SS
  - `TweenPart()` - Smooth part movement

---

### Workspace Scripts

#### **SpawnManager.lua** (Maps/)
- Manages player spawn points
- Cycles through spawn locations
- Ensures players spawn at different positions
- **Spawn Points:**
  - (-50, 5, 0)
  - (50, 5, 0)
  - (0, 5, 50)
  - (0, 5, -50)

#### **MapManager.lua** (Maps/)
- Defines map boundaries and properties
- Manages hazards and objectives
- Checks if players go out of bounds
- Applies damage to out-of-bounds players
- **Map Size:** 200x100x200 studs

#### **BasicNPC.lua** (NPCs/)
- Individual NPC behavior script
- Implements patrol and combat
- Searches for nearby players
- Attacks when players are in range
- Respawns health and attack variables
- **Properties:**
  - Attack Range: 15 studs
  - Patrol Range: 50 studs

#### **NPCSpawner.lua** (NPCs/)
- Spawns NPCs at intervals
- Manages NPC pool (max 10 active)
- Cleans up dead NPCs
- **NPC Types:**
  - Goblin (30 HP, 8 DMG, 14 speed)
  - Orc (60 HP, 15 DMG, 10 speed)
  - Skeleton (40 HP, 12 DMG, 12 speed)

---

## 🎮 Game Controls

| Control | Action |
|---------|--------|
| W/A/S/D | Move character |
| Space | Jump |
| E | Attack nearby enemies |
| 1-4 | Select ability |
| Left Click | (Expandable) |
| Right Click | (Expandable) |

---

## 🔄 Game Flow

```
1. Player Joins
   ├─ PlayerManager creates player data
   ├─ Character spawns
   ├─ CharacterHealth initializes
   ├─ Movement system activates
   ├─ Combat system ready
   ├─ ClientUI appears
   └─ InputHandler listens

2. Game Running
   ├─ Players move and attack
   ├─ Combat checks deal damage
   ├─ NPCs spawn and patrol
   ├─ Health bars update
   └─ Round timer counts down

3. Character Dies
   ├─ Health reaches 0
   ├─ CharacterHealth detects death
   ├─ 2-second delay
   └─ Character destroyed (respawns)

4. Round Ends
   ├─ GameManager ends round
   ├─ Intermission starts
   ├─ Players respawn
   └─ Next round begins
```

---

## 💡 Key Design Patterns

### Server-Client Architecture
- **Server:** Game logic, combat, player management
- **Client:** UI, input, visual feedback

### Module Pattern
- Reusable code in `ReplicatedStorage`
- Requires pattern for dependencies
- Easy to extend and maintain

### Event-Driven
- `PlayerAdded`, `PlayerRemoving` events
- `Humanoid.Died` for character deaths
- Input events for player actions

### Object-Oriented
- Scripts act as classes
- Return tables with methods
- Shared state management

---

## 🔧 How to Use in Roblox Studio

### Script Placement Guide

| Folder | Roblox Location | Script Type |
|--------|-----------------|------------|
| **ServerScripts/** | ServerScriptService | Server Scripts |
| **LocalScripts/PlayerScripts/** | StarterPlayer > StarterPlayerScripts | Local Scripts |
| **LocalScripts/CharacterScripts/** | StarterPlayer > StarterCharacterScripts | Local Scripts |
| **ModuleScripts/** | ReplicatedStorage > Modules | Module Scripts |
| **WorkspaceScripts/NPCs/** | Workspace > (NPC Models) | Scripts/Modules |

### Setup Steps

1. **Create Folders in Roblox Studio:**
   - ServerScriptService (already exists)
   - StarterPlayer → StarterPlayerScripts
   - StarterPlayer → StarterCharacterScripts
   - ReplicatedStorage → Modules
   - Workspace → (place NPC scripts directly on NPC models)

2. **Copy Scripts:**
   - Place `ServerScripts/` contents into **ServerScriptService**
   - Place `LocalScripts/PlayerScripts/` contents into **StarterPlayerScripts**
   - Place `LocalScripts/CharacterScripts/` contents into **StarterCharacterScripts**
   - Place `ModuleScripts/` contents into **ReplicatedStorage/Modules**
   - Place `WorkspaceScripts/` scripts into their respective objects

3. **Test:**
   - Play the game with multiple players
   - Check Output console for errors
   - Verify UI appears and controls work

### Customization

2. **To Expand:**
   - Add new abilities in `LocalScripts/CharacterScripts/Combat.lua`
   - Create new systems in `ServerScripts/`
   - Add UI elements in `LocalScripts/PlayerScripts/ClientUI.lua`
   - Extend NPC behavior in `WorkspaceScripts/NPCs/BasicNPC.lua`

3. **To Customize:**
   - Adjust constants in `ModuleScripts/Constants.lua`
   - Modify spawn points in `SpawnManager.lua`
   - Change NPC stats in `NPCSpawner.lua`
   - Update control keys in movement scripts

---

## 📊 Game Constants

| Constant | Value | Purpose |
|----------|-------|---------|
| WALK_SPEED | 16 | Player movement speed |
| DEFAULT_HEALTH | 100 | Starting player health |
| ATTACK_COOLDOWN | 1 | Seconds between attacks |
| BASE_DAMAGE | 25 | Damage per attack |
| CRITICAL_CHANCE | 0.2 (20%) | Chance for critical hit |
| CRITICAL_DAMAGE_MULTIPLIER | 1.5 | Damage multiplier for crits |
| MAX_PLAYERS | 10 | Maximum concurrent players |
| ROUND_DURATION | 300 | 5 minutes per round |

---

## 🚀 Future Enhancements

- [ ] Inventory system
- [ ] Shop/Trading system
- [ ] Ability trees
- [ ] PvE dungeons
- [ ] Leaderboards
- [ ] Chat system
- [ ] Team-based gameplay
- [ ] Leveling progression
- [ ] Equipment system
- [ ] Quest system

---

## 📝 Notes

- All Lua scripts use Roblox's API
- Scripts assume standard character models
- Some functionality is simplified for learning
- Extend as needed for production games
- Test with multiple simultaneous players

---

## 📄 License

This example project is provided for educational purposes.

Created: March 2, 2026
