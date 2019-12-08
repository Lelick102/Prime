defmodule Drop do
	@moduledoc """
	Documentation for Drop.
	"""

	@doc """
	Hello world.

	## Examples

		iex> Drop.hello()
		:world

		{:ok, file} = File.open("tmp", [:write])
			z=n
			IO.write(file, z)
			File.close(file)
	"""

	def inputt() do
		input = IO.gets("N > ")   
		r=String.trim(input) 
		String.to_integer(r)
	end
  
	def is_Prime(limit) do   
		is_Prime(2,limit)  
	end  
  
	defp is_Prime(count,limit) when count <= limit do 
		if rem(limit,count)==0 do 
			is_Prime(count+1,limit)+1
		else
			is_Prime(count+1,limit)
		end
	end
  
	defp is_Prime(count,limit)  when count>0 do
		0
	end 
	
	def add_list(n) do
		[n]
	end
	
	def fileInit() do
	  File.open!("tmp.txt", [:read, :utf8, :write])
	end
	
	def check_Prime_Numbers(n,m,file) when n<=m do
		if(is_Prime(n)<2) do
			IO.puts(file, n)
			IO.puts(n)
		end
		check_Prime_Numbers(n+1,m,file)
	end
	
	def check_Prime_Numbers(n,m,file)  when n>0 do
		true
	end
	
	def async_word_count(n, m,file) do
		process = self()
		spawn(fn ->
			send(process, {:result, check_Prime_Numbers(n,m,file)})
		end)
	end
		
	get_result = fn ->
		receive do
			{:result, result} -> result
		end
	end
end