defmodule StartTask do
   def start_Task(n,b,a,path) do
      f=Prime.fileInit(path)
      Task.Supervisor.async(n, Prime, :check_Prime_Numbers, [b,a,f])
   end
   
   def start_Count([head|tail],b,e,path) do
       start_Task(head, b, round(e/length [head|tail]), path)
       start_Count(tail,round(e/length [head|tail]),e, path)
   end

   def start_Count([], b, e, path) do
      true
   end

end
