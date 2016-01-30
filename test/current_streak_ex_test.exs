defmodule CurrentStreakExTest do
  use ExUnit.Case

  alias CurrentStreakEx

  setup do
    html = File.read!("test/data/contributions.html")
    {:ok, html: html}
  end

  test "#current_streak", context do
    assert CurrentStreakEx.current_streak(context[:html]) == 4
  end

  test "#current_streak is nil" do
    assert CurrentStreakEx.current_streak("fail case") == nil
  end

  test "#latest_streak_day", context do
    assert CurrentStreakEx.latest_streak_day(context[:html]) == "2016-01-30"
  end

  test "#latest_streak_day is nil" do
    assert CurrentStreakEx.latest_streak_day("fail case") == nil
  end
end
