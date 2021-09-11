defmodule Shortnr.UrlsTest do
  use Shortnr.DataCase

  alias Shortnr.Urls

  describe "urls" do
    alias Shortnr.Urls.Url

    import Shortnr.UrlsFixtures

    @invalid_attrs %{long_url: nil, short_url: nil}

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Urls.list_urls() == [url]
    end

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

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      update_attrs = %{long_url: "some updated long_url", short_url: "some updated short_url"}

      assert {:ok, %Url{} = url} = Urls.update_url(url, update_attrs)
      assert url.long_url == "some updated long_url"
      assert url.short_url == "some updated short_url"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Urls.update_url(url, @invalid_attrs)
      assert url == Urls.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Urls.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Urls.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Urls.change_url(url)
    end
  end
end
