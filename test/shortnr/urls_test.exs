defmodule Shortnr.UrlsTest do
  use Shortnr.DataCase

  alias Shortnr.Urls

  describe "urls" do
    alias Shortnr.Urls.Url

    import Shortnr.UrlsFixtures

    @invalid_attrs %{long_url: nil, short_url: nil}

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Urls.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      valid_attrs = %{long_url: "some long_url", short_url: "some short_url"}

      assert {:ok, %Url{} = url} = Urls.create_url(valid_attrs)
      assert url.long_url == "some long_url"
      assert url.short_url == "some short_url"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_url(@invalid_attrs)
    end
  end
end
