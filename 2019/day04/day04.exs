defmodule Day04 do
  def has_descender?([first, second | rest]) do
    if first > second, do: true, else: has_descender?([second | rest])
  end

  def has_descender?([_]), do: false

  def count_groups(num) do
    Integer.digits(num) |> Enum.chunk_by(& &1) |> Enum.map(&Enum.count/1)
  end

  def valid_p1?(num) do
    not has_descender?(Integer.digits(num)) and
      Enum.any?(count_groups(num), &(&1 >= 2))
  end

  def valid_p2?(num) do
    not has_descender?(Integer.digits(num)) and
      Enum.any?(count_groups(num), &(&1 == 2))
  end

  def check(from, to, valid_fun) do
    Enum.to_list(from..to) |> Enum.filter(valid_fun) |> Enum.count()
  end
end

IO.puts("Part 1: #{Day04.check(245_182, 790_572, &Day04.valid_p1?/1)}")
IO.puts("Part 2: #{Day04.check(245_182, 790_572, &Day04.valid_p2?/1)}")
