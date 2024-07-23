defmodule RealDealApiWeb.Auth.Guardian do
  use Guardian, otp_app: :real_deal_api
  alias RealDealApi.Accounts

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok,sub}
  end

  def subject_for_token(_,_) ,do: {:error, :no_id_provided}

  def resource_from_claims(%{"sub"=>id}) do

  end
end
