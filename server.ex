defmodule Server do
	def create(name,context) do
		try do
			l=["r","n"]
			if File.exists?(context) do
				{data}=File.read!(context)
				start_create(l,name,data,0)
			else
				start_create(l,name,context,0)
			end
		rescue
			error->error
		end
	end
	
    def start_Task(n,name,context) do
		Router.route(n, F_manager, :insert_file, [name,context])
	end
   
	def start_create([head|tail],name,context, count) do  
		start_Task(head, name, String.slice(context, 0, round(String.length(context)/length([head|tail]))))#???????????????????????????????????????????????????
		start_create(tail,name,context,count)
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
	
	def get_file(name) do 
		for item <- ["r","n"] do
			Router.route(item, F_manager, :get_file, [name])
		end
	end

end