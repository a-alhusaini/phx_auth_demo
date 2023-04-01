defmodule CustomPhxAuthDemo.UserMailer do
  import Swoosh.Email

  def sign_in_email(token, first_name, address) do
    new()
    |> to({first_name, address})
    |> from({"SCP-682", "ihatelife@mail.com"})
    |> subject("Sign in")
    |> text_body("""
    You may sign in with this link

    https://localhost:3000/auth/#{token}

    Sharing your sign up link exposes you to hackers
    """)
  end
end
