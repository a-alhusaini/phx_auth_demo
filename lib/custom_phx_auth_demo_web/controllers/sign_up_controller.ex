defmodule CustomPhxAuthDemoWeb.SignUpController do
  use CustomPhxAuthDemoWeb, :controller
  alias CustomPhxAuthDemo.User
  alias CustomPhxAuthDemo.MagicLink

  def email(conn, %{"first_name" => _, "family_name" => _, "email" => _} = params) do
    with {:ok, user} <- User.create_user(params) do
      {:ok, magic_link} =
        MagicLink.create_magic_link(%{
          token: Ecto.UUID.generate(),
          user_id: user.id
        })

      MagicLink.generate_magic_link_token(magic_link.token)
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
