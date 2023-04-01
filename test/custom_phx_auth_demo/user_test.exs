defmodule CustomPhxAuthDemo.UserTest do
  use CustomPhxAuthDemo.DataCase

  @user %{first_name: "john", family_name: "doe", email: "john@doe.com"}
  @invalid_user %{email: "..."}

  test "This should create a user?" do
    {:ok, %CustomPhxAuthDemo.User{} = result} = CustomPhxAuthDemo.User.create_user(@user)

    assert result.email == @user.email
    assert result.first_name == @user.first_name
    assert result.family_name == @user.family_name
  end

  test "It should return some sort of error" do
    {:error, result} = CustomPhxAuthDemo.User.create_user(@invalid_user)

    assert Map.has_key?(result, :errors)
  end
end
