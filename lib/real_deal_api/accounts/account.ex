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
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{hash_password: hash_password}} = changeset) do
    change(changeset, hash_password: Bcrypt.hash_pwd_salt(hash_password))
  end

  defp put_password_hash(changeset) , do: changeset
end
