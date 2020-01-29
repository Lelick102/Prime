defmodule Config do

  def server do :"server@172.17.0.2"  end
  def client do :"client@172.17.0.3" end
  def node1 do :"node1@172.17.0.4" end

    def init(name,cookie) do
       Node.start name
       Node.set_cookie cookie
    end
end
   