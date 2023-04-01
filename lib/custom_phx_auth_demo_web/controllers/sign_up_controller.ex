defmodule CustomPhxAuthDemoWeb.SignUpController do
  use CustomPhxAuthDemoWeb, :controller

  def email(conn, params)
      when is_map_key(params, "first_name") and is_map_key(params, "family_name") and
             is_map_key(params, "email") do
    with {:ok, user} <- CustomPhxAuthDemo.User.create_user(params) do
      CustomPhxAuthDemo.Token.generate(%{token: Ecto.UUID.generate()})
      |> CustomPhxAuthDemo.UserMailer.sign_in_email(user.first_name, user.email)
      |> CustomPhxAuthDemo.Mailer.deliver()

      conn
      |> put_status(:created)
      |> json(%{
        success: "success",
        email: user.email,
        first_name: user.first_name,
        family_name: user.family_name
      })
    else
      {:error, %Ecto.Changeset{} = _} -> {:error, :bad_request}
    end
  end

  def email(_conn, _params) do
    {:error, :bad_request}
  end
end
