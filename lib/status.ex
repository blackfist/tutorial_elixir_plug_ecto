defmodule Status do
  use Plug.Router
  alias Utility.Repo
  alias Utility.Record
  import Plug.Conn

  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Status, []
  end


  get "/status" do
    last_run = Record |> Ecto.Query.last |> Repo.one

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{last_run: last_run.inserted_at, result_count: last_run.count}))
  end

  match _ do
    conn
    |> send_resp(404, Poison.encode!(%{endpoint: "not implemented"}))
  end

end
