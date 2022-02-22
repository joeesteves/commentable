defmodule CommentableTest do
  use ExUnit.Case
  doctest Commentable

  alias Commentable.{Comment}

  setup do
   {:ok, post} = TestHelper.create_post()

    {:ok, post: post}
  end

  describe "commentable" do
    test "add comment to post", %{post: post} do
      comment_body = "Hello Comments"

      Commentable.comment(post, %Comment{body: comment_body})

      post_with_comments = TestHelper.get_post(post.id)

      [comment | _ ] = post_with_comments.comments
      assert comment.body == comment_body
    end

    test "add multiple comments to post", %{post: post} do
      first_comment_body = "first_comment"
      last_comment_body = "last_comment"

      Commentable.comment(post, %Comment{body: first_comment_body})
      Commentable.comment(post, %Comment{body: last_comment_body})

      post_with_comments = TestHelper.get_post(post.id)

      [first_comment, last_comment | _ ] = comments =  post_with_comments.comments

      assert Enum.count(comments) == 2
      assert first_comment.body == first_comment_body
      assert last_comment.body == last_comment_body
    end
  end
end
