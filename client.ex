defmodule Client do
    def create(name, context) do #СОЗДАНИЕ ФАЙЛА
		Router.route("s", Server, :create, [name,context])
	end
	
	def delete(name) do #УДАЛЕНИЕ ФАЙЛА
		Router.route("s", Server, :delete, [name])
	end
	
	def if_exist(name) do #ПРОВЕРКА НА СУЩЕСТВОВАНИЕ ФАЙЛА В ФАЙЛОВОЙ СИСТЕМЕ 
		data=Router.route("s", Server, :if_exist, [name])
		count=count_num(data,0)
		case count do
			0 -> "Файла с таким именем не существует."
			1 -> "Файл существует только на одном узле, данные частично утрачены!!!"
			2 -> "Файл с именем #{name} найден."
		end
		count
	end
	
	def get_file(name) do #ПОЛУЧЕНИЕ ФАЙЛА ЦЕЛИКОМ
		Router.route("s", Server, :get_file, [name])
	end
	
	def get_file_block(name,blok) do #ПОЛУЧЕНИЕ БЛОКА ФАЙЛА 
		Router.route("s", Server, :get_file_block, [name,blok])
	end
	
	def replace_file_block(name, blok) do #ЗАМЕНА БЛОКА ФАЙЛА
	
	end
	
	def insert_file_a(name,context) do #ДОБАВЛЕНИЕ В ФАЙЛ НЕКОТОРОГО КОНТЕКСТА
		try do
			{:ok,file}=File.open(name,[:append])
			IO.write(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end
	
	def insert_file_w(name,context) do #ЗАПИСЬ В ФАЙЛ НЕКОТОРОГО КОНТЕКСТА
		try do
			{:ok,file}=File.open(name,[:write])
			IO.write(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end
	
	def get_data(context) do #ПОЛУЧЕНИЕ ДАННЫХ ИЗ ФАЙЛ ЕСЛИ ОН СУЩЕСТВУЕТ, ЕСЛИ НЕ СУЩЕСТВУЕТ, ПОЛУЧАЕТ КОНТЕКСТ
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
	
	def count_n(head,count) do #ПОДСЧЕТ КОЛИЧЕСТВА ФАЙЛОВ В ФАЙЛОВОЙ СИСТЕМЕ
		1
	end
   
	def count_num([head|tail],count) do  
	    if head do count_num(tail,count+1) 
		else count_num(tail,count) end
	end

	def count_num([],count) do
		count
	end
end