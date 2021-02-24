defmodule RocketpayWeb.UsersView do
  alias Rocketpay.User
  def render("created.json", %{user: %User {id: id, name: name, nickname: nickname} }) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end
end
