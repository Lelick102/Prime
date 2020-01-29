defmodule Prime do
	@moduledoc """
	Documentation for Prime.
	"""

	@doc """
	Prime
	"""
  
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
	
end
