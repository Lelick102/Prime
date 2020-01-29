defmodule Init do
    def initNode(node) do
        Node.start(node, :longnames, 9000)
        Node.set_cookie(:secret)
    end
    
    def initNodes do
        [{RouterTasks, :"comp1@172.17.0.3"},{RouterTasks, :"comp2@172.17.0.4"}, {RouterTasks, :"comp3@172.17.0.5"}]
    end
    
    def initFile(path) do
        File.open!(path, [:read,:utf8,:write])
    end
end