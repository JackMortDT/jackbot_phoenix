defmodule JackbotPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :jackbot_phoenix,
    adapter: Ecto.Adapters.Postgres
end
