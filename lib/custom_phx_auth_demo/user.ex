defmodule CustomPhxAuthDemo.User do
  use Ecto.Schema

  @email_regex ~R<^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$>

  schema "users" do
    field :first_name, :string
    field :family_name, :string
    field :email, :string
    field :is_verified, :boolean, default: false
  end

  def create_user(user_data) do
    changeset(%__MODULE__{}, user_data)
    |> CustomPhxAuthDemo.Repo.insert()
  end

  defp changeset(user, params) do
    user
    |> Ecto.Changeset.cast(params, [:first_name, :family_name, :email, :is_verified])
    |> Ecto.Changeset.validate_required([:first_name, :family_name, :email, :is_verified])
    |> Ecto.Changeset.validate_format(:email, @email_regex)
  end
end
