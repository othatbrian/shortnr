defmodule ShortnrWeb.RedirectControllerTest do
  use ShortnrWeb.ConnCase

  @create_attrs %{long_url: "http://www.example.com", short_url: "abcd"}
  @invalid_attrs %{long_url: nil, short_url: nil}

  describe "redirect" do
    test "succeeds when short URL is valid", %{conn: conn} do
      post(conn, Routes.url_path(conn, :create), url: @create_attrs)

      conn = get(conn, @create_attrs[:short_url])
      assert redirected_to(conn) == @create_attrs[:long_url]
    end
  end
end
