defmodule Shortnr.Urls.Url do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:short_url, :string, autogenerate: false}
  @derive {Phoenix.Param, key: :short_url}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "urls" do
    field :long_url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:short_url, :long_url])
    |> validate_required([:short_url, :long_url])
    |> validate_format(:long_url, ~r/^https?:\/\//, message: "URL must contain 'http://' or 'https://'")
  end
end
