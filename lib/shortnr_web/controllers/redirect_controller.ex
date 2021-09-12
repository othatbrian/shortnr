defmodule ShortnrWeb.RedirectController do
  use ShortnrWeb, :controller

  alias Shortnr.Urls

  def show(conn, %{"short_url" => short_url}) do
    url = Urls.get_url!(short_url)
    conn
    |> redirect(external: url.long_url)
  end
end
