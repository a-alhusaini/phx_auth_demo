defmodule CustomPhxAuthDemo.Repo do
  use Ecto.Repo,
    otp_app: :custom_phx_auth_demo,
    adapter: Ecto.Adapters.Postgres
end
