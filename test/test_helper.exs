ExUnit.start()

Code.require_file("post.exs", "test/commentable_test")

Commentable.Repo.start_link

defmodule TestHelper do
  alias Commentable.Repo
  alias CommentableTest.Post

  import Ecto.Query

  def get_post(id) do
    Repo.one(from p in Post, where: p.id == ^id) |> Repo.preload(:comments)
  end

  def create_post do
    Repo.insert(%Post{})
  end
end

