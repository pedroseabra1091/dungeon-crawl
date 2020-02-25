defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Heroes
  alias DungeonCrawl.CLI.BaseCommand

  require IEx

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = Heroes.all()
    find_hero_by_index = &(Enum.at(heroes, &1))

    heroes
    |> Enum.map(&(&1.name))
    |> BaseCommand.display_options
    |> BaseCommand.generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp parse_answer(answer) do
    pick = BaseCommand.parse_answer(answer)

    cond do
      pick in 0..2 -> pick
      true -> randomize_hero()
    end
  end

  defp randomize_hero do
    Shell.info("You little prick, trying to find loop holes in my dungeon are you?")
    :timer.sleep 1500
    Shell.info("Stop testing my patience! Pick again!")
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