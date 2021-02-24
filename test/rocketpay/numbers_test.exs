defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers
  describe "sum_from_file/1" do
    test "when a file with param name exists return the sum of the numbers" do
    response = Numbers.sum_from_file("numbers")
    expected_response = {:ok, %{result: 55}}
    assert response == expected_response
    end

    test "when a file with param name does not exit return an error" do
      response = Numbers.sum_from_file("platano")
      expected_response = {:error, %{message: "Invalid file"}}
      assert response == expected_response
      end
  end
end
