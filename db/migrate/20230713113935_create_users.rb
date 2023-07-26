# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      # t.integer :update_user_posts_counter, default: 0
      t.timestamps
    end

    add_index :users, :id
    add_column :users, :posts_counter, :integer, default: 0

    # photo URL validation
    # change_column :users, :photo, :text, null: false
    # add_column :users, :photo_url_valid, :boolean, default: false
    # User.reset_column_information
    # User.all.each do |user|
    #   user.update(photo_url_valid: user.valid?)
    # end
    # add_index :users, :photo_url_valid
  end
end
