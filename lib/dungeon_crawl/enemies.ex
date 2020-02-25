defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character

  def all do
    [%Character{
      name: "Ogre",
      description: "Bulked creature with veigns popping from every inch of his body. Equipped with a heavy vest and iron hammer.",
      hit_points: 12,
      max_hit_points: 12,
      attack_description: "Hammer slam",
      damage_range: 3..5,
    },
    %Character{
      name: "Goblin",
      description: "Small and frail creature. Wears torn clothes and rusty dagger.",
      hit_points: 4,
      max_hit_points: 4,
      attack_description: "Dagger thrust",
      damage_range: 1..2,
    },
    %Character{
      name: "Orc",
      description: "Battle tested creature, equppiped with a leather vest and steel morning star.",
      hit_points: 8,
      max_hit_points: 8,
      attack_description: "Morning star lunge",
      damage_range: 2..4,
    }]
  end
end