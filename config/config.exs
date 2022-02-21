# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kashotii,
  ecto_repos: [Kashotii.Repo]

# Configures the endpoint
config :kashotii, KashotiiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y+SaPPI2+F4BMg+rI0SzrfHI8Z7mby2HbGX7hfP03REa/91RKzNkgZQ4sqN4Hpld",
  render_errors: [view: KashotiiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Kashotii.PubSub,
  live_view: [signing_salt: "4hBRuX0w"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
