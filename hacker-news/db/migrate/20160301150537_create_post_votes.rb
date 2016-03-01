class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :total, default: 0
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end
  end
end
