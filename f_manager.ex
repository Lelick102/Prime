defmodule F_manager do
	def insert_file(name,context) do
		try do
			{:ok,file}=File.open(name,[:append])
			IO.write(file, context)
			File.close(file)
			true
		rescue
			error->error
		end
    end

    def get_file(name, begin_block, end_block) do
		try do
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
	
	def file_read_block(input, start, langth) do
		try do
			{:ok, file}=:file.open(input, [:binary])
			{:ok,data}=:file.pread(file,start,langth)
			:file.close(file)
			true
		rescue
			error->error
		end
	end
	
	def file_write_block(data, output_file) do
		try do
			{:ok,out}=:file.open(output_file,[:append])
			IO.write(out,data)
			:file.close(out)
			true
		rescue
			error->error
		end
	end
	
	def create(name,context,com_node) do
		try do
		    data=devide_str(context)
			task=Task.Supervisor.async({RouterTasks,com_node},F_manager, :insert_file, [name,context])
			Task.await(task)
		rescue
			error->error
		end
	end
	
		def devide_str(context) do
		for <<x::binary-10 <- context>>, do: x
	end
	
end