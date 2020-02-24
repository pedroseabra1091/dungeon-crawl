defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Heroes

  require IEx

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = Heroes.all()
    find_hero_by_index = &(Enum.at(heroes, &1))

    heroes
    |> Enum.map(&(&1.name))
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.map(fn {option, index} -> Shell.info("#{index} - #{option}") end)
  end

  defp generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one of these mighty heroes will you pick? [#{options}]"
  end

  defp parse_answer(answer) do
    pick = case Integer.parse(answer) do
      {pick, _} -> pick
      :error -> 0
    end

    cond do
      pick in 1..3 -> pick - 1
      true -> randomize_hero()
    end
  end

  defp randomize_hero do
    Shell.info("You little prick, trying to find loop holes in my dungeon are you?")
    :timer.sleep 1500
    Shell.info("Back to the beginning...pick again!")
    :timer.sleep 1500
    start()
  end

  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.name)
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end