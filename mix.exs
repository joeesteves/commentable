defmodule Commentable.MixProject do
  use Mix.Project

  def project do
    [
      app: :commentable,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
     {:ecto_sql, "~> 3.0"},
     {:postgrex, ">= 0.0.0"}

    ]
  end

   defp description() do
    "Add commentable capabilities to your schemas straight away"
  end

  def package do
    [
      name: "commentable",
      links: %{"GitHub" => "https://github.com/ponyesteves/commentable"},
      licenses: ["MIT"]
    ]
  end

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
