defmodule Prime do
  @moduledoc """
  Documentation for Prime.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Prime.hello()
      :world

  """
  def hello do
    :world
  end
  
  def sum(a,b) do
    a+b
  end

  def inputt() do
    input=IO.gets("N>")
    r=String.trim(input)
    String.to_integer(r)
  end

  def is_Prime(limit) do 
    is_Prime(2,limit)
  end

  defp is_Prime(count,limit) when count<=limit do
    if rem(limit,count)==0 do
      is_Prime(count+1,limit)+1
    else
      is_Prime(count+1,limit)
    end
  end

  defp is_Prime(count,limit) when count>0 do
    0
  end

  def add_list(n) do
    [n]
  end

end
