defmodule ElixirQueueProcessor.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_queue_processor,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirQueueProcessor.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:broadway, "~> 0.6.0"},
      {:broadway_sqs, "~> 0.6.0"},
      {:hackney, "~> 1.17.4", override: true},
      {:broadway_kafka, "~> 0.1.1"},
      {:protobuf, "~> 0.10.0"},
      {:excontainers, "~> 0.3.0", only: [:dev, :test]},
      {:redix, "~> 1.1"}
      # {:castore, ">= 0.0.0"} # for connecting to redis over ssl
    ]
  end
end
