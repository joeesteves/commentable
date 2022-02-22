defmodule Commentable.Repo do
  use Ecto.Repo,
    otp_app: :commentable,
    adapter: Ecto.Adapters.Postgres
end
