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
defmodule Mate.Conty.Entry do
  @moduledoc false
  use Ecto.Schema
  <mark>use Commentable</mark>

  import Ecto.Changeset

  alias Mate.Conty.{Account, Entry, EntryItem}

  schema "entries" do
    field :date, :date
    field :type, :string

    belongs_to(:entry_group, Entry)

    has_many(:entry_items, EntryItem)

    (...)

    <mark>commentable()</mark>

    timestamps()
  end

  (...)
end
</pre>


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/commentable>.

