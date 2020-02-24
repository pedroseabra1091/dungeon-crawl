defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Heroes

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = Heroes.all()

    heroes
    |> Enum.map(&(&1.name))
    |> display_options
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.map(fn {option, index} -> Shell.info("#{index} - #{option}") end)
  end
end