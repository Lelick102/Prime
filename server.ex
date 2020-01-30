defmodule Server do
	def create(name,context) do
		try do
		    #count=0
			l=["r","n"]
			#for item <- l do
			    #s=String.slice context, count, (String.length(context)-round(String.length(context)/length(l)))
				#Router.route(item, F_manager, :insert_file, [name,s])
			#end
			start_create(l,name,context)
		rescue
			error->error
		end
	end
	
    def start_Task(n,name,context) do
		Router.route(n, F_manager, :insert_file, [name,context])
	end
   
	def start_create([head|tail],name,context) do 
		#l=length[head|tail]
		s=String.slice context, count, (String.length(context)-round(String.length(context)/length(l)))
		start_Task(head, name, context)
		start_create(tail,name,context)
		
	end

	def start_create([],name,context) do
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