defmodule DungeonCrawl.CLI.HeroChoice do
  alias DungeonCrawl.Heroes
  alias DungeonCrawl.CLI.GenericChoice

  def start do
    IO.puts("\e[H\e[2J")
    IO.puts("Start by choosing your hero:")

    Heroes.all()
    |> GenericChoice.start
    |> confirm_hero
  end

  defp confirm_hero(chosen_hero) do
    IO.puts("\e[H\e[2J")
    IO.puts(chosen_hero.name)
    IO.puts(chosen_hero.description)

    if ExPrompt.yes?("Are you sure?"), do: chosen_hero, else: start()
  end
end