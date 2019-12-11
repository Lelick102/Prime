defmodule BSupervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(:ok) do
    children = [
	  {Task.Supervisor, name: RouterTasks}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
  
end