defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias DungeonCrawl.CLI.BaseCommand

  def start(room) do
    IO.puts(room.description)

    find_room_actions_by_index = &(Enum.at(room.actions, &1))

    chosen_action =
      room.actions
      |> BaseCommand.display_options
      |> BaseCommand.generate_question
      |> ExPrompt.string
      |> BaseCommand.parse_answer
      |> parse_answer(room)
      |> find_room_actions_by_index.()

    {room, chosen_action}
  end

  defp parse_answer(0, _room), do: 0
  defp parse_answer(_, room), do: start(room)
end