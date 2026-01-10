# MangosTool - Item Management for cMaNGOS

A World of Warcraft addon for cMaNGOS server administrators that provides an enhanced loot browser with item generation capabilities.

## Features

- **Enhanced Loot Browser**: Browse all game items using AtlasLoot integration
- **Direct Item Generation**: Left-click any item to instantly add it to your backpack
- **Item Transfer**: Right-click items to send them directly to another player's backpack
- **Search Functionality**: Quickly find items by name
- **Quick Look Presets**: Save favorite loot tables for quick access
- **Visual Feedback**: Hover effects on items for better UX

## Requirements

- World of Warcraft 1.12.x (Vanilla)
- cMaNGOS server with GM permissions
- **AtlasLoot addon** (must be installed separately) - Compatible with AtlasLoot Enhanced or similar versions for Vanilla WoW

## Installation

1. Install AtlasLoot if not already installed (download from your preferred addon repository)
2. Extract the MangosTool folder to your `World of Warcraft/Interface/AddOns/` directory
3. Restart World of Warcraft or type `/reload` in-game
4. The addon will automatically load on login

## Usage

1. Open the addon with `/mangostool` or `/mt`
2. Browse items using the loot table menus or search functionality
3. **Left-click** an item to add it to your backpack
4. **Right-click** an item to open a context menu with additional options:
   - Add to my backpack
   - Give to player (opens submenu to enter player name)

### GM Commands

The addon uses cMaNGOS GM commands in the background:
- `.additem <itemID> 1` - Adds item to your backpack
- `.additem <itemID> 1 <playerName>` - Sends item to another player

Make sure you have the appropriate GM permissions to use these commands.

## Version

Current version: 2.0

## Changes from v1.x

- Removed Teleport module (no longer needed)
- Removed GM Commands module (simplified)
- Enhanced item interaction with left/right click handlers
- Improved UI with better visual feedback
- Streamlined interface focusing on item management

## License

This addon is provided as-is for use with cMaNGOS private servers.

