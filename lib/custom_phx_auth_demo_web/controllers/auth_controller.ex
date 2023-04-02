defmodule CustomPhxAuthDemoWeb.AuthController do
  use CustomPhxAuthDemoWeb, :controller
  alias CustomPhxAuthDemo.MagicLink

  def auth(conn, params) do
    with {:ok, token} <- MagicLink.decode_magic_link_token(params["token"]),
         {:ok, magic_link} <- MagicLink.get(token) do
      put_session(conn, :user_id, magic_link.user.email)
      |> json(%{success: true})
    else
      _ -> {:error, :unauthorized}
    end
  end
end
