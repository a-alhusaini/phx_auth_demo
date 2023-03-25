defmodule CustomPhxAuthDemoWeb.MockController do
  use CustomPhxAuthDemoWeb, :controller

  def index(conn, _params) do
    json(conn, %{hello: "world"})
  end
end
