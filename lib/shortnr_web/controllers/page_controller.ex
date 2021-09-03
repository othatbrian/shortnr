defmodule ShortnrWeb.PageController do
  use ShortnrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
