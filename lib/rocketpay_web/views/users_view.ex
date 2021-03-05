defmodule RocketpayWeb.UsersView do
  alias Rocketpay.{User, Account}
  def render("created.json",
    %{user: %User
        {
        id: id,
        name: name,
        nickname: nickname,
        account: %Account{id: account_id, balance: balance}
        }
      }) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end
end
