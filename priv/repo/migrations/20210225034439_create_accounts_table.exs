defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      # decimal is specifically for dealing with monetary values
      add :balance, :decimal
      add :user_id, references(:type, type: :binary_id)

      timestamps()
    end
    # user accounts can never be negative
    create constraint(:accounts, :balance_must_be_positive_or_zero, check: "balance >= 0" )
  end
end
