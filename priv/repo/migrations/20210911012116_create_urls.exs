defmodule Shortnr.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :short_url, :string
      add :long_url, :string

      timestamps()
    end
  end
end
