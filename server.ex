defmodule Server do
	def create(name,context,com_node) do
		try do
			for item <- F_manager.devide_str(context) do
				task=Task.Supervisor.async({RouterTasks,com_node},F_manager, :insert_file, [name,context])
				Task.await(task)
			end
		rescue
			error->error
		end
	end
end