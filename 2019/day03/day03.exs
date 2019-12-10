defmodule Day03 do
  def import_parse(filename) do
    File.read!(filename) |> String.split("\n", trim: true)
  end

  def add_points(instruction, path) do
    {last_x, last_y} = List.last(path)

    [direction, distance] =
      String.split(
        instruction,
        ~r/.{1}/,
        include_captures: true,
        parts: 2,
        trim: true
      )

    distance = String.to_integer(distance)
    dup_x = List.duplicate(last_x, distance)
    dup_y = List.duplicate(last_y, distance)

    new_points =
      case direction do
        "U" -> Enum.zip(dup_x, (last_y + 1)..(last_y + distance))
        "R" -> Enum.zip((last_x + 1)..(last_x + distance), dup_y)
        "D" -> Enum.zip(dup_x, (last_y - 1)..(last_y - distance))
        "L" -> Enum.zip((last_x - 1)..(last_x - distance), dup_y)
        _ -> []
      end

    path ++ new_points
  end

  def create_path(instructions, start_point) do
    instructions
    |> String.split(",", trim: true)
    |> List.foldl(List.wrap(start_point), &add_points/2)
    |> MapSet.new()
  end

  def manhatten_distance({from_x, from_y}, {to_x, to_y}) do
    abs(to_x - from_x) + abs(to_y - from_y)
  end

  def manhatten_to_start(from), do: manhatten_distance(from, {0, 0})

  def part_one(filename) do
    [path1_instr, path2_instr] = import_parse(filename)
    path1 = create_path(path1_instr, {0, 0})
    path2 = create_path(path2_instr, {0, 0})

    MapSet.intersection(path1, path2)
    |> MapSet.to_list()
    |> List.delete({0, 0})
    |> Enum.map(&manhatten_to_start/1)
    |> Enum.min(fn -> 0 end)
  end
end

IO.puts("Part 1: #{Day03.part_one("input.txt")}")