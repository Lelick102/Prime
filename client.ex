defmodule Client do
    def create(name, context) do #СОЗДАНИЕ ФАЙЛА
		Router.route("s", Server, :create, [name,context])
	end
	
	def delete(name) do #УДАЛЕНИЕ ФАЙЛА
		Router.route("s", Server, :delete, [name])
	end
	
	def if_exist(name) do #ПРОВЕРКА НА СУЩЕСТВОВАНИЕ ФАЙЛА В ФАЙЛОВОЙ СИСТЕМЕ 
		data=Router.route("s", Server, :if_exist, [name])
		count=0
		for item <- data do
			if item do count=count+1 end
		end
		case count do
			0 -> "Файла с таким именем не существует."
			1 -> "Файл существует только на одном узле, данные частично утрачены!!!"
			2 -> "Файл с именем #{name} найден."
		end
	end
	
	def get_file(name) do #ПОЛУЧЕНИЕ ФАЙЛА ЦЕЛИКОМ
		Router.route("s", Server, :get_file, [name])
	end
	
	def get_file_block(name,blok) do #ПОЛУЧЕНИЕ БЛОКА ФАЙЛА 
		Router.route("s", Server, :get_file_block, [name,blok])
	end
	
	def replace_file_block(name, blok) do #ЗАМЕНА БЛОКА ФАЙЛА
	
	end
	
	def insert_file_a(name,context) do
		try do
			{:ok,file}=File.open(name,[:append])
			IO.write(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end
	
	def insert_file_w(name,context) do
		try do
			{:ok,file}=File.open(name,[:write])
			IO.write(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end
	
	def get_data(context) do
		try do
			if File.exists?(context) do
				{:ok,data}=File.read(context)
				data
			else
				context
			end
		rescue
			error->error
		end
	end 
end