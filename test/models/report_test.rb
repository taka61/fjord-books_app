# frozen_string_literal: true

require 'test_helper'
require 'date'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
  @report = reports(:one)
  Bob = users(:Bob)

  assert @report.editable?(Bob)
  end

  test '#created_on' do
  @report = reports(:one)
  assert_equal Date.new(2021, 9, 7), @report.created_on
  end
end
