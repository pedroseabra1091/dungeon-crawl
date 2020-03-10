defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, _rooms, _), do: {character, :exit}
end