# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:Agatha_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'ABC殺人事件'
    fill_in 'メモ', with: 'ポワロシリーズの中でも有名で評価も高い作品の一つ'
    fill_in '著者', with: 'アガサ・クリスティ'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'ABC殺人事件'
    assert_text 'ポワロシリーズの中でも有名で評価も高い作品の一つ'
    assert_text 'アガサ・クリスティ'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: '中国マフィアも登場。ポワロにしては壮大な設定。'
    fill_in '著者', with: @book.author
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'ビック4'
    assert_text '中国マフィアも登場。ポワロにしては壮大な設定。'
    assert_text 'アガサ・クリスティ'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
