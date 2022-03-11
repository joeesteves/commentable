defmodule Commentable do
  @moduledoc """
  Documentation for `Commentable`.
  """

  alias Commentable.Comment

  def repo do
    hd(Application.get_env(:commentable, :ecto_repos))
  end

  @type commentable :: %{__struct__: String.t(), id: integer()}

  @spec comment_changeset(commentable) :: any()
  def comment_changeset(%{__struct__: commentable_type, id: commentable_id}) do
    Comment.changeset(%Comment{}, %{
      commentable_type: commentable_type,
      commentable_id: commentable_id
    })
  end

  def create_comment(attrs) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> repo().insert()
  end

  def update_comment(%Comment{} = comment, %{} = attrs) do
    comment
    |> Comment.changeset(attrs)
    |> repo().update()
  end

  def delete_comment(%Comment{} = comment) do
    comment
    |> repo().delete()
  end

  @spec load_comments(commentable) :: any()
  def load_comments(commentable) do
    commentable
    |> repo().preload(:comments)
  end

  @spec list_comments(commentable) :: [Comment]
  def list_comments(commentable) do
    commentable
    |> repo().preload(:comments)
    |> Map.get(:comments)
  end

  @doc """
  Include this macro in schema block to make it commentable
  """
  defmacro commentable do
    quote do
      has_many(:comments, Comment,
        where: [commentable_type: "#{__MODULE__}"],
        foreign_key: :commentable_id
      )
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Commentable, only: [commentable: 0]
    end
  end
end
