defmodule DungeonCrawl.Room.Triggers.Armory do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Room
  alias DungeonCrawl.Character

  @dmg_stat_increase 1
  @hp_stat_increase 3

  def run(character, rooms, _) do
    char_after_gearing = character
                        |> increase_character_stats
                        |> increase_hit_points

    char_after_gearing |> Character.display_stats |> IO.puts

    IO.puts("\nYour base damage and max hit points were increased!\n")

    updated_rooms = rooms
                    |> increase_room_count(char_after_gearing.damage_range)

    IO.puts("\nRoom starts shaking...")
    ExPrompt.string("Press enter to continue")
    IO.puts("\nGround collapses!\nYou end up on a lower floor of the dungeon.")
    ExPrompt.string("Press enter to continue")

    {char_after_gearing, updated_rooms, :forward_from_treasure}
  end

  defp increase_character_stats(%{damage_range: lower_dmg_limit..high_dmg_limit} = character) do
    lower_dmg_limit = lower_dmg_limit + @dmg_stat_increase
    high_dmg_limit = high_dmg_limit + @dmg_stat_increase

    %{character | damage_range: lower_dmg_limit..high_dmg_limit}
  end

  defp increase_hit_points(%{max_hit_points: max_hit_points, hit_points: hit_points} = character) do
    %{character | max_hit_points: max_hit_points + @hp_stat_increase, hit_points: hit_points + @hp_stat_increase}
  end

  defp increase_room_count(rooms, damage_range) do
    new_rooms = damage_range |> Enum.min |> Room.add_rooms(Room.enemy_room)

    rooms ++ new_rooms
  end
end