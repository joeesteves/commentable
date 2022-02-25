[![Elixir CI](https://github.com/ponyesteves/commentable/actions/workflows/elixir.yml/badge.svg)](https://github.com/ponyesteves/commentable/actions/workflows/elixir.yml)

# Commentable

Add comments to any schema in your project in a trice

## Requirements
- elixir ~> 1.11
- ecto ~> 3.0

## Installation

### Include commentable dep

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `commentable` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:commentable, "~> 0.1.0"}
  ]
end
```

### Configure commentable to use your Repo

`config/config.exs`

```elixir
config :commentable,
  ecto_repos: [MyApp.Repo]

```

### Add migrations and execute them

```bash

myProject> mix commentable.install
myProject> mix ecto.migrate

```

### Include on any schema


<pre>
defmodule MyApp.Post do
  @moduledoc false
  use Ecto.Schema
  <mark>use Commentable</mark>

  schema "entries" do
    field :date, :date
    field :title, :string
    field :body, :string

    (...)

    <mark>commentable()</mark>

    timestamps()
  end

  (...)
end
</pre>

## Use

```elixir
iex> alias MyApp.{Post, Repo}

iex> post = Repo.get(Post, 25)

## comment a post
iex> Commentable.comment(post, %Comment{body: "This comment will be added to Post"})
iex> {:ok, %Comment{...}}

## list comments on a post
iex> Commentable.list_comments(post)
iex> [%Comment{...}]

## load post with comments
iex> Commentable.load_comments(post)
iex> %Post{..., comments: [%Comment{...}]}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/commentable>.

