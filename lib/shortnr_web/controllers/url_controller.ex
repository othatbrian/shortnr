defmodule ShortnrWeb.UrlController do
  use ShortnrWeb, :controller

  alias Shortnr.Urls
  alias Shortnr.Urls.Url

  def new(conn, _params) do
    changeset = Urls.change_url(%Url{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"url" => url_params}) do
    case Urls.create_url(url_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Url created successfully.")
        |> redirect(to: Routes.url_path(conn, :new))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Urls.get_url!(id)
    render(conn, "show.html", url: url)
  end
end
