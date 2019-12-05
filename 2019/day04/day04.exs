defmodule Day04 do
  def has_consec?([_]), do: false

  def has_consec?([first, second | rest]) do
    if first == second, do: true, else: has_consec?([second | rest])
  end

  def has_descender?([_]), do: false

  def has_descender?([first, second | rest]) do
    if first > second, do: true, else: has_descender?([second | rest])
  end

  def conditions_met?(list), do: has_consec?(list) and not has_descender?(list)

  def number_ok?(number), do: Integer.digits(number) |> conditions_met?()

  def check_part1(from, to) do
    Enum.filter(Enum.to_list(from..to), fn x -> number_ok?(x) end)
    |> Enum.count()
  end
end

IO.puts("Part 1: #{Day04.check_part1(245_182, 790_572)}")
