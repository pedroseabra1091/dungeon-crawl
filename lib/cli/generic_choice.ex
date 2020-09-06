defmodule DungeonCrawl.CLI.GenericChoice do
  alias DungeonCrawl.CLI.BaseCommand

  def start(resources) do
    find_resource_by_index = &(Enum.at(resources, &1))

    resources
    |> BaseCommand.display_options
    |> BaseCommand.generate_question
    |> ExPrompt.string
    |> BaseCommand.parse_answer
    |> parse_answer(resources)
    |> find_resource_by_index.()
  end

  defp parse_answer(answer, resources) when answer in 0..length(resources), do: answer
  defp parse_answer(_answer, resources), do: start(resources)
end
