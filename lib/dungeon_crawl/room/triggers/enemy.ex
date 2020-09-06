defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Enemies
  alias DungeonCrawl.Battle

  def run(character, rooms, _) do
    enemy = Enum.random(Enemies.all)

    IO.puts(enemy.description)
    IO.puts("The enemy #{enemy.name} is ready for battle")
    ExPrompt.string("\nPress enter to start combat\n")
    IO.puts("You were prepared and attack first")

    {updated_char, _enemy} = Battle.fight(character, enemy)

    {updated_char,  rooms, :forward}
  end
end