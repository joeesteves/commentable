defmodule Commentable.Comment do
  use Ecto.Schema

  import Ecto.Changeset

  alias Commentable.Type

  schema "comments" do
    field :commentable_id, :integer
    field :commentable_type, Type

    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:commentable_id, :commentable_type, :body])
    |> validate_required([:commentable_id, :commentable_type, :body])
  end
end

