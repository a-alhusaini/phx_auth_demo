defmodule CustomPhxAuthDemo.Token do
  def generate_token(data) do
    Phoenix.Token.encrypt(context(), secret_key(), data)
  end

  def decode_token(token, opts \\ []) do
    Phoenix.Token.decrypt(context(), secret_key(), token, opts)
  end

  defp context() do
    CustomPhxAuthDemoWeb.Endpoint
  end

  defp secret_key() do
    Application.get_env(:custom_phx_auth_demo, CustomPhxAuthDemoWeb.Endpoint)
  end
end
