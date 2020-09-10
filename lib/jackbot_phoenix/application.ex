defmodule JackbotPhoenix.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(JackbotPhoenix.Worker.Discord, [%{
        handler: JackbotPhoenix.Worker.Discord,
        token: Application.get_env(:jackbot_phoenix, :token)
      }]),
      JackbotPhoenix.Repo,
      JackbotPhoenixWeb.Telemetry,
      {Phoenix.PubSub, name: JackbotPhoenix.PubSub},
      JackbotPhoenixWeb.Endpoint,
      {JackbotPhoenix.Manager.Supervisor, []}
    ]

    opts = [strategy: :one_for_one, name: JackbotPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    JackbotPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
