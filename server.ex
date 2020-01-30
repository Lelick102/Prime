defmodule Server do
	def create(name,context) do
		try do
			l=["r","n"]
			start_create(l,name,context,0)
		rescue
			error->error
		end
	end
	
    def start_Task(n,name,context) do
		Router.route(n, F_manager, :insert_file, [name,context])
	end
   
	def start_create([head|tail],name,context, count) do 
		start_Task(head, name, String.slice(context, 0, String.length(context)/length([head|tail])))
		start_create(tail,name,context,count)
	end

	def start_create([],name,context,count) do
		[true]
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
	
	def chunk_bits(binary, n) do
		for << chunk::size(n) <- binary >>, do: <<chunk::size(n)>>
	end

end