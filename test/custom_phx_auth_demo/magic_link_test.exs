defmodule CustomPhxAuthDemo.MagicLinkTest do
  use CustomPhxAuthDemo.DataCase, async: true
  alias CustomPhxAuthDemo.User
  alias CustomPhxAuthDemo.MagicLink

  @user %{first_name: "don", family_name: "doe", email: "don@doe.com"}
  @token Ecto.UUID.generate()

  test "it should return an error if foreign key constraint is invalid" do
    {:ok, _} = User.create_user(@user)

    {:error, magic_link} = MagicLink.create_magic_link(%{token: @token, user_id: "2945vb"})

    assert Keyword.has_key?(magic_link.errors, :user_id)
  end

  test "it creates a magic link when given valid data" do
    {:ok, user} = User.create_user(@user)
    {:ok, magic_link} = MagicLink.create_magic_link(%{token: @token, user_id: user.id})

    assert magic_link.token == @token
    assert magic_link.user_id == user.id
  end

  test "It can get magic links by token" do
    {:ok, user} = User.create_user(@user)
    {:ok, magic_link} = MagicLink.create_magic_link(%{token: @token, user_id: user.id})

    {:ok, found_link} = MagicLink.get(magic_link.token)
    {:error, nonexistent_link} = MagicLink.get("fake")

    assert found_link.token == @token
    assert nonexistent_link == nil
  end

  test "It should generate and decode encrypted tokens" do
    encrypted_token = MagicLink.generate_magic_link_token(@token)

    assert {:ok, @token} == MagicLink.decode_magic_link_token(encrypted_token)
  end
end
