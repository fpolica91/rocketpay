
defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller
  alias Rocketpay.User
  action_fallback RocketpayWeb.FallbackController

  def create(connection, params) do
    # this is called pattern matching, if the response is :ok with a user then do whats below
    # you could chain multiple conditions before executing by adding the condition, before do
    with {:ok, %User{} = user}  <- Rocketpay.create_user(params) do
      connection
      |>put_status(:created)
      |>render("created.json", user: user)
    end
  end
  # since we have a fallback we can use short-syntax and errors wil be handled automatically by Fallback Controller

  # defp handle_response({:ok, %User{} = user}, connection) do
  #   connection
  #   |>put_status(:created)
  #   |>render("created.json", user: user)
  # end

  # defp handle_response({:error, _result} = error, _connection), do: error
    # connection
    # |>put_status(:bad_request)
    # |>put_view(RocketpayWeb.ErrorView)
    # |>render("400.json", result: result)
end
