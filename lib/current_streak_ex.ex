defmodule CurrentStreakEx do
  alias Floki
  alias HTTPoison

  @scheme "https://"
  @github_domain "github.com"
  @contribution_path "/users/:user/contributions"

  @spec contributions(binary) :: binary
  def contributions(user) do
    contribution_url = @scheme <> @github_domain <> String.replace(@contribution_path, ":user", user)
    HTTPoison.get!(contribution_url)
    |> Map.get(:body)
  end

  @spec current_streak(binary) :: integer | nil
  def current_streak(html) do
    html
    |> days
    |> filter("data-count")
    |> Enum.find_index(fn x -> x == 0 end)
  end

  @spec latest_streak_day(binary) :: binary | nil
  def latest_streak_day(html) do
    html
    |> days
    |> filter("data-date")
    |> List.first
  end

  defp days(html), do: html |> Floki.find(".day")

  defp filter(tuples, "data-count") do
    tuples
    |> Enum.reduce([], fn {_, day, _}, acc ->
      Enum.into(acc, [Enum.filter(day, fn x ->
        elem(x, 0) == "data-count"
      end)
      |> hd
      |> elem(1)
      |> String.to_integer
      ])
    end)
  end

  defp filter(tuples, "data-date") do
    tuples
    |> Enum.reduce([], fn {_, day, _}, acc ->
      Enum.into(acc, [Enum.filter(day, fn x ->
        elem(x, 0) == "data-date"
      end)
      |> hd
      |> elem(1)
      ])
    end)
  end
end
