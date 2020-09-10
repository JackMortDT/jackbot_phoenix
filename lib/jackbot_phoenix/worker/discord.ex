defmodule JackbotPhoenix.Worker.Discord do
  @moduledoc """

  """
  require Logger

  alias JackbotPhoenix.Util.ProcessMessageUtil
  alias JackbotPhoenix.Manager.SendMessagesManager
  alias DiscordEx.Client

  def start_link(otps \\ [] ) do
    Client.start_link(otps)
  end

  def handle_event({:message_create, payload}, state) do
    Logger.info("Author: #{payload.data["author"]["username"]} ")
    if !payload.data["author"]["bot"] do
      SendMessagesManager.manage_messages(payload, state)
    end
    {:ok, state}
  end

  def handle_event({_event, _payload}, state) do
    {:ok, state}
  end

end