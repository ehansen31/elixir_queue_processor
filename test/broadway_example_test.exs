defmodule BroadwayExampleTest do
  use ExUnit.Case, async: true

  test "test message" do
    ref = Broadway.test_message(BroadwayExample, 1)
    assert_receive {:ack, ^ref, [%{data: 1}], []}
  end
end
