defmodule F_manager do
	def insert_file(name,context) do
		try do
			{:ok,file}=File.open(name,[:write])
			IO.binwrite(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end

	def get_data(context) do
		try do
			if File.exists?(context) do
				{:ok,file}=File.open(context)
				data=IO.read(file,:all)
				|>File.close(file)
				|>data
			else
				context
			end
		rescue
			error->error
		end
	end
	
    def delete_file(name) do
		try do
			if  File.exists?(name) do
			    File.rm(name)
				true
			else
				false
			end
		rescue
			error->error
		end
    end

    def is_file_existense(name) do
		try do
			if File.exists?(name) do
				true
			else
				false
			end
		rescue
			error->error
		end
    end
end