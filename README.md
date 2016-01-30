# CurrentStreakEx

Get github current streak which support only public repositories.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add current_streak_ex to your list of dependencies in `mix.exs`:

        def deps do
          [{:current_streak_ex, "~> 0.1.0"}]
        end

# How to use

```elixir
iex> CurrentStreakEx.contributions("KazuCocoa") |> CurrentStreakEx.current_streak
4
```

```elixir
iex> CurrentStreakEx.contributions("KazuCocoa") |> CurrentStreakEx.latest_streak_day
"2016-01-30"
```

# License
MIT
