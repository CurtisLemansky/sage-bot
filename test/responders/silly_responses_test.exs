defmodule Sage.Responders.SillyResponsesTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{Sage.Responders.SillyResponses, []}]

  test "slaps you", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred slap me"}}
    assert_receive {:message, %{text: text}}, 500
    assert String.contains?(text, "slaps you around a bit with a")
  end

  @tag start_robot: true, name: "alfred", responders: [{Sage.Responders.SillyResponses, []}]

  test "slaps joe", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred slap joe"}}
    assert_receive {:message, %{text: text}}, 500
    assert String.contains?(text, "slaps joe around a bit with a")
  end
end
