defmodule AdventOfCode.Day01 do
  def part1(nil) do
    input = AdventOfCode.Input.get!(1)
    part1(input)
  end

  def part1(input) do
    [left, right] = split_into_lists(input)

    Enum.zip(left, right)
    |> Enum.map(fn {left, right} -> abs(left - right) end)
    |> Enum.sum()
  end

  def part2(nil) do
    input = AdventOfCode.Input.get!(1)
    part2(input)
  end

  def part2(input) do
    [left_list, right_list] = split_into_lists(input)

    right_list_frequencies = Enum.frequencies(right_list)

    left_list
    |> Enum.frequencies_by(fn left_element ->
      case Enum.member?(right_list, left_element) do
        true -> left_element
        false -> nil
      end
    end)
    |> Map.reject(fn
      {nil, _} -> true
      _ -> false
    end)
    |> Enum.map(fn {number, num_left_list_frequency} ->
      num_right_list_frequency =
        case Map.get(right_list_frequencies, number) do
          nil -> 0
          value -> value
        end

      number * num_left_list_frequency * num_right_list_frequency
    end)
    |> Enum.sum()
  end

  defp split_into_lists(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn values ->
      values
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
    |> Tuple.to_list()
    |> Enum.map(&Enum.sort/1)
  end
end
