defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb,:controller

  def index(conn,_params) do
    text conn, "The real deal Api is Live - #{Mix.env()}"
  end
end
