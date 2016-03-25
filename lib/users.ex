defmodule Users do
  alias Utility.Repo
  alias Utility.Record

  def main do
    response = HTTPotion.get "http://jsonplaceholder.typicode.com/users"

    case Poison.Parser.parse(response.body) do
      {:ok, json} -> IO.puts "I got #{length(json)} users!"
        Repo.insert! %Record{count: length(json)}
      _ -> IO.puts "something wrong with the answer"
    end
  end
end
