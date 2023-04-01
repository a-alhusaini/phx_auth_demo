defmodule CustomPhxAuthDemoWeb.SignUpControllerTest do
  use CustomPhxAuthDemoWeb.ConnCase

  test "it returns 400 on invalid data", %{conn: conn} do
    conn = post(conn, ~p"/signup/email")

    assert json_response(conn, 400)
  end

  test "it returns 201 and a user object on success", %{conn: conn} do
    user_data = %{first_name: "joe", family_name: "doe", email: "joe@doe.com"}

    resp = post(conn, ~p"/signup/email", user_data) |> json_response(201)
    assert resp["email"] == user_data.email
    assert resp["first_name"] == user_data.first_name
    assert resp["family_name"] == user_data.family_name
  end

  test "it should fail is user data is invalid", %{conn: conn} do
    user_data = %{first_name: "j", last_name: "b", email: "f"}

    conn = post(conn, ~p"/signup/email", user_data)
    assert json_response(conn, 400)
  end
end
