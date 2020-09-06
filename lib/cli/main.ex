defmodule DungeonCrawl.CLI.Main do
  alias DungeonCrawl.CLI.HeroChoice
  alias DungeonCrawl.CLI.RoomActionsChoice
  alias DungeonCrawl.CLI.HeroChoice
  alias DungeonCrawl.CLI.RoomActionsChoice
  alias DungeonCrawl.Room
  alias DungeonCrawl.Character

  def main(_args \\ []) do
    welcome_message()
    ExPrompt.string("Press enter to continue")
    move(hero_choice(), Room.all)
  end

  defp welcome_message do
    IO.puts("\n== Dungeon Crawl ==\n")
    IO.puts("You awake in a dungeon full of monsters")
    IO.puts("You need to survive and find the exit")
  end

  def move(%{hit_points: 0}, _) do
    ExPrompt.string("Press enter to continue")
    IO.puts("\nYou are severly wounded, you can't keep walking.")
    IO.puts("With no strength left, you fall onto the ground.")
    IO.puts("Game over! ")
  end

  def move(character, rooms) do
    IO.puts("\nYou keep moving to the next room")
    ExPrompt.string("Press enter to continue")
    IO.puts("\e[H\e[2J")

    IO.inspect("#{Character.display_hp(character)}")

    rooms
    |> Enum.random
    |> RoomActionsChoice.start
    |> trigger_action(character, rooms)
    |> handle_action_result
  end

  defp hero_choice do
    chosen_hero = HeroChoice.start()
    %{chosen_hero | name: "You"}
  end

  defp trigger_action({room, action}, character, rooms) do
    IO.puts("\e[H\e[2J")
    room.trigger.run(character, rooms, action)
  end

  defp handle_action_result({_, :exit}), do: IO.puts("Seems somehow you found the exit. Leave this place at once!")
  defp handle_action_result({character, rooms, _}), do: move(character, rooms)
end