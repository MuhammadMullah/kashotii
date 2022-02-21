defmodule KashotiiWeb.PageController do
  use KashotiiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
