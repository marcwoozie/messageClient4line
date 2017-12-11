class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :description
      t.integer :channel_id, null: false
      t.string :channel_secret, null: false
      t.integer :app_type, null: false
      t.string :access_token, null: false

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :channels, :deleted_at
  end
end
