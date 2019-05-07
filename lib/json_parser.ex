defmodule JsonParser do
  @moduledoc """
  Documentation for JsonParser.
  """

  def get_reasons(filename) do
    IO.inspect filename
               |> get_json
               |> get_failures
  end

  defp get_reason(_ = %{"errors" => errors}) do
    Enum.map(errors, fn e -> e["reason"]  end)
  end

  defp get_failures(
         %{
           "products" => %{
             "failures" => failures
           }
         }
       ) do
    Enum.map(failures, fn f -> get_reason(f) end)
  end

  defp get_failures(err) do
    err end

  defp get_json(filename) do
    with {:ok, body} <- File.read(filename),
         {:ok, json} <- Poison.decode(body)
      do
      json
    else
      err -> err
    end
  end
end
