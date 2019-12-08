defmodule Day08 do
  defp import_parse(filename) do
    File.read!(filename)
    |> String.trim()
    |> String.to_integer()
    |> Integer.digits()
  end

  defp count_digits(list, digit) do
    Enum.filter(list, fn x -> x == digit end) |> Enum.count()
  end

  defp count_zeros(list), do: count_digits(list, 0)

  def part_one do
    layers = import_parse("input.txt") |> Enum.chunk_every(25 * 6)

    fewest_zeros = Enum.map(layers, &count_zeros/1) |> Enum.min(fn -> 0 end)

    low_zero_layer =
      Enum.filter(layers, fn layer -> count_zeros(layer) == fewest_zeros end)
      |> List.flatten()

    count_digits(low_zero_layer, 1) * count_digits(low_zero_layer, 2)
  end
end

IO.puts("Part one: #{Day08.part_one()}")
