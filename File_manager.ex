defmodule File_manager do
    def create(name,context) do
       try do
          {:ok,file}=File.open(name,[:write])
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
          true
       rescue
          error->error
       end
    end

    def is_file_existense(name) do
       try do
         true
       rescue
          error->error
       end
    end

end