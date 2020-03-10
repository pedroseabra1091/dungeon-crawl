defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room

  @callback run(character :: %Character{}, rooms :: list(%Room{}), action :: atom()) :: tuple()
end