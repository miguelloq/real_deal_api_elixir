defmodule RealDealApi.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :eamil, :string
    field :hash_password, :string
    has_one :user, RealDealApi.Users.User
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:eamil, :hash_password])
    |> validate_required([:eamil, :hash_password])
    |> validate_format(:eamil,~r/^[^\s]+@[^\s]+$/,message: "must have the @ sign and no spaces")
    |> validate_length(:eamil,max: 160)
    |> unique_constraint(:eamil)
  end
end
