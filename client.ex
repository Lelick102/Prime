defmodule Client do
    def create(name, context) do
		Router.route("s", Server, :create, [name,context])
	end
	
	def delete(name) do
		Router.route("s", Server, :delete, [name])
	end
end