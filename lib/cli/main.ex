defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.CLI.HeroChoice
  alias DungeonCrawl.CLI.RoomActionsChoice
  alias DungeonCrawl.Room
  alias DungeonCrawl.Character

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

  def move(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.info("You are severly wounded, you can't keep walking.")
    Shell.info("With no strength left, you fall onto the ground.")
    Shell.info("Game over! ")
    Shell.prompt("")
  end

  def move(character, rooms) do
    Shell.info("You keep moving to the next room")
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")

    Shell.info("#{Character.display_stats(character)}")

    rooms
    |> Enum.random
    |> RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  defp hero_choice do
    chosen_hero = HeroChoice.start()
    %{chosen_hero | name: "You"}
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}), do: Shell.info("Seems somehow you found the exit. Leave this place at once!")
  defp handle_action_result({character, _}), do: move(character, Room.all)
end