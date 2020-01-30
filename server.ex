defmodule Server do
	def create(name,context) do
		try do
		    count=0
			l=["k","r"]
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
			for item <- ["k","r"] do
				Router.route(item, F_manager, :delete_file, [name])
			end
		rescue
			error->error
		end
	end

end