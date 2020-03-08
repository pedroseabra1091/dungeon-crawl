defmodule DungeonCrawl.CLI.HeroChoice do
  alias DungeonCrawl.Heroes
  alias DungeonCrawl.CLI.BaseCommand

  def start do
    IO.puts("\e[H\e[2J")
    IO.puts("Start by choosing your hero:")

    heroes = Heroes.all()
    find_hero_by_index = &(Enum.at(heroes, &1))

    heroes
    |> BaseCommand.display_options
    |> BaseCommand.generate_question
    |> ExPrompt.string
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
    IO.puts("You little prick, trying to find loop holes in my dungeon are you?")
    :timer.sleep 1500
    IO.puts("Stop testing my patience! Pick again!")
    :timer.sleep 1500
    start()
  end

  defp confirm_hero(chosen_hero) do
    IO.puts("\e[H\e[2J")
    IO.puts(chosen_hero.name)
    IO.puts(chosen_hero.description)

    if ExPrompt.yes?("Are you sure?"), do: chosen_hero, else: start()
  end
end