class CreateUsers < ActiveRecord::Migration[6.1]
    def change
      create_table :users do |t|
        t.string :name
        t.text :photo
        t.text :bio
        t.integer :posts_counter, default: 0
        t.timestamps
      end
  
      add_index :users, :id
  
      # photo URL validation
      change_column :users, :photo, :text, null: false
      add_column :users, :photo_url_valid, :boolean, default: false
      User.reset_column_information
      User.all.each do |user|
        user.update(photo_url_valid: user.valid?)
      end
      add_index :users, :photo_url_valid
    end
  end
  