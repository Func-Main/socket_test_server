defmodule SocketTesterWeb.PageController do
  use SocketTesterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
