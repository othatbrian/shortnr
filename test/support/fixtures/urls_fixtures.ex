defmodule Shortnr.UrlsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shortnr.Urls` context.
  """

  @doc """
  Generate a url.
  """
  def url_fixture(attrs \\ %{}) do
    {:ok, url} =
      attrs
      |> Enum.into(%{
        long_url: "http://www.foo.com",
        short_url: "abcd"
      })
      |> Shortnr.Urls.create_url()

    url
  end
end
