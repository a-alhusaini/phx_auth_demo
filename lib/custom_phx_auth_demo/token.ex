defmodule CustomPhxAuthDemo.Token do
  def generate(data) do
    Phoenix.Token.encrypt(context(), secret_key(), data)
  end

  def decode(token, opts \\ []) do
    Phoenix.Token.decrypt(context(), secret_key(), token, opts)
  end

  defp context() do
    CustomPhxAuthDemoWeb.Endpoint
  end

  defp secret_key() do
    Application.get_env(:custom_phx_auth_demo, CustomPhxAuthDemoWeb.Endpoint)[:secret_key_base]
  end
end
