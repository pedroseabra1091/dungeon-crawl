defmodule DungeonCrawl.Room.Trigger do
  @callback run(character :: any, action :: any) :: any
end