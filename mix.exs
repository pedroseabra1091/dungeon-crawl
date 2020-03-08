defmodule DungeonCrawl.MixProject do
  use Mix.Project

  def project do
    [
      app: :dungeon_crawl,
      version: "0.1.0",
      escript: escript(),
      embed_elixir: true,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp escript do
    [main_module: DungeonCrawl.CLI.Main]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_prompt, "~> 0.1.5"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
