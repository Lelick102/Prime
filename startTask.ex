defmodule StartTask do
   def start_Task(n,b,a,file) do
      Task.Supervisor.async(n, Prime, :check_Prime_Numbers, [b,a,file])
   end
   
   def start_Count([head|tail],b,e,file) do
       start_Task(head, b, round(e/length [head|tail]), file)
       start_Count(tail,round(e/length [head|tail]),e, file)
   end

   def start_Count([], b, e, file) do
      true
   end

end
