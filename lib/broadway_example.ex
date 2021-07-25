defmodule BroadwayExample do
  use Broadway

  def start_link(_opts) do
    producer_module = Application.fetch_env!(:elixir_queue_processor, :producer_module)

    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module: producer_module
      ],
      processors: [
        default: []
      ],
      batchers: [
        default: [batch_size: 10]
      ]
    )
  end

  @impl true
  def handle_message(_processor, message, _context) do
    message
  end

  @impl true
  def handle_batch(_batcher, messages, _batch_info, _context) do
    messages
  end
end
