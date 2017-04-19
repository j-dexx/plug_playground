defmodule ReversingPlugTest do
  use ExUnit.Case, async: true
  # Plug ships with its own test helpers that you can pull in by Using Plug.Test
  use Plug.Test

  @opts ReversingPlug.init([])

  test "returns hello world" do
    # Create a test connection using the `conn` helper that Plug imported when
    # you used Plug.Test
    conn = conn(:get, "/")

    # Invoke the plug
    conn = ReversingPlug.call(conn, @opts)

    # Test the output
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "dlrow olleH"
  end
end
