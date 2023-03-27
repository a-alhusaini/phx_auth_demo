defmodule CustomPhxAuthDemo.Repo.Migrations.CreateUsersAndMagicLinksTables do
  use Ecto.Migration

  def change do
    create table("users") do
      add :first_name, :text
      add :family_name, :text
      add :email, :text
    end

    create table("magic_links") do
      add :token, :text
      add :user_id, references("users")

      timestamps()
    end
  end
end
