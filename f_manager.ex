defmodule F_manager do
	def insert_file(name,context) do
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
	
    def get_file(name, begin_block, end_block) do
		try do
		    IO.inspect(File.read!(name))
			true
		rescue
			error->error
		end
    end
	
	def replace_file_block(name, context, begin_block, end_block) do
		try do
			true
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