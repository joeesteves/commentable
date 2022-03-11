defmodule Commentable.Comment do
  use Ecto.Schema

  import Ecto.Changeset

  alias Commentable.Type

  schema "comments" do
    field :commentable_id, :integer
    field :commentable_type, Type

    field :body, :string

    has_many :attachments, Commentable.Attachment

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:commentable_id, :commentable_type, :body])
    |> cast_assoc(:attachments)
    |> validate_required([:commentable_id, :commentable_type, :body])
  end
end

