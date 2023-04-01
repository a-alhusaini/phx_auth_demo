defmodule CustomPhxAuthDemoWeb.FallbackController do
  use Phoenix.Controller
  alias CustomPhxAuthDemoWeb.ErrorJSON

  def call(conn, {:error, :bad_request}) do
    conn |> put_status(:bad_request) |> put_view(ErrorJSON) |> render("400.json")
  end

  def call(conn, {:error, :unauthorized}) do
    conn |> put_status(:unauthorized) |> put_view(ErrorJSON) |> render("401.json")
  end
end
