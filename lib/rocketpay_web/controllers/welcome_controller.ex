# FOLDER ROCKETPAY_WEB, following convention,
# controller = folderNameCamelCase.ControllerNameCamelCase
defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller
  alias Rocketpay.Numbers

  def index(connection, %{"filename" => filename}) do
    filename
    |>Numbers.sum_from_file()
    |>handle_response(connection)
  end

  defp handle_response({:ok, %{result: result}}, connection) do
    connection
    |>put_status(:ok)
    |>json(%{message: "Welcome to the rocketpay api, here is your number #{result}"})
  end

  defp handle_response({:error, reason}, connection) do
    connection
    |>put_status(:bad_request)
    |>json(reason)
  end
end
