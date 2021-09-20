# frozen_string_literal: true
require "test_helper"

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:one)
    @bob = users(:bob)
  end

  test "#editable?" do
    assert @report.editable?(@bob)
  end

  test "#created_on" do
    assert_equal Date.new(2021, 9, 7), @report.created_on
  end
end
