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
      |> parse_answer
      |> find_room_actions_by_index.()

    {room, chosen_action}
  end

  defp parse_answer(answer) do
    pick = BaseCommand.parse_answer(answer)

    cond do
      pick in 0..2 -> pick
      true -> randomize_action()
    end
  end

  def randomize_action do
    IO.puts("You little prick, trying to find loop holes in my dungeon are you?")
    :timer.sleep(1500)
    IO.puts("I will decide your fate!")
    Enum.random(0..2)
  end
end