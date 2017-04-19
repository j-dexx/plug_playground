defmodule HelloPlug do
  import Plug.Conn

  def init(options) do
    # initialize your options here
    options
  end

  # Call is the primary interface to a plug
  # This is where the helpers that importing Plug.Connection gives you pay off
  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end
