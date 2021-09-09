# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)

    visit root_url
    fill_in 'Eメール', with:'Bob@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'CSS初級'
    fill_in '内容', with: 'progateで学習した後取り組みました。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'CSS初級'
    assert_text 'progateで学習した後取り組みました。'

  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'
　　
    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: 'がんばる'
    click_on '更新する'

    assert_text '日報が更新されました。'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました'
  end
end
