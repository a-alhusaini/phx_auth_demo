defmodule CustomPhxAuthDemo.MagicLink do
  use Ecto.Schema

  schema "magic_links" do
    field :token, :string, default: Ecto.UUID.generate()
    belongs_to :user, CustomPhxAuthDemo.User

    timestamps()
  end

  def create_magic_link(magic_link_data) do
    changeset(%__MODULE__{}, magic_link_data)
    |> CustomPhxAuthDemo.Repo.insert()
  end

  def generate_magic_link_token(magic_link_string) do
    CustomPhxAuthDemo.Token.generate(magic_link_string)
  end

  def decode_magic_link_token(token) do
    CustomPhxAuthDemo.Token.decode(token, max_age: 60 * 30)
  end

  defp changeset(magic_link, params) do
    magic_link
    |> Ecto.Changeset.cast(params, [:token, :user_id])
    |> Ecto.Changeset.validate_required([:token, :user_id])
    |> Ecto.Changeset.foreign_key_constraint(:user_id)
  end
end
