defmodule Mix.Tasks.Commentable.Install do
  use Mix.Task

  @shortdoc "Creates migrations needed by Commentable"

  @moduledoc """
    After adding commentable as dep, run this command to create the require table.
    $> mix commentable.install
  """

  @impl Mix.Task
  def run(_) do
    if in_host?() do
      migration_path = "priv/repo/migrations/"
      commentable_migration_path = Path.join(Application.app_dir(:commentable), migration_path)
      host_migration_path = Path.join(File.cwd!(), migration_path)

      clean(host_migration_path)

      commentable_migration_path
      |> File.ls!()
      |> Enum.reject(& &1 =~ ~r/test/)
      |> Enum.each(fn migration_filename ->
        target_path = Path.join(host_migration_path, restamp(migration_filename))

        File.cp(
          Path.join(commentable_migration_path, migration_filename),
          target_path
        )

        File.read!(target_path)
        |> String.replace(~r/commentable/, host_name())
        |> (&File.write!(target_path, &1)).()
      end)
    else
      IO.puts("☠ ️Danger ☠ You are at commentable, not on host")
    end
  end

  defp in_host? do
    Application.app_dir(:commentable) != Mix.Project.app_path()
  end

  def host_name do
    Mix.Project.get().project[:app] |> Atom.to_string() |> String.capitalize()
  end

  defp clean(dir) do
    File.ls!(dir)
    |> Enum.filter(&Regex.match?(~r/_commentable_/, &1))
    |> Enum.each(fn filename -> File.rm!(Path.join(dir, filename)) end)
  end

  defp restamp(filename) do
    String.replace(filename, ~r/\d+_/, ~s(#{timestamp()}_commentable_))
  end

  defp timestamp do
    :timer.sleep(1000)
    {{y, m, d}, {hh, mm, ss}} = :calendar.universal_time()

    "#{y}#{pad(m)}#{pad(d)}#{pad(hh)}#{pad(mm)}#{pad(ss)}"
  end

  defp pad(i) when i < 10, do: <<?0, ?0 + i>>
  defp pad(i), do: to_string(i)
end

