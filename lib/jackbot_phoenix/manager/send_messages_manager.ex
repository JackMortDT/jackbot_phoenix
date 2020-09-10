defmodule JackbotPhoenix.Manager.SendMessagesManager do
  use GenServer
  require Logger
  alias JackbotPhoenix.Util.ProcessMessageUtil

  def start_link(otps \\ []) do
    GenServer.start_link(__MODULE__, otps, [name: __MODULE__])
  end

  def manage_messages(payload, state_data) do
    GenServer.cast(__MODULE__, {:manage_messages, payload, state_data})
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast({:manage_messages, payload, state_data}, state) do
    IO.puts "LLegué"
    ProcessMessageUtil.process_message(payload, state_data)
    {:noreply, state}
  end

end