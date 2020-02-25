defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.CLI.BaseCommand

  require IEx

  def start(room) do
    Shell.info(room.description)

    find_room_actions_by_index = &(Enum.at(room.actions, &1))

    chosen_action =
      room.actions
      |> BaseCommand.display_options
      |> BaseCommand.generate_question
      |> Shell.prompt
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
    Shell.info("You little prick, trying to find loop holes in my dungeon are you?")
    :timer.sleep(1500)
    Shell.info("I will decide your fate!")
    Enum.random(0..2)
  end
end