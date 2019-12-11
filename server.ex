defmodule Server do
  use GenServer

  def start_task do
    GenServer.call(__MODULE__, :start_task)
  end
 
  def handle_call(:start_task, _from, %{ref: ref} = state) when is_reference(ref) do
    {:reply, :ok, state}
  end

  def handle_call(:start_task, _from, %{ref: nil} = state) do
    task =
      Task.Supervisor.async_nolink(RouterTasks, fn ->
        "..."
      end)

    {:reply, :ok, %{state | ref: task.ref}}
  end

  def handle_info({ref, answer}, %{ref: ref} = state) do
    Process.demonitor(ref, [:flush])
    {:noreply, %{state | ref: nil}}
  end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, %{ref: ref} = state) do
    {:noreply, %{state | ref: nil}}
  end
end