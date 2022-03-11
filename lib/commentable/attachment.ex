defmodule Commentable.Attachment do
  use Ecto.Schema

  import Ecto.Changeset

  schema "attachments" do
    field :url, :string
    field :mime_type, :string

    field :delete, :boolean, virtual: true

    belongs_to :comment, Commentable.Comment

    timestamps()
  end

  # NOTE: https://hexdocs.pm/ecto/Ecto.Changeset.html#cast_assoc/3
  def changeset(attachment, %{delete: true}) do
    %{change(attachment) | action: :delete}
  end

  def changeset(comment, %{"delete" => "true"}) do
    %{change(comment, delete: true) | action: :delete}
  end

  def changeset(attachment, attrs) do
    attachment
    |> cast(attrs, [:url, :mime_type])
    |> validate_required([:url, :mime_type])
  end

end

