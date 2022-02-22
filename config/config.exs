import Config

config :commentable, ecto_repos: [Commentable.Repo]

config :commentable, Commentable.Repo,
  database: "commentable_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
