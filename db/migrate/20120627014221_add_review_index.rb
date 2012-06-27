class AddReviewIndex < ActiveRecord::Migration
  def up
    add_index :reviews, :user_id
    add_index :reviews, :snippet_id
  end

  def down
    remove_index :reviews, :user_id
    remove_index :reviews, :snippet_id
  end
end
