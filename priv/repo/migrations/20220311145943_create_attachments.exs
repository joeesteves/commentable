defmodule Commentable.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add(:url, :string)
      add(:mime_type, :string)

      add(:comment_id, references(:comments))

      timestamps()
    end

    create index(:attachments, [:comment_id])
  end
end
