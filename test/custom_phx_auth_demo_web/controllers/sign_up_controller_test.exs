defmodule CustomPhxAuthDemoWeb.SignUpControllerTest do
  use CustomPhxAuthDemoWeb.ConnCase

  @user_data %{first_name: "joe", family_name: "doe", email: "joe@doe.com"}

  test "it returns 400 on invalid data", %{conn: conn} do
    conn = post(conn, ~p"/signup/email")

    assert json_response(conn, 400)
  end

  test "it returns 201 and a user object on success", %{conn: conn} do
    resp = post(conn, ~p"/signup/email", @user_data) |> json_response(201)
    assert resp["email"] == @user_data.email
    assert resp["first_name"] == @user_data.first_name
    assert resp["family_name"] == @user_data.family_name
  end

  test "it should fail if user data is invalid", %{conn: conn} do
    user_data = %{first_name: "j", last_name: "b", email: "f"}

    conn = post(conn, ~p"/signup/email", user_data)
    assert json_response(conn, 400)
  end

  test "it should send email with correct properties on user signup", %{conn: conn} do
    post(conn, ~p"/signup/email", @user_data)
    {:email, email} = Swoosh.TestAssertions.assert_email_sent()

    {name, email_address} = email.to |> List.first()

    assert name == @user_data.first_name
    assert email_address == @user_data.email
  end

  test "it should create a magic link token on sign up", %{conn: conn} do
    post(conn, ~p"/signup/email", @user_data)

    assert CustomPhxAuthDemo.Repo.all(CustomPhxAuthDemo.MagicLink) !== []
  end
end
