defmodule CustomPhxAuthDemoWeb.AuthController do
  use CustomPhxAuthDemoWeb, :controller

  def auth(conn, params) do
    case Phoenix.Token.verify(conn, "email_auth", params["token"]) do
      {:ok, _} ->
        json(conn, %{success: true})

      {:error, _} ->
        put_view(conn, CustomPhxAuthDemoWeb.ErrorJSON)
        |> render("403.json")
    end
  end
end
