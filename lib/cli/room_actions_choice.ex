defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias DungeonCrawl.CLI.GenericChoice

  def start(room) do
    IO.puts(room.description)

    chosen_action = room.actions
                    |> GenericChoice.start

    {room, chosen_action}
  end
end
