# Advent of Code 2024

There are 25 modules, 25 tests, and 50 mix tasks.

1. Fill in the tests with the example solutions.
1. Write your implementation.
1. Fill in the final problem inputs into the mix task and run `mix d01.p1`!
    - Benchmark your solution by passing the `-b` flag, `mix d01.p1 -b`

```elixir
defmodule AdventOfCode.Day01 do
  def part1(args) do
  end

  def part2(args) do
  end
end
```

```elixir
defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  @tag :skip # Make sure to remove to run your test.
  test "part1" do
    input = nil
    result = part1(input)

    assert result
  end

  @tag :skip # Make sure to remove to run your test.
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
```

```elixir
defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 1"
  def run(args) do
    input = AdventOfCode.Input.get!(1, 2020)

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
```

### Optional Automatic Input Retriever

To get the input from AoC automatically, simply put your session cookie
into a environment variable called ADVENT_OF_CODE_SESSION_COOKIE (see .env.example)

After which, you can retrieve your inputs using the module:

```elixir
day = 1
year = 2020
AdventOfCode.Input.get!(day, year)
# or just have it auto-detect the current year
AdventOfCode.Input.get!(8)
# and if your input somehow gets mangled and you need a fresh one:
AdventOfCode.Input.delete!(7, 2019)
# and the next time you `get!` it will download a fresh one -- use this sparingly!
```

## Installation

Clone this repo, run `mix deps.get` inside the folder and get running
