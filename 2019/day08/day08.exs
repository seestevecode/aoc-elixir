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

  defp get_visible_pixel(layered_pixels) do
    Enum.drop_while(layered_pixels, fn x -> x == 2 end) |> List.first()
  end

  def part_two do
    import_parse("input.txt")
    |> Enum.chunk_every(25 * 6)
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&get_visible_pixel/1)
    |> Enum.chunk_every(25)
  end

  # TODO: Properly render the output for part two
end

IO.puts("Part one: #{Day08.part_one()}")
IO.puts("Part two:\n")
IO.inspect(Day08.part_two())
