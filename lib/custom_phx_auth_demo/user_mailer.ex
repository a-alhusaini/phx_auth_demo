defmodule CustomPhxAuthDemo.UserMailer do
  import Swoosh.Email

  def sign_in_email(token) do
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
