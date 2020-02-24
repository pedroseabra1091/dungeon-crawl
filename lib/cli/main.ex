defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.CLI.HeroChoice

  def start_game do
    welcome_message()
    Shell.prompt("Press enter to continue")
    hero_choice()
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ==")
    Shell.info("You awake in a dungeon full of monsters")
    Shell.info("You need to survive and find the exit")
  end

  defp hero_choice, do: HeroChoice.start()
end