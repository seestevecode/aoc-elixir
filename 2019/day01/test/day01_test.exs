defmodule Day01Test do
  use ExUnit.Case

  test "calculate basic fuel" do
    assert Day01.basic_fuel(12) == 2
    assert Day01.basic_fuel(100756) == 33583
  end

  test "calculate complex fuel" do
    assert Day01.complex_fuel(14) == 2
    assert Day01.complex_fuel(1969) == 966
    assert Day01.complex_fuel(100756) == 50346
  end
end
