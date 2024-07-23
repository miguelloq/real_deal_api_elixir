defmodule RealDealApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :eamil, :string
      add :hash_password, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:accounts,[:eamil])
  end
end
