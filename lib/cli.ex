defmodule JsonParser.CLI do
  def main(args) do
   parse_args(args)
   |> process
  end

  def process({}) do
    process(:help)
  end

  def process(:help) do
    IO.puts """
  JSON failure parser
  -------------------
  ./json_parser failures.json


  *******************
  lists all of the failure reasons (without the associated fields)
"""
  end

  def process({filename}) do
    IO.inspect filename
    filename
    |> JsonParser.get_reasons
  end


  def parse_args(args) do
    parse = OptionParser.parse(
      args,
      switches: [
        help: :boolean
      ],
      aliases: [
        h: :help
      ]
    )
    case parse do
      {[help: true], _, _}
      -> :help
      {_, [search_term], _}
      -> {search_term}
    end
  end
end