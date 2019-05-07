defmodule JsonParserTest do
  use ExUnit.Case
  doctest JsonParser

  test "greets the world" do
    assert JsonParser.hello() == :world
  end
end
