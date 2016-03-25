defmodule Utility.Record do
  use Ecto.Schema

  schema "records" do
    field :count, :integer

    timestamps
  end
end
