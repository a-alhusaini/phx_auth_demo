defmodule AuthControllerTest do
  use CustomPhxAuthDemoWeb.ConnCase

  @user_data %{first_name: "john", family_name: "doe", email: "john@doe.com"}

  test "it should return 401 on missing/invalid token", %{conn: conn} do
    conn = post(conn, ~p"/auth/invalid_credentials")

    assert json_response(conn, 401)
  end

  test "It creates a valid auth token and sets a session cookie on successful auth", %{conn: conn} do
    conn = post(conn, ~p"/signup/email", @user_data)

    magic_link = CustomPhxAuthDemo.Repo.all(CustomPhxAuthDemo.MagicLink) |> List.first()
    path = CustomPhxAuthDemo.MagicLink.generate_magic_link_token(magic_link.token)

    conn = post(conn, ~p"/auth/#{path}/")

    assert json_response(conn, 200)
    assert get_session(conn, :user_id) == @user_data.email
  end

  test "It should return 401 if the token no longer exists in the database", %{conn: conn} do
    # This is a valid token, but there won't be an actual database record with this magic link
    mock_magic_link = CustomPhxAuthDemo.MagicLink.generate_magic_link_token("Hello world!")

    conn = post(conn, ~p"/auth/#{mock_magic_link}")

    assert json_response(conn, 401)
  end
end
