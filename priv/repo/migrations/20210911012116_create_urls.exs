defmodule Shortnr.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls, primary_key: false) do
      add :short_url, :string, null: false
      add :long_url, :string, null: false, primary_key: true

      timestamps()
    end

    create unique_index(:urls, :short_url)
  end
end
