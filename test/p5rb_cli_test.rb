# frozen_string_literal: true

require "test_helper"

class P5rbCliTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::P5rbCli.const_defined?(:VERSION)
    end
  end
end
