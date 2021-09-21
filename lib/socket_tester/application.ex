defmodule SocketTester.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SocketTesterWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SocketTester.PubSub},
      # Start the Endpoint (http/https)
      SocketTesterWeb.Endpoint,
      {Absinthe.Subscription, SocketTesterWeb.Endpoint}
      # Start a worker by calling: SocketTester.Worker.start_link(arg)
      # {SocketTester.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SocketTester.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SocketTesterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
