defmodule Router do
   def table do
    [{?a..?c, :"client@172.17.0.6"},
     {?d..?n, :"node1@172.17.0.4"},
	 {?o..?r, :"root@172.17.0.5"},
	 {?s..?z, :"server@172.17.0.2"}
	]
  end
  
  def route(nodes, mod, fun, args) do
    first = :binary.first(nodes)

    entry =
      Enum.find(table(), fn {enum, _node} ->
        first in enum
      end) || no_entry_error(nodes)

    if elem(entry, 1) == node() do
      apply(mod, fun, args)
    else
      {RouterTasks, elem(entry, 1)}
      |> Task.Supervisor.async(Router, :route, [nodes, mod, fun, args])
      |> Task.await()
    end
  end

  defp no_entry_error(nodes) do
    raise "could not find entry for #{inspect nodes} in table #{inspect table()}"
  end
end