defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    # file = File.read("#{filename}.csv")
    # handle_file(file)
    # using the pipe operator, |> passes the result of the function above to the function below
    "#{filename}.csv"
    |>
    File.read()
    |>
    handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
       result
       |>String.split(",")
       |>Enum.map(fn(number) -> String.to_integer(number) end)
       |>Enum.sum()
       {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file"}}

end
