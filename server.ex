defmodule Server do
	def create(name,context) do
		try do
		    count=0
		    data=F_manager.devide_str(context)
			for item <- ["r","r"] do
				Router.route(item, F_manager, :insert_file, [name,context])
			end
		rescue
			error->error
		end
	end
	
	def delete(name) do
		try do
			for item <- ["r","r"] do
				Router.route(item, F_manager, :delete_file, [name])
			end
		rescue
			error->error
		end
	end

end