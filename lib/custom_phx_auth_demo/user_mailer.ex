defmodule CustomPhxAuthDemo.UserMailer do
  import Swoosh.Email

  def sign_in_email() do
    token =
      Phoenix.Token.sign(CustomPhxAuthDemoWeb.Endpoint, "email_auth", %{
        magic_link: Ecto.UUID.generate()
      })

    new()
    |> to({"fancyman", "fancymailservice@mail.com"})
    |> from({"SCP-682", "ihatelife@mail.com"})
    |> subject("Sign in")
    |> text_body("""
    You may sign in with this link

    https://localhost:3000/auth/#{token}

    Sharing your sign up link exposes you to hackers
    """)
  end
end
