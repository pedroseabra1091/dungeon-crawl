defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger

  alias Mix.Shell.IO, as: Shell
  alias DungeonCrawl.Enemies
  alias DungeonCrawl.Battle

  def run(character, _) do
    enemy = Enum.random(Enemies.all)

    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} is ready for battle")
    Shell.info("You were prepared and attack first")

    {updated_char, _enemy} = Battle.fight(character, enemy)

    {updated_char, :forward}
  end
end