defmodule Server do
	def create(name,context) do
		try do
		    data=F_manager.devide_str(context)
			for item <- ["r","n"] do
				Router.route("r", F_manager, :insert_file, [name,context])
			end
			data
		rescue
			error->error
		end
	end
	
	def delete(name) do
		try do
			task=Task.Supervisor.async({RouterTasks,:"root@172.17.0.5"}, F_manager, :insert_file, [name])
			Task.await(task)
		rescue
			error->error
		end
	end

end