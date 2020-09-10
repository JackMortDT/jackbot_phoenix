use Mix.Config

config :jackbot_phoenix,
  ecto_repos: [JackbotPhoenix.Repo]

# Configures the endpoint
config :jackbot_phoenix, JackbotPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bEHjZscMrxdFF9texBjVNLiFloTiSpwG9IKVm9GXcDM1TVyECgKTERT5W4wXNfef",
  render_errors: [view: JackbotPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: JackbotPhoenix.PubSub,
  live_view: [signing_salt: "IiGhtd1n"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Tokens
config :jackbot_phoenix, token: System.get_env("DISCORD_TOKEN")

# Discord
config :jackbot_phoenix, discord_prefix: "!"

config :porcelain, goon_warn_if_missing: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
