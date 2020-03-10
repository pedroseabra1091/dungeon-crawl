defmodule DungeonCrawl.CLI.HeroChoice do
  alias DungeonCrawl.Heroes
  alias DungeonCrawl.CLI.BaseCommand

  require IEx

  def start do
    IO.puts("\e[H\e[2J")
    IO.puts("Start by choosing your hero:")

    heroes = Heroes.all()
    find_hero_by_index = &(Enum.at(heroes, &1))

    heroes
    |> BaseCommand.display_options
    |> BaseCommand.generate_question
    |> ExPrompt.string
    |> BaseCommand.parse_answer
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp parse_answer(answer) when answer in 0..2, do: answer
  defp parse_answer(_answer), do: start()

  defp confirm_hero(chosen_hero) do
    IO.puts("\e[H\e[2J")
    IO.puts(chosen_hero.name)
    IO.puts(chosen_hero.description)

    if ExPrompt.yes?("Are you sure?"), do: chosen_hero, else: start()
  end
end