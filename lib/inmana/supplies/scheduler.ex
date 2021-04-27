defmodule Inmana.Supplies.Scheduler do
  use GenServer
  alias Inmana.Supplies.ExpirationNotification

  @impl true
  def init(state \\ %{}) do
    schendule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    schendule_notification()

    {:noreply, state}
  end

  defp schendule_notification do
    # De 10 em 10 segundos / Caso fosse um intervalo de 1 semana: * 60 * 60 * 24 * 7
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
