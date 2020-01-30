defmodule Server do
	def create(name,context) do
		try do
		    count=0
			l=["r","n"]
			ln=length(l)
			for item <- l do
			    s=String.slice context, (String.length(context)-round(String.length(context)/ln)), (String.length(context)-round(String.length(context)/ln)
				Router.route(item, F_manager, :insert_file, [name,s])
			end
		rescue
			error->error
		end
	end
	
	def chunk_bits(binary, n) do
		for << chunk::size(n) <- binary >>, do: <<chunk::size(n)>>
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
	    for item <- ["r","n"] do
			Router.route(item, F_manager, :is_file_existense, [name])
		end
	end
	
	def get_file(name) do
		for item <- ["r","n"] do
			Router.route(item, F_manager, :get_file, [name])
		end
	end

end