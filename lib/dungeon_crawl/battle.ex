defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character

  def fight(
    char_a = %{hit_points: char_a_hit_points},
    char_b = %{hit_points: char_b_hit_points}
    ) when char_a_hit_points == 0 or char_b_hit_points == 0, do: {char_a, char_b}

  def fight(char_a, char_b) do
    char_b_after_fight = attack(char_a, char_b)
    char_a_after_fight = attack(char_b_after_fight, char_a)

    fight(char_a_after_fight, char_b_after_fight)
  end

  defp attack(%{hit_points: hit_points_attacker}, defender) when hit_points_attacker == 0, do: defender
  defp attack(attacker, defender) do
    damage = Enum.random(attacker.damage_range)
    defender_after_attack = Character.take_damage(defender, damage)

    attacker
    |> attack_message(damage)
    |> IO.puts

    defender_after_attack
    |> receive_message(damage)
    |> IO.puts

    defender_after_attack
  end

  defp attack_message(%{name: "You"} = character, damage) do
    "You attack with a #{character.attack_description} and deal #{damage} damage"
  end

  defp attack_message(character, damage) do
    "#{character.name} attacks with #{character.attack_description} and deals #{damage} damage"

  end

  defp receive_message(%{name: "You"} = character, damage) do
    "You received #{damage} damage. Your HP: #{character.hit_points}"
  end

  defp receive_message(character, damage) do
    "#{character.name} receives #{damage} damage. #{character.name} HP: #{character.hit_points}"
  end
end