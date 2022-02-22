defmodule Commentable.Repo.Migrations.CreateTestPosts do
  use Ecto.Migration

  def change do
    create table(:posts)

  end
end
