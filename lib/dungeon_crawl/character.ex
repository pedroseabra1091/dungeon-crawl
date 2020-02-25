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

  def display_stats(character), do: "HP: #{character.hit_points} / #{character.max_hit_points}"

  defimpl String.Chars do
    def to_string(character), do: character.name
  end
end