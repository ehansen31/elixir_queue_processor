defmodule ElixirQueueProcessor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirQueueProcessor.Worker.start_link(arg)
      # {ElixirQueueProcessor.Worker, arg}
      # {ElixirQueueProcessor, []},
      {BroadwayExample, []},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
