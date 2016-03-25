defmodule Utility.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :count, :integer

      timestamps
    end
  end
end
