defmodule Commentable.Attachment do
  use Ecto.Schema

  import Ecto.Changeset

  schema "attachments" do
    field :url, :string
    field :mime_type, :string

    belongs_to :comment, Commentable.Comment

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:url, :mime_type])
    |> validate_required([:url, :mime_type])
  end
end

