defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: []

  def all do
    [
      %Room{
        description: "Looks like a safe space to take a rest",
        actions: [forward(), rest()]
      }
    ]
  end
end