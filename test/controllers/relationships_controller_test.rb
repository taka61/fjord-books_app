# frozen_string_literal: true

require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test 'should get followings_index' do
    get relationships_followings_index_url
    assert_response :success
  end

  test 'should get followers_index' do
    get relationships_followers_index_url
    assert_response :success
  end

  test 'should get create' do
    get relationships_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get relationships_destroy_url
    assert_response :success
  end
end
