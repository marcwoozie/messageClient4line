class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :channel_id
      t.text :text

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :messages, :deleted_at    
  end
end
