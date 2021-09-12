defmodule Shortnr.UrlsTest do
  use Shortnr.DataCase

  alias Shortnr.Urls

  describe "urls" do
    alias Shortnr.Urls.Url

    import Shortnr.UrlsFixtures

    @invalid_attrs %{long_url: nil, short_url: nil}

    test "get_url!/1 returns the URL model with given short URL" do
      url = url_fixture()
      assert Urls.get_url!(url.short_url).short_url == url.short_url
    end

    test "create_url/1 with valid data creates a url" do
      valid_attrs = %{long_url: "http://www.foo.com", short_url: "abcd"}

      assert {:ok, %Url{} = url} = Urls.create_url(valid_attrs)
      assert url.long_url == "http://www.foo.com"
      assert url.short_url == "abcd"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_url(@invalid_attrs)
    end

    test "url format is valid" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_url(%{long_url: "www.foo.com"})
      assert {:ok, %Url{}} = Urls.create_url(%{long_url: "http://www.foo.com"})
      assert {:ok, %Url{}} = Urls.create_url(%{long_url: "https://www.foo.com"})
    end
  end
end
