defmodule ReversingPlug do
  use Plug.Builder

  plug :hello
  plug :reverse
  plug :sender

  def hello(conn, _opts) do
    conn
    |> resp(200, "Hello world")
  end

  def reverse(conn, _opts) do
    conn
    |> resp(200, String.reverse(conn.resp_body))
  end

  def sender(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, conn.resp_body)
  end
end
