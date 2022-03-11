defmodule Commentable.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add(:commentable_type, :string)
      add(:commentable_id, :integer)
      add(:body, :string)

      add(:attachment_urls, {:array, :string}, null: false, default: [])

      timestamps()
    end

    create(index(:comments, [:commentable_id, :commentable_type]))
  end
end
