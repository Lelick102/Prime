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
end