defmodule CommentableTest.Post do
  use Ecto.Schema
  use Commentable

  schema "posts" do
    commentable()
  end
end
