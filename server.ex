defmodule Server do
	def create(name,context) do
		try do
			nodes=["r","n"]
			data=get_data(context)
			#start_create(nodes,name,data,0)			
		rescue
			error->error
		end
	end
	
    def start_Task(n,name,context) do
		data=Router.route(n, F_manager, :insert_file, [name,context])
	end
   
	def start_create([head|tail],name,[head|tail],count) do  
		start_Task(head, name, head)
		start_create(tail, name, tail,count)
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
			Router.route(item, F_manager, :get_data, [name])
		end
	end
	
	def get_file(name) do 
		for item <- ["r","n"] do
			Router.route(item, F_manager, :get_file, [name])
		end
	end

end