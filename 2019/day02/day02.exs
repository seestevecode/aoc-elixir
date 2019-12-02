defmodule Day02 do
  defp import_parse(filename) do
    File.read!(filename)
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp process_step(list), do: process_step(list, 0)

  defp process_step(list, start_index) do
    [opcode, index_one, index_two, target | _] = Enum.drop(list, start_index)
    elem_one = Enum.at(list, index_one)
    elem_two = Enum.at(list, index_two)

    case opcode do
      1 ->
        List.replace_at(list, target, elem_one + elem_two)
        |> process_step(start_index + 4)

      2 ->
        List.replace_at(list, target, elem_one * elem_two)
        |> process_step(start_index + 4)

      99 ->
        list
    end
  end

  def run(noun, verb) do
    import_parse("input.txt")
    |> List.replace_at(1, noun)
    |> List.replace_at(2, verb)
    |> process_step()
    |> List.first()
  end

  def check(target) do
    for(n <- 0..99, v <- 0..99, run(n, v) == target, do: 100 * n + v)
    |> List.first()
  end
end

IO.puts("Part 1: #{Day02.run(12, 2)}")
IO.puts("Part 2: #{Day02.check(19_690_720)}")
