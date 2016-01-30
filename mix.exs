defmodule CurrentStreakEx.Mixfile do
  use Mix.Project

  def project do
    [app: :current_streak_ex,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8"},
      {:floki, "~> 0.7"}
    ]
  end
end
