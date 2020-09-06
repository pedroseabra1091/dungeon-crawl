defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers.{Armory, Enemy, Exit}

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do: add_rooms(6, enemy_room()) ++ add_rooms(2, treasure_room()) ++ add_rooms(1, exit_room())

  def add_rooms(amount_of_rooms, room_type) do
    Enum.map(0..amount_of_rooms, fn _ -> room_type end)
  end

  def enemy_room do
    %Room{
      description: "A enemy is blocking your path.",
      actions: [forward()],
      trigger: Enemy
    }
  end

  defp treasure_room do
    %Room{
      description: "The room ahead is filled with gear. You found a armory!",
      actions: [forward()],
      trigger: Armory
    }
  end

  defp exit_room do
    %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Exit
    }
  end
end