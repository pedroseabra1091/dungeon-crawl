defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers.{Enemy, Exit}

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all do
    [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Exit
      },
      %Room{
        description: "A enemy is blocking your path.",
        actions: [forward()],
        trigger: Enemy
      },
      %Room{
        description: "A enemy is blocking your path.",
        actions: [forward()],
        trigger: Enemy
      },
      %Room{
        description: "A enemy is blocking your path.",
        actions: [forward()],
        trigger: Enemy
      },
      %Room{
        description: "A enemy is blocking your path.",
        actions: [forward()],
        trigger: Enemy
      }
    ]
  end
end