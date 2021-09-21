defmodule SocketTesterWeb.AbsintheSocket do
  # App.GraphqlSchema is your graphql schema
  use SubscriptionsTransportWS.Socket, schema: SocketTesterWeb.Schema, keep_alive: 1000

  # Callback similar to default Phoenix UserSocket
  @impl true
  def connect(params, socket) do
    {:ok, socket}
  end

  # Callback to authenticate the user
  @impl true
  def gql_connection_init(message, socket) do
    {:ok, socket}
  end
end
