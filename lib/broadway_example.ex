defmodule BroadwayExample do
  use Broadway
  alias Broadway.Message

  # https://hexdocs.pm/broadway/Broadway.html#start_link/2
  def start_link(_opts) do
    producer_module = Application.fetch_env!(:elixir_queue_processor, :producer_module)

    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      # https://hexdocs.pm/broadway/Broadway.html#start_link/2-producers-options
      producer: [
        module: producer_module
      ],
      # https://hexdocs.pm/broadway/Broadway.html#start_link/2-processors-options
      processors: [
        default: []
      ],
      # https://hexdocs.pm/broadway/Broadway.html#start_link/2-batchers-options
      batchers: [
        default: [batch_size: 10]
      ]
    )
  end

  @impl true
  def handle_message(_processor, message, _context) do
    # perform processing actions on message here, update message data as well.
    message
    |> process
  end

  defp process(msg) do
    msg
    |> IO.inspect
    |> Message.update_data(fn msg-> msg end)
  end

  @impl true
  def handle_batch(_batcher, messages, _batch_info, _context) do
    # ack message w/ sqs here, or publish somewhere else.
    messages
  end
end
