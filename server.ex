defmodule Server do
	def create(name,context) do
		try do
		    count=0
			l=["r","n"]
			for item <- l do
			    #s=String.slice context, count, context/length
				Router.route(item, F_manager, :insert_file, [name,context])
			end
		rescue
			error->error
		end
	end
	
	def delete(name) do
		try do
			for item <- ["r","n"] do
				Router.route(item, F_manager, :delete_file, [name])
			end
		rescue
			error->error
		end
	end
	
	def if_exist(name) do
		l=[]
	    for item <- ["r","n"] do
			[l|Router.route(item, F_manager, :is_file_existense, [name])]
			l
		end
	end

end