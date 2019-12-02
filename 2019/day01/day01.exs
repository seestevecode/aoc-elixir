defmodule Day01 do
  defp import_parse(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp calc_fuel(mass) do
    div(mass, 3) - 2
  end

  def part_one(filename) do
    import_parse(filename)
    |> Enum.map(&calc_fuel/1)
    |> Enum.sum()
  end

  defp calc_all_fuel(mass) do
    calc_all_fuel(mass, 0)
  end

  defp calc_all_fuel(mass, accumulator) do
    fuel = calc_fuel(mass)

    if fuel > 0 do
      calc_all_fuel(fuel, accumulator + fuel)
    else
      accumulator
    end
  end

  def part_two(filename) do
    import_parse(filename)
    |> Enum.map(&calc_all_fuel/1)
    |> Enum.sum()
  end
end

IO.puts("Part 1: #{Day01.part_one("input.txt")}")
IO.puts("Part 2: #{Day01.part_two("input.txt")}")
