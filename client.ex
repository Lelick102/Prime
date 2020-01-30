defmodule Client do
    def create(name, context) do #СОЗДАНИЕ ФАЙЛА
		Router.route("s", Server, :create, [name,context])
	end
	
	def delete(name) do #УДАЛЕНИЕ ФАЙЛА
		Router.route("s", Server, :delete, [name])
	end
	
	def if_exist(name) do #ПРОВЕРКА НА СУЩЕСТВОВАНИЕ ФАЙЛА В ФАЙЛОВОЙ СИСТЕМЕ 
		Router.route("s", Server, :if_exist, [name])
	end
	
	def get_file(name) do #ПОЛУЧЕНИЕ ФАЙЛА ЦЕЛИКОМ
		Router.route("s", Server, :get_file, [name])
	end
	
	def get_file_block(name,blok) do #ПОЛУЧЕНИЕ БЛОКА ФАЙЛА 
		Router.route("s", Server, :get_file_block, [name,blok])
	end
	
	def replace_file_block(name, blok) do #ЗАМЕНА БЛОКА ФАЙЛА
	
	end
	
	def insert_file(name,context,wa) do
		try do
		    case wa do
				"a"->{:ok,file}=File.open(name,[:append])
				"w"->{:ok,file}=File.open(name,[:write])
			end
			IO.write(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end
end