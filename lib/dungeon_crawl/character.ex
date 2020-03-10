defmodule DungeonCrawl.Character do
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  def take_damage(target_character, damage) do
    new_hit_points = max(0, target_character.hit_points - damage)
    %{target_character | hit_points: new_hit_points}
  end

  def heal(target_character, heal) do
    new_hit_points = min(target_character.max_hit_points, target_character.hit_points + heal)
    %{target_character | hit_points: new_hit_points}
  end

  def display_hp(character), do: "HP: #{character.hit_points} / #{character.max_hit_points}"

  def display_stats(character) do
    display_hp(character) <> "\n" <> display_dmg_range(character)
  end

  defp display_dmg_range(character), do: "Damage Range: #{character.damage_range}"

  defimpl String.Chars, for: Range do
    def to_string(damage_range), do: damage_range |> inspect
  end

  defimpl String.Chars do
    def to_string(character), do: character.name
  end
end