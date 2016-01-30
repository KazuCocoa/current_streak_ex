defmodule CurrentStreakEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :current_streak_ex,
      version: "0.1.0",
      elixir: "~> 1.0",
      name: "CurrentStreakEx",
      source_url: "https://github.com/KazuCocoa/current_streak_ex",
      description: "Get github current streak which support only public repositories.",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      package: package
    ]
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

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE),
      maintainers: ["Kazuaki Matsuo"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/KazuCocoa/current_streak_ex"}
    ]
  end
end
