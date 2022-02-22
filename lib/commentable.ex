defmodule Commentable do
  @moduledoc """
  Documentation for `Commentable`.
  """

  alias Commentable.{Comment, Repo}

  @type commentable :: %{__struct__: String.t(), id: integer()}

  @spec comment(commentable, %Comment{}) :: any()
  def comment(%{__struct__: commentable_type, id: commentable_id}, %Comment{} = comment) do
    Comment.changeset(%Comment{}, %{commentable_type: commentable_type, commentable_id: commentable_id, body: comment.body})
    |> Repo.insert()
  end

  @doc """
  Include this macro in schema block to make it commentable
  """
  defmacro commentable do
    quote do
      has_many :comments, Comment,
        where: [commentable_type: "#{__MODULE__}"],
        foreign_key: :commentable_id
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Commentable, only: [commentable: 0]
    end
  end
end

