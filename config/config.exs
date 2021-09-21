# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :socket_tester, SocketTesterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wMtyPpFLY7PKInXO1Am1U1AkHuqvISR7wqi5ug7MniC/k7X8V8HyuIRX+CDIev7v",
  render_errors: [view: SocketTesterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SocketTester.PubSub,
  live_view: [signing_salt: "B909ZP9V"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
