defmodule ElixirQueueProcessor do
  use Broadway

  def start_link(_opts) do
    Broadway.start_link(ElixirQueueProcessor,
      name: MyBroadwayExample,
      producer: [
        module: {Counter, []},
        concurrency: 1
      ],
      processors: [
        default: [concurrency: 2]
      ]
    )
  end
  
  
end
