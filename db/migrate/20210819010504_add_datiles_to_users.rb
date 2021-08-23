# frozen_string_literal: true

class AddDatilesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :postal_code, :integer
    add_column :users, :address, :text
    add_column :users, :introduction, :text
  end
end
