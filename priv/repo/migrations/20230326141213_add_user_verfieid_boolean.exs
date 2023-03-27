defmodule CustomPhxAuthDemo.Repo.Migrations.AddUserVerfieidBoolean do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :is_verified, :boolean
    end
  end
end
