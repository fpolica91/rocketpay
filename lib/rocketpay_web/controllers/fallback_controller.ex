
defmodule RocketpayWeb.FallbackController do
  use RocketpayWeb, :controller
  IO.puts("I was summoned")
  def call(connection, {:error, result}) do
    connection
    |>put_status(:bad_request)
    |>put_view(RocketpayWeb.ErrorView)
    |>render("400.json", result: result)
  end
end
