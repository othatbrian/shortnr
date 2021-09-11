defmodule Shortnr.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls, primary_key: false) do
      add :short_url, :string, null: false, primary_key: true
      add :long_url, :text, null: false

      timestamps()
    end

    create unique_index(:urls, :long_url)
  end
end
