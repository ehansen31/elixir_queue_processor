defmodule BroadwayExampleTest do
  use ExUnit.Case, async: false

  test "test message" do
    ref = Broadway.test_message(BroadwayExample, 1)
    assert_receive {:ack, ^ref, [%{data: 1}], []}
  end

  test "batch messages" do
    ref = Broadway.test_batch(BroadwayExample, [1, 2, 3])
    assert_receive {:ack, ^ref, [%{data: 1}, %{data: 2}, %{data: 3}], []}, 2000
  end
end
