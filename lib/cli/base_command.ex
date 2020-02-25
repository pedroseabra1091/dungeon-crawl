defmodule DungeonCrawl.CLI.BaseCommand do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.map(fn {option, index} -> Shell.info("#{index} - #{option}") end)
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]"
  end

  def parse_answer(answer) do
    pick = case Integer.parse(answer) do
      {pick, _} -> pick - 1
      :error -> -1
    end
  end
end