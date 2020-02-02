defmodule Server do
	def create(name,context) do
		nodes=["r","n"]
		data=get_data_client(context)
		start_create(nodes,name,data,0)			
	end
	
    def start_Task(n,name,context) do
		Router.route(n, F_manager, :insert_file, [name,context])
	end
   
	def start_create([head|tail],name,data,count) do  
		start_Task(head, name, String.slice(data,count,round(String.length(data)/length([head|tail]))))
		start_create(tail, name, data, count+round(String.length(data)/length([head|tail])))
	end

	def start_create([],name,data,count) do
		[true]
	end
	
	def delete(name) do #DONE ITS GREAT
		for item <- ["r","n"] do
			Router.route(item, F_manager, :delete_file, [name])
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
	
	def get_data_client(name) do 
		Router.route("c", Client, :get_data, [name])
	end
	
	def get_blok_data(name,blok) do 
		Router.route(blok, F_manager, :get_data, [name])
	end
	
	def get_file_block(name,blok) do 
		data=get_blok_data(name,blok)
		Router.route("c", Client, :insert_file_w, [name,data])
		IO.inspect(data)
	end
	
	def get_file(name) do 
		data=get_data(name)
		Router.route("c", Client, :rewrite_file, [name])
		for item <- data do
			Router.route("c", Client, :insert_file_a, [name,item])
		end	
	end
	
	def replace_file_block(name, block, context) do
		Router.route(blok, F_manager, :rewrite_block, [name, block, context])
	end
end