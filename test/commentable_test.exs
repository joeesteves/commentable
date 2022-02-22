defmodule CommentableTest do
  use ExUnit.Case
  doctest Commentable

  test "greets the world" do
    assert Commentable.hello() == :world
  end
end
