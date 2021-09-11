defmodule ShortnrWeb.UrlControllerTest do
  use ShortnrWeb.ConnCase

  @create_attrs %{long_url: "some long_url", short_url: "some short_url"}
  @invalid_attrs %{long_url: nil, short_url: nil}

  describe "new url" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.url_path(conn, :new))
      assert html_response(conn, 200) =~ "New Url"
    end
  end

  describe "create url" do
    test "redirects to new when data is valid", %{conn: conn} do
      conn = post(conn, Routes.url_path(conn, :create), url: @create_attrs)
      assert redirected_to(conn) == Routes.url_path(conn, :new)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.url_path(conn, :create), url: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Url"
    end
  end
end
