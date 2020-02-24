defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all do
    [%Character{
      name: "Warrior",
      description: "Consistent damage and strong defese",
      hit_points: 18,
      max_hit_points: 18,
      attack_description: "Axe cleave",
      damage_range: 4..6
    },
    %Character{
      name: "Assassin",
      description: "High variability of attack damage",
      hit_points: 12,
      max_hit_points: 12,
      attack_description: "Saber slash",
      damage_range: 1..10
    },
    %Character{
      name: "Wizard",
      description: "Strong attack but low health",
      hit_points: 8,
      max_hit_points: 8,
      attack_description: "Destructive fireball",
      damage_range: 6..10
    }]
  end
end