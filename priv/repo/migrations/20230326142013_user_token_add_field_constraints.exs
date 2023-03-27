defmodule CustomPhxAuthDemo.Repo.Migrations.UserTokenAddFieldConstraints do
  use Ecto.Migration

  def change do
    alter table("users") do
      modify :first_name, :text, null: false
      modify :family_name, :text, null: false
      modify :email, :text, null: false
      modify :is_verified, :boolean, null: false
    end

    alter table("magic_links") do
      modify :token, :text, null: false
      modify :user_id, :bigint, null: false
    end

    create index("magic_links", [:token], unique: true)
    create index("users", [:email], unique: true)
  end
end
