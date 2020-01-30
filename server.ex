defmodule Server do
	def create(name,context) do
		try do
			task=Task.Supervisor.async({RouterTasks,:"root@172.17.0.5"}, F_manager, :insert_file, [name,context])
			Task.await(task)
		rescue
			error->error
		end
	end

end