defmodule Server do
	def create(name,context) do
		try do
			nodes=["r","n"]
			data=get_data_client(context)
			start_create(nodes,name,5,0)			
		rescue
			error->error
		end
	end
	
    def start_Task(n,name,context) do
		Router.route(n, F_manager, :insert_file, [name,context])
	end
   
	def start_create([head|tail],name,data,count) do  
		start_Task(head, name, data)
		start_create(tail, name, data, count)
	end

	def start_create([],name,context,count) do
		[true]
	end
	
	def delete(name) do #DONE ITS GREAT
		try do
			for item <- ["r","n"] do
				Router.route(item, F_manager, :delete_file, [name])
			end
		rescue
			error->error
		end
	end
	
	def if_exist(name) do #DONE ITS GREAT
	    for item <- ["r","n"] do
			Router.route(item, F_manager, :is_file_existense, [name])
		end
	end
	
	def get_data(name) do 
	    for item <- ["r","n"] do
			Kernel.inspect(Router.route(item, F_manager, :get_data, [name]))
		end
	end
	
	def get_data_client(name) do 
		Kernel.inspect(Router.route("c", Client, :get_data, [name]))
	end
	
	def get_blok_data(name,blok) do 
		Kernel.inspect(Router.route(blok, F_manager, :get_data, [name]))
	end
	
	def get_file_block(name,blok) do 
		try do
			data=get_blok_data(name,blok)
			Router.route("c", Client, :insert_file_w, [name,data])	
		rescue
			error->error
		end
	end
	
	def get_file(name) do 
		try do
			data=get_data(name)
			for item <- data do
				Router.route("c", Client, :insert_file_a, [name,item])
		    end	
		rescue
			error->error
		end
	end
end