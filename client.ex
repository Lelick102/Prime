defmodule Client do
    def create(name, context) do
		Router.route("s", Server, :create, [name,context])
	end
	
	def delete(name) do
		Router.route("s", Server, :delete, [name])
	end
	
	def if_exist(name) do
		Router.route("s", Server, :if_exist, [name])
	end
	
	def get_file(name) do
	
	end
	
	def replace_file_block(name, blok) do
	
	end
end