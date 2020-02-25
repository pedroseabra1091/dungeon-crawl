defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.CLI.HeroChoice
  alias DungeonCrawl.CLI.RoomActionsChoice
  alias DungeonCrawl.Room

  def start_game do
    welcome_message()
    Shell.prompt("Press enter to continue")
    hero_choice()
    move(Room.all)
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters")
    Shell.info("You need to survive and find the exit")
  end

  def move(rooms) do
    Shell.info("You keep moving to the next room")
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")

    rooms
    |> Enum.random
    |> RoomActionsChoice.start
  end

  defp hero_choice, do: HeroChoice.start()
end