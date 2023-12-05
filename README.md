# DungeonCrawl

Terminal text based Dungeon Crawl game to pratice topics lectured in Elixir Session #1.

### Features
- Hero picking system. The system should present 3 classes (e.g: warrior, assassin, wizard);

- Battle system;

- Forward action that ables players to walk from room to room;

- Rooms with enemies to fight and a exit to trigger the game winning condition.

- Treasure room that when found would increase the hero damage range by 1 (both lower and upper limit). In addition, would add X amount of enemy rooms, where X is the lower damage range limit from the selected hero.

### Setup guide

1. Fetch all dependencies: `mix deps.get`

2. Start game: `mix start`

#### Other relevant actions
- Start game inside an IEX instance by calling `DungeonCrawl.CLI.Main.main`

- Generate executable with `mix escript.build`
