defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.CLI.HeroChoice
  alias DungeonCrawl.CLI.RoomActionsChoice
  alias DungeonCrawl.Room

  def start_game do
    welcome_message()
    Shell.prompt("Press enter to continue")
    move(hero_choice(), Room.all)
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters")
    Shell.info("You need to survive and find the exit")
  end

  def move(character, rooms) do
    Shell.info("You keep moving to the next room")
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")

    rooms
    |> Enum.random
    |> RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  defp hero_choice, do: HeroChoice.start()

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}), do: Shell.info("Seems somehow you found the exit. Leave this place at once!")
  defp handle_action_result({character, _}), do: move(character, Room.all)
end