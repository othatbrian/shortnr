defmodule Shortnr.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls, primary_key: false) do
      add :short_url, :string
      add :long_url, :string

      timestamps()
    end

    unique_index(:urls, :short_url)
    unique_index(:urls, :long_url)
  end
end
