defmodule Router do
   def table do
    [{?a..?q, :"client@172.17.0.3"},
     {?h..?n, :"node1@172.17.0.6"},
	 {?o..?r, :"root@172.17.0.5"},
	 {?s..?z, :"server@172.17.0.4"}
	]
  end
  
  def route(bucket, mod, fun, args) do
    first = :binary.first(bucket)

    entry =
      Enum.find(table(), fn {enum, _node} ->
        first in enum
      end) || no_entry_error(bucket)

    if elem(entry, 1) == node() do
      apply(mod, fun, args)
    else
      {RouterTasks, elem(entry, 1)}
      |> Task.Supervisor.async(Router, :route, [bucket, mod, fun, args])
      |> Task.await()
    end
  end

  defp no_entry_error(bucket) do
    raise "could not find entry for #{inspect bucket} in table #{inspect table()}"
  end
end