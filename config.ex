defmodule Config do

  def server do :"server@172.17.0.4"  end
  def client do :"client@172.17.0.3" end
  def node1 do :"node@172.17.0.6" end
  def root do :"root@172.17.0.5" end

    def init(name,cookie) do
       Node.start name
       Node.set_cookie cookie
	   Task.Supervisor.start_link(name: RouterTasks)
    end
	
end