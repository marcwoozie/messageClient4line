class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :line_display_name
      t.string :line_user_id
      t.string :line_picture_url
      t.string :line_status_message

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :users, :deleted_at
  end
end
