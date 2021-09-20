# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @me = User.create!(email: 'me@example.com', password: 'password')
    @she = User.create!(email: 'she@example.com', password: 'password')
  end

  test '#following?' do
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#followed_by?' do
    @she.follow(@me)
    assert @me.followed_by?(@she)
  end

  test '#follow' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '#unfollow' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
    @me.unfollow(@she)
    assert_not @me.following?(@she)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')

    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'alice'
    assert_equal 'alice', user.name_or_email
  end
end
