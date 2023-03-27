defmodule CustomPhxAuthDemoWeb.SignUpController do
  use CustomPhxAuthDemoWeb, :controller

  def email(conn, _params) do
    CustomPhxAuthDemo.UserMailer.sign_in_email()
    |> CustomPhxAuthDemo.Mailer.deliver()

    conn
    |> Plug.Conn.put_session(:mail_key, "1")
    |> json(%{error: "error"})
  end
end
