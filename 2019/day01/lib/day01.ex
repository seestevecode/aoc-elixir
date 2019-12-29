defmodule Day01 do
  @spec basic_fuel(integer) :: integer
  def basic_fuel(mass), do: div(mass, 3) - 2

  @spec complex_fuel(integer, integer) :: integer
  def complex_fuel(mass, acc) do
    fuel = basic_fuel(mass)
    if(fuel > 0, do: complex_fuel(fuel, fuel + acc), else: acc)
  end

  @spec complex_fuel(integer) :: integer
  def complex_fuel(mass), do: complex_fuel(mass, 0)
end
